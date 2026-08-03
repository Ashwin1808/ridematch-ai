"use client";

import Link from "next/link";

interface Props {
  vehicles: any[];
  winner?: string;
}

export default function CompareCards({
  vehicles,
  winner,
}: Props) {
  return (
    <section className="max-w-7xl mx-auto mb-14">

      <div className="grid gap-8 md:grid-cols-2 xl:grid-cols-3">

        {vehicles.map((vehicle) => {

          const isWinner = winner === vehicle.name;

          return (

            <div
              key={vehicle.id}
              className={`relative rounded-3xl overflow-hidden transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl ${
                isWinner
                  ? "border-2 border-green-500 bg-gradient-to-b from-green-500/10 to-zinc-900"
                  : "border border-zinc-800 bg-zinc-900"
              }`}
            >

              {isWinner && (
                <div className="absolute top-5 right-5 z-20">

                  <span className="rounded-full bg-green-500 px-4 py-2 text-sm font-bold">

                    🏆 AI Winner

                  </span>

                </div>
              )}

              <img
                src={vehicle.image_url || "/placeholder.png"}
                alt={vehicle.name}
                className="h-60 w-full object-cover"
              />

              <div className="p-6">

                <h2 className="text-3xl font-black">

                  {vehicle.name}

                </h2>

                <p className="mt-2 text-zinc-400">

                  {vehicle.make}

                </p>

                <div className="mt-6 grid grid-cols-2 gap-4">

                  <div className="rounded-xl bg-zinc-800 p-4">

                    <p className="text-sm text-zinc-400">

                      Price

                    </p>

                    <p className="mt-1 font-bold text-green-400">

                      ₹{vehicle.price}

                    </p>

                  </div>

                  <div className="rounded-xl bg-zinc-800 p-4">

                    <p className="text-sm text-zinc-400">

                      Mileage

                    </p>

                    <p className="mt-1 font-bold">

                      {vehicle.mileage} kmpl

                    </p>

                  </div>

                  <div className="rounded-xl bg-zinc-800 p-4">

                    <p className="text-sm text-zinc-400">

                      Safety

                    </p>

                    <p className="mt-1">

                      ⭐ {vehicle.safety}

                    </p>

                  </div>

                  <div className="rounded-xl bg-zinc-800 p-4">

                    <p className="text-sm text-zinc-400">

                      Fuel

                    </p>

                    <p className="mt-1">

                      {vehicle.fuel_type}

                    </p>

                  </div>

                </div>

                <Link href={`/vehicle/${vehicle.id}`}>

                  <button className="mt-8 w-full rounded-xl bg-blue-600 py-4 font-bold hover:bg-blue-700 transition">

                    View Details →

                  </button>

                </Link>

              </div>

            </div>

          );

        })}

      </div>

    </section>
  );
}