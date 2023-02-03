-- DDL


-- CREATE UPDATE FUNCTION TRIGGER
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER 
LANGUAGE PLPGSQL
AS $$
BEGIN
   NEW.updated_at = now(); 
   RETURN NEW;
END;
$$;

-- exam_series Table
create table exam_series (
	exam_series_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	total_exam INT NOT NULL DEFAULT 0,
	public_date DATE,
	author TEXT DEFAULT '',
	created_by INTEGER REFERENCES users(user_id) ,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON exam_series
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- exam Table
create table exam (
    exam_id SERIAL PRIMARY KEY,
	exam_series_id INTEGER REFERENCES exam_series(exam_series_id) ON DELETE CASCADE,
	name VARCHAR(255) NOT NULL,
	total_part INTEGER DEFAULT 0,
	total_question INTEGER DEFAULT 0,
	total_comment INTEGER DEFAULT 0,
    point_reward INTEGER DEFAULT 0,
	nums_join INTEGER DEFAULT 0,
	hashtag TEXT[] DEFAULT ARRAY['Listening', 'Reading'],
	is_full_explanation BOOLEAN DEFAULT false,
    audio TEXT,
    duration INTEGER DEFAULT 0,
    file_download TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON exam
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- part Table
create table part (
    part_id SERIAL PRIMARY KEY,
	exam_id INTEGER REFERENCES exam(exam_id),
	name VARCHAR(255) NOT NULL,
	total_question INTEGER DEFAULT 0,
	number_of_explanation INTEGER DEFAULT 0,
    numeric_order INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(numeric_order, exam_id)
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON part
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- hashtag Table
create table hashtag (
    hashtag_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON hashtag
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- set_questiontion Table
create table set_question (
    set_question_id SERIAL PRIMARY KEY,
    part_id INTEGER REFERENCES part(part_id),
	title VARCHAR(255) DEFAULT '',
    numeric_order INTEGER NOT NULL,
    -- is_single BOOLEAN DEFAULT true,
    audio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(part_id, numeric_order)
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON set_question
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- question Table
create table question (
    question_id SERIAL PRIMARY KEY,
    set_question_id INTEGER REFERENCES set_question(set_question_id),
    hashtag_id INTEGER REFERENCES hashtag(hashtag_id),
	name VARCHAR(255) DEFAULT '',
    explain VARCHAR(255) DEFAULT '',
    order_qn INTEGER NOT NULL,
    -- img TEXT,
    level INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(order_qn, set_question_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON question
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- choice Table
create table choice (
    choice_id SERIAL PRIMARY KEY,
    question_id INTEGER REFERENCES question(question_id),
    order_choice INTEGER NOT NULL,
    name TEXT NOT NULL DEFAULT '',
    key BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(order_choice, question_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON choice
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- side Table
create table side (
    side_id SERIAL PRIMARY KEY,
    set_question_id INTEGER REFERENCES set_question(set_question_id),
    paragraph TEXT NOT NULL,
    seq INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(seq, set_question_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON side
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- examTaking Table
create table exam_taking (
    exam_taking_id SERIAL PRIMARY KEY,
    exam_id INTEGER NOT NULL REFERENCES exam(exam_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    time_finished INTEGER NOT NULL DEFAULT 0,
    nums_of_correct_qn INTEGER NOT NULL DEFAULT 0,
    total_question INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON exam_taking
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- answer_record Table
create table answer_record (
    -- answer_record_id SERIAL PRIMARY KEY,
    exam_taking_id INTEGER REFERENCES exam_taking(exam_taking_id),
    question_id INTEGER REFERENCES question(question_id),
    choice_id INTEGER REFERENCES choice(choice_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (exam_taking_id, question_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON answer_record
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- part_option Table
create table part_option (
    exam_taking_id INTEGER REFERENCES exam_taking(exam_taking_id),
    part_id INTEGER REFERENCES part(part_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (exam_taking_id, part_id)
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON part_option
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

