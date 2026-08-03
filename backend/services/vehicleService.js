const pool = require("../db");

async function getVehicles(type) {
  const result = await pool.query(
    "SELECT * FROM vehicles WHERE LOWER(type)=LOWER($1)",
    [type]
  );

  return result.rows;
}

module.exports = {
  getVehicles,
};