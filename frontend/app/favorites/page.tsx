"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";

export default function FavoritesPage() {
  const [vehicles, setVehicles] = useState<any[]>([]);
  const [filter, setFilter] = useState<"all" | "car" | "bike">("all");
  const router = useRouter();
  const API = process.env.NEXT_PUBLIC_API_URL;


  const loadFavorites = async () => {
    const res = await fetch(`${API}/favorites`);
    const data = await res.json();
    setVehicles(data.vehicles || []);
  };

  useEffect(() => { loadFavorites(); }, []);

  const removeFavorite = async (id: number) => {
    await fetch(`${API}/favorites/${id}`, { method: "DELETE" });
    loadFavorites();
  };

  const filtered = vehicles.filter(v =>
    filter === "all" ? true : v.type === filter
  );

  if (vehicles.length === 0) {
    return (
      <main className="min-h-screen bg-[#111] text-white flex flex-col items-center justify-center gap-4">
        <div className="text-4xl text-red-500">♥</div>
        <h2 className="text-2xl font-semibold text-white">No favorites yet</h2>
        <p className="text-[#555] text-sm">Save vehicles while browsing to see them here.</p>
        <Link href="/cars" className="mt-4 bg-blue-600 hover:bg-blue-700 transition-colors text-sm font-medium px-5 py-2.5 rounded-lg">
          Explore vehicles
        </Link>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-[#111]">

      {/* Nav */}
      <nav className="flex items-center gap-0 px-8 h-[52px] border-b border-[#1f1f1f] bg-[#0d0d0d]">
        <button
          onClick={() => router.back()}
          className="flex items-center gap-2 text-[#888] hover:text-white text-xs tracking-wide border border-[#242424] hover:border-[#3a3a3a] px-3 py-1.5 rounded-md transition-all bg-transparent"
        >
          ← Back
        </button>
        <div className="w-px h-4 bg-[#222] mx-3.5" />
        <span className="text-[11px] text-[#444] tracking-wide">
          Garage / <span className="text-[#666]">My Favorites</span>
        </span>
      </nav>

      {/* Header */}
      <div className="flex items-end justify-between px-8 py-7 border-b border-[#1a1a1a]">
        <div>
          <h1 className="text-[22px] font-semibold text-white tracking-tight flex items-center gap-2.5">
            <span className="text-red-500">♥</span>
            My Favorites
            <span className="text-xs font-normal text-[#555] ml-1">{vehicles.length} saved</span>
          </h1>
          <p className="text-xs text-[#555] mt-1.5">Tap a card to view full details</p>
        </div>
        <div className="flex gap-1.5">
          {(["all", "car", "bike"] as const).map(f => (
            <button
              key={f}
              onClick={() => setFilter(f)}
              className={`text-[11px] px-3.5 py-1.5 rounded-full border transition-all capitalize tracking-wide ${
                filter === f
                  ? "bg-blue-600 border-blue-600 text-white font-medium"
                  : "border-[#242424] text-[#555] hover:text-[#bbb] hover:border-[#3a3a3a] bg-transparent"
              }`}
            >
              {f === "all" ? "All" : f === "car" ? "Cars" : "Bikes"}
            </button>
          ))}
        </div>
      </div>

      {/* Grid */}
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 p-8">
        {filtered.map((vehicle: any) => (
          <div
            key={vehicle.id}
            className="bg-[#171717] border border-[#1f1f1f] hover:border-[#2e2e2e] rounded-2xl overflow-hidden flex flex-col group transition-all duration-200 hover:-translate-y-0.5"
          >
            {/* Image */}
            <div className="relative h-[150px] bg-[#111] overflow-hidden">
              <span className={`absolute top-2.5 left-2.5 z-10 text-[10px] font-semibold tracking-wide px-2.5 py-1 rounded-full uppercase ${
                vehicle.type === "bike"
                  ? "bg-emerald-900/20 text-emerald-400 border border-emerald-800/30"
                  : "bg-blue-900/20 text-blue-400 border border-blue-800/30"
              }`}>
                {vehicle.type || "Car"}
              </span>
              <button
                onClick={() => removeFavorite(vehicle.id)}
                className="absolute top-2.5 right-2.5 z-10 w-7 h-7 flex items-center justify-center bg-black/55 border border-white/[0.08] rounded-md text-red-500 hover:bg-red-800 hover:border-red-800 hover:text-white transition-all text-xs"
                aria-label="Remove"
              >
                ♥
              </button>
              <img
                src={vehicle.image_url || vehicle.image}
                alt={vehicle.name}
                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              {/* Image fade to card bg */}
              <div className="absolute inset-0 bg-gradient-to-b from-transparent via-transparent to-[#171717] pointer-events-none" />
            </div>

            {/* Body */}
            <div className="p-3.5 flex flex-col gap-2.5 flex-1">
              <p className="text-[13px] font-semibold text-[#e8e8e8] leading-snug tracking-tight">{vehicle.name}</p>
              <p className="text-xs text-[#666]">
                Starting at <span className="text-base font-medium text-[#ccc] tracking-tight">₹ {vehicle.price}</span>
              </p>
              <div className="flex gap-2 mt-auto pt-1">
                <Link href={`/vehicle/${vehicle.id}`} className="flex-1">
                  <button className="w-full flex items-center justify-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium py-2.5 rounded-lg transition-colors">
                    Details
                  </button>
                </Link>
                <button
                  onClick={() => removeFavorite(vehicle.id)}
                  className="w-[34px] h-[34px] flex items-center justify-center bg-[#1e1e1e] border border-[#2a2a2a] hover:bg-[#2a1515] hover:border-[#5a1a1a] rounded-lg text-red-500 transition-all text-sm"
                  aria-label="Remove from favorites"
                >
                  ♥
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

    </main>
  );
}