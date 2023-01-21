CREATE DATABASE test7;

create table set_question (
    set_question_id SERIAL PRIMARY KEY,
    part_id INTEGER REFERENCES part(part_id),
	title VARCHAR(255) DEFAULT '',
    numeric_order INTEGER NOT NULL,
    -- is_single BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(part_id, numeric_order)
);

create table property_type (
    property_type_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT DEFAULT '',
    is_specific BOOLEAN DEFAULT false
);

create table property (
    property_id SERIAL PRIMARY KEY,
    set_question_id INTEGER REFERENCES set_question(set_question_id),
    property_type_id INTEGER REFERENCES property_type(property_type_id)
);

create table trait (
    property_id SERIAL PRIMARY KEY,
    value TEXT NOT NULL,

    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

create table trait_specific (
    trait_specific_id INTEGER,
    property_id INTEGER REFERENCES property(property_id),
    seq INTEGER NOT NULL,
    script TEXT NOT NULL,
    script_voice VARCHAR(10) NOT NULL,

    PRIMARY KEY(trait_specific_id, property_id)
);

insert into set_question (title, numeric_order) values ('', 1);

insert into property_type (name, description) values ('ReaderVoice', 'ReaderVoice is only for Part 1');
insert into property_type (name, description) values ('QuestionerVoice', 'QuestionerVoice is only for Part 2');
insert into property_type (name, description) values ('AnswererVoice', 'AnswererVoice is only for Part 2');
insert into property_type (name, description) values ('Title', 'Title is for Parts like: Part 3, Part 4, Part 6, Part 7');
insert into property_type (name, description) values ('Audio', 'Audio is for Parts like: Part 1, Part 2, Part 3, Part 4');
insert into property_type (name, description, is_specific) values ('Script', 'Script is for Parts like: Part 3, Part 4', true);
