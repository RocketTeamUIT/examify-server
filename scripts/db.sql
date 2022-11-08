CREATE DATABASE examify;

CREATE TABLE course(
  course_id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  description TEXT,
  participants SMALLINT
);