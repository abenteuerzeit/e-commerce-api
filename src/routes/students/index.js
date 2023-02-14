import Router from "express-promise-router";

import {
    getStudents,
    getStudentById,
    createStudent,
    updateStudentById,
    deleteStudentById,
} from "../../model/querries/students/index.js";

const studentRouter = new Router();

studentRouter.get("/", getStudents);
studentRouter.get("/:id", getStudentById);
studentRouter.post("/", createStudent);
studentRouter.put("/:id", updateStudentById);
studentRouter.delete("/:id", deleteStudentById);

// studentRouter.use("/:id/lessons", lessonRouter);


export default studentRouter;
