import studentRouter from "./students";

export default (app) => {

  app.use("/students", studentRouter);
};
