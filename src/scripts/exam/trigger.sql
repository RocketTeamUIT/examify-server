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
	EXECUTE PROCEDURE decrease_total_exam();


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


-- Function create an user_to_role
CREATE OR REPLACE FUNCTION fn_create_a_role_user() RETURNS Trigger AS 
$$
	BEGIN
		INSERT INTO user_to_role(user_id, role_id) VALUES(NEW.user_id, 4);
		RAISE NOTICE 'Create a new user_to_role for user!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger create a role when create an user
CREATE OR REPLACE TRIGGER auto_create_user_to_role
	AFTER INSERT ON users
	FOR EACH ROW
	EXECUTE PROCEDURE fn_create_a_role_user();



-- Function update number order in Part
CREATE OR REPLACE FUNCTION fn_num_order_part_update() RETURNS Trigger AS 
$$
DECLARE var_new_num int;
DECLARE var_old_num int;
DECLARE var_old_part_id int;
DECLARE var_old_exam_id int;
DECLARE var_record RECORD;
	BEGIN
		var_new_num := NEW.numeric_order;
		var_old_num := OLD.numeric_order;
		var_old_part_id := OLD.part_id;
		var_old_exam_id := OLD.exam_id;
		
		IF EXISTS(SELECT * FROM part WHERE numeric_order = var_new_num AND exam_id = var_old_exam_id) THEN
-- 			Create temp Exam:
			INSERT INTO exam(exam_id, name) VALUES(-1, '');
-- 			Handle new_num > old_num:
			IF var_new_num > var_old_num THEN 
				UPDATE part SET exam_id = -1 WHERE part_id = var_old_part_id;
				
				FOR var_record IN 
					SELECT part_id 
					FROM part
					WHERE exam_id = var_old_exam_id
					AND numeric_order > var_old_num 
					AND numeric_order <= var_new_num
					ORDER BY numeric_order ASC
				LOOP
					UPDATE part SET numeric_order = numeric_order - 1 WHERE part_id = var_record.part_id;
				END LOOP;
			ELSE 
-- 				Handle new_num < old_num:
				IF var_new_num < var_old_num THEN 
					UPDATE part SET exam_id = -1 WHERE part_id = var_old_part_id;
					
					FOR var_record IN 
						SELECT part_id 
						FROM part
						WHERE exam_id = var_old_exam_id
						AND numeric_order < var_old_num 
						AND numeric_order >= var_new_num
						ORDER BY numeric_order DESC
					LOOP
						UPDATE part SET numeric_order = numeric_order + 1 WHERE part_id = var_record.part_id;
					END LOOP;
				END IF;
			END IF;
-- 			Update:
			UPDATE part SET numeric_order = var_new_num, exam_id = var_old_exam_id WHERE part_id = var_old_part_id;
-- 			Delete temp Exam:
			DELETE FROM exam WHERE exam_id = -1;
		END IF;
		RAISE NOTICE 'updated numeric order of part successfull!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when update Part
CREATE OR REPLACE TRIGGER numeric_order_part_update
	AFTER UPDATE OF numeric_order ON part
	FOR EACH ROW
	WHEN (pg_trigger_depth() = 0)
	EXECUTE PROCEDURE fn_num_order_part_update();



-- Function update number order in Part
CREATE OR REPLACE FUNCTION fn_num_order_part_delete() RETURNS Trigger AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT part_id
			FROM part 
			WHERE exam_id = OLD.exam_id
			AND numeric_order > OLD.numeric_order
			ORDER BY numeric_order ASC
		 LOOP
		 	UPDATE part SET numeric_order = numeric_order - 1 WHERE part_id = var_recode.part_id;
		END LOOP;
		RAISE NOTICE 'Updated numeric_order in Part!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when delete part
CREATE OR REPLACE TRIGGER numeric_order_part_delete
	AFTER DELETE ON part
	FOR EACH ROW
	EXECUTE PROCEDURE fn_num_order_part_delete();



-- Function update number order in Set Question
CREATE OR REPLACE FUNCTION fn_num_order_set_question_update() RETURNS Trigger AS 
$$
DECLARE var_new_num int;
DECLARE var_old_num int;
DECLARE var_old_set_question_id int;
DECLARE var_old_part_id int;
DECLARE var_record RECORD;
	BEGIN
		var_new_num := NEW.numeric_order;
		var_old_num := OLD.numeric_order;
		var_old_set_question_id := OLD.set_question_id;
		var_old_part_id := OLD.part_id;
		
		IF EXISTS(SELECT * FROM set_question WHERE numeric_order = var_new_num AND part_id = var_old_part_id) THEN
-- 			Create temp Part:
			INSERT INTO part(part_id, name, numeric_order) VALUES(-1, '', 0);
-- 			Handle new_num > old_num:
			IF var_new_num > var_old_num THEN 
				UPDATE set_question SET part_id = -1 WHERE set_question_id = var_old_set_question_id;
				
				FOR var_record IN 
					SELECT set_question_id 
					FROM set_question
					WHERE part_id = var_old_part_id
					AND numeric_order > var_old_num 
					AND numeric_order <= var_new_num
					ORDER BY numeric_order ASC
				LOOP
					UPDATE set_question SET numeric_order = numeric_order - 1 WHERE set_question_id = var_record.set_question_id;
				END LOOP;
			ELSE 
-- 				Handle new_num < old_num:
				IF var_new_num < var_old_num THEN 
					UPDATE set_question SET part_id = -1 WHERE set_question_id = var_old_set_question_id;
					
					FOR var_record IN 
						SELECT set_question_id 
						FROM set_question
						WHERE part_id = var_old_part_id
						AND numeric_order < var_old_num 
						AND numeric_order >= var_new_num
						ORDER BY numeric_order DESC
					LOOP
						UPDATE set_question SET numeric_order = numeric_order + 1 WHERE set_question_id = var_record.set_question_id;
					END LOOP;
				END IF;
			END IF;
-- 			Update:
			UPDATE set_question SET numeric_order = var_new_num, part_id = var_old_part_id WHERE set_question_id = var_old_set_question_id;
-- 			Delete temp Part:
			DELETE FROM part WHERE part_id = -1;
		END IF;
		RAISE NOTICE 'updated numeric order of set question successfull!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when update Set Question
CREATE OR REPLACE TRIGGER numeric_order_set_question_update
	AFTER UPDATE OF numeric_order ON set_question
	FOR EACH ROW
	WHEN (pg_trigger_depth() = 0)
	EXECUTE PROCEDURE fn_num_order_set_question_update();



-- Function update number order in Set Question
CREATE OR REPLACE FUNCTION fn_num_order_set_question_delete() RETURNS Trigger AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT set_question_id
			FROM set_question 
			WHERE part_id = OLD.part_id
			AND numeric_order > OLD.numeric_order
			ORDER BY numeric_order ASC
		 LOOP
		 	UPDATE set_question SET numeric_order = numeric_order - 1 WHERE set_question_id = var_recode.set_question_id;
		END LOOP;
		RAISE NOTICE 'Updated numeric_order in Set Question!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when delete Set Question
CREATE OR REPLACE TRIGGER numeric_order_set_question_delete
	AFTER DELETE ON set_question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_num_order_set_question_delete();




	-- Function update number order in Side
CREATE OR REPLACE FUNCTION fn_num_order_side_update() RETURNS Trigger AS 
$$
DECLARE var_new_num int;
DECLARE var_old_num int;
DECLARE var_old_side_id int;
DECLARE var_old_set_question_id int;
DECLARE var_record RECORD;
	BEGIN
		var_new_num := NEW.seq;
		var_old_num := OLD.seq;
		var_old_side_id := OLD.side_id;
		var_old_set_question_id := OLD.set_question_id;
		
		IF EXISTS(SELECT * FROM side WHERE seq = var_new_num AND set_question_id = var_old_set_question_id) THEN
-- 			Create temp set question:
			INSERT INTO set_question(set_question_id, title, numeric_order) VALUES(-1, '', 0);
-- 			Handle new_num > old_num:
			IF var_new_num > var_old_num THEN 
				UPDATE side SET set_question_id = -1 WHERE side_id = var_old_side_id;
				
				FOR var_record IN 
					SELECT side_id 
					FROM side
					WHERE set_question_id = var_old_set_question_id
					AND seq > var_old_num 
					AND seq <= var_new_num
					ORDER BY seq ASC
				LOOP
					UPDATE side SET seq = seq - 1 WHERE side_id = var_record.side_id;
				END LOOP;
			ELSE 
-- 				Handle new_num < old_num:
				IF var_new_num < var_old_num THEN 
					UPDATE side SET set_question_id = -1 WHERE side_id = var_old_side_id;
					
					FOR var_record IN 
						SELECT side_id 
						FROM side
						WHERE set_question_id = var_old_set_question_id
						AND seq < var_old_num 
						AND seq >= var_new_num
						ORDER BY seq DESC
					LOOP
						UPDATE side SET seq = seq + 1 WHERE side_id = var_record.side_id;
					END LOOP;
				END IF;
			END IF;
-- 			Update:
			UPDATE side SET seq = var_new_num, set_question_id = var_old_set_question_id WHERE side_id = var_old_side_id;
-- 			Delete temp set question:
			DELETE FROM set_question WHERE set_question_id = -1;
		END IF;
		RAISE NOTICE 'updated numeric order of side successfull!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when update Side
CREATE OR REPLACE TRIGGER numeric_order_side_update
	AFTER UPDATE OF seq ON side
	FOR EACH ROW
	WHEN (pg_trigger_depth() = 0)
	EXECUTE PROCEDURE fn_num_order_side_update();



-- Function update number order in Side
CREATE OR REPLACE FUNCTION fn_num_order_side_delete() RETURNS Trigger AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT side_id
			FROM side 
			WHERE set_question_id = OLD.set_question_id
			AND seq > OLD.seq
			ORDER BY seq ASC
		 LOOP
		 	UPDATE side SET seq = seq - 1 WHERE side_id = var_recode.side_id;
		END LOOP;
		RAISE NOTICE 'Updated numeric_order in Side!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when delete Side
CREATE OR REPLACE TRIGGER numeric_order_side_delete
	AFTER DELETE ON side
	FOR EACH ROW
	EXECUTE PROCEDURE fn_num_order_side_delete();



-- Function update number order in Question
CREATE OR REPLACE FUNCTION fn_num_order_question_update() RETURNS Trigger AS 
$$
DECLARE var_new_num int;
DECLARE var_old_num int;
DECLARE var_old_question_id int;
DECLARE var_old_set_question_id int;
DECLARE var_record RECORD;
	BEGIN
		var_new_num := NEW.order_qn;
		var_old_num := OLD.order_qn;
		var_old_question_id := OLD.question_id;
		var_old_set_question_id := OLD.set_question_id;
		
		IF EXISTS(SELECT * FROM question WHERE order_qn = var_new_num AND set_question_id = var_old_set_question_id) THEN
-- 			Create temp set question:
			INSERT INTO set_question(set_question_id, title, numeric_order) VALUES(-1, '', 0);
-- 			Handle new_num > old_num:
			IF var_new_num > var_old_num THEN 
				UPDATE question SET set_question_id = -1 WHERE question_id = var_old_question_id;
				
				FOR var_record IN 
					SELECT question_id 
					FROM question
					WHERE set_question_id = var_old_set_question_id
					AND order_qn > var_old_num 
					AND order_qn <= var_new_num
					ORDER BY order_qn ASC
				LOOP
					UPDATE question SET order_qn = order_qn - 1 WHERE question_id = var_record.question_id;
				END LOOP;
			ELSE 
-- 				Handle new_num < old_num:
				IF var_new_num < var_old_num THEN 
					UPDATE question SET set_question_id = -1 WHERE question_id = var_old_question_id;
					
					FOR var_record IN 
						SELECT question_id 
						FROM question
						WHERE set_question_id = var_old_set_question_id
						AND order_qn < var_old_num 
						AND order_qn >= var_new_num
						ORDER BY order_qn DESC
					LOOP
						UPDATE question SET order_qn = order_qn + 1 WHERE question_id = var_record.question_id;
					END LOOP;
				END IF;
			END IF;
-- 			Update:
			UPDATE question SET order_qn = var_new_num, set_question_id = var_old_set_question_id WHERE question_id = var_old_question_id;
-- 			Delete temp set question:
			DELETE FROM set_question WHERE set_question_id = -1;
		END IF;
		RAISE NOTICE 'updated numeric order of question successfull!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when update Question
CREATE OR REPLACE TRIGGER numeric_order_question_update
	AFTER UPDATE OF order_qn ON question 
	FOR EACH ROW
	WHEN (pg_trigger_depth() = 0)
	EXECUTE PROCEDURE fn_num_order_question_update();



-- Function update number order in Question
CREATE OR REPLACE FUNCTION fn_num_order_question_delete() RETURNS Trigger AS 
$$
DECLARE var_recode RECORD;
	BEGIN
		FOR var_recode IN 
			SELECT question_id
			FROM question 
			WHERE set_question_id = OLD.set_question_id
			AND order_qn > OLD.order_qn
			ORDER BY order_qn ASC
		 LOOP
		 	UPDATE question SET order_qn = order_qn - 1 WHERE question_id = var_recode.question_id;
		END LOOP;
		RAISE NOTICE 'Updated numeric_order in Question!';
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


-- Trigger update numeric order when delete Question
CREATE OR REPLACE TRIGGER numeric_order_question_delete
	AFTER DELETE ON question
	FOR EACH ROW
	EXECUTE PROCEDURE fn_num_order_question_delete();
