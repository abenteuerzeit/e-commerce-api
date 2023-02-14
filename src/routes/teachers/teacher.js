import Router from "express-promise-router";

import {
    getTeachers,
    getTeacherById,
    createTeacher,
    updateTeacherById,
    deleteTeacherById,
} from "../db/queries";

const teacherRouter = new Router();
