"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useCompare } from "../components/context/CompareContext";
import CompareHero from "./components/CompareHero";
import CompareCards from "./components/CompareCards";

export default function ComparePage() {
  const [vehicles, setVehicles] = useState<any[]>([]);
  const { compareList } = useCompare();
  const API = process.env.NEXT_PUBLIC_API_URL;


  const [aiResult, setAiResult] = useState<any>(null);
  const [loadingAI, setLoadingAI] = useState(true);

  useEffect(() => {
    const loadVehicles = async () => {
      if (compareList.length < 2) {
        setLoadingAI(false);

        return;
      }

      try {
        const response = await fetch(
          `${API}/compare-ai`,

          {
            method: "POST",

            headers: {
              "Content-Type": "application/json",
            },

            body: JSON.stringify({
              vehicleIds: compareList,
            }),
          },
        );

        const data = await response.json();

        setVehicles(data.vehicles || []);
        setAiResult(data.ai);
        console.log(data);
        console.log(data.vehicles);
      } catch (err) {
        console.log(err);
      } finally {
        setLoadingAI(false);
      }
    };

    loadVehicles();
  }, [compareList]);

  if (loadingAI) {
    return (
      <main className="min-h-screen bg-black flex items-center justify-center text-white text-3xl">
        Loading comparison...
      </main>
    );
  }

  if (compareList.length < 2) {
    return (
      <main className="min-h-screen bg-black text-white flex items-center justify-center text-3xl">
        No vehicles selected
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-black text-white px-8 py-20">
      <CompareHero total={vehicles.length} />

      <div className="overflow-x-auto rounded-3xl border border-zinc-800 bg-zinc-900">
        <CompareCards
          vehicles={vehicles}
          winner={aiResult?.winner}
        />
        <table className="w-full">
          <thead>
            <tr className="border-t border-zinc-800 hover:bg-zinc-800/40 transition">
              <th className="p-6 text-left">Feature</th>

              {vehicles.map((vehicle: any) => (
                <th
                  key={vehicle.id}
                  className={`min-w-[280px] p-6 transition-all ${
                    aiResult?.winner === vehicle.name
                      ? "bg-green-500/10 border-x border-green-500"
                      : "bg-zinc-900"
                  }`}
                >
                  {/* <img
                    src={vehicle.image_url || "/placeholder.png"}
                    className="w-64 h-40 rounded-2xl object-cover mx-auto shadow-2xl"
                  /> */}

                  {/* {aiResult?.winner === vehicle.name && (
                    <div className="mt-4">
                      <span className="bg-green-500 px-4 py-2 rounded-full text-sm">
                        🏆 AI Winner
                      </span>
                    </div>
                  )} */}

                  <h2 className="text-2xl font-bold mt-5">{vehicle.name}</h2>

                  {/* <Link href={`/vehicle/${vehicle.id}`}>
                    <button className="mt-5 bg-blue-600 px-5 py-3 rounded-xl hover:bg-blue-700">
                      View Details
                    </button>
                  </Link> */}
                </th>
              ))}
            </tr>
          </thead>

          <tbody>
            <tr>
              <td className="p-5 font-semibold">💰 Price</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  <span className="font-bold text-green-400 text-lg">
                    ₹{v.price}
                  </span>
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">⛽ Mileage</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  <div>
                    <div className="font-bold">{v.mileage} kmpl</div>

                    <div className="w-28 h-2 bg-zinc-700 rounded-full mt-3 mx-auto">
                      <div
                        className="h-2 rounded-full bg-blue-500"
                        style={{
                          width: `${Math.min(Number(v.mileage) * 4, 100)}%`,
                        }}
                      />
                    </div>
                  </div>
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">🛡️ Safety</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  <div className="text-yellow-400 text-xl">
                    {"⭐".repeat(Number(v.safety) || 0)}
                  </div>
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">🔥 Fuel</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  {v.fuel_type}
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">⚙️ Transmission</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  {v.transmission}
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">🚗 Body</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  {v.body_type}
                </td>
              ))}
            </tr>

            <tr>
              <td className="p-5 font-semibold">💺 Seats</td>

              {vehicles.map((v: any) => (
                <td key={v.id} className="text-center">
                  {v.seating_capacity}
                </td>
              ))}
            </tr>
          </tbody>
        </table>
      </div>
       <section className="max-w-7xl mx-auto mt-16">
          <div className="grid lg:grid-cols-2 gap-8">
            <div className="bg-zinc-900 rounded-3xl p-8 border border-green-500">
              <h2 className="text-4xl font-black">🏆 AI Winner</h2>

              <h3 className="text-3xl mt-8 text-green-400">
                {aiResult?.winner}
              </h3>

              <div className="mt-8">
                <p className="text-zinc-400">AI Confidence</p>

                <div className="w-full h-4 bg-zinc-800 rounded-full mt-3">
                  <div
                    className="bg-green-500 h-4 rounded-full"
                    style={{
                      width: "92%",
                    }}
                  />
                </div>

                <p className="mt-3">92%</p>
              </div>
            </div>

            <div className="bg-zinc-900 rounded-3xl p-8 border border-blue-500">
              <h2 className="text-4xl font-black">🤖 AI Verdict</h2>

              <p className="text-zinc-300 mt-8 leading-8">
                {aiResult?.verdict}
              </p>

              <div className="grid grid-cols-2 gap-6 mt-10">
                <div>
                  <h3 className="text-green-400 text-xl font-bold">Pros</h3>

                  {aiResult?.pros?.map((pro: string, index: number) => (
                    <p key={index} className="mt-3">
                      ✅ {pro}
                    </p>
                  ))}
                </div>

                <div>
                  <h3 className="text-red-400 text-xl font-bold">Cons</h3>

                  {aiResult?.cons?.map((con: string, index: number) => (
                    <p key={index} className="mt-3">
                      ❌ {con}
                    </p>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </section>
    </main>
  );
}
