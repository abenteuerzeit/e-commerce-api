import { queryAsync } from "../../index.js";

// Abstract overloaded functions for all entities where entity type is retrieved from the request
// GET all entities

const tables = {
    students: "students",
    teachers: "teachers",
    lessons: "lessons",
    payments: "payments",
    students_lessons: "studentslessons",
    teachers_lessons: "teacherslessons",
    bookings: "bookings",
    schedules: "schedules",
}




const getEntities = async (req, res, next) => {
    try {
        const results = await queryAsync(`SELECT * FROM ${}`);
        return res.status(200).json(results.rows);
    } catch (err) {
        return next(err);
    }
};


