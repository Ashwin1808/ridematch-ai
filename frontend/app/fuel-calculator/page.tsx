"use client";

// import { useState } from "react";
import { useEffect, useState } from "react";
import Link from "next/link";

export default function FuelCalculator() {
  const [distance, setDistance] = useState("");
  const [mileage, setMileage] = useState("");
  // const [fuelPrice, setFuelPrice] = useState("");
  const [fuelPrice, setFuelPrice] = useState("0");
  const [fuelType, setFuelType] = useState("petrol");
  const API = process.env.NEXT_PUBLIC_API_URL;


  useEffect(() => {
    const loadFuelPrice = async () => {
      const res = await fetch(`${API}/fuel-price`);
      const data = await res.json();

      if (fuelType === "petrol") setFuelPrice(data.petrol.toString());

      if (fuelType === "diesel") setFuelPrice(data.diesel.toString());

      if (fuelType === "cng") setFuelPrice(data.cng.toString());
    };

    loadFuelPrice();
  }, [fuelType]);

  const fuelNeeded =
    distance && mileage ? Number(distance) / Number(mileage) : 0;

  const tripCost = fuelNeeded && fuelPrice ? fuelNeeded * Number(fuelPrice) : 0;

  const costPerKm = distance && tripCost ? tripCost / Number(distance) : 0;

  return (
    <main className="min-h-screen bg-black text-white p-10">
      <div className="max-w-5xl mx-auto">
        <div className="flex justify-between items-center mb-10">
          <div>
            <h1 className="text-6xl font-black">⛽ Fuel Cost Calculator</h1>

            <p className="text-zinc-400 mt-3">
              Estimate your trip cost instantly
            </p>
          </div>

          <Link href="/" className="bg-blue-600 px-6 py-3 rounded-xl">
            ← Home
          </Link>
        </div>

        <div className="grid lg:grid-cols-2 gap-10">
          <div className="bg-zinc-900 rounded-3xl p-8 border border-zinc-800">
            <h2 className="text-3xl font-bold mb-8">Trip Details</h2>

            <select
              value={fuelType}
              onChange={(e) => setFuelType(e.target.value)}
              className="w-full mb-6 bg-zinc-800 rounded-xl p-4"
            >
              <option value="petrol">Petrol</option>
              <option value="diesel">Diesel</option>
              <option value="cng">CNG</option>
            </select>

            <input
              type="number"
              placeholder="Distance (km)"
              value={distance}
              onChange={(e) => setDistance(e.target.value)}
              className="w-full mb-6 bg-zinc-800 rounded-xl p-4"
            />

            <input
              type="number"
              placeholder="Mileage (kmpl)"
              value={mileage}
              onChange={(e) => setMileage(e.target.value)}
              className="w-full mb-6 bg-zinc-800 rounded-xl p-4"
            />

            <input
              type="number"
              value={fuelPrice}
              readOnly
              className="w-full bg-zinc-800 rounded-xl p-4"
            />
          </div>

          <div className="bg-gradient-to-br from-blue-600/20 to-zinc-900 rounded-3xl p-8 border border-blue-500">
            <h2 className="text-3xl font-bold mb-8">Results</h2>

            <div className="space-y-6">
              <div className="bg-zinc-900 rounded-xl p-5">
                <p className="text-zinc-400">Fuel Needed</p>

                <h3 className="text-4xl font-bold mt-2">
                  {fuelNeeded.toFixed(2)} L
                </h3>
              </div>

              <div className="bg-zinc-900 rounded-xl p-5">
                <p className="text-zinc-400">Trip Cost</p>

                <h3 className="text-4xl font-bold text-green-400 mt-2">
                  ₹ {tripCost.toFixed(2)}
                </h3>
              </div>

              <div className="bg-zinc-900 rounded-xl p-5">
                <p className="text-zinc-400">Cost Per KM</p>

                <h3 className="text-4xl font-bold mt-2">
                  ₹ {costPerKm.toFixed(2)}
                </h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
