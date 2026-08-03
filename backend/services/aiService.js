

const { GoogleGenAI } = require("@google/genai");
require("dotenv").config();

const ai = new GoogleGenAI({
  apiKey: process.env.GEMINI_API_KEY,
});

async function askAI(prompt) {
  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: prompt,
  });

  return response.text;
}

async function compareVehicles(vehicle1, vehicle2) {
  const prompt = `
Compare these two vehicles.

Vehicle 1:
${JSON.stringify(vehicle1)}

Vehicle 2:
${JSON.stringify(vehicle2)}

IMPORTANT:
Return ONLY valid JSON.
No markdown.
No \`\`\`.
No explanation.
No text before JSON.
No text after JSON.

{
  "winner":"",
  "verdict":"",
  "pros":[],
  "cons":[]
}
`;

  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: prompt,
  });

  return response.text;
}

module.exports = {
  askAI,
  compareVehicles,
};