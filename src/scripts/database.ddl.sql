-- Data Definition Language

-- DROP DATABASE examify;
-- CREATE DATABASE examify;

-- CREATE UPDATE FUNCTION TRIGGER
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER 
LANGUAGE PLPGSQL
AS $$
BEGIN
   NEW.updated_at = now(); 
   RETURN NEW;
END;
$$;


-- CREATE TABLE RANK:
create table rank (
    rank_id SERIAL PRIMARY KEY,
	rank_name TEXT NOT NULL,
	point_to_unlock INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON rank
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE USER:
create table users (
	user_id SERIAL PRIMARY KEY,
	mail TEXT NOT NULL,
	password TEXT NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	date_of_birth DATE,
	phone_number VARCHAR(10),
	avt TEXT DEFAULT 'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=170667a&w=0&k=20&c=m-F9Doa2ecNYEEjeplkFCmZBlc5tm1pl1F7cBCh9ZzM=',
	banner TEXT DEFAULT 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAX8AAACECAMAAABPuNs7AAAACVBMVEWAgICLi4uUlJSuV9pqAAABI0lEQVR4nO3QMQEAAAjAILV/aGPwjAjMbZybnTjbP9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b+1cxvnHi9hBAfkOyqGAAAAAElFTkSuQmCC',
	description TEXT,
	rank_id INTEGER REFERENCES rank(rank_id) DEFAULT 1,
	accumulated_point INTEGER DEFAULT 0,
	rank_point INTEGER DEFAULT 0,
	refresh_token TEXT DEFAULT '',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON users
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE COURSE:
create table course (
	course_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	image TEXT NOT NULL,
	level VARCHAR(10) NOT NULL,
	charges BOOLEAN NOT NULL,
	point_to_unlock INT,
	point_reward INT NOT NULL,
	quantity_rating INT NOT NULL DEFAULT 0,
	avg_rating DECIMAL(3,2) NOT NULL DEFAULT 0,
	participants INT NOT NULL DEFAULT 0,
	price INT,
	discount INT,
	total_chapter INT NOT NULL DEFAULT 0,
	total_lesson INT NOT NULL DEFAULT 0,
	total_video_time INT NOT NULL DEFAULT 0,
	achieves TEXT,
	description TEXT,
	created_by INTEGER REFERENCES users(user_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON course
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE CHAPTER:
create table chapter (
	chapter_id SERIAL PRIMARY KEY,
	course_id INT NOT NULL REFERENCES course(course_id),
	numeric_order INT NOT NULL,
	name VARCHAR(150) NOT NULL,
	total_lesson SMALLINT NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(course_id, numeric_order)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON chapter
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE UNIT:
create table unit (
	unit_id SERIAL PRIMARY KEY,
	chapter_id INTEGER NOT NULL REFERENCES chapter(chapter_id),
	numeric_order INT NOT NULL,
	name VARCHAR(150) NOT NULL,
	total_lesson SMALLINT NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(chapter_id, numeric_order)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON unit
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE LESSON:
create table lesson (
	lesson_id SERIAL PRIMARY KEY,
	unit_id INTEGER NOT NULL REFERENCES unit(unit_id),
	numeric_order INT NOT NULL,
	name TEXT NOT NULL,
	type SMALLINT NOT NULL,
	video_url TEXT,
	video_time INT NOT NULL DEFAULT 0,
	flashcard_set_id INTEGER,
	text TEXT,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(unit_id, numeric_order)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON lesson
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE JOIN_COURSE:
create table join_course (
	-- join_course_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id) ,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (student_id, course_id)
);


-- CREATE TABLE JOIN_LESSON:
create table join_lesson (
	-- join_lesson_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	lesson_id INTEGER NOT NULL REFERENCES lesson(lesson_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (student_id, lesson_id)
);


-- CREATE TABLE NOTE:
create table note (
	note_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	lesson_id INTEGER NOT NULL REFERENCES lesson(lesson_id),
	note TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON note
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE RATING:
create table rating (
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id),
	rate INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (student_id, course_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON rating
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE COMMENT:
create table comment (
	comment_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id),
	content TEXT,
	total_like INTEGER DEFAULT 0,
	respond_id INTEGER REFERENCES comment(comment_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON comment
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE ROLE:
create table roles (
	role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON roles
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- CREATE TABLE USER_TO_ROLE:
create table user_to_role (
	user_id INTEGER NOT NULL REFERENCES users(user_id),
	role_id INTEGER NOT NULL REFERENCES roles(role_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, role_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON user_to_role
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();



-- CREATE TABLE SLIDE:
create table slide (
    slide_id SERIAL PRIMARY KEY,
	sequence INTEGER NOT NULL,
	lesson_id INTEGER REFERENCES lesson(lesson_id),
	text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE(sequence, lesson_id)
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON slide
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();



-- CREATE TABLE LIKE:
create table likes (
	user_id INTEGER NOT NULL REFERENCES users(user_id),
	comment_id INTEGER NOT NULL REFERENCES comment(comment_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, comment_id)
);

