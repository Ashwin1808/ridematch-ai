// "use client";

// import { useEffect, useState } from "react";
// import Link from "next/link";
// import { main } from "framer-motion/client";

// export default function CarsPage() {
//   const [vehicles, setVehicles] = useState<any[]>([]);

//   const [loading, setLoading] = useState(true);

//   const [search, setSearch] = useState("");

//   const [brand, setBrand] = useState("");
//   const [fuel, setFuel] = useState("");
//   const [transmission, setTransmission] = useState("");
//   const [bodyType, setBodyType] = useState("");

//   const [budget, setBudget] = useState("");

//   const [sort, setSort] = useState("name");

//   const [page, setPage] = useState(1);

//   const [totalPages, setTotalPages] = useState(1);

//   const [totalVehicles, setTotalVehicles] = useState(0);

//   const [savingId, setSavingId] = useState<number | null>(null);

//   //------------------------------------
//   // Fetch Vehicles
//   //------------------------------------

//   useEffect(() => {

//     const fetchVehicles = async () => {

//       try {

//         setLoading(true);

//         const params = new URLSearchParams();

//         if (search) params.append("search", search);

//         if (brand) params.append("brand", brand);

//         if (fuel) params.append("fuel", fuel);

//         if (transmission)
//           params.append("transmission", transmission);

//         if (bodyType)
//           params.append("body", bodyType);

//         if (budget)
//           params.append("budget", budget);

//         params.append("sort", sort);

//         params.append("page", page.toString());

//         params.append("limit", "12");

//         const response = await fetch(

//           `http://localhost:5001/vehicles?${params.toString()}`

//         );

//         const data = await response.json();

//         setVehicles(data.vehicles || []);

//         setTotalPages(data.pages || 1);

//         setTotalVehicles(data.total || 0);

//       } catch (err) {

//         console.error(err);

//       } finally {

//         setLoading(false);

//       }

//     };

//     fetchVehicles();

//   }, [

//     search,

//     brand,

//     fuel,

//     transmission,

//     bodyType,

//     budget,

//     sort,

//     page,

//   ]);

//   //------------------------------------
//   // Favorite
//   //------------------------------------

//   const addToFavorites = async (

//     e: React.MouseEvent,

//     vehicleId: number

//   ) => {

//     e.preventDefault();

//     e.stopPropagation();

//     try {

//       setSavingId(vehicleId);

//       const response = await fetch(

//         "http://localhost:5001/favorites",

//         {

//           method: "POST",

//           headers: {

//             "Content-Type": "application/json",

//           },

//           body: JSON.stringify({

//             vehicleId,

//           }),

//         }

//       );

//       const data = await response.json();

//       alert(data.message);

//     } catch {

//       alert("Failed to save");

//     } finally {

//       setSavingId(null);

//     }

//   };

//   return (
//   <main className="min-h-screen bg-gradient-to-b from-black via-zinc-950 to-black text-white">

//     {/* Hero */}
//     <section className="relative overflow-hidden border-b border-zinc-800">

//       <div className="absolute inset-0 bg-gradient-to-r from-blue-600/10 via-transparent to-cyan-500/10" />

//       <div className="relative max-w-7xl mx-auto px-8 py-16">

//         <div className="flex flex-col lg:flex-row justify-between lg:items-center gap-10">

//           <div>

//             <p className="uppercase tracking-[8px] text-blue-400 text-sm mb-4">
//               AI Powered Vehicle Finder
//             </p>

//             <h1 className="text-6xl font-black leading-tight">
//               RideMatch
//               <span className="text-blue-500"> Garage</span>
//             </h1>

//             <p className="text-zinc-400 text-xl mt-6 max-w-2xl leading-8">
//               Discover your perfect car with intelligent recommendations,
//               compare vehicles, save favourites and explore India's biggest
//               vehicle collection.
//             </p>

//           </div>

//           <Link
//             href="/"
//             className="h-fit px-6 py-4 rounded-2xl bg-zinc-900 hover:bg-blue-600 border border-zinc-700 transition"
//           >
//             ← Home
//           </Link>

//         </div>

//       </div>

//     </section>

//     {/* Filter Card */}

//     <section className="max-w-7xl mx-auto px-8 -mt-8 relative z-10">

//       <div className="rounded-3xl bg-zinc-900/70 backdrop-blur-xl border border-zinc-800 p-8 shadow-2xl">

//         <div className="grid lg:grid-cols-6 gap-5">

//           <input
//             type="text"
//             placeholder="🔍 Search vehicles..."
//             value={search}
//             onChange={(e) => {
//               setSearch(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 outline-none border border-zinc-700 focus:border-blue-500"
//           />

//           <select
//             value={brand}
//             onChange={(e) => {
//               setBrand(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
//           >
//             <option value="">Brand</option>
//             <option>Hyundai</option>
//             <option>Honda</option>
//             <option>Tata</option>
//             <option>Toyota</option>
//             <option>Mahindra</option>
//             <option>Maruti Suzuki</option>
//             <option>Kia</option>
//           </select>

//           <select
//             value={fuel}
//             onChange={(e) => {
//               setFuel(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
//           >
//             <option value="">Fuel</option>
//             <option>Petrol</option>
//             <option>Diesel</option>
//             <option>CNG</option>
//             <option>Electric</option>
//           </select>

//           <select
//             value={transmission}
//             onChange={(e) => {
//               setTransmission(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
//           >
//             <option value="">Transmission</option>
//             <option>Manual</option>
//             <option>Automatic</option>
//           </select>

//           <select
//             value={bodyType}
//             onChange={(e) => {
//               setBodyType(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
//           >
//             <option value="">Body</option>
//             <option>SUV</option>
//             <option>Sedan</option>
//             <option>Hatchback</option>
//             <option>MUV</option>
//           </select>

//           <select
//             value={sort}
//             onChange={(e) => {
//               setSort(e.target.value);
//               setPage(1);
//             }}
//             className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
//           >
//             <option value="name">Sort By</option>
//             <option value="price-low">Price ↑</option>
//             <option value="price-high">Price ↓</option>
//             <option value="mileage">Mileage</option>
//           </select>

//         </div>

//       </div>

//     </section>

//     {/* Stats */}

//     <section className="max-w-7xl mx-auto px-8 mt-10">

//       <div className="flex flex-col md:flex-row justify-between gap-8 items-center">

//         <div>

//           <h2 className="text-4xl font-black">

//             {totalVehicles.toLocaleString()} Vehicles

//           </h2>

//           <p className="text-zinc-400 mt-2">

//             Showing {(page - 1) * 12 + 1} -

//             {Math.min(page * 12, totalVehicles)}

//             {" "}of{" "}

//             {totalVehicles}

//           </p>

//         </div>

//         <div className="flex gap-5">

//           <div className="bg-zinc-900 rounded-2xl px-6 py-4 border border-zinc-800">

//             <p className="text-zinc-500 text-sm">Page</p>

//             <h3 className="text-2xl font-bold">

//               {page}/{totalPages}

//             </h3>

//           </div>

//           <div className="bg-zinc-900 rounded-2xl px-6 py-4 border border-zinc-800">

//             <p className="text-zinc-500 text-sm">Results</p>

//             <h3 className="text-2xl font-bold">

//               {vehicles.length}

//             </h3>

//           </div>

//         </div>

//       </div>

//     </section>

//     {/* Cards */}

//     <section className="max-w-7xl mx-auto px-8 mt-12">

//       {loading ? (

//         <div className="text-center text-2xl py-24">

//           Loading Vehicles...

//         </div>

//       ) : (

//       {/* Vehicle Cards */}

//       <>
//       <div className="grid sm:grid-cols-2 xl:grid-cols-3 gap-8">

//   {vehicles.map((vehicle: any) => (

//     <Link
//       key={vehicle.id}
//       href={`/vehicle/${vehicle.id}`}
//     >

//       <div className="group rounded-3xl overflow-hidden border border-zinc-800 bg-zinc-900/60 backdrop-blur-xl hover:border-blue-500 transition-all duration-300 hover:-translate-y-2 hover:shadow-[0_20px_60px_rgba(59,130,246,.20)]">

//         {/* Image */}

//         <div className="relative h-72 bg-gradient-to-br from-zinc-950 via-zinc-900 to-zinc-800 flex items-center justify-center overflow-hidden">

//           <img
//             src={vehicle.image_url || "/placeholder.png"}
//             alt={vehicle.name}
//             className="w-full h-full object-contain p-6 group-hover:scale-110 transition duration-500"
//           />

//           <button
//             type="button"
//             onClick={(e) => addToFavorites(e, vehicle.id)}
//             className="absolute top-4 right-4 h-12 w-12 rounded-full bg-black/60 backdrop-blur-xl flex items-center justify-center text-2xl hover:bg-blue-600 transition"
//           >
//             {savingId === vehicle.id ? "⏳" : "🤍"}
//           </button>

//           <div className="absolute top-4 left-4">

//             <span className="px-3 py-1 rounded-full bg-blue-600 text-sm font-semibold">

//               {vehicle.make}

//             </span>

//           </div>

//         </div>

//         {/* Content */}

//         <div className="p-7">

//           <h2 className="text-2xl font-bold leading-tight line-clamp-2">

//             {vehicle.name}

//           </h2>

//           <p className="text-3xl font-black text-blue-400 mt-4">

//             ₹ {vehicle.price}

//           </p>

//           <div className="grid grid-cols-2 gap-4 mt-6">

//             <div className="rounded-2xl bg-black/40 p-4">

//               <p className="text-xs text-zinc-500 uppercase">

//                 Mileage

//               </p>

//               <h3 className="font-bold mt-1">

//                 ⛽ {vehicle.mileage || "--"} kmpl

//               </h3>

//             </div>

//             <div className="rounded-2xl bg-black/40 p-4">

//               <p className="text-xs text-zinc-500 uppercase">

//                 Safety

//               </p>

//               <h3 className="font-bold mt-1">

//                 🛡 {vehicle.safety || "--"} ⭐

//               </h3>

//             </div>

//             <div className="rounded-2xl bg-black/40 p-4">

//               <p className="text-xs text-zinc-500 uppercase">

//                 Fuel

//               </p>

//               <h3 className="font-bold mt-1">

//                 {vehicle.fuel_type || "--"}

//               </h3>

//             </div>

//             <div className="rounded-2xl bg-black/40 p-4">

//               <p className="text-xs text-zinc-500 uppercase">

//                 Transmission

//               </p>

//               <h3 className="font-bold mt-1">

//                 {vehicle.transmission || "--"}

//               </h3>

//             </div>

//           </div>

//           <div className="flex items-center justify-between mt-8">

//             <div>

//               <p className="text-xs text-zinc-500">

//                 Body

//               </p>

//               <h4 className="font-semibold">

//                 {vehicle.body_type || "--"}

//               </h4>

//             </div>

//             <button
//               className="rounded-xl bg-blue-600 hover:bg-blue-500 px-5 py-3 font-semibold transition"
//             >
//               View →
//             </button>

//           </div>

//         </div>

//       </div>

//     </Link>

//   ))}

// </div>

// </>

// {/* Empty State */}

// {!loading && vehicles.length === 0 && (

// <section className="max-w-5xl mx-auto py-28 text-center">

// <div className="text-8xl mb-6">
// 🚘
// </div>

// <h2 className="text-4xl font-black">
// No Vehicles Found
// </h2>

// <p className="text-zinc-400 mt-4 text-xl">
// Try changing your search or filters.
// </p>

// <button
// onClick={()=>{
// setSearch("");
// setBrand("");
// setFuel("");
// setTransmission("");
// setBodyType("");
// setBudget("");
// setSort("name");
// setPage(1);
// }}
// className="mt-8 bg-blue-600 hover:bg-blue-500 px-8 py-4 rounded-2xl font-bold transition"
// >

// Reset Filters

// </button>

// </section>

// )}

// {/* Pagination */}

// <section className="max-w-7xl mx-auto px-8 py-20">

// <div className="flex justify-center items-center gap-5">

// <button

// disabled={page===1}

// onClick={()=>{

// window.scrollTo({
// top:0,
// behavior:"smooth"
// });

// setPage(page-1);

// }}

// className="px-6 py-4 rounded-2xl bg-zinc-900 border border-zinc-700 disabled:opacity-30 hover:bg-zinc-800 transition"

// >

// ← Previous

// </button>

// <div className="flex gap-3">

// {

// Array.from({

// length:Math.min(totalPages,5)

// }).map((_,i)=>{

// let number=i+1;

// if(page>3){

// number=page-2+i;

// }

// if(number>totalPages)return null;

// return(

// <button

// key={number}

// onClick={()=>{

// window.scrollTo({

// top:0,

// behavior:"smooth"

// });

// setPage(number);

// }}

// className={`

// h-12

// w-12

// rounded-xl

// font-bold

// transition

// ${page===number

// ?

// "bg-blue-600"

// :

// "bg-zinc-900 border border-zinc-700 hover:bg-zinc-800"

// }

// `}

// >

// {number}

// </button>

// )

// })

// }

// </div>

// <button

// disabled={page===totalPages}

// onClick={()=>{

// window.scrollTo({

// top:0,

// behavior:"smooth"

// });

// setPage(page+1);

// }}

// className="px-6 py-4 rounded-2xl bg-blue-600 hover:bg-blue-500 disabled:opacity-30 transition"

// >

// Next →

// </button>

// </div>

// </section>

// {/* Footer */}

// <footer className="border-t border-zinc-800">

// <div className="max-w-7xl mx-auto px-8 py-14 flex flex-col md:flex-row justify-between items-center">

// <div>

// <h2 className="text-2xl font-black">

// RideMatch

// </h2>

// <p className="text-zinc-500 mt-2">

// AI Powered Vehicle Recommendation Platform

// </p>

// </div>

// <div className="flex gap-8 mt-8 md:mt-0">

// <Link
// href="/"
// className="hover:text-blue-400"
// >

// Home

// </Link>

// <Link
// href="/favorites"
// className="hover:text-blue-400"
// >

// Favorites

// </Link>

// <Link
// href="/recommend"
// className="hover:text-blue-400"
// >

// AI Recommendation

// </Link>

// </div>

// </div>

// </footer>

// </main>

// );
// }
//   );
// }

"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useCompare } from "../components/context/CompareContext";

export default function CarsPage() {
  const [vehicles, setVehicles] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [brand, setBrand] = useState("");
  const [fuel, setFuel] = useState("");
  const [transmission, setTransmission] = useState("");
  const [bodyType, setBodyType] = useState("");
  const [budget, setBudget] = useState("");
  const [sort, setSort] = useState("name");
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalVehicles, setTotalVehicles] = useState(0);
  const [savingId, setSavingId] = useState<number | null>(null);
  const [favorites, setFavorites] = useState<number[]>([]);

  const { compareList, addVehicle, removeVehicle, clearCompare } = useCompare();

  //------------------------------------
  // Fetch Vehicles
  //------------------------------------

  useEffect(() => {
    const fetchFavorites = async () => {
      try {
        const res = await fetch("http://localhost:5001/favorites");

        const data = await res.json();

        setFavorites(data.favorites || []);
      } catch (err) {
        console.error(err);
      }
    };
    const fetchVehicles = async () => {
      try {
        setLoading(true);

        const params = new URLSearchParams();
        if (search) params.append("search", search);
        if (brand) params.append("brand", brand);
        if (fuel) params.append("fuel", fuel);
        if (transmission) params.append("transmission", transmission);
        if (bodyType) params.append("body", bodyType);
        if (budget) params.append("budget", budget);
        params.append("sort", sort);
        params.append("page", page.toString());
        params.append("limit", "12");

        const response = await fetch(
          `http://localhost:5001/vehicles?${params.toString()}`,
        );
        const data = await response.json();

        setVehicles(data.vehicles || []);
        setTotalPages(data.pages || 1);
        setTotalVehicles(data.total || 0);
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchVehicles();
    fetchFavorites();
  }, [search, brand, fuel, transmission, bodyType, budget, sort, page]);

  //------------------------------------
  // Favorite
  //------------------------------------

  const addToFavorites = async (
  e: React.MouseEvent,
  vehicleId: number
) => {
  e.preventDefault();
  e.stopPropagation();

  try {
    setSavingId(vehicleId);

    const response = await fetch(
      "http://localhost:5001/favorites",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ vehicleId }),
      }
    );

    const data = await response.json();

    if (!data.success) return;

    if (data.favorite) {
      setFavorites((prev) => [...prev, vehicleId]);
    } else {
      setFavorites((prev) =>
        prev.filter((id) => id !== vehicleId)
      );
    }

  } catch (err) {
    console.error(err);
  } finally {
    setSavingId(null);
  }
};

  return (
    <main className="min-h-screen bg-gradient-to-b from-black via-zinc-950 to-black text-white">
      {/* Hero */}
      <section className="relative overflow-hidden border-b border-zinc-800">
        <div className="absolute inset-0 bg-gradient-to-r from-blue-600/10 via-transparent to-cyan-500/10" />
        <div className="relative max-w-7xl mx-auto px-8 py-16">
          <div className="flex flex-col lg:flex-row justify-between lg:items-center gap-10">
            <div>
              <p className="uppercase tracking-[8px] text-blue-400 text-sm mb-4">
                AI Powered Vehicle Finder
              </p>
              <h1 className="text-6xl font-black leading-tight">
                RideMatch
                <span className="text-blue-500"> Garage</span>
              </h1>
              <p className="text-zinc-400 text-xl mt-6 max-w-2xl leading-8">
                Discover your perfect car with intelligent recommendations,
                compare vehicles, save favourites and explore India's biggest
                vehicle collection.
              </p>
            </div>
            <Link
              href="/"
              className="h-fit px-6 py-4 rounded-2xl bg-zinc-900 hover:bg-blue-600 border border-zinc-700 transition"
            >
              ← Home
            </Link>
          </div>
        </div>
      </section>

      {/* Filter Card */}
      <section className="max-w-7xl mx-auto px-8 -mt-8 relative z-10">
        <div className="rounded-3xl bg-zinc-900/70 backdrop-blur-xl border border-zinc-800 p-8 shadow-2xl">
          <div className="grid lg:grid-cols-6 gap-5">
            <input
              type="text"
              placeholder="🔍 Search vehicles..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 outline-none border border-zinc-700 focus:border-blue-500"
            />

            <select
              value={brand}
              onChange={(e) => {
                setBrand(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
            >
              <option value="">Brand</option>
              <option>Hyundai</option>
              <option>Honda</option>
              <option>Tata</option>
              <option>Toyota</option>
              <option>Mahindra</option>
              <option>Maruti Suzuki</option>
              <option>Kia</option>
            </select>

            <select
              value={fuel}
              onChange={(e) => {
                setFuel(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
            >
              <option value="">Fuel</option>
              <option>Petrol</option>
              <option>Diesel</option>
              <option>CNG</option>
              <option>Electric</option>
            </select>

            <select
              value={transmission}
              onChange={(e) => {
                setTransmission(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
            >
              <option value="">Transmission</option>
              <option>Manual</option>
              <option>Automatic</option>
            </select>

            <select
              value={bodyType}
              onChange={(e) => {
                setBodyType(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
            >
              <option value="">Body</option>
              <option>SUV</option>
              <option>Sedan</option>
              <option>Hatchback</option>
              <option>MUV</option>
            </select>

            <select
              value={sort}
              onChange={(e) => {
                setSort(e.target.value);
                setPage(1);
              }}
              className="bg-black/40 rounded-2xl px-5 py-4 border border-zinc-700"
            >
              <option value="name">Sort By</option>
              <option value="price-low">Price ↑</option>
              <option value="price-high">Price ↓</option>
              <option value="mileage">Mileage</option>
            </select>
          </div>
        </div>
      </section>

      {/* <div className="max-w-7xl mx-auto px-8 mt-6">
        {compareList.length > 0 && (
          <div className="bg-blue-600 rounded-2xl p-5 flex items-center justify-between">
            <div>
              <h2 className="text-2xl font-bold">⚔️ Compare Garage</h2>

              <p>{compareList.length} vehicles selected</p>
            </div>

            <div className="flex gap-4">
              <button
                onClick={clearCompare}
                className="px-5 py-3 rounded-xl bg-red-500 hover:bg-red-600"
              >
                Clear
              </button>

              <Link
                href="/compare"
                className="px-6 py-3 rounded-xl bg-white text-black font-bold hover:bg-gray-200"
              >
                Compare →
              </Link>
            </div>
          </div>
        )}
      </div> */}

      {/* Stats */}
      <section className="max-w-7xl mx-auto px-8 mt-10">
        <div className="flex flex-col md:flex-row justify-between gap-8 items-center">
          <div>
            <h2 className="text-4xl font-black">
              {totalVehicles.toLocaleString()} Vehicles
            </h2>
            <p className="text-zinc-400 mt-2">
              Showing {(page - 1) * 12 + 1} -{" "}
              {Math.min(page * 12, totalVehicles)} of {totalVehicles}
            </p>
          </div>
          <div className="flex gap-5">
            <div className="bg-zinc-900 rounded-2xl px-6 py-4 border border-zinc-800">
              <p className="text-zinc-500 text-sm">Page</p>
              <h3 className="text-2xl font-bold">
                {page}/{totalPages}
              </h3>
            </div>
            <div className="bg-zinc-900 rounded-2xl px-6 py-4 border border-zinc-800">
              <p className="text-zinc-500 text-sm">Results</p>
              <h3 className="text-2xl font-bold">{vehicles.length}</h3>
            </div>
          </div>
        </div>
      </section>

      {/* Cards */}
      <section className="max-w-7xl mx-auto px-8 mt-12">
        {loading ? (
          <div className="text-center text-2xl py-24">Loading Vehicles...</div>
        ) : (
          <>
            {/* Vehicle Cards */}
            <div className="grid sm:grid-cols-2 xl:grid-cols-3 gap-8">
              {vehicles.map((vehicle: any) => (
                <Link key={vehicle.id} href={`/vehicle/${vehicle.id}`}>
                  <div className="group rounded-3xl overflow-hidden border border-zinc-800 bg-zinc-900/60 backdrop-blur-xl hover:border-blue-500 transition-all duration-300 hover:-translate-y-2 hover:shadow-[0_20px_60px_rgba(59,130,246,.20)]">
                    {/* Image */}
                    <div className="relative h-72 bg-gradient-to-br from-zinc-950 via-zinc-900 to-zinc-800 flex items-center justify-center overflow-hidden">
                      <img
                        src={vehicle.image_url || "/placeholder.png"}
                        alt={vehicle.name}
                        className="w-full h-full object-contain p-6 group-hover:scale-110 transition duration-500"
                      />
                      <button
                        type="button"
                        onClick={(e) => addToFavorites(e, vehicle.id)}
                        className="absolute top-4 right-4 h-12 w-12 rounded-full bg-black/60 backdrop-blur-xl flex items-center justify-center text-2xl hover:bg-blue-600 transition"
                      >
                        {savingId === vehicle.id
                          ? "⏳"
                          : favorites.includes(vehicle.id)
                            ? "❤️"
                            : "🤍"}
                      </button>

                      {/* <button
                        type="button"
                        onClick={(e) => {
                          e.preventDefault();
                          e.stopPropagation();

                          if (compareList.includes(vehicle.id)) {
                            removeVehicle(vehicle.id);
                          } else {
                            addVehicle(vehicle.id);
                          }
                        }}
                        className="absolute top-4 left-16 h-12 w-12 rounded-full bg-blue-600 flex items-center justify-center hover:scale-110 transition"
                      >
                        {compareList.includes(vehicle.id) ? "✅" : "⚔️"}
                      </button> */}

                      {/* <div className="flex items-center justify-between mt-6">
                        <span className="text-blue-400 font-semibold">
                          View Details →
                        </span>

                        <button
                          type="button"
                          onClick={(e) => {
                            e.preventDefault();
                            e.stopPropagation();

                            if (compareList.includes(vehicle.id)) {
                              removeVehicle(vehicle.id);
                            } else {
                              addVehicle(vehicle.id);
                            }
                          }}
                          className={`px-4 py-2 rounded-xl font-semibold transition ${
                            compareList.includes(vehicle.id)
                              ? "bg-green-600 hover:bg-green-700"
                              : "bg-blue-600 hover:bg-blue-700"
                          }`}
                        >
                          {compareList.includes(vehicle.id)
                            ? "✓ Added"
                            : "+ Compare"}
                        </button>
                      </div> */}

                      <div className="absolute top-4 left-4">
                        <span className="px-3 py-1 rounded-full bg-blue-600 text-sm font-semibold">
                          {vehicle.make}
                        </span>
                      </div>
                    </div>

                    {/* Content */}
                    <div className="p-7">
                      <h2 className="text-2xl font-bold leading-tight line-clamp-2">
                        {vehicle.name}
                      </h2>
                      <p className="text-3xl font-black text-blue-400 mt-4">
                        ₹ {vehicle.price}
                      </p>
                      <div className="grid grid-cols-2 gap-4 mt-6">
                        <div className="rounded-2xl bg-black/40 p-4">
                          <p className="text-xs text-zinc-500 uppercase">
                            Mileage
                          </p>
                          <h3 className="font-bold mt-1">
                            ⛽ {vehicle.mileage || "--"} kmpl
                          </h3>
                        </div>
                        <div className="rounded-2xl bg-black/40 p-4">
                          <p className="text-xs text-zinc-500 uppercase">
                            Safety
                          </p>
                          <h3 className="font-bold mt-1">
                            🛡 {vehicle.safety || "--"} ⭐
                          </h3>
                        </div>
                        <div className="rounded-2xl bg-black/40 p-4">
                          <p className="text-xs text-zinc-500 uppercase">
                            Fuel
                          </p>
                          <h3 className="font-bold mt-1">
                            {vehicle.fuel_type || "--"}
                          </h3>
                        </div>
                        <div className="rounded-2xl bg-black/40 p-4">
                          <p className="text-xs text-zinc-500 uppercase">
                            Transmission
                          </p>
                          <h3 className="font-bold mt-1">
                            {vehicle.transmission || "--"}
                          </h3>
                        </div>
                      </div>
                      <div className="flex items-center justify-between mt-8">
                        <div>
                          <p className="text-xs text-zinc-500">Body</p>
                          <h4 className="font-semibold">
                            {vehicle.body_type || "--"}
                          </h4>
                        </div>
                        <div className="flex gap-3">
                          <button className="rounded-xl border border-blue-500 px-5 py-3 hover:bg-blue-600 transition">
                            View →
                          </button>

                          <button
                            type="button"
                            onClick={(e) => {
                              e.preventDefault();
                              e.stopPropagation();

                              if (compareList.includes(vehicle.id)) {
                                removeVehicle(vehicle.id);
                              } else {
                                addVehicle(vehicle.id);
                              }
                            }}
                            className={`rounded-xl px-5 py-3 font-semibold transition ${
                              compareList.includes(vehicle.id)
                                ? "bg-green-600 hover:bg-green-700"
                                : "bg-zinc-800 hover:bg-blue-600"
                            }`}
                          >
                            {compareList.includes(vehicle.id)
                              ? "✓ Added"
                              : "+ Compare"}
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </Link>
              ))}
            </div>

            {/* Empty State */}
            {vehicles.length === 0 && (
              <section className="max-w-5xl mx-auto py-28 text-center">
                <div className="text-8xl mb-6">🚘</div>
                <h2 className="text-4xl font-black">No Vehicles Found</h2>
                <p className="text-zinc-400 mt-4 text-xl">
                  Try changing your search or filters.
                </p>
                <button
                  onClick={() => {
                    setSearch("");
                    setBrand("");
                    setFuel("");
                    setTransmission("");
                    setBodyType("");
                    setBudget("");
                    setSort("name");
                    setPage(1);
                  }}
                  className="mt-8 bg-blue-600 hover:bg-blue-500 px-8 py-4 rounded-2xl font-bold transition"
                >
                  Reset Filters
                </button>
              </section>
            )}
          </>
        )}
      </section>

      {/* Pagination */}
      <section className="max-w-7xl mx-auto px-8 py-20">
        <div className="flex justify-center items-center gap-5">
          <button
            disabled={page === 1}
            onClick={() => {
              window.scrollTo({ top: 0, behavior: "smooth" });
              setPage(page - 1);
            }}
            className="px-6 py-4 rounded-2xl bg-zinc-900 border border-zinc-700 disabled:opacity-30 hover:bg-zinc-800 transition"
          >
            ← Previous
          </button>

          <div className="flex gap-3">
            {Array.from({ length: Math.min(totalPages, 5) }).map((_, i) => {
              let number = i + 1;
              if (page > 3) number = page - 2 + i;
              if (number > totalPages) return null;
              return (
                <button
                  key={number}
                  onClick={() => {
                    window.scrollTo({ top: 0, behavior: "smooth" });
                    setPage(number);
                  }}
                  className={`h-12 w-12 rounded-xl font-bold transition ${
                    page === number
                      ? "bg-blue-600"
                      : "bg-zinc-900 border border-zinc-700 hover:bg-zinc-800"
                  }`}
                >
                  {number}
                </button>
              );
            })}
          </div>

          <button
            disabled={page === totalPages}
            onClick={() => {
              window.scrollTo({ top: 0, behavior: "smooth" });
              setPage(page + 1);
            }}
            className="px-6 py-4 rounded-2xl bg-blue-600 hover:bg-blue-500 disabled:opacity-30 transition"
          >
            Next →
          </button>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-zinc-800">
        <div className="max-w-7xl mx-auto px-8 py-14 flex flex-col md:flex-row justify-between items-center">
          <div>
            <h2 className="text-2xl font-black">RideMatch</h2>
            <p className="text-zinc-500 mt-2">
              AI Powered Vehicle Recommendation Platform
            </p>
          </div>
          <div className="flex gap-8 mt-8 md:mt-0">
            <Link href="/" className="hover:text-blue-400">
              Home
            </Link>
            <Link href="/favorites" className="hover:text-blue-400">
              Favorites
            </Link>
            <Link href="/recommend" className="hover:text-blue-400">
              AI Recommendation
            </Link>
          </div>
        </div>
      </footer>
      {compareList.length > 0 && (
        <div className="fixed bottom-8 right-8 z-50">
          <div className="bg-zinc-900 border border-blue-500 rounded-3xl p-6 shadow-2xl w-80">
            <h3 className="text-xl font-bold">⚔ Compare Garage</h3>

            <p className="text-zinc-400 mt-2">
              {compareList.length} vehicle(s) selected
            </p>

            <div className="flex gap-3 mt-5">
              <button
                onClick={clearCompare}
                className="flex-1 rounded-xl bg-red-600 py-3 hover:bg-red-700"
              >
                Clear
              </button>

              <Link
                href="/compare"
                className="flex-1 rounded-xl bg-blue-600 py-3 text-center hover:bg-blue-700"
              >
                Compare →
              </Link>
            </div>
          </div>
        </div>
      )}
    </main>
  );
}
