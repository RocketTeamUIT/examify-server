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