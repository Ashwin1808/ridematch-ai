"use client";

import Image from "next/image";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import RecentlyViewed from "./components/RecentlyViewed";

export default function Home() {
  const [budget, setBudget] = useState("");
  const [vehicleType, setVehicleType] = useState("Car");
  const [mileagePriority, setMileagePriority] = useState("High");
  const [safetyPriority, setSafetyPriority] = useState("High");
  const [usageType, setUsageType] = useState("City");
  const [fuelType, setFuelType] = useState("");
  const [fuel, setFuel] = useState<any>(null);
  const [transmission, setTransmission] = useState("");
  const [bodyType, setBodyType] = useState("");
  const [seatingCapacity, setSeatingCapacity] = useState("");
  const [prompt, setPrompt] = useState("");
  const [dashboard, setDashboard] = useState<any>(null);
  const [news, setNews] = useState<any[]>([]);
  const router = useRouter();
  const [loggedIn, setLoggedIn] = useState(false);
  const [userName, setUserName] = useState("");

  useEffect(() => {
    const fetchDashboard = async () => {
      try {
        const response = await fetch("http://localhost:5001/dashboard");
        const data = await response.json();
        setDashboard(data);
      } catch (error) {
        console.error(error);
      }
    };
    fetchDashboard();
  }, []);

  useEffect(() => {
    const fetchNews = async () => {
      try {
        const response = await fetch("http://localhost:5001/news");
        const data = await response.json();
        setNews(data.articles || []);
      } catch (error) {
        console.error(error);
      }
    };
    fetchNews();
  }, []);

  useEffect(() => {
    const fetchFuel = async () => {
      const res = await fetch("http://localhost:5001/fuel-prices");
      const data = await res.json();
      setFuel(data);
    };
    fetchFuel();
  }, []);

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      setLoggedIn(true);
      const user = JSON.parse(localStorage.getItem("user") || "{}");
      setUserName(user.name || "User");
    }
  }, []);

  const handleRecommendation = async () => {
    try {
      const response = await fetch("http://localhost:5001/recommend", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          budget,
          vehicleType,
          fuelType,
          transmission,
          bodyType,
          seatingCapacity,
          mileagePriority,
          safetyPriority,
          usageType,
          prompt,
        }),
      });
      const data = await response.json();
      console.log(data);
      if (!data.success) {
        alert(data.message || "Recommendation failed");
        return;
      }
      localStorage.setItem("recommendations", JSON.stringify(data.vehicles));
      router.push("/results");
    } catch (error) {
      console.error(error);
      alert("Backend connection failed");
    }
  };

  return (
    <>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Inter:wght@300;400;500;600;700&display=swap');

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
          --void: #06070f;
          --deep: #0a0d1a;
          --surface: #0f1221;
          --glass: rgba(15, 18, 33, 0.7);
          --border: rgba(45, 111, 255, 0.15);
          --border-hover: rgba(45, 111, 255, 0.5);
          --cobalt: #2D6FFF;
          --cobalt-bright: #4D8FFF;
          --cobalt-glow: rgba(45, 111, 255, 0.25);
          --chrome: #C8D6E5;
          --snow: #F0F4FF;
          --muted: #5A6A8A;
          --font-display: 'Cinzel', serif;
          --font-body: 'Inter', sans-serif;
        }

        body { background: var(--void); color: var(--snow); font-family: var(--font-body); }

        .mesh-bg {
          position: fixed; inset: 0; z-index: 0; pointer-events: none;
          background:
            radial-gradient(ellipse 80% 50% at 20% -10%, rgba(45,111,255,0.12) 0%, transparent 60%),
            radial-gradient(ellipse 60% 40% at 80% 110%, rgba(45,111,255,0.08) 0%, transparent 60%),
            radial-gradient(ellipse 40% 30% at 50% 50%, rgba(10,15,40,0.9) 0%, transparent 100%);
        }
        .noise-overlay {
          position: fixed; inset: 0; z-index: 0; pointer-events: none; opacity: 0.03;
          background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
        }

        .page-root { position: relative; z-index: 1; min-height: 100vh; overflow-x: hidden; }

        /* ── NAV ── */
        .nav {
          display: flex; align-items: center; justify-content: space-between;
          padding: 0 3rem; height: 72px;
          border-bottom: 1px solid var(--border);
          backdrop-filter: blur(24px) saturate(180%);
          background: rgba(6,7,15,0.88);
          position: sticky; top: 0; z-index: 100;
        }
        .nav-logo {
          font-family: var(--font-display);
          font-size: 1.25rem; font-weight: 700; letter-spacing: 0.08em;
          background: linear-gradient(135deg, #fff 30%, var(--cobalt-bright));
          -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
          flex-shrink: 0;
        }
        .nav-auth { display: flex; align-items: center; gap: 10px; }

        .btn-login {
          background: transparent; color: var(--chrome);
          border: 1px solid rgba(200,214,229,0.2);
          padding: 0.45rem 1.25rem; border-radius: 8px;
          font-family: var(--font-body); font-size: 0.82rem; font-weight: 600;
          letter-spacing: 0.04em; cursor: pointer; transition: all 0.2s ease;
        }
        .btn-login:hover { border-color: rgba(200,214,229,0.45); color: #fff; background: rgba(200,214,229,0.06); }

        .btn-register {
          background: var(--cobalt); color: #fff;
          border: 1px solid rgba(77,143,255,0.4);
          padding: 0.45rem 1.25rem; border-radius: 8px;
          font-family: var(--font-body); font-size: 0.82rem; font-weight: 600;
          letter-spacing: 0.04em; cursor: pointer; transition: all 0.2s ease;
        }
        .btn-register:hover { background: var(--cobalt-bright); border-color: rgba(77,143,255,0.7); }

        .btn-logout {
          background: rgba(255,80,80,0.08); color: #FF6B6B;
          border: 1px solid rgba(255,80,80,0.2);
          padding: 0.45rem 1.25rem; border-radius: 8px;
          font-family: var(--font-body); font-size: 0.82rem; font-weight: 600;
          cursor: pointer; transition: all 0.2s ease;
        }
        .btn-logout:hover { background: rgba(255,80,80,0.16); border-color: rgba(255,80,80,0.4); }

        .user-chip {
          display: flex; align-items: center; gap: 0.5rem;
          color: var(--chrome); font-size: 0.82rem; font-weight: 500;
          background: rgba(45,111,255,0.08);
          border: 1px solid rgba(45,111,255,0.15);
          padding: 0.35rem 0.875rem 0.35rem 0.5rem; border-radius: 100px;
        }
        .user-avatar {
          width: 22px; height: 22px; border-radius: 50%;
          background: var(--cobalt); color: #fff;
          display: flex; align-items: center; justify-content: center;
          font-size: 0.65rem; font-weight: 700; flex-shrink: 0;
        }

        /* ── HERO ── */
        .hero { position: relative; padding: 7rem 3rem 6rem; max-width: 1400px; margin: 0 auto; }
        .hero-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 6rem; align-items: center; }

        .hero-eyebrow {
          display: inline-flex; align-items: center; gap: 0.5rem;
          font-size: 0.7rem; font-weight: 600; letter-spacing: 0.2em; text-transform: uppercase;
          color: var(--cobalt-bright);
          border: 1px solid var(--border);
          padding: 0.4rem 1rem; border-radius: 100px;
          background: rgba(45,111,255,0.08);
          margin-bottom: 2rem;
        }
        .hero-eyebrow::before { content: ''; width: 6px; height: 6px; border-radius: 50%; background: var(--cobalt-bright); display: block; animation: pulse 2s infinite; }
        @keyframes pulse { 0%,100%{opacity:1;transform:scale(1)} 50%{opacity:0.5;transform:scale(0.8)} }

        .hero-title {
          font-family: var(--font-display);
          font-size: clamp(3rem, 5vw, 5rem);
          font-weight: 900; line-height: 1.05; letter-spacing: -0.01em; color: var(--snow);
        }
        .hero-title .accent {
          background: linear-gradient(135deg, var(--cobalt-bright), #88BBFF);
          -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
        }
        .hero-sub { font-size: 1.05rem; color: var(--muted); line-height: 1.8; max-width: 480px; margin-top: 1.5rem; }
        .hero-actions { display: flex; gap: 1rem; margin-top: 2.5rem; align-items: center; flex-wrap: wrap; }

        .btn-primary {
          background: var(--cobalt); color: #fff; border: none;
          padding: 0.875rem 2.25rem; border-radius: 10px;
          font-family: var(--font-body); font-size: 0.9375rem; font-weight: 600;
          letter-spacing: 0.03em; cursor: pointer; transition: all 0.25s ease;
          box-shadow: 0 4px 24px rgba(45,111,255,0.35);
          text-decoration: none; display: inline-block;
        }
        .btn-primary:hover { background: var(--cobalt-bright); box-shadow: 0 6px 32px rgba(45,111,255,0.5); transform: translateY(-2px); }

        .btn-ghost {
          background: transparent; color: var(--chrome);
          border: 1px solid rgba(200,214,229,0.2);
          padding: 0.875rem 2.25rem; border-radius: 10px;
          font-family: var(--font-body); font-size: 0.9375rem; font-weight: 500;
          cursor: pointer; transition: all 0.25s ease; text-decoration: none; display: inline-block;
        }
        .btn-ghost:hover { border-color: rgba(200,214,229,0.5); color: #fff; background: rgba(200,214,229,0.05); }

        .hero-stats { display: flex; gap: 3rem; margin-top: 4rem; padding-top: 2.5rem; border-top: 1px solid var(--border); }
        .stat-val { font-family: var(--font-display); font-size: 2.5rem; font-weight: 700; color: var(--cobalt-bright); line-height: 1; }
        .stat-label { font-size: 0.8rem; color: var(--muted); margin-top: 0.4rem; letter-spacing: 0.06em; text-transform: uppercase; }

        .hero-image-wrap { position: relative; display: flex; justify-content: center; align-items: center; }
        .hero-image-glow {
          position: absolute; width: 520px; height: 520px; border-radius: 50%;
          background: radial-gradient(circle, rgba(45,111,255,0.18) 0%, transparent 70%);
          pointer-events: none;
        }
        .hero-image-ring {
          position: absolute; width: 460px; height: 460px; border-radius: 50%;
          border: 1px solid rgba(45,111,255,0.1);
          animation: spin 20s linear infinite;
        }
        .hero-image-ring::before {
          content: ''; position: absolute; top: -3px; left: 50%; width: 6px; height: 6px;
          background: var(--cobalt-bright); border-radius: 50%;
          box-shadow: 0 0 12px var(--cobalt);
        }
        @keyframes spin { from{transform:rotate(0deg)} to{transform:rotate(360deg)} }
        .hero-img { position: relative; z-index: 2; filter: drop-shadow(0 0 60px rgba(45,111,255,0.3)); transition: transform 0.6s ease; }
        .hero-img:hover { transform: scale(1.03) translateY(-6px); }

        /* ── SECTIONS ── */
        .section-wrap { max-width: 1400px; margin: 0 auto; padding: 0 3rem; }
        .section-eyebrow { font-size: 0.7rem; font-weight: 600; letter-spacing: 0.2em; text-transform: uppercase; color: var(--cobalt-bright); margin-bottom: 0.6rem; }
        .section-title { font-family: var(--font-display); font-size: clamp(2rem, 3.5vw, 3rem); font-weight: 700; color: var(--snow); }

        .quick-nav-section { padding: 5rem 0 4rem; }
        .quick-nav-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.25rem; margin-top: 3rem; }

        .qcard {
          background: var(--glass); backdrop-filter: blur(16px);
          border: 1px solid var(--border); border-radius: 16px;
          padding: 2rem 1.75rem;
          cursor: pointer; text-decoration: none; display: block;
          transition: all 0.3s ease; position: relative; overflow: hidden;
        }
        .qcard::before {
          content: ''; position: absolute; inset: 0; border-radius: 16px;
          background: linear-gradient(135deg, rgba(45,111,255,0.06) 0%, transparent 60%);
          opacity: 0; transition: opacity 0.3s;
        }
        .qcard:hover { border-color: var(--border-hover); transform: translateY(-4px); box-shadow: 0 16px 40px rgba(0,0,0,0.4), 0 0 0 1px rgba(45,111,255,0.15); }
        .qcard:hover::before { opacity: 1; }
        .qcard-icon { font-size: 2rem; line-height: 1; }
        .qcard-title { font-family: var(--font-display); font-size: 1.125rem; font-weight: 600; color: var(--snow); margin-top: 1.25rem; letter-spacing: 0.02em; }
        .qcard-sub { font-size: 0.8rem; color: var(--muted); margin-top: 0.4rem; }
        .qcard-arrow { position: absolute; bottom: 1.5rem; right: 1.75rem; color: var(--cobalt-bright); font-size: 1rem; opacity: 0; transition: all 0.3s; transform: translateX(-4px); }
        .qcard:hover .qcard-arrow { opacity: 1; transform: translateX(0); }

        .stats-section { padding: 4rem 0; }
        .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.25rem; margin-top: 3rem; }
        .stat-card {
          background: var(--glass); backdrop-filter: blur(16px);
          border: 1px solid var(--border); border-radius: 16px;
          padding: 2rem; position: relative; overflow: hidden;
          transition: border-color 0.3s, box-shadow 0.3s;
        }
        .stat-card:hover { border-color: var(--border-hover); box-shadow: 0 8px 32px rgba(0,0,0,0.3); }
        .stat-card::after {
          content: ''; position: absolute; bottom: 0; left: 0; right: 0; height: 2px;
          background: linear-gradient(90deg, transparent, var(--cobalt), transparent);
          opacity: 0; transition: opacity 0.3s;
        }
        .stat-card:hover::after { opacity: 1; }
        .stat-card-label { font-size: 0.75rem; font-weight: 500; letter-spacing: 0.12em; text-transform: uppercase; color: var(--muted); }
        .stat-card-val { font-family: var(--font-display); font-size: 3.5rem; font-weight: 700; color: var(--cobalt-bright); line-height: 1; margin-top: 0.75rem; }

        .trending-section { padding: 4rem 0; }
        .trending-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2.5rem; }
        .trending-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }

        .vehicle-card {
          background: var(--glass); backdrop-filter: blur(16px);
          border: 1px solid var(--border); border-radius: 20px;
          overflow: hidden; text-decoration: none; display: block;
          transition: all 0.35s ease; box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }
        .vehicle-card:hover { border-color: var(--border-hover); transform: translateY(-6px); box-shadow: 0 20px 50px rgba(0,0,0,0.4), 0 0 0 1px rgba(45,111,255,0.2); }
        .vehicle-card-img { width: 100%; height: 210px; object-fit: cover; display: block; transition: transform 0.5s ease; }
        .vehicle-card:hover .vehicle-card-img { transform: scale(1.04); }
        .vehicle-card-body { padding: 1.5rem; }
        .vehicle-card-name { font-family: var(--font-display); font-size: 1.25rem; font-weight: 700; color: var(--snow); letter-spacing: 0.02em; }
        .vehicle-card-specs { display: flex; justify-content: space-between; margin-top: 1.25rem; }
        .spec-item-label { font-size: 0.7rem; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; }
        .spec-item-val { font-size: 0.9rem; font-weight: 600; color: var(--snow); margin-top: 0.2rem; }
        .vehicle-card-footer { display: flex; justify-content: space-between; align-items: center; margin-top: 1.25rem; padding-top: 1rem; border-top: 1px solid var(--border); }
        .views-badge { font-size: 0.8rem; color: var(--muted); }
        .view-btn {
          background: rgba(45,111,255,0.15); color: var(--cobalt-bright);
          border: 1px solid rgba(45,111,255,0.3);
          padding: 0.4rem 1rem; border-radius: 8px; font-size: 0.8rem; font-weight: 600; transition: all 0.2s;
        }
        .vehicle-card:hover .view-btn { background: var(--cobalt); color: #fff; border-color: var(--cobalt); }

        .form-section { padding: 4rem 0 6rem; }
        .form-card {
          background: var(--glass); backdrop-filter: blur(24px) saturate(180%);
          border: 1px solid var(--border); border-radius: 24px;
          padding: 3.5rem; max-width: 960px; margin: 0 auto;
          box-shadow: 0 0 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.04);
          position: relative; overflow: hidden;
        }
        .form-card::before {
          content: ''; position: absolute; top: 0; left: 50%; transform: translateX(-50%);
          width: 60%; height: 1px;
          background: linear-gradient(90deg, transparent, rgba(45,111,255,0.5), transparent);
        }
        .form-title { font-family: var(--font-display); font-size: clamp(1.75rem, 3vw, 2.5rem); font-weight: 700; text-align: center; letter-spacing: 0.02em; margin-bottom: 0.5rem; }
        .form-subtitle { text-align: center; color: var(--muted); font-size: 0.9rem; margin-bottom: 3rem; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem; }
        .form-group { display: flex; flex-direction: column; gap: 0.5rem; }
        .form-group.full { grid-column: 1 / -1; }
        .form-label { font-size: 0.75rem; font-weight: 600; letter-spacing: 0.1em; text-transform: uppercase; color: var(--muted); }

        .form-input, .form-select, .form-textarea {
          width: 100%; background: rgba(6,7,15,0.8);
          border: 1px solid rgba(45,111,255,0.15); border-radius: 10px;
          padding: 0.75rem 1rem; color: var(--snow);
          font-family: var(--font-body); font-size: 0.9rem;
          outline: none; transition: all 0.25s ease;
          appearance: none; -webkit-appearance: none;
        }
        .form-input::placeholder { color: var(--muted); }
        .form-input:focus, .form-select:focus, .form-textarea:focus {
          border-color: rgba(45,111,255,0.5); box-shadow: 0 0 0 3px rgba(45,111,255,0.1);
        }
        .form-select { background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%235A6A8A' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 1rem center; padding-right: 2.5rem; cursor: pointer; }
        .form-select option { background: var(--deep); }
        .form-textarea { resize: vertical; min-height: 120px; line-height: 1.6; }

        .form-cta-wrap { display: flex; justify-content: center; margin-top: 2.5rem; }
        .btn-cta {
          background: var(--cobalt); color: #fff; border: none;
          padding: 1rem 3rem; border-radius: 12px;
          font-family: var(--font-body); font-size: 1rem; font-weight: 700;
          letter-spacing: 0.05em; cursor: pointer; transition: all 0.3s ease;
          box-shadow: 0 6px 30px rgba(45,111,255,0.4);
          position: relative; overflow: hidden;
        }
        .btn-cta::before {
          content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%;
          background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
          transition: left 0.5s ease;
        }
        .btn-cta:hover::before { left: 100%; }
        .btn-cta:hover { background: var(--cobalt-bright); box-shadow: 0 8px 40px rgba(45,111,255,0.6); transform: translateY(-2px); }

        .news-section { padding: 5rem 0; border-top: 1px solid var(--border); }
        .news-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 3rem; }
        .news-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
        .news-card {
          background: var(--glass); backdrop-filter: blur(16px);
          border: 1px solid var(--border); border-radius: 20px;
          overflow: hidden; transition: all 0.3s ease;
        }
        .news-card:hover { border-color: var(--border-hover); transform: translateY(-4px); box-shadow: 0 16px 40px rgba(0,0,0,0.35); }
        .news-card-img { width: 100%; height: 210px; object-fit: cover; display: block; }
        .news-card-body { padding: 1.5rem; }
        .news-source { font-size: 0.7rem; color: var(--cobalt-bright); text-transform: uppercase; letter-spacing: 0.12em; font-weight: 600; }
        .news-title { font-size: 1.05rem; font-weight: 700; color: var(--snow); margin-top: 0.6rem; line-height: 1.4; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
        .news-desc { font-size: 0.85rem; color: var(--muted); margin-top: 0.75rem; line-height: 1.7; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; }
        .news-cta {
          display: inline-flex; align-items: center; gap: 0.4rem;
          margin-top: 1.25rem; background: rgba(45,111,255,0.12);
          color: var(--cobalt-bright); border: 1px solid rgba(45,111,255,0.25);
          padding: 0.4rem 1rem; border-radius: 8px;
          font-size: 0.8rem; font-weight: 600; text-decoration: none; transition: all 0.2s;
        }
        .news-cta:hover { background: var(--cobalt); color: #fff; border-color: var(--cobalt); }

        .fuel-section { padding: 5rem 0; border-top: 1px solid var(--border); }
        .fuel-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.25rem; margin-top: 3rem; }
        .fuel-card {
          background: var(--glass); backdrop-filter: blur(16px);
          border: 1px solid var(--border); border-radius: 16px;
          padding: 2rem; transition: all 0.3s ease; position: relative; overflow: hidden;
        }
        .fuel-card:hover { border-color: var(--border-hover); box-shadow: 0 12px 40px rgba(0,0,0,0.3); }
        .fuel-card-label { font-size: 0.8rem; font-weight: 500; color: var(--muted); letter-spacing: 0.08em; }
        .fuel-card-val { font-family: var(--font-display); font-size: 2.75rem; font-weight: 700; color: var(--cobalt-bright); margin-top: 0.75rem; line-height: 1; }
        .fuel-card-unit { font-size: 0.7rem; color: var(--muted); margin-top: 0.3rem; letter-spacing: 0.1em; text-transform: uppercase; }
        .fuel-tag { display: inline-block; margin-bottom: 0.75rem; font-size: 1.1rem; }

        .footer { border-top: 1px solid var(--border); padding: 5rem 0 3rem; }
        .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 3rem; }
        .footer-brand {
          font-family: var(--font-display); font-size: 1.5rem; font-weight: 700; letter-spacing: 0.06em;
          background: linear-gradient(135deg, #fff 40%, var(--cobalt-bright));
          -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
        }
        .footer-tagline { font-size: 0.85rem; color: var(--muted); margin-top: 0.75rem; line-height: 1.6; }
        .footer-col-title { font-size: 0.75rem; font-weight: 700; letter-spacing: 0.15em; text-transform: uppercase; color: var(--snow); }
        .footer-col-item { font-size: 0.875rem; color: var(--muted); margin-top: 0.75rem; cursor: pointer; transition: color 0.2s; }
        .footer-col-item:hover { color: var(--snow); }
        .footer-bottom { margin-top: 4rem; padding-top: 1.5rem; border-top: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
        .footer-copy { font-size: 0.75rem; color: var(--muted); }

        .view-all { font-size: 0.85rem; color: var(--cobalt-bright); text-decoration: none; font-weight: 600; display: flex; align-items: center; gap: 0.3rem; transition: gap 0.2s; }
        .view-all:hover { gap: 0.6rem; }
        .section-divider { height: 1px; background: linear-gradient(90deg, transparent, var(--border), transparent); margin: 0 3rem; }

        @media (max-width: 1024px) {
          .hero-grid, .quick-nav-grid { grid-template-columns: 1fr; }
          .stats-grid, .trending-grid, .news-grid, .fuel-grid { grid-template-columns: 1fr 1fr; }
          .footer-grid { grid-template-columns: 1fr 1fr; }
          .hero { padding: 4rem 2rem; }
          .section-wrap { padding: 0 2rem; }
          .hero-image-wrap { display: none; }
        }
        @media (max-width: 640px) {
          .stats-grid, .trending-grid, .news-grid, .fuel-grid, .form-grid { grid-template-columns: 1fr; }
          .footer-grid { grid-template-columns: 1fr; }
          .nav { padding: 0 1.5rem; }
          .hero { padding: 3rem 1.5rem; }
          .section-wrap { padding: 0 1.5rem; }
          .form-card { padding: 2rem 1.5rem; }
        }
      `}</style>

      <div className="mesh-bg" />
      <div className="noise-overlay" />

      <div className="page-root">

        {/* NAVBAR */}
        <nav className="nav">
          <span className="nav-logo">RideMatch AI</span>

          <div className="nav-auth">
            {loggedIn ? (
              <>
                <div className="user-chip">
                  <div className="user-avatar">
                    {userName?.charAt(0)?.toUpperCase()}
                  </div>
                  {userName}
                </div>
                <button
                  className="btn-logout"
                  onClick={() => {
                    localStorage.removeItem("token");
                    localStorage.removeItem("user");
                    window.location.reload();
                  }}
                >
                  Logout
                </button>
              </>
            ) : (
              <>
                <Link href="/login">
                  <button className="btn-login">Login</button>
                </Link>
                <Link href="/register">
                  <button className="btn-register">Register</button>
                </Link>
              </>
            )}
          </div>
        </nav>

        {/* HERO */}
        <section className="hero">
          <div className="hero-grid">
            <div>
              <div className="hero-eyebrow">
                AI-Powered Vehicle Intelligence
              </div>
              <h1 className="hero-title">
                Find Your Perfect
                <br />
                <span className="accent">Car or Bike</span>
                <br />
                with AI
              </h1>
              <p className="hero-sub">
                Smart AI-powered recommendations based on your budget, mileage,
                safety, driving habits, maintenance cost, and lifestyle.
              </p>
              <div className="hero-actions">
                <button className="btn-primary">Start Now</button>
                <Link className="btn-ghost" href="/cars">
                  Browse Vehicles
                </Link>
              </div>
              <div className="hero-stats">
                <div>
                  <div className="stat-val">10K+</div>
                  <div className="stat-label">Recommendations</div>
                </div>
                <div>
                  <div className="stat-val">500+</div>
                  <div className="stat-label">Vehicles Analysed</div>
                </div>
              </div>
            </div>
            <div className="hero-image-wrap">
              <div className="hero-image-glow" />
              <div className="hero-image-ring" />
              <img
                src="/car.png"
                alt="Swift Car"
                width={680}
                height={680}
                className="hero-img"
              />
            </div>
          </div>
        </section>

        {/* QUICK NAV */}
        <section className="quick-nav-section">
          <div className="section-wrap">
            <div className="section-eyebrow">Platform</div>
            <div className="section-title">Everything You Need</div>
            <div className="quick-nav-grid">
              {[
                { href: "/cars", icon: "🚗", title: "Browse Garage", sub: "Explore all vehicles" },
                { href: "/ai-recommend", icon: "🤖", title: "AI Recommendation", sub: "Find your perfect vehicle" },
                { href: "/compare", icon: "⚔️", title: "Compare", sub: "Side-by-side comparison" },
                { href: "/favorites", icon: "❤️", title: "Favorites", sub: "Saved vehicles" },
              ].map((item) => (
                <Link key={item.href} href={item.href} className="qcard">
                  <div className="qcard-icon">{item.icon}</div>
                  <div className="qcard-title">{item.title}</div>
                  <div className="qcard-sub">{item.sub}</div>
                  <span className="qcard-arrow">→</span>
                </Link>
              ))}
            </div>
          </div>
        </section>

        {/* STATS */}
        <section className="stats-section">
          <div className="section-wrap">
            <div className="section-eyebrow">Live Platform</div>
            <div className="section-title">RideMatch Statistics</div>
            <div className="stats-grid">
              {[
                { label: "Vehicles", val: dashboard?.totalVehicles || 0 },
                { label: "Favorites", val: dashboard?.totalFavorites || 0 },
                { label: "AI Recommendations", val: dashboard?.totalRecommendations || 0 },
                { label: "Comparisons", val: dashboard?.totalComparisons || 0 },
              ].map((s) => (
                <div key={s.label} className="stat-card">
                  <div className="stat-card-label">{s.label}</div>
                  <div className="stat-card-val">{s.val}</div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* TRENDING */}
        <section className="trending-section">
          <div className="section-wrap">
            <div className="trending-header">
              <div>
                <div className="section-eyebrow">Popular Now</div>
                <div className="section-title">🔥 Trending Vehicles</div>
              </div>
            </div>
            <div className="trending-grid">
              {dashboard?.trending?.map((vehicle: any) => (
                <Link key={vehicle.id} href={`/vehicle/${vehicle.id}`} className="vehicle-card">
                  <img
                    src={vehicle.image_url || vehicle.image}
                    className="vehicle-card-img"
                    alt={vehicle.name}
                  />
                  <div className="vehicle-card-body">
                    <div className="vehicle-card-name">{vehicle.name}</div>
                    <div className="vehicle-card-specs">
                      <div>
                        <div className="spec-item-label">Price</div>
                        <div className="spec-item-val">₹ {vehicle.price}</div>
                      </div>
                      <div>
                        <div className="spec-item-label">Mileage</div>
                        <div className="spec-item-val">{vehicle.mileage} kmpl</div>
                      </div>
                      <div>
                        <div className="spec-item-label">Safety</div>
                        <div className="spec-item-val">⭐ {vehicle.safety}</div>
                      </div>
                    </div>
                    <div className="vehicle-card-footer">
                      <span className="views-badge">👀 {vehicle.views} views</span>
                      <span className="view-btn">View →</span>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

        {/* AI FORM */}
        <section className="form-section">
          <div className="section-wrap">
            <div className="form-card">
              <div className="form-title">Get AI Recommendations</div>
              <div className="form-subtitle">
                Tell us what you're looking for and our AI will find the perfect match
              </div>
              <div className="form-grid">
                <div className="form-group">
                  <label className="form-label">Budget</label>
                  <input type="text" value={budget} onChange={(e) => setBudget(e.target.value)} placeholder="Ex: 10 Lakhs" className="form-input" />
                </div>
                <div className="form-group">
                  <label className="form-label">Vehicle Type</label>
                  <select value={vehicleType} onChange={(e) => setVehicleType(e.target.value)} className="form-select">
                    <option>Car</option>
                    <option>Bike</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Fuel Type</label>
                  <select value={fuelType} onChange={(e) => setFuelType(e.target.value)} className="form-select">
                    <option value="">Any</option>
                    <option>Petrol</option>
                    <option>Diesel</option>
                    <option>CNG</option>
                    <option>Electric</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Transmission</label>
                  <select value={transmission} onChange={(e) => setTransmission(e.target.value)} className="form-select">
                    <option value="">Any</option>
                    <option>Manual</option>
                    <option>Automatic</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Body Type</label>
                  <select value={bodyType} onChange={(e) => setBodyType(e.target.value)} className="form-select">
                    <option value="">Any</option>
                    <option>SUV</option>
                    <option>Sedan</option>
                    <option>Hatchback</option>
                    <option>MUV</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Minimum Seats</label>
                  <select value={seatingCapacity} onChange={(e) => setSeatingCapacity(e.target.value)} className="form-select">
                    <option value="">Any</option>
                    <option>2</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Mileage Priority</label>
                  <select value={mileagePriority} onChange={(e) => setMileagePriority(e.target.value)} className="form-select">
                    <option>High</option>
                    <option>Medium</option>
                    <option>Low</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Safety Priority</label>
                  <select value={safetyPriority} onChange={(e) => setSafetyPriority(e.target.value)} className="form-select">
                    <option>High</option>
                    <option>Medium</option>
                    <option>Low</option>
                  </select>
                </div>
                <div className="form-group full">
                  <label className="form-label">Usage Type</label>
                  <select value={usageType} onChange={(e) => setUsageType(e.target.value)} className="form-select">
                    <option>City</option>
                    <option>Highway</option>
                    <option>Mixed</option>
                  </select>
                </div>
                <div className="form-group full">
                  <label className="form-label">Tell AI Your Needs</label>
                  <textarea
                    rows={5}
                    value={prompt}
                    onChange={(e) => setPrompt(e.target.value)}
                    placeholder="Ex: I travel 50km daily and want low maintenance with strong safety..."
                    className="form-textarea"
                  />
                </div>
              </div>
              <div className="form-cta-wrap">
                <button onClick={handleRecommendation} className="btn-cta">
                  Get Recommendations →
                </button>
              </div>
            </div>
          </div>
        </section>

        {/* NEWS */}
        <section className="news-section">
          <div className="section-wrap">
            <div className="news-header">
              <div>
                <div className="section-eyebrow">Latest Updates</div>
                <div className="section-title">Automotive News</div>
              </div>
              <Link href="#" className="view-all">View All →</Link>
            </div>
            <div className="news-grid">
              {news.slice(0, 3).map((article, index) => (
                <div key={index} className="news-card">
                  <img
                    src={article.image || article.urlToImage || "/placeholder-news.jpg"}
                    className="news-card-img"
                    alt={article.title}
                  />
                  <div className="news-card-body">
                    <div className="news-source">{article.source}</div>
                    <div className="news-title">{article.title}</div>
                    <div className="news-desc">{article.aiSummary || article.description}</div>
                    <a href={article.url} target="_blank" className="news-cta">Read Article →</a>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* FUEL */}
        <section className="fuel-section">
          <div className="section-wrap">
            <div className="section-eyebrow">Live</div>
            <div className="section-title">Today's Fuel Prices</div>
            <div className="fuel-grid">
              {[
                { tag: "⛽", label: "Petrol", val: fuel?.petrol },
                { tag: "🛢", label: "Diesel", val: fuel?.diesel },
                { tag: "⚡", label: "EV Charging", val: fuel?.ev },
                { tag: "🌱", label: "CNG", val: fuel?.cng },
              ].map((f) => (
                <div key={f.label} className="fuel-card">
                  <div className="fuel-tag">{f.tag}</div>
                  <div className="fuel-card-label">{f.label}</div>
                  <div className="fuel-card-val">₹ {f.val}</div>
                  <div className="fuel-card-unit">per litre / unit</div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* FOOTER */}
        <footer className="footer">
          <div className="section-wrap">
            <div className="footer-grid">
              <div>
                <div className="footer-brand">RideMatch AI</div>
                <div className="footer-tagline">AI Powered Vehicle Discovery Platform</div>
              </div>
              <div>
                <div className="footer-col-title">Platform</div>
                {["Garage", "Compare", "Favorites", "News"].map((item) => (
                  <div key={item} className="footer-col-item">{item}</div>
                ))}
              </div>
              <div>
                <div className="footer-col-title">Technology</div>
                {["Next.js", "Express.js", "PostgreSQL", "AI"].map((item) => (
                  <div key={item} className="footer-col-item">{item}</div>
                ))}
              </div>
              <div>
                <div className="footer-col-title">Developer</div>
                <div className="footer-col-item">Ashwin K</div>
                <div className="footer-col-item">2026</div>
              </div>
            </div>
            <div className="footer-bottom">
              <span className="footer-copy">© 2026 RideMatch AI. Built by Ashwin K.</span>
              <span className="footer-copy">All logic & data intact.</span>
            </div>
          </div>
        </footer>

      </div>
    </>
  );
}
