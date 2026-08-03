import Link from "next/link";

interface CompareHeroProps {
  total: number;
}

export default function CompareHero({
  total,
}: CompareHeroProps) {
  return (
    <section className="max-w-7xl mx-auto mb-12">

      <div className="flex items-center justify-between">

        <div>

          <h1 className="text-6xl font-black">

            🤖 AI Vehicle Comparison

          </h1>

          <p className="text-zinc-400 mt-3 text-lg">

            Compare {total} vehicles side-by-side using AI-powered insights.

          </p>

        </div>

        <div className="flex gap-4">

          <Link
            href="/cars"
            className="px-6 py-3 rounded-xl border border-zinc-700 hover:bg-zinc-800 transition"
          >
            ← Garage
          </Link>

          <Link
            href="/"
            className="px-6 py-3 rounded-xl bg-blue-600 hover:bg-blue-700 transition"
          >
            Home
          </Link>

        </div>

      </div>

    </section>
  );
}