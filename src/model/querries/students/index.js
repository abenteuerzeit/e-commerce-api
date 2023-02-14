import { queryAsync } from "../../index.js";

// GET all students
const getStudents = async (req, res, next) => {
    try {
        const results = await queryAsync("SELECT * FROM students");
        return res.status(200).json(results.rows);
    } catch (err) {
        return next(err);
    }
};

// GET student by id
const getStudentById = async (req, res, next) => {
    try {
        const results = await queryAsync("SELECT * FROM students WHERE id = $1", [
            req.params.id,
        ]);
        return res.status(200).json(results.rows);
    } catch (err) {
        return next(err);
    }
};

// POST new student
const createStudent = async (req, res, next) => {
    try {
        const results = await queryAsync(
            "INSERT INTO students (name, email, phone, address, city, state, zip) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
            [
                req.body.name,
                req.body.email,
                req.body.phone,
                req.body.address,
                req.body.city,
                req.body.state,
                req.body.zip,
            ]
        );
        return res.status(201).json(results.rows);
    } catch (err) {
        return next(err);
    }
};

// PUT update student by id
const updateStudentById = async (req, res, next) => {
    try {
        const results = await queryAsync(
            "UPDATE students SET name = $1, email = $2, phone = $3, address = $4, city = $5, state = $6, zip = $7 WHERE id = $8 RETURNING *",
            [
                req.body.name,
                req.body.email,
                req.body.phone,
                req.body.address,
                req.body.city,
                req.body.state,
                req.body.zip,
                req.params.id,
            ]
        );
        return res.status(200).json(results.rows);
    } catch (err) {
        return next(err);
    }
};

// DELETE student by id
const deleteStudentById = async (req, res, next) => {
    try {
        const results = await queryAsync("DELETE FROM students WHERE id = $1", [
            req.params.id,
        ]);
        return res.status(204).json(results.rows);
    } catch (err) {
        return next(err);
    }
};

export { getStudents, getStudentById, createStudent, updateStudentById, deleteStudentById };