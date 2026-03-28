"use client";

import { useState } from "react";

export default function Home() {
  const [ip, setIp] = useState("");
  const [result, setResult] = useState("");

  const callApi = async () => {
    setResult("Loading...");

    try {
      const res = await fetch(`http://${ip}:3000`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (!res.ok) {
        throw new Error(`HTTP ${res.status}`);
      }

      const text = await res.text();
      setResult(text);
    } catch (err) {
      setResult("❌ Error: " + err.message);
    }
  };

  return (
    <main style={{ padding: 40, fontFamily: "Arial" }}>
      <h1>🚀 Call API from Next.js</h1>

      <div style={{ marginBottom: 20 }}>
        <label>API IP:</label>
        <input
          type="text"
          value={ip}
          onChange={(e) => setIp(e.target.value)}
          style={{ marginLeft: 10, padding: 8 }}
          placeholder="192.168.1.100"
        />
      </div>

      <button
        onClick={callApi}
        style={{
          padding: "10px 20px",
          cursor: "pointer",
          borderRadius: 8,
          border: "none",
          background: "#0070f3",
          color: "white",
        }}
      >
        Call API (port 3000)
      </button>

      <pre
        style={{
          marginTop: 20,
          background: "#f4f4f4",
          padding: 15,
          borderRadius: 8,
        }}
      >
        {result}
      </pre>
    </main>
  );
}
