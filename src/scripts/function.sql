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


-- Function get monday nearly
CREATE OR REPLACE FUNCTION fn_monday_nearly() RETURNS timestamp AS 
$$
	DECLARE 
		var_monday timestamp;
		var_distance integer;
	BEGIN
		SELECT extract(isodow from NOW()) INTO var_distance;
		var_monday:= NOW()::date - (var_distance - 1) * INTERVAL '1 day' ;
		
		RETURN var_monday;
	END;
$$ 
LANGUAGE plpgsql;



-- Function check Enroll course
CREATE OR REPLACE FUNCTION fn_enroll_course(arg_user_id int, arg_course_id int)
RETURNS Boolean	AS
$$
DECLARE var_accumulated_point INTEGER;
DECLARE var_point_to_unlock INTEGER;
	BEGIN
		SELECT accumulated_point 
		INTO var_accumulated_point
		FROM users WHERE user_id = arg_user_id;
		
		SELECT point_to_unlock 
		INTO var_point_to_unlock
		FROM course WHERE course_id = arg_course_id;
		
		IF var_accumulated_point >= var_point_to_unlock THEN
			INSERT INTO join_course 
			VALUES(arg_user_id, arg_course_id);
			
			UPDATE users SET accumulated_point = accumulated_point - var_point_to_unlock
			WHERE user_id = arg_user_id;
			RETURN TRUE;
		ELSE
			RETURN FALSE;
		END IF;	
	END;
$$
LANGUAGE plpgsql; 


-- Function delete one lesson
CREATE OR REPLACE FUNCTION fn_delete_lesson(arg_lesson_id int) RETURNS void AS 
$$
	BEGIN
		-- Delete all relationship
		DELETE FROM note WHERE lesson_id = arg_lesson_id;
		DELETE FROM slide WHERE lesson_id = arg_lesson_id;
		DELETE FROM join_lesson WHERE lesson_id = arg_lesson_id;
		-- Delete lesson
		DELETE FROM lesson where lesson_id = arg_lesson_id;
		RAISE NOTICE 'Deleted lesson success!';
	END;
$$ 
LANGUAGE plpgsql;


-- Function delete one Unit 
CREATE OR REPLACE FUNCTION fn_delete_unit(arg_unit_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT lesson_id
			FROM lesson
			WHERE unit_id = arg_unit_id
		 LOOP
			PERFORM fn_delete_lesson(var_recode.lesson_id);
		END LOOP;
		
		DELETE FROM unit where unit_id = arg_unit_id;
		RAISE NOTICE 'Delete unit success!';
	END;
$$ 
LANGUAGE plpgsql;


-- Function delete one Chapter
CREATE OR REPLACE FUNCTION fn_delete_chapter(arg_chapter_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT unit_id
			FROM unit
			WHERE chapter_id = arg_chapter_id
		 LOOP
			PERFORM fn_delete_unit(var_recode.unit_id);
		END LOOP;
		
		DELETE FROM chapter where chapter_id = arg_chapter_id;
		RAISE NOTICE 'Delete chapter success!';
	END;
$$ 
LANGUAGE plpgsql;


-- Function delete one Comment
CREATE OR REPLACE FUNCTION fn_delete_comment(arg_comment_id int) RETURNS void AS 
$$
	BEGIN
-- 		Detete all relationship 
		DELETE FROM likes where comment_id = arg_comment_id;
-- 		Delete comment
		DELETE FROM comment where comment_id = arg_comment_id;
		
		RAISE NOTICE 'Delete comment success!';
	END;
$$ 
LANGUAGE plpgsql;


-- Function delete one Course
CREATE OR REPLACE FUNCTION fn_delete_course(arg_course_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 	Delete comment reference
		FOR var_recode IN 
			SELECT comment_id
			FROM comment
			WHERE course_id = arg_course_id
		 LOOP
			PERFORM fn_delete_comment(var_recode.comment_id);
		END LOOP;
-- 	Delete Join_course reference
		DELETE FROM join_course WHERE course_id = arg_course_id;
-- 	Delete Raing reference
		DELETE FROM rating WHERE course_id = arg_course_id;
-- 	Delete chapter reference
		FOR var_recode IN 
			SELECT chapter_id
			FROM chapter
			WHERE course_id = arg_course_id
		 LOOP
			PERFORM fn_delete_chapter(var_recode.chapter_id);
		END LOOP;
		
		DELETE FROM course WHERE course_id = arg_course_id;
		RAISE NOTICE 'Delete course success!';
	END;
$$ 
LANGUAGE plpgsql;