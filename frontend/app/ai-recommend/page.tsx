"use client";

import { useState } from "react";
import Link from "next/link";

export default function AIRecommendPage() {
  const [budget, setBudget] = useState("");
  const [fuel, setFuel] = useState("Petrol");
  const [usage, setUsage] = useState("City");
  const [seats, setSeats] = useState("Select seats");
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<any>(null);
  const [vehicleType, setVehicleType] = useState("Car");
  const [prompt, setPrompt] = useState("");
  const API = process.env.NEXT_PUBLIC_API_URL;

  const recommend = async () => {
    setLoading(true);

    const res = await fetch(`${API}/recommend`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        budget,
        vehicleType,
        fuel,
        usage,
        seats,
        prompt,
      }),
    });

    const data = await res.json();

    setResult(data);

    setLoading(false);
  };

  return (
    <main className="min-h-screen bg-black text-white p-10">
      <div className="max-w-6xl mx-auto">
        <div className="flex justify-between items-center mb-12">
          <div>
            <h1 className="text-6xl font-black">🤖 AI Car Recommendation</h1>

            <p className="text-zinc-400 mt-3">
              Tell us your needs. AI will choose the best cars.
            </p>
          </div>

          <Link href="/" className="bg-blue-600 px-6 py-3 rounded-xl">
            Home
          </Link>
        </div>

        <div className="grid lg:grid-cols-2 gap-10">
          <div className="bg-zinc-900 rounded-3xl p-8">
            <input
              type="number"
              placeholder="Budget (Lakhs)"
              value={budget}
              onChange={(e) => setBudget(e.target.value)}
              className="w-full p-4 rounded-xl bg-zinc-800 mb-6"
            />

            <select
              value={vehicleType}
              onChange={(e) => setVehicleType(e.target.value)}
              className="w-full p-4 rounded-xl bg-zinc-800 mb-6"
            >
              <option>Car</option>
              <option>Bike</option>
            </select>

            <select
              value={fuel}
              onChange={(e) => setFuel(e.target.value)}
              className="w-full p-4 rounded-xl bg-zinc-800 mb-6"
            >
              <option>Petrol</option>
              <option>Diesel</option>
              <option>CNG</option>
              <option>Electric</option>
            </select>

            <select
              value={usage}
              onChange={(e) => setUsage(e.target.value)}
              className="w-full p-4 rounded-xl bg-zinc-800 mb-6"
            >
              <option>City</option>
              <option>Highway</option>
            </select>

            <select
              value={seats}
              onChange={(e) => setSeats(e.target.value)}
              className="w-full p-4 rounded-xl bg-zinc-800 mb-8"
            >
              <option>5</option>
              <option>6</option>
              <option>7</option>
            </select>

            <textarea
              rows={5}
              placeholder="Tell AI what you need...

Example:
• Family of 5
• Long highway trips
• Good resale value
• Low maintenance
"
              value={prompt}
              onChange={(e) => setPrompt(e.target.value)}
              className="w-full rounded-xl bg-zinc-800 p-4 mb-8"
            />

            <button
              onClick={recommend}
              className="w-full bg-blue-600 py-4 rounded-xl text-xl font-bold"
            >
              {loading ? "Thinking..." : "Recommend"}
            </button>
          </div>

          <div className="bg-zinc-900 rounded-3xl p-8">
            {!result ? (
              <div className="text-zinc-500 text-center mt-20">
                AI recommendation will appear here
              </div>
            ) : (
              <>
                <h2 className="text-3xl font-bold mb-6">
                  🏆 AI Recommendation
                </h2>

                <h3 className="text-2xl text-green-400">{result.winner}</h3>

                <p className="mt-6 leading-8">{result.reason}</p>

                <div className="mt-8">
                  {result.recommendations?.map((car: any, index: number) => (
                    <div
                      key={index}
                      className="bg-zinc-800 rounded-xl p-4 mb-4"
                    >
                      {index + 1}. {car}
                    </div>
                  ))}
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </main>
  );
}
