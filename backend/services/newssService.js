// const axios = require("axios");

// async function getAutomotiveNews() {
//   const response = await axios.get(
//     "https://gnews.io/api/v4/search",
//     {
//       params: {
//         q: "cars OR automobile OR electric vehicle OR motorcycle OR Maruti OR Tata OR Hyundai OR Toyota",
//         lang: "en",
//         country: "in",
//         max: 6,
//         apikey: process.env.GNEWS_API_KEY,
//       },
//     }
//   );

//   return response.data.articles;
// }

// module.exports = {
//   getAutomotiveNews,
// };

const axios = require("axios");

async function getAutomotiveNews() {
  const response = await axios.get(
    "https://gnews.io/api/v4/search",
    {
      params: {
        q: "(car OR cars OR automobile OR SUV OR hatchback OR sedan OR motorcycle OR EV OR electric vehicle OR Maruti OR Tata OR Hyundai OR Mahindra OR Toyota OR Honda OR BMW OR Mercedes OR Kia)",
        lang: "en",
        country: "in",
        max: 6,
        apikey: process.env.GNEWS_API_KEY,
      },
    }
  );

  return response.data.articles;
}

module.exports = {
  getAutomotiveNews,
};