const axios = require("axios");

async function getAutomotiveNews() {
  const response = await axios.get(
    "https://newsapi.org/v2/everything",
    {
      params: {
        q: '(car launch OR new car OR automobile industry OR electric vehicle OR EV OR Maruti Suzuki OR Tata Motors OR Hyundai India OR Mahindra Auto OR Toyota India OR Honda Cars OR Kia India OR BMW OR Mercedes OR Audi OR motorcycle launch)',
        language: "en",
        sortBy: "publishedAt",
        pageSize: 5,
        apiKey: process.env.NEWS_API_KEY,
      },
    }
  );

  return response.data.articles;
}

module.exports = {
  getAutomotiveNews,
};