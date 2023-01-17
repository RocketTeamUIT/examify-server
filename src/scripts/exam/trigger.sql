-- Trigger auto increase total_exam after insert exam
CREATE OR REPLACE FUNCTION increase_total_exam()
	RETURNS trigger AS
$$
BEGIN
	UPDATE exam_series SET total_exam = total_exam + 1 WHERE NEW.exam_series_id = exam_series_id;

	RAISE NOTICE 'Auto increase total_exam successfully';
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER create_new_exam
	AFTER INSERT ON exam
	FOR EACH ROW
	EXECUTE PROCEDURE increase_total_exam();


--Trigger auto decrease total_exam after delete exam
CREATE OR REPLACE FUNCTION decrease_total_exam()
	RETURNS trigger AS
$$
BEGIN
	UPDATE exam_series SET total_exam = total_exam - 1 WHERE OLD.exam_series_id = exam_series_id;

	RAISE NOTICE 'Auto decrease total_exam successfully';
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER delete_exam
	AFTER DELETE ON exam
	FOR EACH ROW
	EXECUTE PROCEDURE decrease_total_exam()


-- Function update total_question in exam when create a question
CREATE OR REPLACE FUNCTION fn_increase_total_question_exam() RETURNS Trigger AS 
$$
DECLARE var_exam_id INT;
	BEGIN
		SELECT part.exam_id INTO var_exam_id
		FROM set_question, part
		WHERE set_question.part_id = part.part_id
		AND set_question.set_question_id = NEW.set_question_id;
-- 		increment total_question
		UPDATE exam SET total_question = total_question + 1 WHERE exam_id = var_exam_id;
		
		RAISE NOTICE 'Updated total_question in exam!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_question in exam when create a question
CREATE OR REPLACE TRIGGER update_increment_total_question_exam
	AFTER INSERT ON question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_increase_total_question_exam();


-- Function update total_question in exam when delete a question
CREATE OR REPLACE FUNCTION fn_decrease_total_question_exam() RETURNS Trigger AS 
$$
DECLARE var_exam_id INT;
	BEGIN
		SELECT part.exam_id INTO var_exam_id
		FROM set_question, part
		WHERE set_question.part_id = part.part_id
		AND set_question.set_question_id = OLD.set_question_id;
-- 		decrement total_question
		UPDATE exam SET total_question = total_question - 1 WHERE exam_id = var_exam_id;
		
		RAISE NOTICE 'Updated total_question in exam!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_question when delete a question
CREATE OR REPLACE TRIGGER update_decrement_total_question_exam
	AFTER DELETE ON question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_decrease_total_question_exam();


	-- Function update total_part in exam when create a part
CREATE OR REPLACE FUNCTION fn_increase_total_part_exam() RETURNS Trigger AS 
$$
	BEGIN
		UPDATE exam SET total_part = total_part + 1 WHERE exam_id = NEW.exam_id;
		RAISE NOTICE 'Updated total_part in exam!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_part in exam when create a part
CREATE OR REPLACE TRIGGER update_increment_total_part_exam
	AFTER INSERT ON part
	FOR EACH ROW
	EXECUTE PROCEDURE fn_increase_total_part_exam();


-- Function update total_part in exam when delete a part
CREATE OR REPLACE FUNCTION fn_decrease_total_part_exam() RETURNS Trigger AS 
$$
	BEGIN
		UPDATE exam SET total_part = total_part - 1 WHERE exam_id = OLD.exam_id;
		RAISE NOTICE 'Updated total_part in exam!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_part when delete a part
CREATE OR REPLACE TRIGGER update_decrement_total_part_exam
	AFTER DELETE ON part
	FOR EACH ROW
	EXECUTE PROCEDURE fn_decrease_total_part_exam();


-- Function update nums_join for exam 
CREATE OR REPLACE FUNCTION fn_increase_nums_join_exam() 
RETURNS Trigger AS 
$$
	BEGIN
		UPDATE exam 
		SET nums_join = nums_join + 1
		WHERE exam_id = NEW.exam_id;
		
		RAISE NOTICE'Updated nums_join in exam!';
	RETURN NEW;
	END
$$ 
LANGUAGE plpgsql;

-- Trigger: update nums_join for exam 
CREATE OR REPLACE TRIGGER update_nums_join_exam
	AFTER INSERT ON exam_taking
	FOR EACH ROW
	EXECUTE PROCEDURE fn_increase_nums_join_exam();



-- Function update total_question in part when create a question
CREATE OR REPLACE FUNCTION fn_increase_total_question_part() RETURNS Trigger AS 
$$
DECLARE var_part_id INT;
	BEGIN
		SELECT set_question.part_id INTO var_part_id
		FROM set_question
		WHERE set_question.set_question_id = NEW.set_question_id;
-- 		increment total_question
		UPDATE part SET total_question = total_question + 1 WHERE part_id = var_part_id;
		
		RAISE NOTICE 'Updated total_question in part!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_question in part when create a question
CREATE OR REPLACE TRIGGER update_increment_total_question_part
	AFTER INSERT ON question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_increase_total_question_part();


-- Function update total_question in part when delete a question
CREATE OR REPLACE FUNCTION fn_decrease_total_question_part() RETURNS Trigger AS 
$$
DECLARE var_part_id INT;
	BEGIN
		SELECT set_question.part_id INTO var_part_id
		FROM set_question
		WHERE set_question.set_question_id = OLD.set_question_id;
-- 		decrement total_question
		UPDATE part SET total_question = total_question - 1 WHERE part_id = var_part_id;
		
		RAISE NOTICE 'Updated total_question in part!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update total_question in part when delete a question
CREATE OR REPLACE TRIGGER update_decrement_total_question_part
	AFTER DELETE ON question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_decrease_total_question_part();
