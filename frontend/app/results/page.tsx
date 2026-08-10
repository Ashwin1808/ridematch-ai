"use client";

import Image from "next/image";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

export default function ResultsPage() {
  const router = useRouter();



  // const searchParams = useSearchParams();

  const [vehicles, setVehicles] = useState<any[]>([]);

  // useEffect(() => {
  //   const stored = localStorage.getItem("recommendations");

  //   if (stored) {
  //     setVehicles(JSON.parse(stored));
  //   }
  // }, []);

  //   useEffect(() => {
  //     const stored = localStorage.getItem("recommendations");

  //     console.log("LOCAL STORAGE =", stored);

  //     // if (stored && stored !== "undefined" && stored !== "null") {
  //     //   try {
  //     //     setVehicles(JSON.parse(stored));
  //     //   } catch (err) {
  //     //     console.error("JSON Parse Error:", err);
  //     //     localStorage.removeItem("recommendations");
  //     //   }
  //     // }
  //     console.log("LOCAL STORAGE =", stored);

  // if (stored && stored !== "undefined") {
  //   try {
  //     setVehicles(JSON.parse(stored));
  //   } catch (err) {
  //     console.error(err);
  //     setVehicles([]);
  //   }
  // }
  //   }, []);

  useEffect(() => {
    const stored = localStorage.getItem("recommendations");

    console.log("LOCAL STORAGE =", stored);

    if (stored && stored !== "undefined" && stored !== "null") {
      try {
        setVehicles(JSON.parse(stored));
      } catch (err) {
        console.error(err);
        setVehicles([]);
      }
    }
  }, []);

  // const vehiclesData = searchParams.get("vehicles");

  // const vehicles = vehiclesData
  //   ? JSON.parse(decodeURIComponent(vehiclesData))
  //   : [];

  return (
    <main className="min-h-screen bg-black text-white overflow-x-hidden">
      {/* BACKGROUND GLOW */}
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[900px] h-[900px] bg-blue-600/20 blur-[180px] rounded-full"></div>

      {/* NAVBAR */}
      <nav className="relative z-20 flex justify-between items-center px-10 py-8 border-b border-gray-800 backdrop-blur-lg bg-black/60 sticky top-0">
        <h1 className="text-3xl font-extrabold text-blue-500">RideMatch AI</h1>

        <button
          onClick={() => router.push("/")}
          className="border border-blue-500 text-white px-6 py-3 rounded-2xl hover:bg-blue-600 transition"
        >
          Try Again
        </button>
      </nav>

      {/* HERO */}
      <section className="relative z-10 text-center py-24 px-6">
        <h1 className="text-7xl font-extrabold leading-tight">
          Your Perfect Match 🚀
        </h1>

        <p className="text-gray-400 text-2xl mt-8 max-w-3xl mx-auto leading-relaxed">
          AI-powered recommendations based on your budget, mileage, safety
          preferences, and driving habits.
        </p>
      </section>

      {/* VEHICLE CARDS */}
      <section className="relative z-10 max-w-7xl mx-auto px-8 pb-28">
        <div className="flex flex-col gap-10">
          {vehicles.map((vehicle: any, index: number) => (
            <div
              key={index}
              className="
      group
      relative
      grid
      lg:grid-cols-2
      bg-gradient-to-br
      from-[#0b1020]
      via-[#0c1225]
      to-black
      border
      border-gray-800
      rounded-[36px]
      overflow-hidden
      hover:border-blue-500
      hover:shadow-[0_0_60px_rgba(37,99,235,0.18)]
      transition
      duration-500
      "
            >
              {/* MATCH BADGE */}

              <div className="absolute top-6 right-6 z-30 bg-blue-600 px-5 py-2 rounded-full text-sm font-bold shadow-lg shadow-blue-500/30">
                #{index + 1} Match
              </div>

              {/* IMAGE SECTION */}

              <div className="relative h-[420px] overflow-hidden">
                <div className="absolute inset-0 bg-gradient-to-r from-transparent to-black/30 z-10"></div>

                <Image
                  src={vehicle.image_url || "/placeholder.png"}
                  alt={vehicle.name}
                  fill
                  className="
    object-cover
    group-hover:scale-105
    transition
    duration-700
"
                />
              </div>

              {/* CONTENT SECTION */}

              <div className="flex flex-col justify-between p-10">
                <div>
                  <p className="text-blue-500 text-lg font-semibold mb-3">
                    AI Recommended Vehicle
                  </p>

                  <h2 className="text-6xl font-extrabold leading-tight mb-6">
                    {vehicle.name}
                  </h2>

                  <p className="text-gray-400 text-xl leading-relaxed max-w-2xl">
                    {vehicle.reason}
                  </p>
                </div>

                {/* STATS */}

                <div className="grid grid-cols-3 gap-5 mt-12">
                  <div className="bg-black/60 border border-gray-800 rounded-3xl p-6">
                    <p className="text-gray-500 text-sm mb-2">Mileage</p>

                    <h3 className="text-blue-500 text-4xl font-bold">
                      {vehicle.mileage}
                    </h3>

                    <p className="text-gray-400 mt-1">kmpl</p>
                  </div>

                  <div className="bg-black/60 border border-gray-800 rounded-3xl p-6">
                    <p className="text-gray-500 text-sm mb-2">Safety</p>

                    <h3 className="text-blue-500 text-4xl font-bold">
                      {vehicle.safety}
                    </h3>

                    <p className="text-gray-400 mt-1">Star</p>
                  </div>

                  <div className="bg-black/60 border border-gray-800 rounded-3xl p-6">
                    <p className="text-gray-500 text-sm mb-2">Price</p>

                    <h3 className="text-blue-500 text-4xl font-bold">
                      ₹{vehicle.price}
                    </h3>
                  </div>
                </div>

                {/* BUTTONS */}

                <div className="flex gap-4 mt-10">
                  <button
                    onClick={() => router.push(`/vehicle/${vehicle.id}`)}
                    className="
                      px-6 py-3 bg-blue-600 rounded-xl hover:bg-blue-700 transition
                      "
                  >
                    View Details
                  </button>

                  {/* <button
                    className="
                      flex-1
                      border
                      border-gray-700
                      hover:border-blue-500
                      py-5
                      rounded-2xl
                      text-xl
                      font-bold
                      transition
                      "
                  >
                    Compare Vehicle
                  </button> */}

                  <button
                    onClick={() => {
                      localStorage.setItem(
                        "compareVehicles",
                        JSON.stringify(vehicles),
                      );

                      router.push("/compare");
                    }}
                    className="px-6 py-3 border border-blue-500 text-blue-500 rounded-xl hover:bg-blue-500 hover:text-white transition"
                  >
                    Compare Vehicles
                  </button>

                  {/* <button
                    onClick={() => {
                      localStorage.setItem(
                        "compareVehicle",
                        JSON.stringify(vehicle),
                      );

                      router.push("/compare");
                    }}
                    className="
  flex-1
  border
  border-gray-700
  hover:border-blue-500
  py-5
  rounded-2xl
  text-xl
  font-bold
  transition
  "
                  >
                    Compare Vehicle
                  </button> */}
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* COMPARISON TABLE */}
      <section className="relative z-10 max-w-7xl mx-auto px-8 pb-32">
        <h2 className="text-6xl font-extrabold text-center mb-16">
          Vehicle Comparison
        </h2>

        <div className="overflow-x-auto rounded-3xl border border-gray-800 bg-[#0b0b0b] shadow-2xl">
          <table className="w-full">
            <thead>
              <tr className="bg-gradient-to-r from-[#111827] to-[#1f2937]">
                <th className="p-8 text-left text-2xl">Feature</th>

                {vehicles.map((vehicle: any, index: number) => (
                  <th key={index} className="p-8 text-center">
                    <div className="flex flex-col items-center">
                      <div className="relative w-28 h-28 rounded-2xl overflow-hidden border border-gray-700 mb-4">
                        <Image
                          src={vehicle.image_url || "/placeholder.png"}
                          alt={vehicle.name}
                          fill
                          className="
    object-cover
    group-hover:scale-105
    transition
    duration-700
"
                        />
                      </div>

                      <span className="text-blue-500 text-xl font-bold">
                        {vehicle.name}
                      </span>
                    </div>
                  </th>
                ))}
              </tr>
            </thead>

            <tbody>
              <tr className="border-t border-gray-800">
                <td className="p-8 text-xl font-semibold">Mileage</td>

                {vehicles.map((vehicle: any, index: number) => (
                  <td
                    key={index}
                    className="p-8 text-center text-blue-500 text-2xl font-bold"
                  >
                    {vehicle.mileage} kmpl
                  </td>
                ))}
              </tr>

              <tr className="border-t border-gray-800">
                <td className="p-8 text-xl font-semibold">Safety</td>

                {vehicles.map((vehicle: any, index: number) => (
                  <td
                    key={index}
                    className="p-8 text-center text-blue-500 text-2xl font-bold"
                  >
                    {vehicle.safety} Star
                  </td>
                ))}
              </tr>

              <tr className="border-t border-gray-800">
                <td className="p-8 text-xl font-semibold">Price</td>

                {vehicles.map((vehicle: any, index: number) => (
                  <td
                    key={index}
                    className="p-8 text-center text-blue-500 text-2xl font-bold"
                  >
                    ₹{vehicle.price}
                  </td>
                ))}
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      {/* CTA */}
      <section className="relative z-10 px-8 pb-32">
        <div className="max-w-5xl mx-auto rounded-[40px] border border-gray-800 bg-gradient-to-r from-[#071540] via-[#091a52] to-black p-16 text-center shadow-[0_0_80px_rgba(37,99,235,0.15)]">
          <h2 className="text-6xl font-extrabold mb-8">
            Ready To Find Your Next Ride?
          </h2>

          <p className="text-gray-400 text-2xl max-w-3xl mx-auto leading-relaxed">
            Let AI help you choose the perfect vehicle based on real-world needs
            and smart analysis.
          </p>

          <button
            onClick={() => router.push("/")}
            className="mt-12 bg-blue-600 hover:bg-blue-700 px-12 py-5 rounded-2xl text-2xl font-bold transition shadow-lg shadow-blue-500/30"
          >
            Start Again
          </button>
        </div>
      </section>
    </main>
  );
}
