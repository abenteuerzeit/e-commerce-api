import * as dotenv from "dotenv";
dotenv.config();

import express from "express";
import session from "express-session";
import cors from "cors";
import morgan from "morgan";
import routes from "./routes";
import helmet from "helmet";
import nunjucks  from "../nunjucks";

import cookieParser from "cookie-parser";
// import bodyParser from "body-parser";

import restartDatabase from "./model/querries/_util";

const app = express();

const port = process.env.PORT || 3000;
const store = new session.MemoryStore();
const resetDb = process.env.RESET_DB.toLowerCase() === "true";

app.use(helmet());



app.use(cors());
app.use(morgan("dev"));
app.use(express.static(__dirname));
// app.use(
//   session({
//     secret: process.env.COOKIES_SESSION_SECRET || "keyboard cat",
//     cookie: { maxAge: 86400000, secure: false },
//     saveUninitialized: false,
//     resave: false,
//     serverData: new session.MemoryStore(),
//   })
// );
// app.use(cookieParser());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

app.use(
  session({
    secret: process.env.COOKIES_SESSION_SECRET,
    cookie: {
      maxAge: 30 * 24 * 60 * 60 * 1000,
      secure: false,
    },
    saveUninitialized: false,
    resave: false,
    store,
    })
);

function ensureAuthentication(req, res, next) {
  console.log('Authenticated: ', req.session.authenticated);
  if (req.session.authenticated) {
    return next();
  } else {
    return res.status(403).json({ message: "Not authenticated" });
  }
}

app.get('/api', ensureAuthentication, (req, res) => {
  return res.json({ message: 'Hello from the API' });
});


app.get('/api/login', (req, res) => {
  return res.json({ message: 'Hello from the login' });
});

app.post('/api/logout', (req, res) => {
  if (!req.session.authenticated) {
    return res.status(403).json({ message: 'Not authenticated' });
  }
  req.session.authenticated = false;
  return res.json({ message: 'Logged out' });
});


app.post('/api/login', (req, res) => {
  const { username, password } = req.body;
  if (username === 'admin' && password === 'admin') {
    req.session.authenticated = true;
    return res.json({ message: 'Authenticated' });
  } else {
    return res.status(403).json({ message: 'Bad credentials' });
  }
});



app.get("/", (req, res, next) => {
  if (req.query.name) {
    return res.status(200).json({ message: `Hello ${req.query.name}` });
  }
  return res.status(200).json({ message: "Hello World" });
});

routes(app);

app.use((err, req, res, next) => {
  if (err) {
    console.log(err);
    return res.status(500).json({ request: { req }, message: err.message });
  }
  next();
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);

  if (resetDb) {
    console.log("Resetting database");
    restartDatabase();
  } else {
    console.info("Database persistent (RESET_DB=false)");
    console.info(
      `To reset database manually, run:\n\n\tpsql -U ${process.env.USER} -d ${process.env.DATABASE} -f ./src/model/querries/dropDB.sql\n\tpsql -U ${process.env.USER} -d ${process.env.DATABASE} -f ./src/model/querries/createTables.sql\n\tpsql -U ${process.env.USER} -d ${process.env.DATABASE} -f ./src/model/querries/seeder.sql\n`
    );
  }
});

export default app;
