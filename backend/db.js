// const { Pool } = require("pg");

// const pool = new Pool({
//   user: "user",
//   host: "localhost",
//   database: "ridematch",
//   password: "",
//   port: 5432,
// });

// pool.connect((err) => {

//   if (err) {

//     console.log("DB CONNECTION FAILED");
//     console.log(err);

//   } else {

//     console.log("POSTGRES CONNECTED");

//   }

// });

// module.exports = pool;


const { Pool } = require("pg");

// const pool = new Pool({
//   host: process.env.DB_HOST,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME,
//   port: process.env.DB_PORT,
// });

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// const pool = new Pool({
//   user: "user",
//   host: "host.docker.internal",
//   database: "ridematch",
//   password: "",
//   port: 5432,
// });

pool.connect((err) => {
  if (err) {
    console.log("DB CONNECTION FAILED");
    console.log(err);
  } else {
    console.log("POSTGRES CONNECTED");
  }
});

module.exports = pool;