"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function RegisterPage() {
  const router = useRouter();

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);

  const handleRegister = async () => {
    try {
      setLoading(true);

      const response = await fetch("http://localhost:5001/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name,
          email,
          password,
        }),
      });

      const data = await response.json();

      if (!data.success) {
        alert(data.message || "Registration failed");
        return;
      }

      alert("Registration Successful");

      router.push("/login");
    } catch (err) {
      console.error(err);
      alert("Unable to register");
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
            textAlign: "center",
            marginBottom: 25,
          }}
        >
          RideMatch Register
        </h1>

        <input
          placeholder="Full Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          style={inputStyle}
        />

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
          onClick={handleRegister}
          disabled={loading}
          style={buttonStyle}
        >
          {loading ? "Creating Account..." : "Register"}
        </button>

        <p
          style={{
            textAlign: "center",
            marginTop: 20,
          }}
        >
          Already have an account?{" "}
          <Link href="/login">Login</Link>
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
} as const;

const buttonStyle = {
  width: "100%",
  padding: "14px",
  borderRadius: "8px",
  background: "#2563eb",
  color: "white",
  border: "none",
  cursor: "pointer",
  fontSize: "16px",
} as const;