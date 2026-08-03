import os
import re
import time
import requests
import psycopg2
from dotenv import load_dotenv

load_dotenv()

# -------------------------------
# PostgreSQL Connection
# -------------------------------

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
)

cur = conn.cursor()

# -------------------------------
# Fetch all cars without images
# -------------------------------

cur.execute("""
SELECT DISTINCT make, name
FROM vehicles
WHERE image_url IS NULL
AND type='Car'
ORDER BY make, name;
""")

cars = cur.fetchall()

print(f"\nFound {len(cars)} cars.\n")


# -------------------------------
# Clean model name
# -------------------------------

def clean_model(make, name):

    # Remove duplicate make
    name = name.replace(make, "").strip()

    # Remove text inside brackets
    name = re.sub(r"\(.*?\)", "", name)

    # Remove engine specs
    name = re.sub(r"\d+\.\d+.*", "", name)

    # Remove common trim words
    remove_words = [
        "MT", "AT", "AMT", "CVT",
        "Petrol", "Diesel", "Turbo",
        "Crdi", "Vtvt", "Gdi",
        "Manual", "Automatic",
        "Plus", "Edition",
        "Dual", "Tone",
        "BSIII", "BSIV", "BSVI"
    ]

    words = []

    for word in name.split():

        if word.lower() in [w.lower() for w in remove_words]:
            continue

        words.append(word)

    if len(words) == 0:
        return make

    model = words[0]

    return f"{make} {model}"


# -------------------------------
# Wikipedia Image
# -------------------------------

def get_image(title):

    url = "https://en.wikipedia.org/w/api.php"

    params = {
        "action": "query",
        "titles": title,
        "prop": "pageimages",
        "format": "json",
        "piprop": "original"
    }

    try:

        response = requests.get(
            url,
            params=params,
            timeout=10
        )

        data = response.json()

        pages = data["query"]["pages"]

        for page in pages.values():

            if "original" in page:
                return page["original"]["source"]

    except Exception as e:

        print(e)

    return None


# -------------------------------
# Main Loop
# -------------------------------

success = 0
failed = 0

for index, (make, model) in enumerate(cars, start=1):

    query = clean_model(make, model)

    print(f"[{index}/{len(cars)}] Searching: {query}")

    image = get_image(query)

    if image:

        base_model = query.replace(make, "").strip()

        cur.execute("""
        UPDATE vehicles
        SET image_url=%s
        WHERE make=%s
        AND name ILIKE %s
        """,
        (
            image,
            make,
            f"{base_model}%"
        ))

        conn.commit()

        print("   ✅ Updated")

        success += 1

    else:

        print("   ❌ No Image")

        failed += 1

    time.sleep(0.4)


print("\n==========================")
print("Completed")
print("==========================")
print("Success :", success)
print("Failed  :", failed)

cur.close()
conn.close()