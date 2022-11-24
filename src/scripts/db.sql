CREATE DATABASE examify;

CREATE TABLE course(
  course_id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  description TEXT,
  participants SMALLINT
);

INSERT INTO course (name, description, participants)
VALUES ("course1", "desc1", 1200);

SELECT * FROM course;

SELECT * 
FROM course 
WHERE course_id = id
