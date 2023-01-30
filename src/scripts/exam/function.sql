-- Function check user answer
CREATE OR REPLACE FUNCTION check_answer(arg_examtaking_id int, arg_question_id int) 
RETURNS int 
AS $$
	DECLARE 
		var_user_answer int;
		var_correct_answer int;
	BEGIN		
		SELECT choice_id INTO var_user_answer
		FROM answer_record 
		WHERE exam_taking_id = arg_examtaking_id
		AND question_id = arg_question_id;
		
		SELECT choice_id INTO var_correct_answer
		FROM choice
		WHERE question_id = arg_question_id
		AND key = true;
		
-- 		Check user answer and correct answer: (0: wrong, 1: correct, 2: user don't filled)
		IF var_user_answer = var_correct_answer 
			THEN return 1;
		ELSE 
			IF var_user_answer <> var_correct_answer 
				THEN return 0;
			ELSE 
				return 2;
			END IF;
		END IF;
	END;
$$ LANGUAGE plpgsql;


-- Function delete choice
CREATE OR REPLACE FUNCTION fn_delete_choice(arg_choice_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 		Delete answer_record reference:
		DELETE FROM answer_record WHERE choice_id = arg_choice_id;
-- 		Delete Choice:
		DELETE FROM choice WHERE choice_id = arg_choice_id;
 			RAISE NOTICE 'Deleted choice!';
	END;
$$ 
LANGUAGE plpgsql;



-- Function delete question
CREATE OR REPLACE FUNCTION fn_delete_question(arg_question_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 		Delete choice reference:
		FOR var_recode IN 
			SELECT choice_id
			FROM choice
			WHERE choice.question_id = arg_question_id
		 LOOP
			PERFORM fn_delete_choice(var_recode.choice_id);
		END LOOP;
-- 		Delete question:
		DELETE FROM question WHERE question_id = arg_question_id;
		RAISE NOTICE 'Deleted question!';
	END;
$$ 
LANGUAGE plpgsql;




-- Function delete set_question
CREATE OR REPLACE FUNCTION fn_delete_set_question(arg_set_question_id int) RETURNS void AS 
$$
DECLARE var_recode_question RECORD;
DECLARE var_recode_side RECORD;
	BEGIN
-- 		Delete question reference:
		FOR var_recode_question IN 
			SELECT question_id
			FROM question
			WHERE question.set_question_id = arg_set_question_id
		 LOOP
			PERFORM fn_delete_question(var_recode_question.question_id);
		END LOOP;
-- 		Delete side reference:
		DELETE FROM side WHERE set_question_id = arg_set_question_id;

-- 		Delete set question:
		DELETE FROM set_question WHERE set_question_id = arg_set_question_id;
		RAISE NOTICE 'Deleted set question!';
	END;
$$ 
LANGUAGE plpgsql;




-- Function delete part
CREATE OR REPLACE FUNCTION fn_delete_part(arg_part_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 		Delete set question reference:
		FOR var_recode IN 
			SELECT set_question_id
			FROM set_question
			WHERE set_question.part_id = arg_part_id
		 LOOP
			PERFORM fn_delete_set_question(var_recode.set_question_id);
		END LOOP;
-- 		Delete part option reference:
		DELETE FROM part_option WHERE part_id = arg_part_id;

-- 		Delete part:
		DELETE FROM part WHERE part_id = arg_part_id;
		RAISE NOTICE 'Deleted part!';
	END;
$$ 
LANGUAGE plpgsql;



-- Function delete exam
CREATE OR REPLACE FUNCTION fn_delete_exam(arg_exam_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 		Delete part reference:
		FOR var_recode IN 
			SELECT part_id
			FROM part
			WHERE exam.exam_id = arg_exam_id
		 LOOP
			PERFORM fn_delete_part(var_recode.part_id);
		END LOOP;
-- 		Delete exam taking reference:
		DELETE FROM exam_taking WHERE exam_id = arg_exam_id;

-- 		Delete exam:
		DELETE FROM exam WHERE exam_id = arg_exam_id;
		RAISE NOTICE 'Deleted exam!';
	END;
$$ 
LANGUAGE plpgsql;



-- Function delete exam_series
CREATE OR REPLACE FUNCTION fn_delete_exam_series(arg_exam_series_id int) RETURNS void AS 
$$
DECLARE var_recode RECORD;
	BEGIN
-- 		Delete exam reference:
		FOR var_recode IN 
			SELECT exam_id
			FROM exam
			WHERE exam.exam_series_id = exam_series_id
		 LOOP
			PERFORM fn_delete_exam(var_recode.exam_id);
		END LOOP;

-- 		Delete exam series:
		DELETE FROM exam_series WHERE exam_series_id = arg_exam_series_id;
		RAISE NOTICE 'Deleted exam series!';
	END;
$$ 
LANGUAGE plpgsql;
