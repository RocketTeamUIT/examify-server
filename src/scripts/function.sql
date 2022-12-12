CREATE OR REPLACE FUNCTION fn_check_user_like(arg_user_id int, arg_comment_id int) RETURNS boolean AS 
$$
	DECLARE 
		isExist boolean;
	BEGIN
		SELECT CASE WHEN user_id = arg_user_id AND comment_id = arg_comment_id THEN true ELSE false END INTO isExist
		FROM likes
		WHERE user_id = arg_user_id AND comment_id = arg_comment_id;
		
		RETURN isExist;
	END;
$$ 
LANGUAGE plpgsql;

-- Function check user join course
CREATE OR REPLACE FUNCTION check_join_course(arg_user_id int, arg_course_id int) RETURNS boolean AS $$
	DECLARE 
		isJoin boolean;
	BEGIN		
		SELECT CASE WHEN TEM.course_id = course.course_id THEN true ELSE false END INTO isJoin
		FROM course
		LEFT JOIN (
		  SELECT course_id 
		  FROM join_course
		  WHERE student_id = arg_user_id
		) AS TEM ON course.course_id = TEM.course_id
		WHERE course.course_id = arg_course_id;

		RETURN isJoin;
	END;
$$ LANGUAGE plpgsql;

-- Function get status learned of chapter
CREATE OR REPLACE FUNCTION get_status_learned_chapter(arg_user_id int, arg_chapter_id int) RETURNS int AS $$
	DECLARE 
		status int;
	BEGIN		
		SELECT CASE WHEN total = learned THEN 2 ELSE 1 END INTO status
		FROM (
			SELECT chapter.total_lesson AS total, COUNT(*) AS learned
			FROM chapter, unit
			INNER JOIN lesson ON unit.unit_id = lesson.unit_id
			INNER JOIN join_lesson ON lesson.lesson_id = join_lesson.lesson_id
			WHERE chapter.chapter_id = arg_chapter_id
			AND unit.chapter_id = chapter.chapter_id
			AND join_lesson.student_id = arg_user_id
			GROUP BY chapter.chapter_id
		) AS TEM;

		RETURN status;
	END;
$$ LANGUAGE plpgsql;

-- Function get status learned of unit
CREATE OR REPLACE FUNCTION get_status_learned_unit(arg_user_id int, arg_unit_id int) RETURNS int AS $$
	DECLARE 
		status int;
	BEGIN		
		SELECT CASE WHEN total = learned THEN 2 ELSE 1 END INTO status
		FROM (
		  SELECT unit.total_lesson AS total, COUNT(*) AS learned
		  FROM unit, lesson
		  INNER JOIN join_lesson ON lesson.lesson_id = join_lesson.lesson_id
		  WHERE unit.unit_id = arg_unit_id
		  AND unit.unit_id = lesson.unit_id
		  AND join_lesson.student_id = arg_user_id
		  GROUP BY unit.unit_id
		) AS TEM;

		RETURN status;
	END;
$$ LANGUAGE plpgsql;

-- Function check user completed lesson
CREATE OR REPLACE FUNCTION check_completed_lesson(arg_user_id int, arg_lesson_id int) RETURNS boolean AS $$
	DECLARE 
		completed boolean;
	BEGIN		
		SELECT CASE WHEN COUNT(*) = 0 THEN false ELSE true END INTO completed
		FROM join_lesson
		WHERE student_id = arg_user_id
		AND lesson_id = arg_lesson_id;

		RETURN completed;
	END;
$$ LANGUAGE plpgsql;