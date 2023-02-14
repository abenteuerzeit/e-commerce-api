// Database access code goes here
// Everywhere else in the application, instead of requiring pg directly, require this file
import { config as _config } from "dotenv";
import { Pool } from "pg";

const config = {
  user: _config().parsed.USER,
  host: _config().parsed.HOST,
  database: _config().parsed.DATABASE,
  password: _config().parsed.PASSWORD,
  port: _config().parsed.DB_PORT,
};
const pool = new Pool(config);

export function query(text, params, callback) {
  const start = Date.now();
  return pool.query(text, params, (err, res) => {
    const duration = Date.now() - start;
    console.log("executed query", { text, duration, rows: res.rowCount });
    callback(err, res);
  });
}
export async function queryAsync(text, params) {
  const startTime = Date.now();
  const res = await pool.query(text, params);
  const duration = ` ${Date.now() - startTime} ms`;
  console.log("executed query", { text, duration, rows: res.rowCount });
  return res;
}
export function getClient(callback) {
  pool.connect((err, client, done) => {
    const query = client.query;

    // monkey patch the query method to keep track of the last query executed
    client.query = (...args) => {
      client.lastQuery = args;
      return query.apply(client, args);
    };

    // set a timeout of 5 seconds, after which we will log this client's last query
    const timeout = setTimeout(() => {
      console.error("A client has been checked out for more than 5 seconds!");
      console.error(
        `The last executed query on this client was: ${client.lastQuery}`
      );
    }, 5000);

    const release = (err) => {
      // call the actual 'done' method, returning this client to the pool
      done(err);

      // clear our timeout
      clearTimeout(timeout);

      // set the query method back to its old un-monkey-patched version
      client.query = query;
    };

    callback(err, client, release);
  });
}
export async function getClientAsync() {
  const client = await pool.connect();
  const query = client.query;
  const release = client.release;

  // set a timeout of 5 seconds, after which we will log this client's last query
  const timeout = setTimeout(() => {
    console.error("A client has been checked out for more than 5 seconds!");
    console.error(
      `The last executed query on this client was: ${client.lastQuery}`
    );
  }, 5000);

  // monkey patch the query method to keep track of the last query executed
  client.query = (...args) => {
    client.lastQuery = args;
    return query.apply(client, args);
  };

  client.release = () => {
    // clear the timeout
    clearTimeout(timeout);
    // set the methods back to their old un-monkey-patched version
    client.query = query;
    client.release = release;
    return release.apply(client);
  };

  return client;
}
