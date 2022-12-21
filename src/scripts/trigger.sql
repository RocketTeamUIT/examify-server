

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



-- Triger function: increase total chapter
CREATE OR REPLACE FUNCTION increase_total_chapter()
	RETURNS trigger AS 
$$
BEGIN
-- 	Trigger:
	UPDATE course SET total_chapter = (total_chapter + 1) WHERE course_id = NEW.course_id;
	
	RAISE NOTICE 'Updated total chapter in course!';
	RETURN NEW;
END;

$$
LANGUAGE 'plpgsql';

-- Trigger: increase total chapter after create new chapter
CREATE OR REPLACE TRIGGER create_chapter
	AFTER INSERT ON chapter
	FOR EACH ROW
	EXECUTE PROCEDURE increase_total_chapter();


-- Triger function: decrease total chapter
CREATE OR REPLACE FUNCTION decrease_total_chapter()
	RETURNS trigger AS 
$$
BEGIN
-- 	Trigger:
	UPDATE course SET total_chapter = (total_chapter - 1) WHERE course_id = OLD.course_id;
	
	RAISE NOTICE 'Updated total chapter in course!';
	RETURN OLD;
END;

$$
LANGUAGE 'plpgsql';


-- Trigger: decrease total chapter after create new chapter
CREATE OR REPLACE TRIGGER delete_chapter
	AFTER DELETE ON chapter
	FOR EACH ROW
	EXECUTE PROCEDURE decrease_total_chapter();



-- Trigger function: increase total lesson video for course
CREATE OR REPLACE FUNCTION increase_total_video_course()
	RETURNS Trigger AS
$$
#variable_conflict use_variable
DECLARE var_type SMALLINT;
DECLARE var_video_time INTEGER;
DECLARE var_course_id INTEGER;
BEGIN
	var_type:= NEW.type;
	var_video_time:= NEW.video_time;
	--check
	IF var_type = 1 AND var_video_time != 0 THEN
		SELECT chapter.course_id INTO var_course_id
		FROM chapter, unit
		WHERE unit.unit_id = NEW.unit_id
		AND unit.chapter_id = chapter.chapter_id;
	--Trigger	
		UPDATE course 
		SET total_video_time = total_video_time + var_video_time
		WHERE  course_id = var_course_id;
	--Notice	
		RAISE NOTICE 'Updated total video time in course!';
	END IF;
	RETURN NULL;
END
$$
LANGUAGE 'plpgsql'; 

-- Trigger: update total video time for course when create new lesson video
CREATE OR REPLACE TRIGGER create_lesson_video
	AFTER INSERT ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE increase_total_video_course();


-- Trigger function: decrease total lesson video for course
CREATE OR REPLACE FUNCTION decrease_total_video_course()
	RETURNS Trigger AS
$$
#variable_conflict use_variable
DECLARE var_type SMALLINT;
DECLARE var_video_time INTEGER;
DECLARE var_course_id INTEGER;
BEGIN
	var_type:= OLD.type;
	var_video_time:= OLD.video_time;
	--check
	IF var_type = 1 AND var_video_time != 0 THEN
		SELECT chapter.course_id INTO var_course_id
		FROM chapter, unit
		WHERE unit.unit_id = OLD.unit_id
		AND unit.chapter_id = chapter.chapter_id;
	--Trigger	
		UPDATE course 
		SET total_video_time = total_video_time - var_video_time
		WHERE  course_id = var_course_id;
	--Notice	
		RAISE NOTICE 'Updated total video time in course!';
	END IF;
	RETURN NULL;
END
$$
LANGUAGE 'plpgsql'; 

-- Trigger: update total video time for course when delete one lesson video
CREATE OR REPLACE TRIGGER delete_lesson_video
	AFTER DELETE ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE decrease_total_video_course();



-- Trigger function: update total lesson video for course
CREATE OR REPLACE FUNCTION update_total_video_course()
	RETURNS Trigger AS
$$
#variable_conflict use_variable
DECLARE var_video_time_old INTEGER;
DECLARE var_video_time_new INTEGER;
DECLARE var_course_id INTEGER;
BEGIN
	var_video_time_new:= NEW.video_time;
	var_video_time_old:= OLD.video_time;
	SELECT chapter.course_id INTO var_course_id
		FROM chapter, unit
		WHERE unit.unit_id = OLD.unit_id
		AND unit.chapter_id = chapter.chapter_id;
	--Trigger	
		UPDATE course 
		SET total_video_time = total_video_time - var_video_time_old + var_video_time_new
		WHERE  course_id = var_course_id;
	--Notice	
	RAISE NOTICE 'Updated total video time in course!';
		
	RETURN NEW;
END
$$
LANGUAGE 'plpgsql'; 

-- Trigger: update total video time for course when delete one lesson video
CREATE OR REPLACE TRIGGER update_video_time_lesson
	AFTER UPDATE OF video_time ON lesson
	FOR EACH ROW
	EXECUTE PROCEDURE update_total_video_course();




-- Function create, update rating for course
CREATE OR REPLACE FUNCTION fn_create_update_rating_course() RETURNS Trigger AS 
$$
DECLARE var_course_id INTEGER;
DECLARE var_quatity_rating INTEGER;
DECLARE var_avg_rating NUMERIC(3,2);
	BEGIN
		var_course_id:= NEW.course_id;
		IF EXISTS (SELECT 1 FROM rating WHERE course_id = var_course_id) THEN
			SELECT COUNT(*), AVG(rating.rate) INTO var_quatity_rating, var_avg_rating
			FROM rating
			WHERE rating.course_id = var_course_id;
		
			UPDATE course 
			SET quantity_rating = var_quatity_rating, avg_rating = var_avg_rating
			WHERE course_id = var_course_id;
		ELSE
			UPDATE course 
			SET quantity_rating = 0, avg_rating = 0
			WHERE course_id = var_course_id;
		END IF;
			RAISE NOTICE'Updated quantity rating and average rating!';
	RETURN NULL;
	END
$$ 
LANGUAGE plpgsql;


-- Function delete rating for course
CREATE OR REPLACE FUNCTION fn_delete_rating_course() RETURNS Trigger AS 
$$
DECLARE var_course_id INTEGER;
DECLARE var_quatity_rating INTEGER;
DECLARE var_avg_rating NUMERIC(3,2);
	BEGIN
		var_course_id:= OLD.course_id;
		IF EXISTS (SELECT 1 FROM rating WHERE course_id = var_course_id) THEN
			SELECT COUNT(*), AVG(rating.rate) INTO var_quatity_rating, var_avg_rating
			FROM rating
			WHERE rating.course_id = var_course_id;
		
			UPDATE course 
			SET quantity_rating = var_quatity_rating, avg_rating = var_avg_rating
			WHERE course_id = var_course_id;
		ELSE
			UPDATE course 
			SET quantity_rating = 0, avg_rating = 0
			WHERE course_id = var_course_id;
		END IF;
			RAISE NOTICE'Updated quantity rating and average rating!';
	RETURN NULL;
	END
$$ 
LANGUAGE plpgsql;


-- Trigger: update rating for course when create rating
CREATE OR REPLACE TRIGGER create_rating_course
	AFTER INSERT ON rating
	FOR EACH ROW
	EXECUTE PROCEDURE fn_create_update_rating_course();

-- Trigger: update rating for course
CREATE OR REPLACE TRIGGER update_rating_course
	AFTER UPDATE OF rate ON rating
	FOR EACH ROW
	EXECUTE PROCEDURE fn_create_update_rating_course();

-- Trigger: update rating for course
CREATE OR REPLACE TRIGGER delete_rating_course
	AFTER DELETE ON rating
	FOR EACH ROW
	EXECUTE PROCEDURE fn_delete_rating_course();

	
	

-- Function update participants for course
CREATE OR REPLACE FUNCTION fn_increase_participants_course() RETURNS Trigger AS 
$$
	BEGIN
		UPDATE course 
		SET participants = participants + 1
		WHERE course_id = NEW.course_id;
		
		RAISE NOTICE'Updated participants in course!';
	RETURN NEW;
	END
$$ 
LANGUAGE plpgsql;

-- Trigger: update participants for course
CREATE OR REPLACE TRIGGER update_participants_course
	AFTER INSERT ON join_course
	FOR EACH ROW
	EXECUTE PROCEDURE fn_increase_participants_course();
-- -- Trigger auto increase total_exam after insert exam
-- CREATE OR REPLACE FUNCTION increase_total_exam()
-- 	RETURNS trigger AS
-- $$
-- BEGIN
-- 	UPDATE exam_series SET total_exam = total_exam + 1 WHERE NEW.exam_series_id = exam_series_id;

-- 	RAISE NOTICE 'Auto increase total_exam successfully';
-- 	RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE OR REPLACE TRIGGER create_new_exam
-- 	AFTER INSERT ON exam
-- 	FOR EACH ROW
-- 	EXECUTE PROCEDURE increase_total_exam();  


-- --Trigger auto decrease total_lesson after delete exam
-- CREATE OR REPLACE FUNCTION decrease_total_exam()
-- 	RETURNS trigger AS
-- $$
-- BEGIN
-- 	UPDATE exam_series SET total_exam = total_exam - 1 WHERE OLD.exam_series_id = exam_series_id;

-- 	RAISE NOTICE 'Auto decrease total_exam successfully';
-- 	RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE OR REPLACE TRIGGER delete_exam
-- 	AFTER DELETE ON exam
-- 	FOR EACH ROW
-- 	EXECUTE PROCEDURE decrease_total_exam();


-- Auto update seq after delete a row
CREATE OR REPLACE FUNCTION fn_update_order_chapter() RETURNS trigger AS 
$$BEGIN
	UPDATE chapter SET numeric_order = numeric_order - 1 WHERE numeric_order > OLD.numeric_order AND course_id = OLD.course_id;
	RETURN NULL;
END;$$
LANGUAGE 'plpgsql';

-- Apply to chapter
CREATE OR REPLACE TRIGGER update_order_chapter
	AFTER DELETE 
	on chapter 
	FOR EACH ROW 
	EXECUTE PROCEDURE fn_update_order_chapter(); 
	
-- Auto update seq after delete a row
CREATE OR REPLACE FUNCTION fn_update_order_unit() RETURNS trigger AS 
$$BEGIN
	UPDATE unit SET numeric_order = numeric_order - 1 WHERE numeric_order > OLD.numeric_order AND chapter_id = OLD.chapter_id;
	RETURN NULL;
END;$$
LANGUAGE 'plpgsql';

-- Apply to unit 
CREATE OR REPLACE TRIGGER update_order_unit
	AFTER DELETE 
	on unit 
	FOR EACH ROW 
	EXECUTE PROCEDURE fn_update_order_unit(); 

-- Auto update seq after delete a row
CREATE OR REPLACE FUNCTION fn_update_order_lesson() RETURNS trigger AS 
$$BEGIN
	UPDATE lesson SET numeric_order = numeric_order - 1 WHERE numeric_order > OLD.numeric_order AND unit_id = OLD.unit_id;
	RETURN NULL;
END;$$
LANGUAGE 'plpgsql';

-- Apply to lesson
CREATE OR REPLACE TRIGGER update_order_lesson
	AFTER DELETE 
	on lesson 
	FOR EACH ROW 
	EXECUTE PROCEDURE fn_update_order_lesson(); 
