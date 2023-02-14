import * as dotenv from "dotenv";
dotenv.config();

import express from "express";
import morgan from "morgan";
import cors from "cors";
import cookieParser from "cookie-parser";
import bodyParser from "body-parser";

import session from "express-session";

const app = express();

const port = process.env.PORT || 3000;

app.use(morgan("dev"));
app.use(cors());
app.use(
  session({
    secret: process.env.COOKIES_SESSION_SECRET || "keyboard cat",
    cookie: { maxAge: 86400000, secure: false },
    saveUninitialized: false,
    resave: false,
    serverData: new session.MemoryStore(),
  })
);
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use((err, req, res, next) => {
  if (err) {
    console.log(err);
    return res.status(500).json({ request: { req }, message: err.message });
  }
  next();
});

app.get("/", (req, res) => {
  if (req.query.name) {
    return res.status(200).json({ message: `Hello ${req.query.name}` });
  }
  return res
    .status(200)
    .json({ message: "E-commerce API: Language Learning GET route OK" });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
