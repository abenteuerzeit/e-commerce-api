CREATE TABLE Students (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  phone TEXT,
  objectives TEXT,
  settings TEXT
);

CREATE TABLE Teachers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  phone TEXT,
  availability TEXT,
  qualifications TEXT,
  rates TEXT
);

CREATE TABLE Lessons (
  id SERIAL PRIMARY KEY,
  subject TEXT,
  level TEXT,
  duration INT,
  availability TEXT,
  price INT
);

CREATE TABLE Schedules (
  id SERIAL PRIMARY KEY,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  date DATE,
  location TEXT,
  availability TEXT
);

CREATE TABLE StudentLessons (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES Students(id),
  lesson_id INT REFERENCES Lessons(id),
  UNIQUE(student_id, lesson_id)
);

CREATE TABLE TeacherLessons (
  id SERIAL PRIMARY KEY,
  teacher_id INT REFERENCES Teachers(id),
  lesson_id INT REFERENCES Lessons(id),
  UNIQUE(teacher_id, lesson_id)
);

CREATE TABLE Bookings (
  student_id INT REFERENCES Students(id),
  teacher_id INT REFERENCES Teachers(id),
  schedule_id INT REFERENCES Schedules(id),
  notes TEXT,
  PRIMARY KEY (student_id, teacher_id, schedule_id)
);


CREATE TABLE Payments (
  id SERIAL PRIMARY KEY,
  student_id INT,
  teacher_id INT,
  schedule_id INT,
  booking_id INT,
  FOREIGN KEY (student_id, teacher_id, schedule_id) REFERENCES Bookings(student_id, teacher_id, schedule_id)
);


