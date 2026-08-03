"use client";

import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import Image from "next/image";

// import Image from "next/image";

export default function VehicleDetailsPage() {
  const params = useParams();
  const router = useRouter();

  const [vehicle, setVehicle] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  const [reviews, setReviews] = useState<any[]>([]);

  const [aiAnalysis, setAiAnalysis] = useState<any>(null);

  const [similarVehicles, setSimilarVehicles] = useState<any[]>([]);

  const [fuelPrices, setFuelPrices] = useState({
    petrol: 0,
    diesel: 0,
    electric: 0,
    updated: "",
  });

  const [distance, setDistance] = useState(1000);

  const [fuelCost, setFuelCost] = useState({
    litres: 0,
    monthly: 0,
    yearly: 0,
    costPerKm: 0,
  });

  useEffect(() => {
    const fetchData = async () => {
      try {
        const fuelResponse = await fetch("http://localhost:5001/fuel-prices");

        const fuelData = await fuelResponse.json();

        if (fuelData.success) {
          setFuelPrices(fuelData.prices);
        }
        // Vehicle

        const vehicleResponse = await fetch(
          `http://localhost:5001/vehicle/${params.id}`,
        );

        const vehicleData = await vehicleResponse.json();

        setVehicle(vehicleData.vehicle);

        const recent = JSON.parse(
          localStorage.getItem("recentVehicles") || "[]",
        );

        const filtered = recent.filter(
          (v: any) => v.id !== vehicleData.vehicle.id,
        );

        filtered.unshift(vehicleData.vehicle);

        localStorage.setItem(
          "recentVehicles",
          JSON.stringify(filtered.slice(0, 5)),
        );

        const similarResponse = await fetch(
          `http://localhost:5001/similar/${params.id}`,
        );

        const similarData = await similarResponse.json();

        setSimilarVehicles(similarData.vehicles || []);

        const aiResponse = await fetch("http://localhost:5001/vehicle-ai", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            vehicle: vehicleData.vehicle,
          }),
        });

        const aiData = await aiResponse.json();

        console.log(aiData);

        setAiAnalysis(aiData.ai);

        // Reviews

        const reviewResponse = await fetch(
          `http://localhost:5001/vehicle/${params.id}/reviews`,
        );

        const reviewData = await reviewResponse.json();

        setReviews(reviewData.reviews || []);
      } catch (error) {
        console.error(error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [params.id]);

  useEffect(() => {
    if (!vehicle) return;

    const mileage = Number(vehicle.mileage);

    if (!mileage || mileage <= 0) return;

    let fuelPrice = fuelPrices.petrol;

    const fuel = vehicle.fuel_type?.toLowerCase();

    if (fuel?.includes("diesel")) fuelPrice = fuelPrices.diesel;

    if (fuel?.includes("electric")) fuelPrice = fuelPrices.electric;

    const litres = distance / mileage;

    const monthly = litres * fuelPrice;

    const yearly = monthly * 12;

    const costPerKm = monthly / distance;

    setFuelCost({
      litres,
      monthly,
      yearly,
      costPerKm,
    });
  }, [distance, vehicle, fuelPrices]);

  if (loading) {
    return (
      <main className="min-h-screen bg-black text-white flex items-center justify-center">
        <h1 className="text-4xl font-bold">Loading Vehicle...</h1>
      </main>
    );
  }

  if (!vehicle) {
    return (
      <main className="min-h-screen bg-black text-white flex items-center justify-center">
        <h1 className="text-4xl font-bold">Vehicle Not Found</h1>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-black text-white">
      <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[800px] bg-blue-600/20 blur-[180px] rounded-full"></div>

      <section className="relative max-w-7xl mx-auto px-8 py-20">
        <button
          onClick={() => router.back()}
          className="mb-10 border border-gray-700 px-5 py-3 rounded-xl hover:border-blue-500 transition"
        >
          ← Back
        </button>

        <div className="grid lg:grid-cols-2 gap-16 items-center">
          {/* IMAGE */}

          <div className="relative h-[550px] rounded-[36px] overflow-hidden border border-gray-800 shadow-2xl">
            <Image
              src={vehicle.image_url || "/placeholder.png"}
              alt={vehicle.name}
              fill
              className="object-cover"
            />
          </div>

          {/* CONTENT */}

          <div>
            <p className="text-blue-500 font-semibold text-xl mb-4">
              {vehicle.body_type} • {vehicle.fuel_type}
            </p>

            <h1 className="text-7xl font-extrabold leading-tight">
              {vehicle.name}
            </h1>

            {/* <div className="flex gap-4 mt-6">
              <div className="bg-green-600 px-5 py-2 rounded-full font-bold">
                92% Match
              </div>

              <div className="bg-blue-600 px-5 py-2 rounded-full font-bold">
                AI Recommended
              </div>
            </div> */}
            {/* 
            <p className="text-gray-400 text-xl mt-8 leading-relaxed">
              {aiAnalysis?.summary || vehicle.reason}
            </p> */}

            {/* AI BOX */}

            {/* <div className="mt-10 bg-blue-500/10 border border-blue-500/20 rounded-3xl p-8">
              <h2 className="text-3xl font-bold mb-6">
                🤖 Why RideMatch Picked This
              </h2>

              <div className="space-y-4 text-lg text-gray-300">
                <p>✅ Fits comfortably within your budget</p>

                <p>✅ Strong match for daily driving needs</p>

                <p>✅ Good balance of safety and mileage</p>

                <p>✅ Recommended for long-term ownership</p>
              </div>
            </div> */}

            <div className="mt-10 bg-blue-500/10 border border-blue-500/20 rounded-3xl p-8">
              <h2 className="text-3xl font-bold mb-6">🤖 AI Summary</h2>

              <p className="text-lg leading-9 text-gray-300">
                {aiAnalysis?.summary || "AI analysis unavailable."}
              </p>
            </div>

            {/* STATS */}

            <div className="grid grid-cols-3 gap-5 mt-10">
              <div className="bg-zinc-900 p-6 rounded-3xl">
                <p className="text-gray-500">Mileage</p>

                <h3 className="text-3xl font-bold text-blue-500 mt-3">
                  {vehicle.mileage}
                </h3>
              </div>

              <div className="bg-zinc-900 p-6 rounded-3xl">
                <p className="text-gray-500">Safety</p>

                <h3 className="text-3xl font-bold text-blue-500 mt-3">
                  {vehicle.safety} ⭐
                </h3>
              </div>

              <div className="bg-zinc-900 p-6 rounded-3xl">
                <p className="text-gray-500">Price</p>

                <h3 className="text-3xl font-bold text-blue-500 mt-3">
                  ₹{vehicle.price}
                </h3>
              </div>
            </div>
          </div>
        </div>

        {/* PROS CONS */}

        {/* <div className="grid lg:grid-cols-2 gap-8 mt-20">
          <div className="bg-zinc-900 rounded-3xl p-8">
            <h2 className="text-3xl font-bold text-green-500 mb-6">Pros</h2>

            <ul className="space-y-4 text-lg">
              <li>✅ Excellent mileage</li>
              <li>✅ Easy maintenance</li>
              <li>✅ Strong service network</li>
              <li>✅ Good resale value</li>
            </ul>
          </div>

          <div className="bg-zinc-900 rounded-3xl p-8">
            <h2 className="text-3xl font-bold text-red-500 mb-6">Cons</h2>

            <ul className="space-y-4 text-lg">
              <li>❌ Average highway performance</li>
              <li>❌ Limited premium features</li>
              <li>❌ Cabin insulation could improve</li>
            </ul>
          </div>
        </div> */}

        {/* OWNERSHIP COST */}

        {/* <div className="mt-20 bg-zinc-900 rounded-3xl p-10">
          <h2 className="text-4xl font-bold mb-10">
            Estimated 5-Year Ownership Cost
          </h2>

          <div className="grid md:grid-cols-4 gap-8">
            <div>
              <p className="text-gray-500">Fuel</p>

              <h3 className="text-3xl font-bold text-blue-500 mt-2">₹3.2L</h3>
            </div>

            <div>
              <p className="text-gray-500">Service</p>

              <h3 className="text-3xl font-bold text-blue-500 mt-2">₹40K</h3>
            </div>

            <div>
              <p className="text-gray-500">Insurance</p>

              <h3 className="text-3xl font-bold text-blue-500 mt-2">₹80K</h3>
            </div>

            <div>
              <p className="text-gray-500">Total</p>

              <h3 className="text-3xl font-bold text-green-500 mt-2">₹4.4L</h3>
            </div>
          </div>
        </div> */}

        {/* AI ANALYSIS */}

        <div className="bg-zinc-900 rounded-3xl p-10 mt-10">
          <h2 className="text-4xl font-bold mb-8">🤖 AI Vehicle Analysis</h2>

          <div className="mb-8">
            <h3 className="text-green-400 text-2xl font-bold mb-4">Pros</h3>

            {/* {aiAnalysis.pros.map((item: string, index: number) => (
      <p key={index} className="mb-2">
        ✅ {item}
      </p>
    ))} */}
            {aiAnalysis?.pros?.map((item: string, index: number) => (
              <p key={index}>✅ {item}</p>
            ))}
          </div>

          <div className="mb-8">
            <h3 className="text-red-400 text-2xl font-bold mb-4">Cons</h3>

            {/* {aiAnalysis.cons.map((item: string, index: number) => (
              <p key={index} className="mb-2">
                ❌ {item}
              </p>
            ))} */}

            {aiAnalysis?.cons?.length > 0 ? (
              aiAnalysis.cons.map((item: string, index: number) => (
                <p key={index} className="mb-2">
                  ❌ {item}
                </p>
              ))
            ) : (
              <p className="text-gray-400">No major drawbacks identified.</p>
            )}
          </div>

          <div>
            <h3 className="text-blue-400 text-2xl font-bold mb-4">Summary</h3>

            {/* <p>{aiAnalysis.summary}</p> */}
            <p>{aiAnalysis?.summary || "No AI summary available."}</p>
          </div>
        </div>

        <div className="mt-10 rounded-3xl border border-zinc-800 bg-zinc-900/70 backdrop-blur-xl p-6">
          <h2 className="text-2xl font-bold mb-6">Today's Fuel Prices</h2>

          <div className="grid md:grid-cols-3 gap-4">
            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">⛽ Petrol</p>

              <h3 className="text-3xl font-black text-green-400">
                ₹{fuelPrices.petrol}
              </h3>

              <p className="text-sm text-zinc-500">per litre</p>
            </div>

            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">🛢 Diesel</p>

              <h3 className="text-3xl font-black text-yellow-400">
                ₹{fuelPrices.diesel}
              </h3>

              <p className="text-sm text-zinc-500">per litre</p>
            </div>

            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">⚡ EV Charging</p>

              <h3 className="text-3xl font-black text-cyan-400">
                ₹{fuelPrices.electric}
              </h3>

              <p className="text-sm text-zinc-500">per unit</p>
            </div>
          </div>

          <p className="mt-5 text-sm text-zinc-500">
            Updated: {fuelPrices.updated}
          </p>
        </div>

        <div className="mt-10 rounded-3xl border border-zinc-800 bg-zinc-900/70 backdrop-blur-xl p-8">
          <h2 className="text-3xl font-bold mb-8">Fuel Cost Calculator</h2>

          <div className="mb-8">
            <label className="text-zinc-400">Monthly Distance (km)</label>

            <input
              type="number"
              value={distance}
              onChange={(e) => setDistance(Number(e.target.value))}
              className="mt-3 w-full rounded-xl bg-black/40 border border-zinc-700 p-4 text-xl"
            />
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-5">
            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">Fuel Needed</p>

              <h3 className="text-3xl font-bold text-cyan-400">
                {fuelCost.litres.toFixed(1)} L
              </h3>
            </div>

            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">Monthly Cost</p>

              <h3 className="text-3xl font-bold text-green-400">
                ₹{fuelCost.monthly.toFixed(0)}
              </h3>
            </div>

            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">Yearly Cost</p>

              <h3 className="text-3xl font-bold text-yellow-400">
                ₹{fuelCost.yearly.toFixed(0)}
              </h3>
            </div>

            <div className="rounded-2xl bg-black/40 p-5">
              <p className="text-zinc-400">Cost / km</p>

              <h3 className="text-3xl font-bold text-blue-400">
                ₹{fuelCost.costPerKm.toFixed(2)}
              </h3>
            </div>
          </div>
        </div>

        <section className="mt-20">
          <h2 className="text-4xl font-bold mb-10">You May Also Like</h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            {similarVehicles.map((car: any) => (
              <div
                key={car.id}
                className="bg-zinc-900 rounded-3xl overflow-hidden hover:scale-105 transition"
              >
                <img
                  src={car.image_url || "/placeholder.png"}
                  className="w-full h-44 object-cover"
                />

                <div className="p-5">
                  <h3 className="text-xl font-bold">{car.name}</h3>

                  <p className="text-zinc-400 mt-2">₹ {car.price}</p>

                  <button
                    onClick={() => router.push(`/vehicle/${car.id}`)}
                    className="mt-5 w-full bg-blue-600 rounded-xl py-3"
                  >
                    View Details
                  </button>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* REVIEWS */}

        <div className="mt-20">
          <h2 className="text-4xl font-bold mb-10">⭐ Customer Reviews</h2>

          {reviews.length === 0 ? (
            <div className="bg-zinc-900 rounded-3xl p-8">
              No reviews available
            </div>
          ) : (
            <div className="space-y-6">
              {reviews.map((review: any) => (
                <div key={review.id} className="bg-zinc-900 rounded-3xl p-8">
                  <div className="flex justify-between items-center">
                    <h3 className="text-xl font-bold">{review.source}</h3>

                    <span className="text-yellow-400">⭐ {review.rating}</span>
                  </div>

                  <p className="text-gray-400 mt-4">{review.review}</p>
                </div>
              ))}
            </div>
          )}
        </div>
      </section>
    </main>
  );
}
