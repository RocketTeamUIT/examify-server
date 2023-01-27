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
