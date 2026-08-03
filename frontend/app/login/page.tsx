"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function LoginPage() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    console.log("LOGIN BUTTON CLICKED");
    try {
      setLoading(true);

      const response = await fetch("http://localhost:5001/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email,
          password,
        }),
      });
      console.log("Sending request...");

      const data = await response.json();
      console.log(data);
      if (!data.success) {
        alert(data.message);
        setLoading(false);
        return;
      }

      localStorage.setItem("token", data.token);
      localStorage.setItem("user", JSON.stringify(data.user));

      alert("Login Successful");

      router.push("/");
    } catch (err) {
      console.error(err);
      alert("Unable to login");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      style={{
        minHeight: "100vh",
        background: "#050816",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <div
        style={{
          width: 420,
          background: "#111827",
          padding: 40,
          borderRadius: 15,
          color: "white",
        }}
      >
        <h1
          style={{
            fontSize: 32,
            marginBottom: 25,
            textAlign: "center",
          }}
        >
          RideMatch Login
        </h1>

        <input
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          style={inputStyle}
        />

        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          style={inputStyle}
        />

        <button
          onClick={handleLogin}
          style={buttonStyle}
          disabled={loading}
        >
          {loading ? "Logging in..." : "Login"}
        </button>

        <p
          style={{
            textAlign: "center",
            marginTop: 20,
          }}
        >
          Don't have an account?{" "}
          <Link href="/register">
            Register
          </Link>
        </p>
      </div>
    </div>
  );
}

const inputStyle = {
  width: "100%",
  padding: "14px",
  marginBottom: "15px",
  borderRadius: "8px",
  border: "1px solid #374151",
  background: "#1f2937",
  color: "white",
};

const buttonStyle = {
  width: "100%",
  padding: "14px",
  borderRadius: "8px",
  background: "#2563eb",
  color: "white",
  border: "none",
  cursor: "pointer",
  fontSize: "16px",
};