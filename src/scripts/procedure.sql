-- Increate participants of course one unit
CREATE OR REPLACE PROCEDURE increase_one_participant_course(course_id_increase INT)
LANGUAGE PLPGSQL
AS $$
BEGIN
   UPDATE course SET participants = participants + 1 WHERE course_id = course_id_increase;
END;
$$;




