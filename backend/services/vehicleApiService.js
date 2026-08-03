const axios = require("axios");

async function getToyotaModels() {
    const response = await axios.get(
        "https://www.carqueryapi.com/api/0.3/?cmd=getModels&make=Toyota"
    );

    return response.data;
}

module.exports = {
    getToyotaModels
};