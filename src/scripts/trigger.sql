

-- Triger function: increase total lesson
CREATE OR REPLACE FUNCTION increase_total_lesson()
	RETURNS trigger AS 
$$
#variable_conflict use_variable
DECLARE var_unit_id INTEGER;
DECLARE var_chapter_id INTEGER;
DECLARE var_course_id INTEGER;
BEGIN
	var_unit_id := NEW.unit_id;
	SELECT chapter_id INTO var_chapter_id FROM unit WHERE unit_id = var_unit_id;
	SELECT course_id INTO var_course_id FROM chapter WHERE chapter_id = var_chapter_id;
-- 	Trigger:
	UPDATE unit SET total_lesson = (total_lesson + 1) WHERE unit_id = var_unit_id;
	UPDATE chapter SET total_lesson = (total_lesson + 1) WHERE chapter_id = var_chapter_id;
	UPDATE course SET total_lesson = (total_lesson + 1) WHERE course_id = var_course_id;
	
	RAISE NOTICE 'Updated total lesson in unit, chapter and course!';
	RETURN NEW;
END;

$$
LANGUAGE 'plpgsql'; 

-- Trigger: increase total lesson after create new lesson
CREATE OR REPLACE TRIGGER create_new_lesson
	AFTER INSERT ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE increase_total_lesson();


-- Triger function: decrease total lesson
CREATE OR REPLACE FUNCTION decrease_total_lesson()
	RETURNS trigger AS 
$$
#variable_conflict use_variable
DECLARE var_unit_id INTEGER;
DECLARE var_chapter_id INTEGER;
DECLARE var_course_id INTEGER;
BEGIN
	var_unit_id := OLD.unit_id; 
	SELECT chapter_id INTO var_chapter_id FROM unit WHERE unit_id = var_unit_id;
	SELECT course_id INTO var_course_id FROM chapter WHERE chapter_id = var_chapter_id;
-- 	Trigger:
	UPDATE unit SET total_lesson = (total_lesson - 1) WHERE unit_id = var_unit_id;
	UPDATE chapter SET total_lesson = (total_lesson - 1) WHERE chapter_id = var_chapter_id;
	UPDATE course SET total_lesson = (total_lesson - 1) WHERE course_id = var_course_id;
	
	RAISE NOTICE 'Updated total lesson in unit, chapter and course!';
	RETURN NEW;
END;

$$
LANGUAGE 'plpgsql';

-- Trigger: decrease total lesson after create new lesson
CREATE OR REPLACE TRIGGER delete_lesson
	AFTER DELETE ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE decrease_total_lesson();



-- Triger function: update total lesson
CREATE OR REPLACE FUNCTION update_total_lesson()
	RETURNS trigger AS 
$$
#variable_conflict use_variable
DECLARE var_old_unit_id INTEGER;
DECLARE var_old_chapter_id INTEGER;
DECLARE var_old_course_id INTEGER;
DECLARE var_new_unit_id INTEGER;
DECLARE var_new_chapter_id INTEGER;
DECLARE var_new_course_id INTEGER;
BEGIN
	-- asign variable
	var_new_unit_id :=  NEW.unit_id; 
	SELECT chapter_id INTO var_new_chapter_id FROM unit WHERE unit_id = var_new_unit_id;
	SELECT course_id INTO var_new_course_id FROM chapter WHERE chapter_id = var_new_chapter_id ;
	var_old_unit_id :=  OLD.unit_id; 
	SELECT chapter_id INTO var_old_chapter_id FROM unit WHERE unit_id = var_old_unit_id;
	SELECT course_id INTO var_old_course_id FROM chapter WHERE chapter_id = var_old_chapter_id;
	-- trigger
	IF var_new_unit_id != var_old_unit_id THEN
		UPDATE unit SET total_lesson = (total_lesson + 1) WHERE unit_id = var_new_unit_id;
		UPDATE unit SET total_lesson = (total_lesson - 1) WHERE unit_id = var_old_unit_id;

		IF var_new_chapter_id != var_old_chapter_id THEN
			UPDATE chapter SET total_lesson = (total_lesson + 1) WHERE chapter_id = var_new_chapter_id;
			UPDATE chapter SET total_lesson = (total_lesson - 1) WHERE chapter_id = var_old_chapter_id;

			IF var_new_course_id != var_old_course_id THEN
				UPDATE course SET total_lesson = (total_lesson + 1) WHERE course_id = var_new_course_id;
				UPDATE course SET total_lesson = (total_lesson - 1) WHERE course_id = var_old_course_id;
			END IF;
		END IF;
	END IF;
	
	RAISE NOTICE 'Updated total lesson in unit, chapter and course!';
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql'; 

-- Trigger: update total lesson after update lesson_id
CREATE OR REPLACE TRIGGER update_lesson_unit_id
	BEFORE UPDATE OF unit_id ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE update_total_lesson();