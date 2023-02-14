-- Insert data into Students table
INSERT INTO Students (name, email, phone, objectives, settings)
VALUES 
  ('John Smith', 'john@example.com', '555-1234', 'Improve conversational skills', '{"preferred_language": "English"}'),
  ('Alice Johnson', 'alice@example.com', '555-5678', 'Prepare for TOEFL exam', '{"preferred_language": "English", "study_materials": ["TOEFL practice tests", "grammar book"]}');
  
-- Insert data into Teachers table
INSERT INTO Teachers (name, email, phone, availability, qualifications, rates)
VALUES 
  ('Mary Lee', 'mary@example.com', '555-4321', '{"Mon": "9:00-15:00", "Wed": "11:00-17:00", "Fri": "9:00-12:00"}', 'TESOL certification', '{"hourly": 30, "package": {"5 lessons": 140, "10 lessons": 270}}'),
  ('Peter Brown', 'peter@example.com', '555-8765', '{"Tue": "14:00-18:00", "Thu": "9:00-13:00", "Sat": "10:00-16:00"}', 'Master in Education', '{"hourly": 35, "package": {"10 lessons": 320, "20 lessons": 600}}');

-- Insert data into Lessons table
INSERT INTO Lessons (subject, level, duration, availability, price)
VALUES 
  ('English conversation', 'Intermediate', 60, '{"Mon": "9:00-11:00", "Wed": "11:00-13:00", "Fri": "9:00-10:00"}', 40),
  ('TOEFL preparation', 'Advanced', 90, '{"Tue": "14:00-16:00", "Thu": "9:00-11:00", "Sat": "10:00-12:00"}', 50);

-- Insert data into Schedules table
INSERT INTO Schedules (start_time, end_time, date, location, availability)
VALUES 
  ('2023-03-01 09:00:00', '2023-03-01 10:00:00', '2023-03-01', 'Zoom', 'Available'),
  ('2023-03-02 14:00:00', '2023-03-02 15:30:00', '2023-03-02', 'Skype', 'Available');

-- Insert data into StudentLessons table
INSERT INTO StudentLessons (student_id, lesson_id)
VALUES 
  (1, 1),
  (2, 2),
  (2, 1);

-- Insert data into TeacherLessons table
INSERT INTO TeacherLessons (teacher_id, lesson_id)
VALUES 
  (1, 1),
  (2, 2),
  (1, 2);

-- Insert data into Bookings table
INSERT INTO Bookings (student_id, teacher_id, schedule_id, notes)
VALUES 
  (1, 1, 1, 'John prefers to have a 5-minute break halfway through the lesson'),
  (2, 1, 2, 'Alice needs to reschedule her lesson on March 2nd');

-- Insert data into Payments table
INSERT INTO Payments (student_id, teacher_id, schedule_id, booking_id)
VALUES 
  (1, 1, 1, 1),
  (2, 1, 2, 2);
