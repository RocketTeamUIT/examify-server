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


--Trigger auto decrease total_lesson after delete exam
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


