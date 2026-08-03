import pandas as pd
import psycopg2
import math

# -----------------------------
# PostgreSQL Connection
# -----------------------------

conn = psycopg2.connect(
    host="localhost",
    database="ridematch",
    user="user",
    password="Ashwin1808@"
)

cursor = conn.cursor()

# -----------------------------
# Read CSV
# -----------------------------

# df = pd.read_csv("shrey_car_dataset.csv")
df = pd.read_csv("data/shrey_car_dataset.csv")

# print("Vehicles Found:", len(df))
print(df.columns)

print(df["Ex-Showroom_Price"].head(20))

# -----------------------------
# Helper Functions
# -----------------------------

# def clean_price(price):

#     if pd.isna(price):
#         return None

#     price = str(price)

#     price = price.replace("Rs. ", "")
#     price = price.replace(",", "")
#     price = price.replace("Lakh", "")
#     price = price.replace("Lakhs", "")
#     price = price.strip()

#     try:
#         return float(price)
#     except:
#         return None

def clean_price(price):

    if pd.isna(price):
        return None

    price = str(price)

    # Remove Rupee symbol
    price = price.replace("₹", "")

    # Remove commas
    price = price.replace(",", "")

    # Remove spaces
    price = price.strip()

    try:
        # Convert to rupees
        price = float(price)

        # Convert to lakhs
        return round(price / 100000, 2)

    except:
        return None


def image_path(make, model):

    model = model.lower().replace(" ", "-")

    return f"/cars/{model}.jpg"


def usage_type(body):

    body = str(body).lower()

    if "suv" in body:
        return "Highway"

    if "sedan" in body:
        return "City"

    return "City"

# -----------------------------
# Insert Vehicles
# -----------------------------

count = 0

for _, row in df.iterrows():

    price = clean_price(row["Ex-Showroom_Price"])

    if price is None:
        continue

    cursor.execute("""
    INSERT INTO vehicles
    (
        name,
        type,
        budget,
        mileage,
        safety,
        usage_type,
        image,
        price,
        reason,
        make,
        variant,
        displacement,
        cylinders,
        fuel_tank_capacity,
        fuel_type,
        height,
        length,
        width,
        body_type,
        seating_capacity,
        transmission,
        power,
        torque
    )

    VALUES
    (
        %s,%s,%s,%s,%s,%s,%s,%s,%s,
        %s,%s,%s,%s,%s,%s,%s,%s,%s,
        %s,%s,%s,%s,%s
    )
    """,

    (

        f'{row["Make"]} {row["Model"]} {row["Variant"]}',

        "Car",

        math.ceil(price),

        18,

        4,

        usage_type(row["Body_Type"]),

        image_path(row["Make"], row["Model"]),

        f"{price} Lakhs",

        "Imported from Indian Vehicle Dataset",

        row["Make"],

        row["Variant"],

        row["Displacement"],

        row["Cylinders"],

        row["Fuel_Tank_Capacity"],

        row["Fuel_Type"],

        row["Height"],

        row["Length"],

        row["Width"],

        row["Body_Type"],

        row["Seating_Capacity"],

        row["Type"],

        row["Power.1"],

        row["Torque.1"]

    ))

    count += 1

conn.commit()

print("Imported:", count)

cursor.close()
conn.close()