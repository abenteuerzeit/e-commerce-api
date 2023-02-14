import * as dotenv from "dotenv";
dotenv.config();

import express from "express";
import morgan from "morgan";
import routes from "./routes";
import cors from "cors";
import cookieParser from "cookie-parser";
// import bodyParser from "body-parser";
import session from "express-session";
import restartDatabase from "./model/querries/_util";

const app = express();

const port = process.env.PORT || 3000;
const resetDb = process.env.RESET_DB.toLowerCase() === "true";

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

app.get("/", (req, res, next) => {
  if (req.query.name) {
    return res.status(200).json({ message: `Hello ${req.query.name}` });
  }
  return res
    .status(200)
    .json({ message: "E-commerce API: Language Learning GET route OK" });
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
