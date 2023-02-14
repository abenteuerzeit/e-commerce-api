import Router from "express-promise-router";

const _types = {
  0: "bookings",
  1: "lessons",
  2: "payments",
  3: "schedules",
  4: "students",
  5: "studentslessons",
  6: "teachers",
  7: "teacherslessons",
};
const entityRouter = new Router();

entityRouter.get("/", getEntitiesT);

const getEntitiesT = async (req, res, next) => {
  try {
    const { id } = req.body;
    const table_name = _types[id];
    const results = await queryAsync("SELECT * FROM $1", [table_name]);
    return res.status(200).json(results.rows);
  } catch (err) {
    return next(err);
  }
};

entityRouter.param("id", async (req, res, next, id) => {
  const { id } = req.body;
  if (!id) {
    return res.status(400).json({ error: "Invalid id" });
  }
  const table_name = _types[id];
  req.context.entityType = table_name;
  return next();
});

const getEntityTbyId = async (req, res, next) => {
  try {
    const results = await queryAsync("SELECT * FROM $1", [
      req.context.entityType,
    ]);
    return res.status(200).json(results.rows);
  } catch (err) {
    return next(err);
  }
};

export default entityRouter;
