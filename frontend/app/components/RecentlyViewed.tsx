"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

export default function RecentlyViewed() {
  const [vehicles, setVehicles] = useState<any[]>([]);

  useEffect(() => {
    const data = JSON.parse(
      localStorage.getItem("recentVehicles") || "[]"
    );

    setVehicles(data);
  }, []);

  if (vehicles.length === 0) return null;

  return (
    <section className="mt-20">

      <h2 className="text-4xl font-bold mb-8">
        Recently Viewed
      </h2>

      <div className="grid md:grid-cols-2 lg:grid-cols-5 gap-6">

        {vehicles.map((v) => (

          <Link
            href={`/vehicle/${v.id}`}
            key={v.id}
          >

            <div className="bg-zinc-900 rounded-3xl overflow-hidden hover:scale-105 transition">

              <img
                src={v.image_url || v.image}
                className="w-full h-36 object-cover"
              />

              <div className="p-4">

                <h3 className="font-bold">
                  {v.name}
                </h3>

                <p className="text-zinc-400">
                  ₹ {v.price}
                </p>

              </div>

            </div>

          </Link>

        ))}

      </div>

    </section>
  );
}