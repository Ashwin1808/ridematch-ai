const pool = require("./db");

const { askAI } = require("./services/aiService");

const { compareVehicles } = require("./services/aiService");

const { getToyotaModels } = require("./services/vehicleApiService");
// const { askAI, compareVehicles } = require("./services/aiService");

// const { getAutomotiveNews } = require("./services/newsService");
const { getAutomotiveNews } = require("./services/newssService");

const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const express = require("express");
const cors = require("cors");

require("dotenv").config();

console.log("JWT:", process.env.JWT_SECRET);

const app = express();

const client = require("prom-client");

// ----------------------------
// Prometheus Metrics
// ----------------------------

// Collect default Node.js metrics
client.collectDefaultMetrics();

// HTTP Request Counter
const httpRequestCounter = new client.Counter({
  name: "ridematch_http_requests_total",
  help: "Total HTTP requests",
  labelNames: ["method", "route", "status"],
});

// HTTP Request Duration
const httpRequestDuration = new client.Histogram({
  name: "ridematch_http_request_duration_seconds",
  help: "HTTP request duration",
  labelNames: ["method", "route", "status"],
  buckets: [0.05, 0.1, 0.3, 0.5, 1, 2, 5],
});

app.use(cors());
app.use(express.json());

// ----------------------------
// Metrics Middleware
// ----------------------------
app.use((req, res, next) => {
  const end = httpRequestDuration.startTimer();

  res.on("finish", () => {
    httpRequestCounter.inc({
      method: req.method,
      route: req.route?.path || req.path,
      status: res.statusCode,
    });

    end({
      method: req.method,
      route: req.route?.path || req.path,
      status: res.statusCode,
    });
  });

  next();
});

const PORT = process.env.PORT || 5001;


// ROOT ROUTE

app.get("/", (req, res) => {
  res.json({
    message: "RideMatch AI Backend Running",
  });
});

app.get("/health", async (req, res) => {
  try {
    await pool.query("SELECT 1");

    res.status(200).json({
      status: "UP",
      database: "Connected",
    });
  } catch (err) {
    res.status(500).json({
      status: "DOWN",
      database: "Disconnected",
    });
  }
});

app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

function calculateVehicleScore(vehicle, preferences) {
  let score = 0;

  // Budget
  if (Number(vehicle.budget) <= preferences.budget) {
    score += 40;
  }

  // Fuel Type
  if (
    preferences.fuelType &&
    vehicle.fuel_type &&
    vehicle.fuel_type.toLowerCase() === preferences.fuelType.toLowerCase()
  ) {
    score += 20;
  }

  // Transmission
  if (
    preferences.transmission &&
    vehicle.transmission &&
    vehicle.transmission
      .toLowerCase()
      .includes(preferences.transmission.toLowerCase())
  ) {
    score += 15;
  }

  // Body Type
  if (
    preferences.bodyType &&
    vehicle.body_type &&
    vehicle.body_type.toLowerCase() === preferences.bodyType.toLowerCase()
  ) {
    score += 15;
  }

  // Seating
  if (
    preferences.seatingCapacity &&
    vehicle.seating_capacity >= Number(preferences.seatingCapacity)
  ) {
    score += 10;
  }

  return score;
}

// RECOMMENDATION ROUTE

app.post("/recommend", async (req, res) => {
  try {
    const {
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
    } = req.body;

    await pool.query(
      `
  INSERT INTO recommendation_history
  (vehicle_type, budget, usage_type)
  VALUES($1,$2,$3)
  `,
      [vehicleType, budget, usageType],
    );

    console.log(req.body);

    // CONVERT BUDGET

    const numericBudget = parseFloat(budget);

    // FETCH VEHICLES FROM DATABASE

    // const result = await pool.query(
    //   `
    //   SELECT * FROM vehicles
    //   WHERE LOWER(type) = LOWER($1)
    //   AND budget <= $2
    //   AND LOWER(usage_type) = LOWER($3)
    //   `,
    //   [vehicleType, numericBudget, usageType],
    // );

    let query = `
SELECT *
FROM vehicles
WHERE budget <= $1
`;

    let values = [numericBudget];
    let index = 2;

    if (vehicleType) {
      query += ` AND LOWER(type)=LOWER($${index})`;
      values.push(vehicleType);
      index++;
    }

    if (fuelType) {
      query += ` AND LOWER(fuel_type)=LOWER($${index})`;
      values.push(fuelType);
      index++;
    }

    if (transmission) {
      query += ` AND LOWER(transmission) LIKE LOWER($${index})`;
      values.push(`%${transmission}%`);
      index++;
    }

    if (bodyType) {
      query += ` AND LOWER(body_type)=LOWER($${index})`;
      values.push(bodyType);
      index++;
    }

    if (seatingCapacity) {
      query += ` AND seating_capacity >= $${index}`;
      values.push(Number(seatingCapacity));
      index++;
    }

    query += ` LIMIT 30`;

    const result = await pool.query(query, values);

    // let vehicles = result.rows;

    let vehicles = result.rows;

    vehicles = vehicles
      .map((vehicle) => ({
        ...vehicle,
        score: calculateVehicleScore(vehicle, {
          budget: numericBudget,
          fuelType,
          transmission,
          bodyType,
          seatingCapacity,
        }),
      }))
      .sort((a, b) => b.score - a.score)
      .slice(0, 20);

    const vehicleSummary = vehicles.map((v) => ({
      name: v.name,
      mileage: v.mileage,
      safety: v.safety,
      price: v.price,
    }));

    console.log("Fetched Vehicles:");
    console.log(vehicles);

    // NO VEHICLES FOUND

    if (vehicles.length === 0) {
      return res.status(404).json({
        success: false,
        message: "No matching vehicles found",
      });
    }

    // SORTING LOGIC

    // vehicles.sort((a, b) => {
    //   let scoreA = 0;
    //   let scoreB = 0;

    //   // MILEAGE PRIORITY

    //   if (mileagePriority === "High") {
    //     scoreA += Number(a.mileage);
    //     scoreB += Number(b.mileage);
    //   }

    //   // SAFETY PRIORITY

    //   if (safetyPriority === "High") {
    //     scoreA += Number(a.safety) * 10;
    //     scoreB += Number(b.safety) * 10;
    //   }

    //   return scoreB - scoreA;
    // });

    //     const aiPrompt = `
    // You are a vehicle recommendation expert.

    // User Requirements:

    // Budget: ${budget} Lakhs
    // Vehicle Type: ${vehicleType}
    // Usage: ${usageType}
    // Mileage Priority: ${mileagePriority}
    // Safety Priority: ${safetyPriority}

    // Available Vehicles:

    // ${JSON.stringify(vehicleSummary)}

    // Choose the best 3 vehicles.

    // Return ONLY JSON.

    // Format:

    // {
    //   "recommendations":[
    //     {
    //       "name":"Vehicle Name",
    //       "reason":"Why selected"
    //     }
    //   ]
    // }
    // `;

    const aiPrompt = `
You are an experienced automobile consultant.

Customer Requirements

Budget : ${budget} Lakhs

Fuel : ${fuelType || "Any"}

Transmission : ${transmission || "Any"}

Body Type : ${bodyType || "Any"}

Seats : ${seatingCapacity || "Any"}

Usage : ${usageType}

Mileage Priority : ${mileagePriority}

Safety Priority : ${safetyPriority}

Additional Requirement

${prompt}

Top Candidate Vehicles

${JSON.stringify(
  vehicles.map((v) => ({
    id: v.id,
    name: v.name,
    price: v.price,
    fuel: v.fuel_type,
    transmission: v.transmission,
    body: v.body_type,
    seats: v.seating_capacity,
    mileage: v.mileage,
    safety: v.safety,
    score: v.score,
  })),
)}

Choose ONLY from the vehicles listed above.

Return ONLY valid JSON.

{
  "recommendations":[
    {
      "id":0,
      "reason":""
    }
  ]
}
`;

    // const aiResponse = await askAI(aiPrompt);

    // console.log(aiResponse);

    // // TOP 3 VEHICLES

    // const topVehicles = vehicles.slice(0, 3);

    // // RESPONSE

    // // res.json({
    // //   success: true,
    // //   recommendations: topVehicles,
    // // });

    // res.json({
    //   success: true,
    //   aiResponse,
    //   vehicles,
    // });

    // const aiResponse = await askAI(aiPrompt);

    // console.log(aiResponse);

    // let aiRecommendations = [];

    const aiResponse = await askAI(aiPrompt);

    const cleaned = aiResponse
      .replace(/```json/g, "")
      .replace(/```/g, "")
      .trim();

    console.log("========== GEMINI ==========");
    console.log(aiResponse);
    console.log("============================");

    let recommendedVehicles = [];

    try {
      const cleaned = aiResponse
        .replace(/```json/g, "")
        .replace(/```/g, "")
        .trim();

      const parsed = JSON.parse(cleaned);

      recommendedVehicles = parsed.recommendations
        .map((rec) => {
          const vehicle = vehicles.find(
            (v) =>
              v.id === rec.id,
          );

          if (!vehicle) return null;

          return {
            ...vehicle,
            reason: rec.reason,
          };
        })
        .filter(Boolean);
    } catch (err) {
      console.log("Gemini JSON Parse Failed");
      console.log(err);
    }

    if (recommendedVehicles.length === 0) {
      recommendedVehicles = vehicles.slice(0, 3);
    }

    return res.json({
      success: true,
      vehicles: recommendedVehicles,
    });

    try {
      // aiRecommendations = JSON.parse(aiResponse).recommendations;
      aiRecommendations = JSON.parse(cleaned).recommendations;
      console.log(aiRecommendations);
      const recommendedVehicles = aiRecommendations
        .map((rec) => {
          // const vehicle = vehicles.find(
          //   (v) =>
          //     v.name.toLowerCase().includes(rec.name.toLowerCase()) ||
          //     rec.name.toLowerCase().includes(v.name.toLowerCase()),
          // );
          const vehicle = vehicles.find((v) => v.id === rec.id);

          if (!vehicle) return null;

          return {
            ...vehicle,
            reason: rec.reason,
          };
        })
        .filter(Boolean);

      if (recommendedVehicles.length === 0) {
        return res.json({
          success: true,
          vehicles: vehicles.slice(0, 3),
        });
      }

      return res.json({
        success: true,
        vehicles: recommendedVehicles,
      });
    } catch (error) {
      console.log("AI JSON Parse Failed");

      return res.json({
        success: true,
        vehicles: vehicles.slice(0, 3),
      });
    }
  } catch (error) {
    console.log("========== ERROR ==========");
    console.error(error);
    console.log("===========================");

    res.status(500).json({
      success: false,
      message: "Recommendation failed",
      error: error.message,
    });
  }
});

// app.get("/vehicle/:id/reviews", async (req, res) => {
//   try {
//     const { id } = req.params;

//     const result = await pool.query(
//       `
//       SELECT *
//       FROM vehicle_reviews
//       WHERE vehicle_id = $1
//       `,
//       [id],
//     );

//     res.json({
//       success: true,
//       reviews: result.rows,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//       message: "Failed to fetch reviews",
//     });
//   }
// });

app.get("/vehicle/:id/reviews", async (req, res) => {
  try {
    const { id } = req.params;

    const result = await pool.query(
      `
      SELECT *
      FROM reviews
      WHERE vehicle_id = $1
      ORDER BY rating DESC
      `,
      [id],
    );

    res.json({
      success: true,
      reviews: result.rows,
    });
  } catch (err) {
    console.error(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

app.get("/vehicles", async (req, res) => {
  try {
    const {
      search = "",
      brand = "",
      fuel = "",
      transmission = "",
      body = "",
      seats = "",
      budget = "",
      sort = "name",
      page = 1,
      limit = 12,
    } = req.query;

    let query = `
      FROM vehicles
      WHERE type='Car'
    `;

    const values = [];
    let index = 1;

    if (search) {
      query += ` AND LOWER(name) LIKE LOWER($${index++})`;
      values.push(`%${search}%`);
    }

    if (brand) {
      query += ` AND LOWER(make)=LOWER($${index++})`;
      values.push(brand);
    }

    if (fuel) {
      query += ` AND LOWER(fuel_type)=LOWER($${index++})`;
      values.push(fuel);
    }

    if (transmission) {
      query += ` AND LOWER(transmission) LIKE LOWER($${index++})`;
      values.push(`%${transmission}%`);
    }

    if (body) {
      query += ` AND LOWER(body_type)=LOWER($${index++})`;
      values.push(body);
    }

    if (seats) {
      query += ` AND seating_capacity >= $${index++}`;
      values.push(Number(seats));
    }

    if (budget) {
      query += ` AND budget <= $${index++}`;
      values.push(Number(budget));
    }

    // Count
    const countResult = await pool.query(`SELECT COUNT(*) ${query}`, values);

    const total = Number(countResult.rows[0].count);

    // Main Query
    let sql = `SELECT * ${query}`;

    switch (sort) {
      case "price-low":
        sql += ` ORDER BY budget ASC`;
        break;

      case "price-high":
        sql += ` ORDER BY budget DESC`;
        break;

      case "name":
        sql += ` ORDER BY name`;
        break;

      default:
        sql += ` ORDER BY make,name`;
    }

    const offset = (Number(page) - 1) * Number(limit);

    sql += ` LIMIT $${index++} OFFSET $${index++}`;

    values.push(Number(limit));
    values.push(offset);

    const result = await pool.query(sql, values);

    res.json({
      success: true,
      vehicles: result.rows,
      total,
      page: Number(page),
      pages: Math.ceil(total / Number(limit)),
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

app.get("/vehicle/:id", async (req, res) => {
  try {
    const { id } = req.params;

    await pool.query(
      `
  INSERT INTO vehicle_views(vehicle_id)
  VALUES($1)
  `,
      [id],
    );

    const result = await pool.query("SELECT * FROM vehicles WHERE id = $1", [
      id,
    ]);

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Vehicle not found",
      });
    }

    res.json({
      success: true,
      vehicle: result.rows[0],
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      message: "Failed to fetch vehicle",
    });
  }
});

// app.post("/compare-ai", async (req, res) => {
//   try {
//     const { vehicle1, vehicle2 } = req.body;

//     await pool.query(
//       `
//   INSERT INTO comparison_history
//   (vehicle1, vehicle2)
//   VALUES($1,$2)
//   `,
//       [vehicle1.name, vehicle2.name],
//     );

//     const aiResponse = await compareVehicles(vehicle1, vehicle2);

//     console.log("===== AI RESPONSE =====");
//     console.log(aiResponse);
//     console.log("=======================");

//     let parsed;

//     try {
//       parsed = JSON.parse(aiResponse);
//     } catch {
//       parsed = {
//         winner: "Unknown",
//         verdict: aiResponse,
//         pros: [],
//         cons: [],
//       };
//     }

//     res.json({
//       success: true,
//       ai: parsed,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//     });
//   }
// });

app.post("/compare-ai", async (req, res) => {
  try {
    const { vehicleIds } = req.body;

    if (!vehicleIds || vehicleIds.length < 2) {
      return res.status(400).json({
        success: false,
        message: "Minimum two vehicles required",
      });
    }

    const result = await pool.query(
      `
      SELECT *
      FROM vehicles
      WHERE id = ANY($1)
      `,
      [vehicleIds],
    );

    const vehicles = result.rows;

    // ---------- Simple AI Logic ----------

    let winner = vehicles[0];

    let bestScore = -1;

    for (const vehicle of vehicles) {
      let score = 0;

      score += Number(vehicle.safety || 0) * 5;
      score += Number(vehicle.mileage || 0);

      if (vehicle.budget) score += Math.max(0, 20 - Number(vehicle.budget));

      if (score > bestScore) {
        bestScore = score;
        winner = vehicle;
      }
    }

    const ai = {
      winner: winner.name,

      verdict: `${winner.name} offers the best balance of safety, mileage and ownership cost. It is the strongest overall recommendation among the selected vehicles.`,

      pros: [
        "Best overall score",
        "Good mileage",
        "Strong safety",
        "Better ownership value",
      ],

      cons: [
        "Higher variants may cost more",
        "Feature availability depends on variant",
      ],
    };

    res.json({
      success: true,
      vehicles,
      ai,
    });
  } catch (err) {
    console.log(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

// app.get("/vehicles", async (req, res) => {
//   try {
//     const result = await pool.query("SELECT * FROM vehicles ORDER BY name");

//     res.json({
//       success: true,
//       vehicles: result.rows,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//     });
//   }
// });

app.post("/vehicle-ai", async (req, res) => {
  try {
    const { vehicle } = req.body;

    const prompt = `
You are an expert automobile reviewer.

Vehicle:
${JSON.stringify(vehicle)}

Respond with ONLY this JSON.

{
  "summary":"Write exactly 2 sentences.",
  "pros":[
    "3 short points"
  ],
  "cons":[
    "2 short points"
  ],
  "idealBuyer":"One sentence",
  "verdict":"One sentence"
}

Rules:
- Every field must contain text.
- Never leave arrays empty.
- Never leave strings empty.
- Do not use markdown.
- Do not use \`\`\`.
- Output only JSON.
`;

    console.log(vehicle);

    const aiResponse = await askAI(prompt);

    console.log("===== AI RESPONSE =====");
    console.log(aiResponse);
    console.log("=======================");

    const cleaned = aiResponse
      .replace(/```json/g, "")
      .replace(/```/g, "")
      .replace(/\/\/.*$/gm, "")
      .trim();

    let parsed;

    try {
      // parsed = JSON.parse(cleaned);
      const start = cleaned.indexOf("{");
      const end = cleaned.lastIndexOf("}");

      if (start !== -1 && end !== -1) {
        parsed = JSON.parse(cleaned.substring(start, end + 1));
      } else {
        throw new Error("Invalid JSON");
      }
    } catch {
      parsed = {
        summary: "AI analysis unavailable.",
        pros: [],
        cons: [],
        idealBuyer: "",
        verdict: "",
      };
    }

    res.json({
      success: true,
      ai: parsed,
    });
  } catch (error) {
    console.log("========== VEHICLE AI ERROR ==========");
    console.error(error);
    console.log("======================================");

    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

// ===========================
// ADD TO FAVORITES
// ===========================

console.log("Favorites routes loaded");

app.post("/favorites", async (req, res) => {
  try {
    const { vehicleId } = req.body;

    const existing = await pool.query(
      "SELECT id FROM favorites WHERE vehicle_id = $1",
      [vehicleId],
    );

    // Remove if already exists
    if (existing.rows.length > 0) {
      await pool.query("DELETE FROM favorites WHERE vehicle_id = $1", [
        vehicleId,
      ]);

      return res.json({
        success: true,
        favorite: false,
        message: "Removed from favorites",
      });
    }

    // Otherwise add
    await pool.query("INSERT INTO favorites(vehicle_id) VALUES($1)", [
      vehicleId,
    ]);

    res.json({
      success: true,
      favorite: true,
      message: "Added to favorites",
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
});

// ===========================
// GET FAVORITES
// ===========================

// app.get("/favorites", async (req, res) => {
//   try {
//     const result = await pool.query(`
//       SELECT
//         vehicles.*
//       FROM favorites
//       JOIN vehicles
//       ON favorites.vehicle_id = vehicles.id
//       ORDER BY favorites.created_at DESC
//     `);

//     res.json({
//       success: true,
//       vehicles: result.rows,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//       message: "Failed to fetch favorites",
//     });
//   }
// });

app.get("/test-api", async (req, res) => {
  try {
    const data = await getToyotaModels();

    res.json(data);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

// app.get("/news", async (req, res) => {
//   try {
//     const articles = await getAutomotiveNews();

//     res.json({
//       success: true,
//       articles,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//       error: error.message,
//     });
//   }
// });

app.get("/news", async (req, res) => {
  try {
    const articles = await getAutomotiveNews();

    const filteredArticles = articles.filter((article) => {
      const text = (
        article.title +
        " " +
        (article.description || "")
      ).toLowerCase();

      return (
        text.includes("launch") ||
        text.includes("facelift") ||
        text.includes("hybrid") ||
        text.includes("electric") ||
        text.includes("ev") ||
        text.includes("battery") ||
        text.includes("price") ||
        text.includes("variant") ||
        text.includes("feature") ||
        text.includes("engine") ||
        text.includes("mileage")
      );
    });

//     const summarizedArticles = [];

//     for (const article of filteredArticles) {
//       if (
//         article.title.toLowerCase().includes("accident") ||
//         article.title.toLowerCase().includes("crash") ||
//         article.title.toLowerCase().includes("killed") ||
//         article.title.toLowerCase().includes("fire")
//       ) {
//         continue;
//       }
//       //       const prompt = `
//       // You are an automobile expert.

//       // Summarize this automotive news in 2-3 sentences.

//       // Title:
//       // ${article.title}

//       // Description:
//       // ${article.description}

//       // Return ONLY the summary.
//       // `;

//       const prompt = `
// You are an automotive journalist.

// Summarize this automotive news in exactly 2 short sentences.

// Mention:
// - What happened
// - Why it matters to vehicle buyers

// Title:
// ${article.title}

// Description:
// ${article.description}

// Return ONLY the summary.
// `;

//       const summary = await askAI(prompt);

//       summarizedArticles.push({
//         title: article.title,
//         image: article.image,
//         url: article.url,
//         publishedAt: article.publishedAt,
//         source: article.source.name,
//         aiSummary: summary.trim(),
//       });
//     }

//     res.json({
//       success: true,
//       articles: summarizedArticles,
//     });
//   } catch (error) {
//     console.error(error);

//     res.status(500).json({
//       success: false,
//       error: error.message,
//     });
//   }
const summarizedArticles = [];

for (const article of filteredArticles) {
  if (
    article.title.toLowerCase().includes("accident") ||
    article.title.toLowerCase().includes("crash") ||
    article.title.toLowerCase().includes("killed") ||
    article.title.toLowerCase().includes("fire")
  ) {
    continue;
  }

  summarizedArticles.push({
    title: article.title,
    image: article.image,
    url: article.url,
    publishedAt: article.publishedAt,
    source: article.source.name,
    aiSummary: article.description || "No summary available.",
  });
}

    res.json({
      success: true,
      articles: summarizedArticles,
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

app.get("/dashboard", async (req, res) => {
  try {
    const vehicleResult = await pool.query("SELECT COUNT(*) FROM vehicles");

    const favoriteResult = await pool.query("SELECT COUNT(*) FROM favorites");

    const recommendationResult = await pool.query(
      "SELECT COUNT(*) FROM recommendation_history",
    );

    const comparisonResult = await pool.query(
      "SELECT COUNT(*) FROM comparison_history",
    );

    const trendingResult = await pool.query(`
SELECT
v.id,
v.name,
v.price,
v.image,
v.image_url,
v.mileage,
v.safety,
COUNT(*)::int AS views
FROM vehicle_views vv
JOIN vehicles v
ON vv.vehicle_id = v.id
GROUP BY
v.id,
v.name,
v.price,
v.image,
v.image_url,
v.mileage,
v.safety
ORDER BY views DESC
LIMIT 4;
`);

    res.json({
      success: true,
      totalVehicles: Number(vehicleResult.rows[0].count),
      totalFavorites: Number(favoriteResult.rows[0].count),
      totalRecommendations: Number(recommendationResult.rows[0].count),
      totalComparisons: Number(comparisonResult.rows[0].count),
      trending: trendingResult.rows,
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

app.get("/fuel-prices", async (req, res) => {
  try {
    // Temporary values
    // We'll replace these with a live API later.

    res.json({
      success: true,
      prices: {
        petrol: 102.45,
        diesel: 89.82,
        electric: 8.2,
        updated: new Date().toLocaleString(),
      },
    });
  } catch (err) {
    console.error(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

// app.get("/fuel-prices", async (req, res) => {
//   try {
//     const response = await fetch("YOUR_FUEL_API_URL");

//     const data = await response.json();

//     res.json({
//       success: true,
//       petrol: data.petrol,
//       diesel: data.diesel,
//       ev: data.ev,
//     });
//   } catch (err) {
//     res.status(500).json({
//       success: false,
//       error: err.message,
//     });
//   }
// });

// app.get("/favorites", async (req, res) => {
//   try {
//     const result = await pool.query(`
//       SELECT vehicle_id
//       FROM favorites
//       ORDER BY id DESC
//     `);

//     res.json({
//       success: true,
//       favorites: result.rows.map((r) => r.vehicle_id),
//     });
//   } catch (err) {
//     console.error(err);

//     res.status(500).json({
//       success: false,
//       error: err.message,
//     });
//   }
// });

app.get("/fuel-price", (req, res) => {
  res.json({
    success: true,
    petrol: 102.91,
    diesel: 88.99,
    cng: 76.5,
  });
});

// app.post("/ai-recommend", async (req, res) => {
//   try {
//     // const { budget, fuel, usage, seats } = req.body;
//     const { budget, vehicleType, fuel, usage, seats, prompt } = req.body;

//     const result = await pool.query(
//       `
//       SELECT *
// FROM vehicles
// WHERE
// type=$2
// AND budget::numeric<=$1
// ORDER BY
// safety::numeric DESC,
// mileage::numeric DESC
// LIMIT 3
//       `,
//       [budget, vehicleType],
//     );

//     const vehicles = result.rows;

//     if (vehicles.length === 0) {
//       return res.json({
//         winner: "No Vehicle Found",
//         reason: "No vehicle matches your budget.",
//         recommendations: [],
//       });
//     }

//     res.json({
//       winner: vehicles[0].name,

//       reason: `${vehicles[0].name} is the best choice based on your budget of ₹${budget} Lakhs. It offers an excellent balance of safety, mileage, and practicality.`,

//       recommendations: vehicles.map((v) => v.name),
//     });
//   } catch (err) {
//     console.log(err);

//     res.status(500).json({
//       success: false,
//       error: err.message,
//     });
//   }
// });

app.get("/similar/:id", async (req, res) => {
  try {
    const { id } = req.params;

    const current = await pool.query("SELECT * FROM vehicles WHERE id=$1", [
      id,
    ]);

    if (current.rows.length === 0) {
      return res.status(404).json({
        success: false,
      });
    }

    const vehicle = current.rows[0];

    const similar = await pool.query(
      `
      SELECT *
      FROM vehicles
      WHERE
      id<>$1
      AND (
          body_type=$2
          OR fuel_type=$3
          OR ABS(budget::numeric-$4)<=3
      )
      LIMIT 4
      `,
      [id, vehicle.body_type, vehicle.fuel_type, Number(vehicle.budget)],
    );

    res.json({
      success: true,
      vehicles: similar.rows,
    });
  } catch (err) {
    console.log(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

app.get("/favorites", async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
      vehicles.*
      FROM favorites
      JOIN vehicles
      ON favorites.vehicle_id = vehicles.id
    `);

    res.json({
      success: true,
      vehicles: result.rows,
    });
  } catch (err) {
    console.log(err);

    res.status(500).json({
      success: false,
    });
  }
});

app.delete("/favorites/:id", async (req, res) => {
  try {
    await pool.query("DELETE FROM favorites WHERE vehicle_id=$1", [
      req.params.id,
    ]);

    res.json({
      success: true,
    });
  } catch (err) {
    console.log(err);

    res.status(500).json({
      success: false,
    });
  }
});


app.post("/register", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existing = await pool.query(
      "SELECT * FROM users WHERE email=$1",
      [email]
    );

    if (existing.rows.length > 0) {
      return res.json({
        success: false,
        message: "Email already exists",
      });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    await pool.query(
      `
      INSERT INTO users(name,email,password)
      VALUES($1,$2,$3)
      `,
      [name, email, hashedPassword]
    );

    res.json({
      success: true,
      message: "Registration successful",
    });
  } catch (err) {
    console.error(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});


app.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    const result = await pool.query(
      "SELECT * FROM users WHERE email=$1",
      [email]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    const user = result.rows[0];

    const validPassword = await bcrypt.compare(password, user.password);

    if (!validPassword) {
      return res.status(401).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "7d",
      }
    );

    res.json({
      success: true,
      token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
      },
    });
  } catch (err) {
    console.error(err);

    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

function authenticateToken(req, res, next) {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({
      success: false,
      message: "Token missing",
    });
  }

  const token = authHeader.split(" ")[1];

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({
        success: false,
        message: "Invalid token",
      });
    }

    req.user = user;
    next();
  });
}

app.get("/profile", authenticateToken, async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT id,name,email,created_at FROM users WHERE id=$1",
      [req.user.id]
    );

    res.json({
      success: true,
      user: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

// SERVER START

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
