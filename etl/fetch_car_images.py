import os
import re
import time
import requests
import psycopg2
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("CARSXE_API_KEY")

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
)

cur = conn.cursor()

# ----------------------------
# Fetch all cars
# ----------------------------

cur.execute("""
SELECT make, name
FROM vehicles
WHERE type='Car'
ORDER BY make, name;
""")

rows = cur.fetchall()

print(f"Cars in DB: {len(rows)}")


# ----------------------------
# Extract clean model
# ----------------------------

def get_model(make, name):

    if make:
        name = name.replace(make, "").strip()

    words = name.split()

    if not words:
        return ""

    model = [words[0]]

    # Keep second word ONLY if it's a number/series
    if len(words) > 1:

        second = words[1]

        if (
            second[0].isdigit()
            or second.upper().startswith("X")
            or second.upper().startswith("Q")
            or second.upper().startswith("GL")
            or second.upper().startswith("XC")
        ):
            model.append(second)

    return " ".join(model)

# ----------------------------
# Build unique models
# ----------------------------

unique_models = {}

for make, name in rows:

    model = get_model(make or "", name)

    key = (make or "", model)

    if key not in unique_models:
        unique_models[key] = True

cars = list(unique_models.keys())

print(f"Unique models: {len(cars)}")

cache = {}

# ----------------------------
# Fetch Images
# ----------------------------

for index, (make, model) in enumerate(cars, start=1):

    print(f"[{index}/{len(cars)}] {make} {model}")

    cache_key = f"{make}-{model}"

    if cache_key in cache:
        image = cache[cache_key]

    else:

        try:

            response = requests.get(
                "https://api.carsxe.com/images",
                params={
                    "key": API_KEY,
                    "make": make,
                    "model": model,
                    "format": "json"
                },
                timeout=20
            )

            data = response.json()

            image = None

            if data.get("success"):

                images = data.get("images", [])

                if images:
                    image = images[0]["link"]

            cache[cache_key] = image

        except Exception as e:

            print(e)

            image = None

    if image:

        cur.execute("""
        UPDATE vehicles
        SET image_url=%s
        WHERE make=%s
        AND name ILIKE %s
        """,
        (
            image,
            make,
            f"%{model}%"
        ))

        conn.commit()

        print("   ✅ Updated")

    else:

        print("   ❌ No image")

    time.sleep(0.2)

cur.close()
conn.close()

print("\nDone!")