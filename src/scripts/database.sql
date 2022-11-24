-- DROP DATABASE temp;
-- CREATE DATABASE temp;

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

create table rank (
    rank_id SERIAL PRIMARY KEY,
	rank_name TEXT NOT NULL,
	point_to_unlock INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON rank
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into rank (rank_name, point_to_unlock) values ('Luyện Khí', 1000);
insert into rank (rank_name, point_to_unlock) values ('Trúc Cơ', 2000);
insert into rank (rank_name, point_to_unlock) values ('Kim Đan', 3000);
insert into rank (rank_name, point_to_unlock) values ('Nguyên Anh', 4000);
insert into rank (rank_name, point_to_unlock) values ('Hoá Thần', 5000);
insert into rank (rank_name, point_to_unlock) values ('Luyện Hư', 6000);
insert into rank (rank_name, point_to_unlock) values ('Hợp Thể', 7000);
insert into rank (rank_name, point_to_unlock) values ('Đại Thừa', 8000);
insert into rank (rank_name, point_to_unlock) values ('Độ Kiếp', 9000);

create table users (
	user_id SERIAL PRIMARY KEY,
	mail TEXT NOT NULL,
	password VARCHAR(50) NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	date_of_birth DATE,
	phone_number VARCHAR(10),
	avt TEXT DEFAULT 'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=170667a&w=0&k=20&c=m-F9Doa2ecNYEEjeplkFCmZBlc5tm1pl1F7cBCh9ZzM=',
	banner TEXT DEFAULT 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAX8AAACECAMAAABPuNs7AAAACVBMVEWAgICLi4uUlJSuV9pqAAABI0lEQVR4nO3QMQEAAAjAILV/aGPwjAjMbZybnTjbP9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b+1cxvnHi9hBAfkOyqGAAAAAElFTkSuQmCC',
	description TEXT,
	rank_id INTEGER REFERENCES rank(rank_id) DEFAULT 0,
	accumulated_point INTEGER DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON users
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('amaylin0@nature.com', 'L2BlPiX', 'Arnoldo', 'Maylin', '05/05/2010', '1317232822', 'http://dummyimage.com/131x192.png/5fa2dd/ffffff', 'http://dummyimage.com/217x246.png/5fa2dd/ffffff', NULL, 6, 5164);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('growcastle1@opensource.org', '95KYe8AEPr7', 'Gertrudis', 'Rowcastle', '07/22/2009', '6819408285', 'http://dummyimage.com/166x173.png/dddddd/000000', 'http://dummyimage.com/245x195.png/dddddd/000000', 'Pathological dislocation of left hip, not elsewhere classified', 4, 2125);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('vmeikle2@buzzfeed.com', 'Bj8tF7', 'Vito', 'Meikle', '07/20/2014', '3579866868', 'http://dummyimage.com/151x180.png/ff4444/ffffff', 'http://dummyimage.com/232x123.png/cc0000/ffffff', 'Open wound of larynx', 3, 4582);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('bpiperley3@infoseek.co.jp', 'BYSC5eXyA', 'Bethena', 'Piperley', '01/25/2012', '7478005811', 'http://dummyimage.com/187x171.png/cc0000/ffffff', 'http://dummyimage.com/209x150.png/ff4444/ffffff', 'Asphyxiation due to being trapped in a car trunk, accidental, sequela', 2, 7865);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('rkenen4@census.gov', 'WRGdAkOC8WN', 'Ronalda', 'Kenen', '09/12/2005', '4966681411', 'http://dummyimage.com/126x213.png/dddddd/000000', 'http://dummyimage.com/233x238.png/dddddd/000000', 'Other osteoporosis with current pathological fracture, unspecified shoulder, subsequent encounter for fracture with delayed healing', 4, 4589);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('mglazzard5@meetup.com', 'lNtPyBq', 'Maddie', 'Glazzard', '12/27/2008', '2968604340', 'http://dummyimage.com/249x223.png/5fa2dd/ffffff', 'http://dummyimage.com/155x151.png/ff4444/ffffff', 'Displaced comminuted fracture of shaft of humerus, right arm', 3, 9491);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('igallard6@liveinternet.ru', 'GqhgLJ5', 'Idalia', 'Gallard', '01/16/2006', '1444726158', 'http://dummyimage.com/111x197.png/ff4444/ffffff', 'http://dummyimage.com/248x185.png/cc0000/ffffff', 'Unspecified car occupant injured in collision with two- or three-wheeled motor vehicle in nontraffic accident, subsequent encounter', 2, 10);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('shixson7@fda.gov', 'fJx96jVFs', 'Sophey', 'Hixson', '05/17/2010', '1694027569', 'http://dummyimage.com/139x116.png/5fa2dd/ffffff', 'http://dummyimage.com/213x117.png/dddddd/000000', 'Displaced Rolando''s fracture, left hand, initial encounter for closed fracture', 8, 3937);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('sbexley8@ycombinator.com', 'lUw3rzDiV', 'Shoshanna', 'Bexley', '11/05/2012', '2541901703', 'http://dummyimage.com/115x111.png/cc0000/ffffff', 'http://dummyimage.com/155x159.png/ff4444/ffffff', 'Open bite of right shoulder, initial encounter', 9, 2162);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('emcjury9@craigslist.org', 'jscImTCUc', 'Enrica', 'McJury', '05/05/2015', '3659068398', 'http://dummyimage.com/176x188.png/cc0000/ffffff', 'http://dummyimage.com/247x183.png/cc0000/ffffff', 'Inflammation (infection) of postprocedural bleb, stage 2', 7, 2843);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('bshrawleya@slideshare.net', 'zMWwKiz', 'Brandy', 'Shrawley', '09/03/2007', '7905280047', 'http://dummyimage.com/101x110.png/ff4444/ffffff', 'http://dummyimage.com/119x185.png/dddddd/000000', 'Poisoning by enzymes, accidental (unintentional), sequela', 8, 2356);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('cparisob@delicious.com', '5tGGCWZiHN', 'Cami', 'Pariso', '08/29/2004', '1765284518', 'http://dummyimage.com/195x111.png/ff4444/ffffff', 'http://dummyimage.com/189x112.png/5fa2dd/ffffff', 'Malignant neoplasm of maxillary sinus', 4, 4297);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('hpiertonc@theatlantic.com', 'uV4oUXe2g0J', 'Herold', 'Pierton', '10/13/2012', '7925114095', 'http://dummyimage.com/196x209.png/dddddd/000000', 'http://dummyimage.com/224x199.png/ff4444/ffffff', 'Underdosing of antiallergic and antiemetic drugs', 7, 994);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('tvigerd@latimes.com', 'QHpxPe6Svo5', 'Tuck', 'Viger', '07/03/2010', '3916663839', 'http://dummyimage.com/215x213.png/ff4444/ffffff', 'http://dummyimage.com/225x227.png/dddddd/000000', 'Burn of other parts of alimentary tract, sequela', 2, 6950);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('cinde@opensource.org', 'grPEgTuI', 'Court', 'Ind', '08/30/2009', '8553596457', 'http://dummyimage.com/209x209.png/cc0000/ffffff', 'http://dummyimage.com/193x217.png/cc0000/ffffff', 'Total perforations of tympanic membrane, left ear', 7, 742);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('jhunnicuttf@ustream.tv', 'xtfDgK1', 'Jedd', 'Hunnicutt', '03/25/2012', '6355420285', 'http://dummyimage.com/173x164.png/dddddd/000000', 'http://dummyimage.com/161x235.png/ff4444/ffffff', 'Acute gastritis with bleeding', 2, 7363);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('ciacomellig@shop-pro.jp', 'bgWyD19FlY', 'Constantine', 'Iacomelli', '04/23/2011', '6383785537', 'http://dummyimage.com/163x177.png/cc0000/ffffff', 'http://dummyimage.com/151x117.png/5fa2dd/ffffff', 'Central perforation of tympanic membrane, right ear', 2, 8454);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('jhaggerwoodh@360.cn', 'YhGB3sVncASc', 'Janette', 'Haggerwood', '07/09/2011', '1229230622', 'http://dummyimage.com/134x211.png/ff4444/ffffff', 'http://dummyimage.com/192x178.png/dddddd/000000', 'Nondisplaced fracture of fourth metatarsal bone, right foot, subsequent encounter for fracture with delayed healing', 1, 3033);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('eashlini@dmoz.org', 'TBq8Mtpl3QW', 'Elsa', 'Ashlin', '09/08/2008', '2458908486', 'http://dummyimage.com/116x190.png/5fa2dd/ffffff', 'http://dummyimage.com/138x131.png/ff4444/ffffff', 'Toxic effect of arsenic and its compounds, assault, subsequent encounter', 7, 9364);
insert into users (mail, password, first_name, last_name, date_of_birth, phone_number, avt, banner, description, rank_id, accumulated_point) values ('abc@gmail.com', 'Abcd1234', 'Tate', 'Smullen', '03/12/2008', '3553500988', 'http://dummyimage.com/147x189.png/ff4444/ffffff', 'http://dummyimage.com/144x188.png/5fa2dd/ffffff', 'Displaced osteochondral fracture of right patella, subsequent encounter for open fracture type I or II with nonunion', 8, 3072);

-- Course
create table course (
	course_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	image TEXT NOT NULL,
	level VARCHAR(10) NOT NULL,
	charges BOOLEAN NOT NULL,
	point_to_unlock INT,
	point_reward INT NOT NULL,
	quantity_rating INT NOT NULL DEFAULT 0,
	avg_rating DECIMAL(3,2) NOT NULL DEFAULT 0,
	participants INT NOT NULL DEFAULT 0,
	price INT,
	discount INT,
	total_chapter INT NOT NULL DEFAULT 0,
	total_lesson INT NOT NULL DEFAULT 0,
	total_video_time INT NOT NULL DEFAULT 0,
	achieves TEXT,
	description TEXT,
	created_by INTEGER REFERENCES users(user_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON course
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Toughjoyfax', 'http://dummyimage.com/357x297.png/dddddd/000000', 'India', false, 9365, 1277, 79, 4.68, 3837, 438727, 43, 7, 94, 15562, 'Dilation of Abdominal Aorta, Bifurcation, Perc Approach', 'Dilation of Abdominal Aorta, Bifurcation, Percutaneous Approach', 6);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Sonsing', 'http://dummyimage.com/366x299.png/dddddd/000000', 'Yankee', false, 9987, 1597, 52, 3.11, 2551, 1362476, 10, 17, 117, 148571, 'Revision of Intraluminal Device in Lymph, Perc Endo Approach', 'Revision of Intraluminal Device in Lymphatic, Percutaneous Endoscopic Approach', 9);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Matsoft', 'http://dummyimage.com/359x328.png/cc0000/ffffff', 'Whiskey', false, 1271, 1365, 810, 3.67, 990, 1108446, 15, 13, 137, 146020, 'Dilate Inf Mesent Art, Bifurc, w 4 Drug-elut, Open', 'Dilation of Inferior Mesenteric Artery, Bifurcation, with Four or More Drug-eluting Intraluminal Devices, Open Approach', 15);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Konklab', 'http://dummyimage.com/283x304.png/5fa2dd/ffffff', 'Victor', true, 5240, 1372, 777, 4.25, 878, 1814315, 26, 11, 138, 79126, 'Excision of Right Pulmonary Artery, Open Approach', 'Excision of Right Pulmonary Artery, Open Approach', 17);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Gembucket', 'http://dummyimage.com/370x314.png/ff4444/ffffff', 'Victor', true, 3094, 1088, 738, 4.29, 345, 1249682, 60, 9, 197, 133349, 'Drainage of R Ext Jugular Vein with Drain Dev, Open Approach', 'Drainage of Right External Jugular Vein with Drainage Device, Open Approach', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Gembucket', 'http://dummyimage.com/328x361.png/5fa2dd/ffffff', 'Quebec', true, 6331, 1565, 79, 4.44, 2444, 941522, 58, 10, 200, 10108, 'Bypass R Int Jugular Vein to Up Vein w Nonaut Sub, Perc Endo', 'Bypass Right Internal Jugular Vein to Upper Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach', 15);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Lotlux', 'http://dummyimage.com/378x351.png/5fa2dd/ffffff', 'Charlie', true, 1090, 1021, 576, 4.04, 1645, 532008, 92, 11, 109, 68025, 'Excision of Right Lower Lobe Bronchus, Via Opening, Diagn', 'Excision of Right Lower Lobe Bronchus, Via Natural or Artificial Opening, Diagnostic', 4);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Sonsing', 'http://dummyimage.com/338x386.png/dddddd/000000', 'Zulu', true, 2532, 1656, 849, 3.7, 2706, 613691, 69, 18, 17, 133381, 'Destruction of Right Atrium, Perc Endo Approach', 'Destruction of Right Atrium, Percutaneous Endoscopic Approach', 14);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('It', 'http://dummyimage.com/387x279.png/5fa2dd/ffffff', 'Bravo', true, 5145, 1075, 35, 4.12, 4967, 338827, 46, 3, 149, 115728, 'LDR Brachytherapy of Pineal Body using Oth Isotope', 'Low Dose Rate (LDR) Brachytherapy of Pineal Body using Other Isotope', 4);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Toughjoyfax', 'http://dummyimage.com/281x254.png/ff4444/ffffff', 'Oscar', true, 1728, 1846, 635, 3.38, 3602, 1222399, 62, 6, 22, 41447, 'Drainage of Sciatic Nerve, Perc Endo Approach, Diagn', 'Drainage of Sciatic Nerve, Percutaneous Endoscopic Approach, Diagnostic', 20);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Voltsillam', 'http://dummyimage.com/359x321.png/5fa2dd/ffffff', 'X-ray', true, 7250, 1867, 352, 4.7, 4640, 1232695, 59, 8, 141, 36498, 'Beam Radiation of Mouth using Neutron Capture', 'Beam Radiation of Mouth using Neutron Capture', 12);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Viva', 'http://dummyimage.com/321x290.png/5fa2dd/ffffff', 'Charlie', true, 6195, 1870, 627, 3.23, 3605, 1692552, 96, 20, 45, 144075, 'Remove Autol Sub from L Toe Phalanx Jt, Perc Endo', 'Removal of Autologous Tissue Substitute from Left Toe Phalangeal Joint, Percutaneous Endoscopic Approach', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Ventosanzap', 'http://dummyimage.com/268x302.png/cc0000/ffffff', 'Uniform', false, 9314, 1946, 361, 3.56, 4120, 1019512, 46, 15, 80, 26781, 'Plain Radiography of L Salivary Gland using L Osm Contrast', 'Plain Radiography of Left Salivary Gland using Low Osmolar Contrast', 11);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Cardguard', 'http://dummyimage.com/313x293.png/ff4444/ffffff', 'Golf', true, 1273, 1446, 627, 4.37, 4926, 289870, 63, 8, 44, 109470, 'Destruction of Left Thyroid Gland Lobe, Open Approach', 'Destruction of Left Thyroid Gland Lobe, Open Approach', 6);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Voltsillam', 'http://dummyimage.com/285x364.png/5fa2dd/ffffff', 'Foxtrot', true, 7213, 1109, 255, 3.52, 926, 652217, 96, 9, 1, 132514, 'Repair Female Reproductive System in POC, Via Opening', 'Repair Female Reproductive System in Products of Conception, Via Natural or Artificial Opening', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Cookley', 'http://dummyimage.com/391x348.png/5fa2dd/ffffff', 'Echo', false, 3110, 1343, 544, 4.16, 231, 1297378, 70, 3, 84, 95855, 'Beam Radiation of Uterus using Heavy Particles', 'Beam Radiation of Uterus using Heavy Particles (Protons,Ions)', 1);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Home Ing', 'http://dummyimage.com/358x341.png/5fa2dd/ffffff', 'Hotel', true, 7341, 1162, 751, 3.9, 3050, 1092888, 46, 20, 36, 9663, 'Transfuse Autol Cord Bld Stem Cell in Periph Vein, Open', 'Transfusion of Autologous Cord Blood Stem Cells into Peripheral Vein, Open Approach', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Flowdesk', 'http://dummyimage.com/261x380.png/ff4444/ffffff', 'Golf', true, 1119, 1206, 551, 4.32, 1624, 1378284, 63, 3, 193, 20649, 'Destruction of Thoracic Vertebral Joint, Perc Approach', 'Destruction of Thoracic Vertebral Joint, Percutaneous Approach', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Wrapsafe', 'http://dummyimage.com/381x313.png/cc0000/ffffff', 'November', false, 8390, 1830, 109, 3.4, 4756, 293144, 76, 4, 131, 138981, 'Restriction of Cystic Duct, Via Opening', 'Restriction of Cystic Duct, Via Natural or Artificial Opening', 18);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Gembucket', 'http://dummyimage.com/269x398.png/dddddd/000000', 'Golf', true, 8738, 1404, 504, 4.51, 2495, 202693, 67, 2, 9, 108866, 'Drainage of Right Colic Artery with Drain Dev, Open Approach', 'Drainage of Right Colic Artery with Drainage Device, Open Approach', 14);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Duobam', 'http://dummyimage.com/315x354.png/5fa2dd/ffffff', 'India', false, 9534, 1912, 755, 4.88, 1546, 475174, 95, 5, 130, 35680, 'Bypass Right Renal Vein to Lower Vein, Open Approach', 'Bypass Right Renal Vein to Lower Vein, Open Approach', 12);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Zontrax', 'http://dummyimage.com/396x389.png/5fa2dd/ffffff', 'India', false, 9406, 1359, 246, 3.21, 4608, 1967492, 10, 8, 170, 94187, 'Drain of R Humeral Shaft with Drain Dev, Perc Endo Approach', 'Drainage of Right Humeral Shaft with Drainage Device, Percutaneous Endoscopic Approach', 8);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Kanlam', 'http://dummyimage.com/261x263.png/ff4444/ffffff', 'November', false, 2587, 1171, 219, 3.75, 2782, 994163, 21, 18, 96, 24649, 'Drainage of Sacral Nerve, Percutaneous Approach, Diagnostic', 'Drainage of Sacral Nerve, Percutaneous Approach, Diagnostic', 4);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Toughjoyfax', 'http://dummyimage.com/319x260.png/dddddd/000000', 'Juliett', false, 5567, 1069, 563, 3.06, 597, 835315, 4, 19, 37, 96591, 'Revision of Infusion Device in Abdominal Wall, Open Approach', 'Revision of Infusion Device in Abdominal Wall, Open Approach', 10);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Opela', 'http://dummyimage.com/311x310.png/cc0000/ffffff', 'Oscar', true, 2785, 1424, 263, 4.95, 4627, 1071143, 2, 12, 105, 46605, 'Excision of Hymen, Via Natural or Artificial Opening, Diagn', 'Excision of Hymen, Via Natural or Artificial Opening, Diagnostic', 3);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Voltsillam', 'http://dummyimage.com/384x290.png/ff4444/ffffff', 'X-ray', false, 2072, 1633, 618, 4.02, 2942, 1101596, 74, 20, 70, 16833, 'Removal of Extralum Dev from Up Vein, Perc Endo Approach', 'Removal of Extraluminal Device from Upper Vein, Percutaneous Endoscopic Approach', 12);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Zathin', 'http://dummyimage.com/324x339.png/cc0000/ffffff', 'Kilo', true, 7114, 1285, 920, 4.43, 4973, 950224, 45, 20, 134, 100252, 'Bypass Sup Vena Cava to L Pulm Vn w Synth Sub, Perc Endo', 'Bypass Superior Vena Cava to Left Pulmonary Vein with Synthetic Substitute, Percutaneous Endoscopic Approach', 6);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Cardify', 'http://dummyimage.com/398x399.png/ff4444/ffffff', 'November', true, 3514, 1599, 858, 3.12, 742, 1804107, 73, 13, 81, 116969, 'Extirpate of Matter from R Post Tib Art, Perc Endo Approach', 'Extirpation of Matter from Right Posterior Tibial Artery, Percutaneous Endoscopic Approach', 19);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Matsoft', 'http://dummyimage.com/294x278.png/ff4444/ffffff', 'Victor', true, 4348, 1576, 424, 3.9, 1134, 921195, 61, 19, 98, 10801, 'Repair Right Foot Bursa and Ligament, Open Approach', 'Repair Right Foot Bursa and Ligament, Open Approach', 12);
insert into course (name, image, level, charges, point_to_unlock, point_reward, quantity_rating, avg_rating, participants, price, discount, total_chapter, total_lesson, total_video_time, achieves, description, created_by) values ('Bamity', 'http://dummyimage.com/267x327.png/ff4444/ffffff', 'Lima', true, 7544, 1215, 591, 3.27, 187, 227343, 41, 14, 1, 59668, 'Change Brace on Neck', 'Change Brace on Neck', 20);

-- CHAPTER
create table chapter (
	chapter_id SERIAL PRIMARY KEY,
	course_id INT NOT NULL REFERENCES course(course_id),
	name VARCHAR(150) NOT NULL,
	total_lesson SMALLINT DEFAULT 0,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON chapter
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into chapter (course_id, name, total_lesson) values (11, 'Fintone', 2);
insert into chapter (course_id, name, total_lesson) values (9, 'Greenlam', 157);
insert into chapter (course_id, name, total_lesson) values (19, 'Sonair', 180);
insert into chapter (course_id, name, total_lesson) values (1, 'Holdlamis', 189);
insert into chapter (course_id, name, total_lesson) values (12, 'Redhold', 82);
insert into chapter (course_id, name, total_lesson) values (26, 'Sonsing', 8);
insert into chapter (course_id, name, total_lesson) values (28, 'Holdlamis', 9);
insert into chapter (course_id, name, total_lesson) values (5, 'Ventosanzap', 40);
insert into chapter (course_id, name, total_lesson) values (24, 'Job', 118);
insert into chapter (course_id, name, total_lesson) values (24, 'Tresom', 33);
insert into chapter (course_id, name, total_lesson) values (22, 'Fixflex', 80);
insert into chapter (course_id, name, total_lesson) values (2, 'Zaam-Dox', 172);
insert into chapter (course_id, name, total_lesson) values (18, 'Andalax', 192);
insert into chapter (course_id, name, total_lesson) values (1, 'Stim', 97);
insert into chapter (course_id, name, total_lesson) values (3, 'Cookley', 126);
insert into chapter (course_id, name, total_lesson) values (12, 'Duobam', 96);
insert into chapter (course_id, name, total_lesson) values (11, 'Gembucket', 117);
insert into chapter (course_id, name, total_lesson) values (29, 'Trippledex', 115);
insert into chapter (course_id, name, total_lesson) values (18, 'Overhold', 126);
insert into chapter (course_id, name, total_lesson) values (12, 'Solarbreeze', 65);
insert into chapter (course_id, name, total_lesson) values (2, 'Sub-Ex', 35);
insert into chapter (course_id, name, total_lesson) values (6, 'Zontrax', 193);
insert into chapter (course_id, name, total_lesson) values (17, 'Transcof', 194);
insert into chapter (course_id, name, total_lesson) values (21, 'Lotlux', 43);
insert into chapter (course_id, name, total_lesson) values (8, 'Ronstring', 105);
insert into chapter (course_id, name, total_lesson) values (27, 'Gembucket', 141);
insert into chapter (course_id, name, total_lesson) values (16, 'Viva', 59);
insert into chapter (course_id, name, total_lesson) values (13, 'Kanlam', 118);
insert into chapter (course_id, name, total_lesson) values (30, 'Zontrax', 105);
insert into chapter (course_id, name, total_lesson) values (21, 'Cookley', 28);
insert into chapter (course_id, name, total_lesson) values (28, 'Fix San', 79);
insert into chapter (course_id, name, total_lesson) values (5, 'Voltsillam', 115);
insert into chapter (course_id, name, total_lesson) values (28, 'Bytecard', 154);
insert into chapter (course_id, name, total_lesson) values (17, 'Lotlux', 89);
insert into chapter (course_id, name, total_lesson) values (3, 'Zontrax', 68);
insert into chapter (course_id, name, total_lesson) values (21, 'Temp', 191);
insert into chapter (course_id, name, total_lesson) values (16, 'Fix San', 108);
insert into chapter (course_id, name, total_lesson) values (18, 'Alphazap', 98);
insert into chapter (course_id, name, total_lesson) values (12, 'Zoolab', 190);
insert into chapter (course_id, name, total_lesson) values (15, 'Temp', 193);
insert into chapter (course_id, name, total_lesson) values (1, 'Tresom', 75);
insert into chapter (course_id, name, total_lesson) values (7, 'Bitwolf', 172);
insert into chapter (course_id, name, total_lesson) values (20, 'Treeflex', 59);
insert into chapter (course_id, name, total_lesson) values (28, 'Zamit', 51);
insert into chapter (course_id, name, total_lesson) values (14, 'Holdlamis', 40);
insert into chapter (course_id, name, total_lesson) values (20, 'Span', 127);
insert into chapter (course_id, name, total_lesson) values (17, 'Cookley', 131);
insert into chapter (course_id, name, total_lesson) values (29, 'Solarbreeze', 52);
insert into chapter (course_id, name, total_lesson) values (11, 'Wrapsafe', 104);
insert into chapter (course_id, name, total_lesson) values (6, 'Mat Lam Tam', 168);
insert into chapter (course_id, name, total_lesson) values (27, 'Greenlam', 109);
insert into chapter (course_id, name, total_lesson) values (15, 'Andalax', 4);
insert into chapter (course_id, name, total_lesson) values (10, 'Aerified', 58);
insert into chapter (course_id, name, total_lesson) values (13, 'Flowdesk', 82);
insert into chapter (course_id, name, total_lesson) values (18, 'Tampflex', 89);
insert into chapter (course_id, name, total_lesson) values (19, 'Sonair', 143);
insert into chapter (course_id, name, total_lesson) values (4, 'Alpha', 13);
insert into chapter (course_id, name, total_lesson) values (14, 'It', 176);
insert into chapter (course_id, name, total_lesson) values (10, 'Zontrax', 55);
insert into chapter (course_id, name, total_lesson) values (15, 'Zathin', 10);
insert into chapter (course_id, name, total_lesson) values (6, 'Tresom', 18);
insert into chapter (course_id, name, total_lesson) values (17, 'Overhold', 70);
insert into chapter (course_id, name, total_lesson) values (30, 'Flexidy', 41);
insert into chapter (course_id, name, total_lesson) values (10, 'Alpha', 89);
insert into chapter (course_id, name, total_lesson) values (3, 'Biodex', 199);
insert into chapter (course_id, name, total_lesson) values (25, 'Kanlam', 57);
insert into chapter (course_id, name, total_lesson) values (15, 'Wrapsafe', 170);
insert into chapter (course_id, name, total_lesson) values (30, 'Cardify', 190);
insert into chapter (course_id, name, total_lesson) values (5, 'Viva', 105);
insert into chapter (course_id, name, total_lesson) values (2, 'Namfix', 99);
insert into chapter (course_id, name, total_lesson) values (7, 'Span', 18);
insert into chapter (course_id, name, total_lesson) values (11, 'Bamity', 11);
insert into chapter (course_id, name, total_lesson) values (4, 'Bitwolf', 166);
insert into chapter (course_id, name, total_lesson) values (2, 'Fintone', 67);
insert into chapter (course_id, name, total_lesson) values (1, 'Latlux', 161);
insert into chapter (course_id, name, total_lesson) values (10, 'Transcof', 28);
insert into chapter (course_id, name, total_lesson) values (18, 'Job', 29);
insert into chapter (course_id, name, total_lesson) values (3, 'Subin', 56);
insert into chapter (course_id, name, total_lesson) values (3, 'Konklux', 107);
insert into chapter (course_id, name, total_lesson) values (19, 'Andalax', 61);
insert into chapter (course_id, name, total_lesson) values (18, 'Greenlam', 66);
insert into chapter (course_id, name, total_lesson) values (14, 'Sonair', 118);
insert into chapter (course_id, name, total_lesson) values (5, 'Matsoft', 182);
insert into chapter (course_id, name, total_lesson) values (11, 'Stronghold', 12);
insert into chapter (course_id, name, total_lesson) values (27, 'Sub-Ex', 39);
insert into chapter (course_id, name, total_lesson) values (10, 'Vagram', 187);
insert into chapter (course_id, name, total_lesson) values (15, 'Cardguard', 181);
insert into chapter (course_id, name, total_lesson) values (15, 'Cardguard', 192);
insert into chapter (course_id, name, total_lesson) values (26, 'Pannier', 130);
insert into chapter (course_id, name, total_lesson) values (18, 'Zontrax', 114);
insert into chapter (course_id, name, total_lesson) values (1, 'Fix San', 136);
insert into chapter (course_id, name, total_lesson) values (25, 'Aerified', 20);
insert into chapter (course_id, name, total_lesson) values (15, 'Trippledex', 184);
insert into chapter (course_id, name, total_lesson) values (2, 'Wrapsafe', 87);
insert into chapter (course_id, name, total_lesson) values (16, 'Fix San', 132);
insert into chapter (course_id, name, total_lesson) values (19, 'Zontrax', 1);
insert into chapter (course_id, name, total_lesson) values (6, 'Temp', 36);
insert into chapter (course_id, name, total_lesson) values (21, 'Zaam-Dox', 10);
insert into chapter (course_id, name, total_lesson) values (28, 'Veribet', 99);
insert into chapter (course_id, name, total_lesson) values (25, 'It', 141);

-- UNIT
create table unit (
	unit_id SERIAL PRIMARY KEY,
	chapter_id INTEGER NOT NULL REFERENCES chapter(chapter_id),
	name VARCHAR(150) NOT NULL,
	total_lesson SMALLINT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON unit
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into unit (chapter_id, name, total_lesson) values (11, 'Sonair', null);
insert into unit (chapter_id, name, total_lesson) values (49, 'Bytecard', null);
insert into unit (chapter_id, name, total_lesson) values (65, 'Bytecard', null);
insert into unit (chapter_id, name, total_lesson) values (47, 'Y-find', null);
insert into unit (chapter_id, name, total_lesson) values (95, 'Fixflex', null);
insert into unit (chapter_id, name, total_lesson) values (5, 'Wrapsafe', null);
insert into unit (chapter_id, name, total_lesson) values (88, 'Span', null);
insert into unit (chapter_id, name, total_lesson) values (36, 'Latlux', 6);
insert into unit (chapter_id, name, total_lesson) values (36, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (35, 'Prodder', null);
insert into unit (chapter_id, name, total_lesson) values (86, 'Bytecard', null);
insert into unit (chapter_id, name, total_lesson) values (65, 'Tampflex', null);
insert into unit (chapter_id, name, total_lesson) values (53, 'Overhold', null);
insert into unit (chapter_id, name, total_lesson) values (40, 'Trippledex', null);
insert into unit (chapter_id, name, total_lesson) values (40, 'Opela', null);
insert into unit (chapter_id, name, total_lesson) values (35, 'Bitwolf', null);
insert into unit (chapter_id, name, total_lesson) values (5, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (11, 'It', null);
insert into unit (chapter_id, name, total_lesson) values (35, 'Flexidy', null);
insert into unit (chapter_id, name, total_lesson) values (49, 'Andalax', 2);
insert into unit (chapter_id, name, total_lesson) values (11, 'Wrapsafe', null);
insert into unit (chapter_id, name, total_lesson) values (71, 'Bytecard', null);
insert into unit (chapter_id, name, total_lesson) values (67, 'Redhold', 10);
insert into unit (chapter_id, name, total_lesson) values (84, 'Prodder', 4);
insert into unit (chapter_id, name, total_lesson) values (91, 'Stringtough', null);
insert into unit (chapter_id, name, total_lesson) values (85, 'Fintone', null);
insert into unit (chapter_id, name, total_lesson) values (23, 'Konklux', null);
insert into unit (chapter_id, name, total_lesson) values (6, 'Keylex', null);
insert into unit (chapter_id, name, total_lesson) values (47, 'Overhold', null);
insert into unit (chapter_id, name, total_lesson) values (9, 'Tresom', null);
insert into unit (chapter_id, name, total_lesson) values (73, 'Trippledex', null);
insert into unit (chapter_id, name, total_lesson) values (10, 'Flexidy', null);
insert into unit (chapter_id, name, total_lesson) values (98, 'Transcof', null);
insert into unit (chapter_id, name, total_lesson) values (96, 'Bitwolf', null);
insert into unit (chapter_id, name, total_lesson) values (20, 'Fixflex', 5);
insert into unit (chapter_id, name, total_lesson) values (2, 'Temp', null);
insert into unit (chapter_id, name, total_lesson) values (36, 'Sub-Ex', null);
insert into unit (chapter_id, name, total_lesson) values (66, 'Mat Lam Tam', null);
insert into unit (chapter_id, name, total_lesson) values (57, 'Redhold', null);
insert into unit (chapter_id, name, total_lesson) values (77, 'Bigtax', null);
insert into unit (chapter_id, name, total_lesson) values (11, 'Zathin', null);
insert into unit (chapter_id, name, total_lesson) values (97, 'Solarbreeze', null);
insert into unit (chapter_id, name, total_lesson) values (96, 'Cardguard', null);
insert into unit (chapter_id, name, total_lesson) values (34, 'Sonair', null);
insert into unit (chapter_id, name, total_lesson) values (54, 'Andalax', null);
insert into unit (chapter_id, name, total_lesson) values (89, 'Lotstring', null);
insert into unit (chapter_id, name, total_lesson) values (2, 'Trippledex', null);
insert into unit (chapter_id, name, total_lesson) values (57, 'Redhold', null);
insert into unit (chapter_id, name, total_lesson) values (95, 'Alphazap', null);
insert into unit (chapter_id, name, total_lesson) values (41, 'Otcom', null);
insert into unit (chapter_id, name, total_lesson) values (39, 'Keylex', null);
insert into unit (chapter_id, name, total_lesson) values (55, 'Gembucket', null);
insert into unit (chapter_id, name, total_lesson) values (8, 'Tres-Zap', null);
insert into unit (chapter_id, name, total_lesson) values (37, 'Tempsoft', null);
insert into unit (chapter_id, name, total_lesson) values (87, 'Stronghold', 2);
insert into unit (chapter_id, name, total_lesson) values (80, 'Lotlux', null);
insert into unit (chapter_id, name, total_lesson) values (51, 'Vagram', null);
insert into unit (chapter_id, name, total_lesson) values (34, 'Kanlam', null);
insert into unit (chapter_id, name, total_lesson) values (74, 'Namfix', null);
insert into unit (chapter_id, name, total_lesson) values (56, 'Lotstring', null);
insert into unit (chapter_id, name, total_lesson) values (81, 'Zoolab', null);
insert into unit (chapter_id, name, total_lesson) values (20, 'Duobam', null);
insert into unit (chapter_id, name, total_lesson) values (27, 'Stim', null);
insert into unit (chapter_id, name, total_lesson) values (68, 'Latlux', null);
insert into unit (chapter_id, name, total_lesson) values (31, 'Zaam-Dox', null);
insert into unit (chapter_id, name, total_lesson) values (5, 'Zontrax', null);
insert into unit (chapter_id, name, total_lesson) values (8, 'Home Ing', null);
insert into unit (chapter_id, name, total_lesson) values (59, 'Overhold', null);
insert into unit (chapter_id, name, total_lesson) values (73, 'Zamit', null);
insert into unit (chapter_id, name, total_lesson) values (25, 'It', null);
insert into unit (chapter_id, name, total_lesson) values (55, 'Voltsillam', null);
insert into unit (chapter_id, name, total_lesson) values (31, 'Rank', null);
insert into unit (chapter_id, name, total_lesson) values (62, 'Andalax', null);
insert into unit (chapter_id, name, total_lesson) values (45, 'Zoolab', null);
insert into unit (chapter_id, name, total_lesson) values (20, 'Domainer', null);
insert into unit (chapter_id, name, total_lesson) values (29, 'Transcof', null);
insert into unit (chapter_id, name, total_lesson) values (87, 'Duobam', 6);
insert into unit (chapter_id, name, total_lesson) values (2, 'Duobam', null);
insert into unit (chapter_id, name, total_lesson) values (91, 'Fixflex', null);
insert into unit (chapter_id, name, total_lesson) values (40, 'Job', null);
insert into unit (chapter_id, name, total_lesson) values (27, 'Temp', 4);
insert into unit (chapter_id, name, total_lesson) values (64, 'Span', null);
insert into unit (chapter_id, name, total_lesson) values (99, 'Gembucket', null);
insert into unit (chapter_id, name, total_lesson) values (36, 'Rank', null);
insert into unit (chapter_id, name, total_lesson) values (90, 'Vagram', null);
insert into unit (chapter_id, name, total_lesson) values (23, 'Stronghold', null);
insert into unit (chapter_id, name, total_lesson) values (47, 'Tempsoft', null);
insert into unit (chapter_id, name, total_lesson) values (99, 'Tres-Zap', null);
insert into unit (chapter_id, name, total_lesson) values (42, 'Kanlam', null);
insert into unit (chapter_id, name, total_lesson) values (74, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (88, 'Zoolab', null);
insert into unit (chapter_id, name, total_lesson) values (3, 'Cardguard', 4);
insert into unit (chapter_id, name, total_lesson) values (63, 'Bamity', 4);
insert into unit (chapter_id, name, total_lesson) values (68, 'Y-find', 4);
insert into unit (chapter_id, name, total_lesson) values (1, 'Mat Lam Tam', 8);
insert into unit (chapter_id, name, total_lesson) values (78, 'Stringtough', null);
insert into unit (chapter_id, name, total_lesson) values (54, 'Viva', null);
insert into unit (chapter_id, name, total_lesson) values (43, 'Prodder', null);
insert into unit (chapter_id, name, total_lesson) values (29, 'Subin', null);
insert into unit (chapter_id, name, total_lesson) values (86, 'Lotlux', null);
insert into unit (chapter_id, name, total_lesson) values (80, 'Tres-Zap', null);
insert into unit (chapter_id, name, total_lesson) values (67, 'Hatity', null);
insert into unit (chapter_id, name, total_lesson) values (26, 'It', null);
insert into unit (chapter_id, name, total_lesson) values (100, 'Transcof', null);
insert into unit (chapter_id, name, total_lesson) values (98, 'Stronghold', null);
insert into unit (chapter_id, name, total_lesson) values (99, 'Tempsoft', 8);
insert into unit (chapter_id, name, total_lesson) values (8, 'Zathin', null);
insert into unit (chapter_id, name, total_lesson) values (56, 'Quo Lux', null);
insert into unit (chapter_id, name, total_lesson) values (88, 'Asoka', null);
insert into unit (chapter_id, name, total_lesson) values (38, 'Quo Lux', 5);
insert into unit (chapter_id, name, total_lesson) values (76, 'Kanlam', null);
insert into unit (chapter_id, name, total_lesson) values (84, 'Daltfresh', null);
insert into unit (chapter_id, name, total_lesson) values (9, 'Fixflex', null);
insert into unit (chapter_id, name, total_lesson) values (29, 'Holdlamis', null);
insert into unit (chapter_id, name, total_lesson) values (29, 'Duobam', null);
insert into unit (chapter_id, name, total_lesson) values (6, 'Rank', null);
insert into unit (chapter_id, name, total_lesson) values (82, 'Tresom', null);
insert into unit (chapter_id, name, total_lesson) values (87, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (3, 'Tin', null);
insert into unit (chapter_id, name, total_lesson) values (65, 'Namfix', 4);
insert into unit (chapter_id, name, total_lesson) values (90, 'Holdlamis', null);
insert into unit (chapter_id, name, total_lesson) values (70, 'Y-Solowarm', 5);
insert into unit (chapter_id, name, total_lesson) values (78, 'Treeflex', 3);
insert into unit (chapter_id, name, total_lesson) values (24, 'Vagram', null);
insert into unit (chapter_id, name, total_lesson) values (72, 'Temp', null);
insert into unit (chapter_id, name, total_lesson) values (66, 'Lotlux', null);
insert into unit (chapter_id, name, total_lesson) values (77, 'Span', null);
insert into unit (chapter_id, name, total_lesson) values (47, 'Tampflex', null);
insert into unit (chapter_id, name, total_lesson) values (72, 'Zamit', null);
insert into unit (chapter_id, name, total_lesson) values (23, 'Fix San', 9);
insert into unit (chapter_id, name, total_lesson) values (53, 'Tin', null);
insert into unit (chapter_id, name, total_lesson) values (97, 'Domainer', null);
insert into unit (chapter_id, name, total_lesson) values (73, 'Ventosanzap', null);
insert into unit (chapter_id, name, total_lesson) values (61, 'Subin', 4);
insert into unit (chapter_id, name, total_lesson) values (21, 'Bamity', null);
insert into unit (chapter_id, name, total_lesson) values (54, 'Flowdesk', null);
insert into unit (chapter_id, name, total_lesson) values (15, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (70, 'Kanlam', null);
insert into unit (chapter_id, name, total_lesson) values (74, 'Viva', null);
insert into unit (chapter_id, name, total_lesson) values (100, 'Alphazap', null);
insert into unit (chapter_id, name, total_lesson) values (55, 'Namfix', null);
insert into unit (chapter_id, name, total_lesson) values (29, 'Daltfresh', null);
insert into unit (chapter_id, name, total_lesson) values (59, 'Opela', null);
insert into unit (chapter_id, name, total_lesson) values (97, 'Bitwolf', null);
insert into unit (chapter_id, name, total_lesson) values (17, 'Fintone', null);
insert into unit (chapter_id, name, total_lesson) values (41, 'Zontrax', null);
insert into unit (chapter_id, name, total_lesson) values (50, 'Zaam-Dox', null);
insert into unit (chapter_id, name, total_lesson) values (25, 'Temp', null);
insert into unit (chapter_id, name, total_lesson) values (36, 'Biodex', null);
insert into unit (chapter_id, name, total_lesson) values (28, 'Fixflex', null);
insert into unit (chapter_id, name, total_lesson) values (7, 'Stringtough', 9);
insert into unit (chapter_id, name, total_lesson) values (66, 'Tampflex', null);
insert into unit (chapter_id, name, total_lesson) values (19, 'Ronstring', null);
insert into unit (chapter_id, name, total_lesson) values (15, 'Tempsoft', 4);
insert into unit (chapter_id, name, total_lesson) values (21, 'Toughjoyfax', null);
insert into unit (chapter_id, name, total_lesson) values (81, 'Cardguard', null);
insert into unit (chapter_id, name, total_lesson) values (61, 'Bitchip', null);
insert into unit (chapter_id, name, total_lesson) values (32, 'Redhold', null);
insert into unit (chapter_id, name, total_lesson) values (45, 'Sonair', null);
insert into unit (chapter_id, name, total_lesson) values (54, 'Alphazap', null);
insert into unit (chapter_id, name, total_lesson) values (23, 'Cardguard', null);
insert into unit (chapter_id, name, total_lesson) values (91, 'Mat Lam Tam', 1);
insert into unit (chapter_id, name, total_lesson) values (48, 'Subin', null);
insert into unit (chapter_id, name, total_lesson) values (41, 'Fintone', null);
insert into unit (chapter_id, name, total_lesson) values (58, 'Bigtax', null);
insert into unit (chapter_id, name, total_lesson) values (78, 'Cookley', null);
insert into unit (chapter_id, name, total_lesson) values (36, 'Namfix', null);
insert into unit (chapter_id, name, total_lesson) values (65, 'Flexidy', 5);
insert into unit (chapter_id, name, total_lesson) values (58, 'Matsoft', null);
insert into unit (chapter_id, name, total_lesson) values (55, 'Regrant', null);
insert into unit (chapter_id, name, total_lesson) values (13, 'Regrant', null);
insert into unit (chapter_id, name, total_lesson) values (77, 'Ventosanzap', null);
insert into unit (chapter_id, name, total_lesson) values (38, 'Holdlamis', 1);
insert into unit (chapter_id, name, total_lesson) values (25, 'Domainer', null);
insert into unit (chapter_id, name, total_lesson) values (91, 'Redhold', 7);
insert into unit (chapter_id, name, total_lesson) values (19, 'Overhold', null);
insert into unit (chapter_id, name, total_lesson) values (17, 'Regrant', null);
insert into unit (chapter_id, name, total_lesson) values (63, 'Vagram', 7);
insert into unit (chapter_id, name, total_lesson) values (67, 'Rank', null);
insert into unit (chapter_id, name, total_lesson) values (97, 'Alphazap', null);
insert into unit (chapter_id, name, total_lesson) values (92, 'Zaam-Dox', null);
insert into unit (chapter_id, name, total_lesson) values (38, 'Bitwolf', null);
insert into unit (chapter_id, name, total_lesson) values (77, 'Voltsillam', null);
insert into unit (chapter_id, name, total_lesson) values (64, 'Biodex', 5);
insert into unit (chapter_id, name, total_lesson) values (78, 'Biodex', null);
insert into unit (chapter_id, name, total_lesson) values (17, 'Solarbreeze', null);
insert into unit (chapter_id, name, total_lesson) values (9, 'Domainer', null);
insert into unit (chapter_id, name, total_lesson) values (27, 'Stronghold', null);
insert into unit (chapter_id, name, total_lesson) values (82, 'Voltsillam', null);
insert into unit (chapter_id, name, total_lesson) values (34, 'Zathin', null);
insert into unit (chapter_id, name, total_lesson) values (87, 'Asoka', null);
insert into unit (chapter_id, name, total_lesson) values (72, 'Konklux', null);
insert into unit (chapter_id, name, total_lesson) values (30, 'Biodex', null);
insert into unit (chapter_id, name, total_lesson) values (72, 'Zathin', null);
insert into unit (chapter_id, name, total_lesson) values (51, 'Sonair', null);
insert into unit (chapter_id, name, total_lesson) values (76, 'Duobam', null);
insert into unit (chapter_id, name, total_lesson) values (78, 'Konklab', 4);
insert into unit (chapter_id, name, total_lesson) values (7, 'Wrapsafe', null);
insert into unit (chapter_id, name, total_lesson) values (79, 'Regrant', null);
insert into unit (chapter_id, name, total_lesson) values (8, 'Cookley', null);

-- LESSON
create table lesson (
	lesson_id SERIAL PRIMARY KEY,
	unit_id INTEGER NOT NULL REFERENCES unit(unit_id),
	name TEXT NOT NULL,
	type SMALLINT NOT NULL,
	video_url TEXT,
	flashcard_set_id INTEGER,
	text TEXT,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON lesson
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (42, 'Flexidy', 3, 'http://dummyimage.com/146x100.png/ff4444/ffffff', 13, 'Sprain of tarsometatarsal ligament of left foot, initial encounter', 'Parent-adopted child conflict');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (183, 'Job', 3, 'http://dummyimage.com/131x100.png/cc0000/ffffff', 15, 'Driver of snowmobile injured in traffic accident', 'Other specified injury of other blood vessels at wrist and hand level of unspecified arm, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (34, 'Stronghold', 3, 'http://dummyimage.com/120x100.png/cc0000/ffffff', 1, 'Acute perichondritis of external ear', 'Poisoning by other viral vaccines, undetermined, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (45, 'Holdlamis', 3, 'http://dummyimage.com/150x100.png/ff4444/ffffff', 11, 'Displaced fracture of trapezoid [smaller multangular], unspecified wrist, initial encounter for closed fracture', 'Unspecified fracture of third thoracic vertebra, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (60, 'Andalax', 2, 'http://dummyimage.com/179x100.png/ff4444/ffffff', 7, 'Anaphylactic reaction due to vaccination', 'Contusion of left index finger with damage to nail');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (168, 'Gembucket', 2, 'http://dummyimage.com/222x100.png/cc0000/ffffff', 18, 'Nondisplaced associated transverse-posterior fracture of left acetabulum, subsequent encounter for fracture with nonunion', 'Other forms of systemic sclerosis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (170, 'Sonair', 1, 'http://dummyimage.com/141x100.png/ff4444/ffffff', 12, 'Sprain of chondrosternal joint', 'Other fracture of fifth metacarpal bone, right hand, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (200, 'Wrapsafe', 2, 'http://dummyimage.com/205x100.png/cc0000/ffffff', 15, 'Nondisplaced fracture of hook process of hamate [unciform] bone, left wrist, initial encounter for open fracture', 'Flail joint, left ankle and foot');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (160, 'Trippledex', 1, 'http://dummyimage.com/220x100.png/ff4444/ffffff', 8, 'Nondisplaced fracture of middle third of navicular [scaphoid] bone of right wrist, subsequent encounter for fracture with malunion', 'Exudative age-related macular degeneration, right eye, stage unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (76, 'Fix San', 2, 'http://dummyimage.com/164x100.png/ff4444/ffffff', 2, 'Displaced fracture of lesser trochanter of left femur, sequela', 'Unspecified injury of muscle(s) and tendon(s) of the rotator cuff of unspecified shoulder');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (17, 'Zamit', 1, 'http://dummyimage.com/218x100.png/cc0000/ffffff', 3, 'Salter-Harris Type II physeal fracture of lower end of unspecified tibia, initial encounter for closed fracture', 'Military operations involving explosion of improvised explosive device [IED], military personnel');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (165, 'Sub-Ex', 1, 'http://dummyimage.com/133x100.png/ff4444/ffffff', 9, 'Poisoning by tricyclic antidepressants, accidental (unintentional), sequela', 'Complete lesion at C2 level of cervical spinal cord, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (166, 'Matsoft', 3, 'http://dummyimage.com/138x100.png/5fa2dd/ffffff', 18, 'War operations involving friendly fire, sequela', 'Nondisplaced fracture of first metatarsal bone, right foot, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (42, 'Viva', 2, 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', 14, 'Laceration of other blood vessels at lower leg level', 'Salter-Harris Type I physeal fracture of phalanx of unspecified toe, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (178, 'Asoka', 3, 'http://dummyimage.com/142x100.png/dddddd/000000', 14, 'External constriction of right back wall of thorax', 'Exposure to sudden change in air pressure in aircraft during descent, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (115, 'Transcof', 2, 'http://dummyimage.com/232x100.png/ff4444/ffffff', 5, 'Laceration with foreign body of right great toe without damage to nail, sequela', 'Salter-Harris Type II physeal fracture of unspecified metatarsal');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (138, 'Regrant', 1, 'http://dummyimage.com/128x100.png/ff4444/ffffff', 18, 'Puncture wound with foreign body of right middle finger with damage to nail, subsequent encounter', 'Poisoning by antiasthmatics, intentional self-harm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (115, 'Konklab', 3, 'http://dummyimage.com/231x100.png/5fa2dd/ffffff', 12, 'Drug-induced chronic gout, unspecified shoulder', 'Nondisplaced fracture of left tibial tuberosity, subsequent encounter for open fracture type I or II with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (45, 'Mat Lam Tam', 3, 'http://dummyimage.com/228x100.png/dddddd/000000', 10, 'Displaced fracture of greater tuberosity of unspecified humerus, sequela', 'Follicular lymphoma grade IIIa, intrathoracic lymph nodes');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (123, 'Toughjoyfax', 1, 'http://dummyimage.com/172x100.png/cc0000/ffffff', 18, 'Pressure ulcer of unspecified site, stage 2', 'Displaced comminuted fracture of shaft of ulna, right arm, subsequent encounter for closed fracture with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (5, 'Zontrax', 2, 'http://dummyimage.com/177x100.png/cc0000/ffffff', 7, 'Nondisplaced segmental fracture of shaft of right fibula, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Other fracture of right patella, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (150, 'Redhold', 2, 'http://dummyimage.com/197x100.png/dddddd/000000', 16, 'Motorcycle rider (driver) (passenger) injured in unspecified nontraffic accident, sequela', 'Unspecified subluxation of left middle finger');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (22, 'Trippledex', 2, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 10, 'Salter-Harris Type IV physeal fracture of upper end of radius', 'Traumatic hemorrhage of cerebrum, unspecified, without loss of consciousness, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (5, 'Y-Solowarm', 1, 'http://dummyimage.com/166x100.png/cc0000/ffffff', 2, 'Minor laceration of celiac artery', 'Congenital stenosis and stricture of esophagus');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (123, 'Trippledex', 3, 'http://dummyimage.com/214x100.png/dddddd/000000', 8, 'Unspecified fracture of unspecified toe(s), subsequent encounter for fracture with malunion', 'Epileptic spasms, intractable, with status epilepticus');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (69, 'Tresom', 3, 'http://dummyimage.com/149x100.png/dddddd/000000', 16, 'Laceration without foreign body of right upper arm', 'Nondisplaced spiral fracture of shaft of unspecified femur, subsequent encounter for open fracture type I or II with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (7, 'Holdlamis', 1, 'http://dummyimage.com/146x100.png/dddddd/000000', 9, 'Skin transplant status', 'Nondisplaced comminuted fracture of shaft of left fibula, subsequent encounter for open fracture type I or II with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (76, 'Flexidy', 2, 'http://dummyimage.com/122x100.png/5fa2dd/ffffff', 12, 'Sprain of unspecified acromioclavicular joint', 'Underdosing of unspecified systemic anti-infectives and antiparasitics');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (94, 'Span', 2, 'http://dummyimage.com/143x100.png/cc0000/ffffff', 9, 'Displaced fracture of capitate [os magnum] bone, right wrist, subsequent encounter for fracture with nonunion', 'Postprocedural seroma of skin and subcutaneous tissue following a dermatologic procedure');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (55, 'Voltsillam', 3, 'http://dummyimage.com/144x100.png/5fa2dd/ffffff', 1, 'Drowning and submersion due to other accident to sailboat', 'Other specified disorders of nose and nasal sinuses');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (153, 'Veribet', 3, 'http://dummyimage.com/179x100.png/dddddd/000000', 2, 'Nondisplaced fracture of proximal phalanx of left great toe, sequela', 'Edema, not elsewhere classified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (43, 'Zaam-Dox', 1, 'http://dummyimage.com/215x100.png/cc0000/ffffff', 14, 'Bitten by other mammals', 'Incarcerated fracture (avulsion) of medial epicondyle of unspecified humerus, subsequent encounter for fracture with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (89, 'Bitchip', 1, 'http://dummyimage.com/157x100.png/5fa2dd/ffffff', 13, 'Displaced fracture of neck of fourth metacarpal bone, right hand, subsequent encounter for fracture with nonunion', 'Chorioretinal scars');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (144, 'Temp', 2, 'http://dummyimage.com/159x100.png/ff4444/ffffff', 4, 'Crushing injury of left ring finger', 'Other fracture of unspecified lesser toe(s), initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (123, 'Fix San', 1, 'http://dummyimage.com/186x100.png/cc0000/ffffff', 5, 'Diabetes mellitus due to underlying condition with hyperosmolarity without nonketotic hyperglycemic-hyperosmolar coma (NKHHC)', 'Cerebral infarction due to thrombosis of cerebellar artery');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (177, 'Quo Lux', 1, 'http://dummyimage.com/225x100.png/ff4444/ffffff', 4, 'Nondisplaced fracture of posterior column [ilioischial] of unspecified acetabulum, subsequent encounter for fracture with routine healing', 'Frostbite with tissue necrosis of left hand, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (142, 'Kanlam', 2, 'http://dummyimage.com/146x100.png/dddddd/000000', 15, 'Nondisplaced avulsion fracture of unspecified ilium, subsequent encounter for fracture with routine healing', 'Other anterior dislocation of left hip, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (17, 'Biodex', 2, 'http://dummyimage.com/151x100.png/5fa2dd/ffffff', 15, 'Unspecified injury of muscle and tendon of long extensor muscle of toe at ankle and foot level, right foot', 'Poisoning by, adverse effect of and underdosing of other nonsteroidal anti-inflammatory drugs [NSAID]');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (121, 'Tempsoft', 3, 'http://dummyimage.com/123x100.png/ff4444/ffffff', 19, 'Non-pressure chronic ulcer of other part of right foot', 'Poisoning by other viral vaccines, accidental (unintentional), initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (37, 'Flowdesk', 2, 'http://dummyimage.com/135x100.png/cc0000/ffffff', 13, 'Adverse effect of other narcotics, sequela', 'Unspecified fracture of third metacarpal bone, left hand, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (29, 'Veribet', 2, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 14, 'Earthquake, initial encounter', 'Unspecified otitis externa, bilateral');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (179, 'Andalax', 3, 'http://dummyimage.com/181x100.png/cc0000/ffffff', 10, 'Underdosing of 4-Aminophenol derivatives, subsequent encounter', 'Neurosyphilis, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (129, 'Lotlux', 2, 'http://dummyimage.com/194x100.png/5fa2dd/ffffff', 2, 'Unspecified fracture of left ilium, initial encounter for closed fracture', 'Nondisplaced oblique fracture of shaft of left fibula, subsequent encounter for closed fracture with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (52, 'Pannier', 2, 'http://dummyimage.com/141x100.png/ff4444/ffffff', 15, 'Adverse effect of other drugs, medicaments and biological substances', 'Mechanical lagophthalmos right upper eyelid');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (74, 'Toughjoyfax', 3, 'http://dummyimage.com/178x100.png/dddddd/000000', 16, 'Contusion of right great toe without damage to nail', 'Complete traumatic amputation of unspecified breast, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (157, 'Fixflex', 2, 'http://dummyimage.com/132x100.png/cc0000/ffffff', 4, 'Other fracture of upper end of unspecified ulna, subsequent encounter for closed fracture with nonunion', 'Contusion of left knee, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (167, 'Stronghold', 1, 'http://dummyimage.com/177x100.png/dddddd/000000', 5, 'Driver of bus injured in collision with car, pick-up truck or van in traffic accident, subsequent encounter', 'Nondisplaced fracture of left ulna styloid process, subsequent encounter for closed fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (133, 'Treeflex', 1, 'http://dummyimage.com/118x100.png/ff4444/ffffff', 3, 'Other fracture of lower end of left ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion', 'Polyhydramnios, unspecified trimester, not applicable or unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (61, 'Bigtax', 2, 'http://dummyimage.com/150x100.png/dddddd/000000', 13, 'Displaced fracture of neck of right radius, subsequent encounter for closed fracture with nonunion', 'Contact with contaminated hypodermic needle');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (162, 'Home Ing', 2, 'http://dummyimage.com/147x100.png/dddddd/000000', 12, 'Leakage of surgically created arteriovenous fistula', 'Other specified urinary incontinence');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (53, 'Zamit', 1, 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 11, 'Intraventricular (nontraumatic) hemorrhage, grade 4, of newborn', 'Displaced fracture of proximal phalanx of right great toe, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (34, 'Stim', 1, 'http://dummyimage.com/208x100.png/dddddd/000000', 12, 'Nondisplaced fracture of neck of unspecified talus, initial encounter for open fracture', 'Other atherosclerosis of native arteries of extremities');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (91, 'Lotstring', 1, 'http://dummyimage.com/233x100.png/5fa2dd/ffffff', 4, 'Toxic effect of venom of wasps, assault, initial encounter', 'Infection of amputation stump, left upper extremity');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (132, 'Holdlamis', 3, 'http://dummyimage.com/170x100.png/cc0000/ffffff', 14, 'Fall on same level from slipping, tripping and stumbling', 'Displaced longitudinal fracture of unspecified patella, subsequent encounter for closed fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (52, 'Transcof', 1, 'http://dummyimage.com/185x100.png/cc0000/ffffff', 1, 'Toxic effect of other specified inorganic substances, assault', 'Unspecified injury of other blood vessels at forearm level, left arm, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (74, 'Stringtough', 2, 'http://dummyimage.com/204x100.png/cc0000/ffffff', 7, 'Other fracture of upper end of unspecified ulna, subsequent encounter for open fracture type I or II with delayed healing', 'Nondisplaced fracture of proximal phalanx of unspecified finger, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (38, 'Opela', 1, 'http://dummyimage.com/125x100.png/dddddd/000000', 6, 'Contusion and laceration of left cerebrum with loss of consciousness greater than 24 hours without return to pre-existing conscious level with patient surviving', 'Laceration without foreign body of abdominal wall, periumbilic region without penetration into peritoneal cavity, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (200, 'Alpha', 2, 'http://dummyimage.com/141x100.png/cc0000/ffffff', 8, 'Unspecified occupant of bus injured in collision with railway train or railway vehicle in traffic accident', 'Underdosing of unspecified anesthetics');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (110, 'Hatity', 2, 'http://dummyimage.com/116x100.png/dddddd/000000', 4, 'Other mechanical complication of implanted electronic neurostimulator of peripheral nerve electrode (lead)', 'Ulceration of vagina');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (137, 'Zaam-Dox', 2, 'http://dummyimage.com/238x100.png/ff4444/ffffff', 18, 'Superficial frostbite of unspecified wrist, sequela', 'Malignant neoplasm of axillary tail of right male breast');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (195, 'Alphazap', 3, 'http://dummyimage.com/186x100.png/5fa2dd/ffffff', 17, 'Flail joint, right hip', 'Nondisplaced fracture of lunate [semilunar], unspecified wrist, subsequent encounter for fracture with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (50, 'Regrant', 3, 'http://dummyimage.com/111x100.png/dddddd/000000', 17, 'Other gonococcal eye infection', 'Drowning and submersion due to fall off water-skis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (36, 'Voltsillam', 2, 'http://dummyimage.com/202x100.png/cc0000/ffffff', 20, 'Stress fracture, right fibula, subsequent encounter for fracture with nonunion', 'Unspecified sprain of left little finger, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (4, 'Fintone', 2, 'http://dummyimage.com/243x100.png/5fa2dd/ffffff', 8, 'Strain of unspecified muscle, fascia and tendon at shoulder and upper arm level, left arm, subsequent encounter', 'Balloon fire injuring occupant');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (118, 'Treeflex', 1, 'http://dummyimage.com/249x100.png/cc0000/ffffff', 14, 'Displaced fracture of body of unspecified talus, subsequent encounter for fracture with nonunion', 'Posterior cyclitis, left eye');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (120, 'Namfix', 1, 'http://dummyimage.com/231x100.png/dddddd/000000', 7, 'Terrorism involving firearms, civilian injured, subsequent encounter', 'Displaced fracture of posterior process of unspecified talus');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (164, 'Stronghold', 2, 'http://dummyimage.com/155x100.png/5fa2dd/ffffff', 3, 'Subluxation of unspecified thoracic vertebra, sequela', 'Injury of blood vessel of thumb');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (82, 'Andalax', 3, 'http://dummyimage.com/213x100.png/dddddd/000000', 4, 'Nondisplaced fracture of coronoid process of unspecified ulna, subsequent encounter for closed fracture with nonunion', 'Infective myositis, unspecified forearm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (190, 'Greenlam', 1, 'http://dummyimage.com/210x100.png/ff4444/ffffff', 6, 'Other intraarticular fracture of lower end of right radius, subsequent encounter for closed fracture with nonunion', 'Nondisplaced fracture of greater tuberosity of left humerus, subsequent encounter for fracture with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (197, 'Tresom', 2, 'http://dummyimage.com/133x100.png/ff4444/ffffff', 7, 'Postpartum inversion of uterus', 'Exposure to sudden change in air pressure in aircraft during ascent');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (16, 'Tempsoft', 2, 'http://dummyimage.com/244x100.png/cc0000/ffffff', 1, 'Arthropathies in other specified diseases classified elsewhere, left wrist', 'Displaced articular fracture of head of right femur, subsequent encounter for open fracture type I or II with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (52, 'Stim', 1, 'http://dummyimage.com/174x100.png/cc0000/ffffff', 15, 'Other injury of other extensor muscle, fascia and tendon at forearm level, left arm, subsequent encounter', 'Nondisplaced transverse fracture of shaft of left radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (189, 'Ronstring', 3, 'http://dummyimage.com/125x100.png/dddddd/000000', 3, 'Other mechanical complication of implanted electronic neurostimulator of peripheral nerve electrode (lead)', 'Partial traumatic amputation at knee level');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (24, 'Y-Solowarm', 1, 'http://dummyimage.com/135x100.png/cc0000/ffffff', 7, 'Contusion and laceration of right cerebrum with loss of consciousness of any duration with death due to other cause prior to regaining consciousness, initial encounter', 'Lead-induced chronic gout, left shoulder');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (50, 'Zamit', 2, 'http://dummyimage.com/226x100.png/dddddd/000000', 1, 'Stress fracture, unspecified tibia and fibula, sequela', 'Unspecified occupant of three-wheeled motor vehicle injured in collision with railway train or railway vehicle in traffic accident, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (148, 'Hatity', 2, 'http://dummyimage.com/226x100.png/dddddd/000000', 4, 'Alzheimer''s disease', 'Mansonelliasis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (6, 'Wrapsafe', 3, 'http://dummyimage.com/179x100.png/ff4444/ffffff', 13, 'Contact with and (suspected) exposure to other environmental pollution', 'Unspecified occupant of special industrial vehicle injured in nontraffic accident, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (191, 'Flexidy', 1, 'http://dummyimage.com/108x100.png/dddddd/000000', 10, 'Passenger on bus injured in collision with other nonmotor vehicle in nontraffic accident, subsequent encounter', 'Motorcycle driver injured in collision with pedestrian or animal in traffic accident');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (164, 'Fixflex', 3, 'http://dummyimage.com/142x100.png/cc0000/ffffff', 17, 'Accidental puncture and laceration of a circulatory system organ or structure during a procedure', 'Agenesis, aplasia and hypoplasia of gallbladder');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (198, 'Bamity', 2, 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 5, 'Unspecified fracture of the lower end of unspecified radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Blue sclera');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (1, 'Cardguard', 3, 'http://dummyimage.com/228x100.png/dddddd/000000', 16, 'Displaced bicondylar fracture of unspecified tibia', 'Displaced other fracture of tuberosity of right calcaneus, initial encounter for open fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (46, 'Redhold', 3, 'http://dummyimage.com/130x100.png/cc0000/ffffff', 20, 'Nondisplaced fracture of distal phalanx of right index finger, subsequent encounter for fracture with delayed healing', 'Type I occipital condyle fracture, unspecified side, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (12, 'Kanlam', 3, 'http://dummyimage.com/167x100.png/ff4444/ffffff', 14, 'Other specified injury of unspecified blood vessel at shoulder and upper arm level, right arm, subsequent encounter', 'Postimmunization arthropathy, vertebrae');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (64, 'Hatity', 3, 'http://dummyimage.com/196x100.png/5fa2dd/ffffff', 1, 'Nondisplaced fracture of second metatarsal bone, unspecified foot, subsequent encounter for fracture with nonunion', 'Idiopathic chronic gout, right elbow, without tophus (tophi)');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (68, 'Stim', 3, 'http://dummyimage.com/180x100.png/dddddd/000000', 14, 'Displacement of other bone devices, implants and grafts, subsequent encounter', 'Nondisplaced unspecified fracture of left great toe');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (25, 'Fintone', 2, 'http://dummyimage.com/228x100.png/ff4444/ffffff', 3, 'Dislocation of metacarpophalangeal joint of left thumb', 'Nonrheumatic aortic (valve) insufficiency');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (10, 'Bitwolf', 1, 'http://dummyimage.com/180x100.png/cc0000/ffffff', 11, 'Salter-Harris Type IV physeal fracture of phalanx of left toe, initial encounter for closed fracture', 'Unspecified fracture of T11-T12 vertebra, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (154, 'Tampflex', 1, 'http://dummyimage.com/209x100.png/5fa2dd/ffffff', 14, 'Erythema multiforme', 'Essential (hemorrhagic) thrombocythemia');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (104, 'Biodex', 3, 'http://dummyimage.com/244x100.png/cc0000/ffffff', 19, 'Opioid dependence with opioid-induced sexual dysfunction', 'Poisoning by coronary vasodilators, assault, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (147, 'Alpha', 2, 'http://dummyimage.com/244x100.png/cc0000/ffffff', 8, 'Unspecified injury of intrinsic muscle and tendon at ankle and foot level, left foot', 'Malignant neoplasm of short bones of left upper limb');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (195, 'Solarbreeze', 1, 'http://dummyimage.com/234x100.png/dddddd/000000', 18, 'Sprain of metacarpophalangeal joint of left middle finger, subsequent encounter', 'Pathological fracture in neoplastic disease, right ulna, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (53, 'Veribet', 2, 'http://dummyimage.com/162x100.png/dddddd/000000', 18, 'Toxic effect of other specified noxious substances eaten as food, assault, initial encounter', 'Familial chondrocalcinosis, knee');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (163, 'Greenlam', 2, 'http://dummyimage.com/136x100.png/5fa2dd/ffffff', 20, 'Person injured in collision between heavy transport vehicle and bus, nontraffic, sequela', 'Burn of first degree of unspecified lower leg, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (74, 'Namfix', 3, 'http://dummyimage.com/118x100.png/cc0000/ffffff', 17, 'Partial traumatic amputation of female external genital organs, sequela', 'Brown-Sequard syndrome at C2 level of cervical spinal cord, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (172, 'Prodder', 1, 'http://dummyimage.com/189x100.png/ff4444/ffffff', 2, 'Smith''s fracture of left radius, subsequent encounter for closed fracture with routine healing', 'Fracture of unspecified phalanx of left little finger, subsequent encounter for fracture with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (40, 'Daltfresh', 3, 'http://dummyimage.com/167x100.png/cc0000/ffffff', 9, 'Acute embolism and thrombosis of unspecified veins of unspecified upper extremity', 'Pain in right arm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (17, 'Zamit', 1, 'http://dummyimage.com/123x100.png/5fa2dd/ffffff', 9, 'Chronic radiodermatitis', 'Injury of digital nerve of right ring finger, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (190, 'Job', 2, 'http://dummyimage.com/216x100.png/cc0000/ffffff', 5, 'Injury of femoral nerve at hip and thigh level, right leg, subsequent encounter', 'Driver of bus injured in collision with heavy transport vehicle or bus in traffic accident, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (109, 'Lotlux', 1, 'http://dummyimage.com/224x100.png/5fa2dd/ffffff', 11, 'Occupant of pick-up truck or van injured in collision with pedestrian or animal', 'Burn of first degree of neck, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (102, 'Y-find', 1, 'http://dummyimage.com/239x100.png/cc0000/ffffff', 1, 'Subluxation of proximal interphalangeal joint of right thumb', 'Open bite of left thumb without damage to nail, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (57, 'Sonair', 3, 'http://dummyimage.com/243x100.png/5fa2dd/ffffff', 4, 'Nondisplaced fracture of lateral malleolus of left fibula, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'Other specified inflammatory spondylopathies, thoracolumbar region');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (88, 'Kanlam', 2, 'http://dummyimage.com/130x100.png/dddddd/000000', 1, 'Person on outside of pick-up truck or van injured in collision with fixed or stationary object in nontraffic accident', 'Unspecified fracture of unspecified femur, initial encounter for open fracture type IIIA, IIIB, or IIIC');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (154, 'Lotstring', 1, 'http://dummyimage.com/219x100.png/ff4444/ffffff', 15, 'Arthritis due to other bacteria, elbow', 'Intervertebral disc stenosis of neural canal of cervical region');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (182, 'Redhold', 3, 'http://dummyimage.com/132x100.png/cc0000/ffffff', 7, 'Nondisplaced fracture of distal phalanx of unspecified great toe, initial encounter for open fracture', 'Laceration with foreign body of left thumb without damage to nail, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (194, 'Keylex', 3, 'http://dummyimage.com/104x100.png/cc0000/ffffff', 9, 'Traumatic subdural hemorrhage with loss of consciousness of 31 minutes to 59 minutes, subsequent encounter', 'Insect bite (nonvenomous) of left little finger, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (148, 'Keylex', 1, 'http://dummyimage.com/106x100.png/ff4444/ffffff', 14, 'Unspecified injury of unspecified blood vessel at ankle and foot level, unspecified leg', 'Nondisplaced fracture of shaft of right clavicle, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (159, 'Latlux', 3, 'http://dummyimage.com/128x100.png/cc0000/ffffff', 17, 'Nipple discharge', 'Osteochondrosis (juvenile) of metacarpal heads [Mauclaire], right hand');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (12, 'Vagram', 1, 'http://dummyimage.com/177x100.png/ff4444/ffffff', 2, 'Other complications specific to multiple gestation', 'Adverse effect of anticholinesterase agents, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (170, 'Cookley', 1, 'http://dummyimage.com/164x100.png/5fa2dd/ffffff', 19, 'Other specified disorders of Eustachian tube, left ear', 'Other secondary chronic gout, left shoulder, with tophus (tophi)');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (170, 'Solarbreeze', 3, 'http://dummyimage.com/138x100.png/dddddd/000000', 15, 'Complete lesion at T11-T12 level of thoracic spinal cord', 'Legal intervention involving other specified means');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (177, 'Veribet', 1, 'http://dummyimage.com/127x100.png/cc0000/ffffff', 2, 'Contusion and laceration of cerebrum, unspecified, with loss of consciousness of unspecified duration, initial encounter', 'Unspecified fracture of shaft of right fibula, subsequent encounter for open fracture type I or II with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (105, 'Cardify', 3, 'http://dummyimage.com/241x100.png/5fa2dd/ffffff', 13, 'Localized swelling, mass and lump, right lower limb', 'Person on outside of heavy transport vehicle injured in collision with heavy transport vehicle or bus in nontraffic accident, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (120, 'Y-Solowarm', 3, 'http://dummyimage.com/186x100.png/cc0000/ffffff', 12, 'Idiopathic chronic gout, unspecified wrist, with tophus (tophi)', 'Loose body in knee, left knee');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (155, 'Asoka', 1, 'http://dummyimage.com/139x100.png/dddddd/000000', 12, 'Hit by object from burning building or structure in uncontrolled fire', 'Fracture of unspecified metatarsal bone(s), unspecified foot, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (130, 'Bitwolf', 3, 'http://dummyimage.com/119x100.png/ff4444/ffffff', 3, 'Traumatic rupture of right radiocarpal ligament, subsequent encounter', 'Sezary disease, lymph nodes of head, face, and neck');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (72, 'Bytecard', 1, 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', 19, 'Nondisplaced fracture of first metatarsal bone, unspecified foot, subsequent encounter for fracture with delayed healing', 'Puncture wound with foreign body of left little finger without damage to nail, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (118, 'Alpha', 3, 'http://dummyimage.com/234x100.png/5fa2dd/ffffff', 20, 'Diagnostic and monitoring physical medicine devices associated with adverse incidents', 'Ulcerative colitis, unspecified with unspecified complications');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (150, 'Stim', 2, 'http://dummyimage.com/157x100.png/cc0000/ffffff', 2, 'Nondisplaced intertrochanteric fracture of unspecified femur', 'Unspecified injury of muscle and tendon of back wall of thorax, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (71, 'Home Ing', 2, 'http://dummyimage.com/217x100.png/cc0000/ffffff', 3, 'Sprain of unspecified sternoclavicular joint', 'Varicella pneumonia');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (124, 'Latlux', 2, 'http://dummyimage.com/218x100.png/dddddd/000000', 13, 'Poisoning by unspecified primarily systemic and hematological agent, assault, subsequent encounter', 'Hematemesis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (164, 'Trippledex', 1, 'http://dummyimage.com/106x100.png/ff4444/ffffff', 17, 'Persistent migraine aura with cerebral infarction, not intractable, with status migrainosus', 'Military operations involving explosion of aerial bomb, military personnel, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (132, 'Bytecard', 3, 'http://dummyimage.com/103x100.png/ff4444/ffffff', 13, 'Burn of third degree of multiple right fingers (nail), not including thumb', 'Unspecified fracture of unspecified metacarpal bone, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (73, 'Y-find', 2, 'http://dummyimage.com/134x100.png/5fa2dd/ffffff', 6, 'Strain of muscle and tendon of unspecified wall of thorax', 'Displaced fracture of base of neck of unspecified femur, subsequent encounter for closed fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (80, 'Lotlux', 3, 'http://dummyimage.com/119x100.png/ff4444/ffffff', 15, 'Chondromalacia, joints of right hand', 'External constriction of right ear, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (178, 'Treeflex', 3, 'http://dummyimage.com/212x100.png/dddddd/000000', 14, 'Salter-Harris Type I physeal fracture of upper end of tibia', 'Corrosion of unspecified degree of scapular region');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (78, 'Zamit', 1, 'http://dummyimage.com/124x100.png/dddddd/000000', 15, 'Other injury of flexor muscle, fascia and tendon of left little finger at forearm level, subsequent encounter', 'Monoplegia of upper limb following unspecified cerebrovascular disease affecting unspecified side');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (199, 'Fix San', 1, 'http://dummyimage.com/131x100.png/dddddd/000000', 20, 'Nondisplaced transverse fracture of shaft of left radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Corrosion of second degree of multiple sites of head, face, and neck');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (175, 'Home Ing', 3, 'http://dummyimage.com/124x100.png/5fa2dd/ffffff', 11, 'Unspecified occupant of pick-up truck or van injured in noncollision transport accident in nontraffic accident', 'Toxic effect of venom of centipedes and venomous millipedes, assault, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (59, 'Asoka', 1, 'http://dummyimage.com/107x100.png/ff4444/ffffff', 10, 'Toxic effect of unspecified pesticide, intentional self-harm', 'Displaced transverse fracture of unspecified patella, subsequent encounter for open fracture type I or II with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (196, 'Andalax', 3, 'http://dummyimage.com/170x100.png/ff4444/ffffff', 8, 'Bitten by other rodent, sequela', 'Open bite of left middle finger with damage to nail, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (179, 'Bitchip', 1, 'http://dummyimage.com/237x100.png/dddddd/000000', 17, 'Stenosis of unspecified lacrimal sac', 'Contusion of stomach, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (155, 'Cardify', 3, 'http://dummyimage.com/208x100.png/cc0000/ffffff', 7, 'Nondisplaced fracture of greater trochanter of unspecified femur, subsequent encounter for closed fracture with malunion', 'Hb-SS disease with crisis, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (60, 'Stringtough', 1, 'http://dummyimage.com/217x100.png/ff4444/ffffff', 1, 'Poisoning by other anti-common-cold drugs, undetermined', 'Strain of flexor muscle, fascia and tendon of right little finger at wrist and hand level');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (31, 'Zontrax', 1, 'http://dummyimage.com/178x100.png/5fa2dd/ffffff', 8, 'Bariatric surgery status complicating pregnancy, unspecified trimester', 'Benign neoplasm of cornea');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (136, 'Wrapsafe', 1, 'http://dummyimage.com/112x100.png/cc0000/ffffff', 7, 'Drowning and submersion while in swimming pool, undetermined intent, initial encounter', 'Neoplasm of uncertain behavior of brain, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (34, 'Alpha', 2, 'http://dummyimage.com/140x100.png/dddddd/000000', 4, 'Secondary pigmentary degeneration', 'Struck by crocodile');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (54, 'Keylex', 3, 'http://dummyimage.com/181x100.png/dddddd/000000', 6, 'Corrosion of second degree of right hand, unspecified site', 'Nondisplaced spiral fracture of shaft of left tibia, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (146, 'Tresom', 3, 'http://dummyimage.com/216x100.png/ff4444/ffffff', 7, 'Unspecified occupant of heavy transport vehicle injured in collision with car, pick-up truck or van in nontraffic accident, sequela', 'Other mental disorders complicating pregnancy, third trimester');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (109, 'Holdlamis', 1, 'http://dummyimage.com/175x100.png/cc0000/ffffff', 15, 'Unspecified injury of flexor muscle, fascia and tendon of right ring finger at wrist and hand level, subsequent encounter', 'Complete traumatic amputation at level between unspecified shoulder and elbow, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (176, 'Job', 2, 'http://dummyimage.com/202x100.png/ff4444/ffffff', 16, 'Pathological fracture in neoplastic disease, left humerus, subsequent encounter for fracture with malunion', 'Ocular laceration without prolapse or loss of intraocular tissue, left eye, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (73, 'Overhold', 3, 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 18, 'Other secondary chronic gout, left knee', 'Disseminated blastomycosis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (42, 'Sonsing', 2, 'http://dummyimage.com/180x100.png/cc0000/ffffff', 6, 'Passenger of snowmobile injured in nontraffic accident, subsequent encounter', 'Strain of intrinsic muscle, fascia and tendon of unspecified thumb at wrist and hand level, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (155, 'Wrapsafe', 3, 'http://dummyimage.com/155x100.png/cc0000/ffffff', 17, 'Nondisplaced oblique fracture of shaft of unspecified fibula, sequela', 'Pedestrian on skateboard injured in collision with railway train or railway vehicle in traffic accident, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (177, 'Latlux', 3, 'http://dummyimage.com/166x100.png/dddddd/000000', 14, 'Pedal cycle driver injured in collision with pedestrian or animal in nontraffic accident, subsequent encounter', 'Unspecified fracture of shaft of right femur, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (72, 'Namfix', 1, 'http://dummyimage.com/249x100.png/ff4444/ffffff', 17, 'Activity, walking, marching and hiking', 'Toxic effect of rodenticides, undetermined, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (69, 'Zoolab', 2, 'http://dummyimage.com/221x100.png/dddddd/000000', 9, 'Poisoning by lysergide [LSD], accidental (unintentional), subsequent encounter', 'Nondisplaced fracture of neck of scapula, unspecified shoulder, subsequent encounter for fracture with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (28, 'Holdlamis', 2, 'http://dummyimage.com/128x100.png/cc0000/ffffff', 7, 'Military operations involving chemical weapons and other forms of unconventional warfare, civilian', 'Poisoning by hydantoin derivatives, accidental (unintentional), sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (62, 'Bitwolf', 1, 'http://dummyimage.com/205x100.png/cc0000/ffffff', 6, 'Fracture of unspecified phalanx of other finger, subsequent encounter for fracture with routine healing', 'Age-related osteoporosis with current pathological fracture, unspecified ankle and foot, initial encounter for fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (39, 'Domainer', 2, 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 7, 'Cerebral infarction due to unspecified occlusion or stenosis of unspecified cerebellar artery', 'Corrosion of third degree of unspecified multiple fingers (nail), not including thumb, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (71, 'Sonair', 2, 'http://dummyimage.com/177x100.png/dddddd/000000', 11, 'Osteonecrosis in diseases classified elsewhere, hand', 'Poisoning by iron and its compounds, accidental (unintentional), initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (78, 'Andalax', 2, 'http://dummyimage.com/156x100.png/cc0000/ffffff', 15, 'Salter-Harris Type II physeal fracture of lower end of right femur, subsequent encounter for fracture with delayed healing', 'Displaced comminuted fracture of shaft of radius, right arm, subsequent encounter for closed fracture with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (35, 'Latlux', 2, 'http://dummyimage.com/177x100.png/cc0000/ffffff', 9, 'Other fracture of left foot, initial encounter for open fracture', 'Pre-existing secondary hypertension complicating pregnancy, second trimester');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (28, 'Zaam-Dox', 2, 'http://dummyimage.com/120x100.png/ff4444/ffffff', 6, 'Nondisplaced transverse fracture of shaft of unspecified radius, initial encounter for closed fracture', 'Osteolysis, unspecified forearm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (69, 'Tin', 2, 'http://dummyimage.com/206x100.png/cc0000/ffffff', 5, 'Blood alcohol level of 80-99 mg/100 ml', 'Psychotic disorder with delusions due to known physiological condition');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (43, 'Greenlam', 2, 'http://dummyimage.com/185x100.png/ff4444/ffffff', 4, 'Breakdown (mechanical) of other specified internal prosthetic devices, implants and grafts', 'Miotic pupillary cyst, left eye');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (64, 'Quo Lux', 2, 'http://dummyimage.com/243x100.png/dddddd/000000', 5, 'Other specified noninflammatory disorders of vulva and perineum', 'Sedative, hypnotic or anxiolytic use, unspecified with intoxication, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (189, 'Bigtax', 1, 'http://dummyimage.com/177x100.png/cc0000/ffffff', 16, 'Other superficial bite of hip, left hip', 'Adverse effect of other hormone antagonists, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (37, 'Rank', 3, 'http://dummyimage.com/171x100.png/ff4444/ffffff', 12, 'Poisoning by mixed antiepileptics, undetermined, initial encounter', 'Cerebral infarction due to thrombosis of right posterior cerebral artery');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (34, 'Biodex', 3, 'http://dummyimage.com/227x100.png/dddddd/000000', 3, 'Subacute osteomyelitis, radius and ulna', 'Keratoconjunctivitis due to Acanthamoeba');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (101, 'Bigtax', 1, 'http://dummyimage.com/173x100.png/5fa2dd/ffffff', 4, 'Burn due to (nonpowered) inflatable craft on fire', 'Drug or chemical induced diabetes mellitus with proliferative diabetic retinopathy with combined traction retinal detachment and rhegmatogenous retinal detachment, right eye');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (35, 'Daltfresh', 1, 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 20, 'Other superficial bite of right ear, sequela', 'Displaced comminuted fracture of shaft of left femur, subsequent encounter for closed fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (127, 'Aerified', 3, 'http://dummyimage.com/178x100.png/dddddd/000000', 8, 'Injury of extensor muscle, fascia and tendon of other and unspecified finger at wrist and hand level', 'Cystic kidney disease, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (160, 'Solarbreeze', 3, 'http://dummyimage.com/142x100.png/cc0000/ffffff', 10, 'Recurrent dislocation, unspecified wrist', 'Steroid responder, bilateral');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (68, 'Stringtough', 1, 'http://dummyimage.com/204x100.png/cc0000/ffffff', 13, 'Unspecified occupant of heavy transport vehicle injured in collision with car, pick-up truck or van in traffic accident, sequela', 'Displacement of implanted electronic neurostimulator of spinal cord electrode (lead), sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (178, 'Alphazap', 2, 'http://dummyimage.com/246x100.png/ff4444/ffffff', 3, 'Fracture of unspecified phalanx of left little finger, sequela', 'Drug-induced chronic gout, left elbow, without tophus (tophi)');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (146, 'Flexidy', 3, 'http://dummyimage.com/218x100.png/cc0000/ffffff', 6, 'Familial chondrocalcinosis, ankle and foot', 'Puncture wound with foreign body of other part of head, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (102, 'Domainer', 1, 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', 19, 'Unspecified injury of left kidney, initial encounter', 'Poisoning by cardiac-stimulant glycosides and drugs of similar action, intentional self-harm, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (134, 'Ventosanzap', 3, 'http://dummyimage.com/217x100.png/dddddd/000000', 4, 'Other calcification of muscle, right forearm', 'Unspecified blepharitis unspecified eye, unspecified eyelid');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (115, 'Bytecard', 1, 'http://dummyimage.com/229x100.png/ff4444/ffffff', 14, 'Glaucomatous optic atrophy, bilateral', 'Adverse effect of antitussives');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (123, 'Cookley', 3, 'http://dummyimage.com/219x100.png/ff4444/ffffff', 15, 'Other fracture of shaft of right humerus, sequela', 'Varicose veins of left lower extremity with both ulcer of heel and midfoot and inflammation');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (40, 'Tempsoft', 3, 'http://dummyimage.com/230x100.png/cc0000/ffffff', 1, 'Unspecified fracture of upper end of humerus', 'Type 1 diabetes mellitus with skin complications');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (168, 'Home Ing', 3, 'http://dummyimage.com/171x100.png/5fa2dd/ffffff', 11, 'Unspecified injury of lung, bilateral, sequela', 'Other specified sprain of right wrist, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (186, 'Wrapsafe', 3, 'http://dummyimage.com/246x100.png/cc0000/ffffff', 2, 'Leakage of insulin pump, subsequent encounter', 'Nondisplaced fracture of fourth metatarsal bone, left foot, initial encounter for open fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (200, 'Job', 3, 'http://dummyimage.com/211x100.png/cc0000/ffffff', 7, 'Other calcification of muscle, right ankle and foot', 'Nondisplaced dome fracture of unspecified talus, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (29, 'Bamity', 2, 'http://dummyimage.com/236x100.png/dddddd/000000', 10, 'Rheumatoid lung disease with rheumatoid arthritis of right shoulder', 'Fracture of unspecified phalanx of right middle finger, initial encounter for open fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (32, 'Keylex', 1, 'http://dummyimage.com/180x100.png/ff4444/ffffff', 6, 'Blister (nonthermal), unspecified ankle', 'Pressure ulcer of right hip');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (194, 'Fix San', 3, 'http://dummyimage.com/188x100.png/dddddd/000000', 5, 'Underdosing of mineralocorticoids and their antagonists, initial encounter', 'Obesity complicating pregnancy, childbirth, and the puerperium');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (13, 'Namfix', 3, 'http://dummyimage.com/130x100.png/cc0000/ffffff', 9, 'Partial traumatic amputation at left shoulder joint, initial encounter', 'Quadriplegia, C1-C4 incomplete');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (131, 'Flexidy', 1, 'http://dummyimage.com/219x100.png/ff4444/ffffff', 3, 'Terrorism involving fires, conflagration and hot substances, public safety official injured, sequela', 'Gastrointestinal mucormycosis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (170, 'Pannier', 3, 'http://dummyimage.com/168x100.png/5fa2dd/ffffff', 7, 'Complete traumatic metacarpophalangeal amputation of right ring finger, sequela', 'Other specified injuries of thorax, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (179, 'Viva', 1, 'http://dummyimage.com/157x100.png/ff4444/ffffff', 5, 'Pathological fracture in neoplastic disease, left hand, subsequent encounter for fracture with nonunion', 'Underdosing of other parasympatholytics [anticholinergics and antimuscarinics] and spasmolytics, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (47, 'Cookley', 3, 'http://dummyimage.com/186x100.png/ff4444/ffffff', 19, 'Cellulitis of left lower limb', 'Struck by baseball bat, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (94, 'Treeflex', 2, 'http://dummyimage.com/178x100.png/5fa2dd/ffffff', 8, 'Maternal care for known or suspected placental insufficiency, first trimester, fetus 5', 'Partial loss of teeth due to trauma, class I');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (56, 'Quo Lux', 1, 'http://dummyimage.com/219x100.png/5fa2dd/ffffff', 1, 'Other injury of extensor or abductor muscles, fascia and tendons of left thumb at forearm level, initial encounter', 'Unspecified injury of extensor muscle, fascia and tendon of unspecified finger at wrist and hand level, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (193, 'Treeflex', 3, 'http://dummyimage.com/127x100.png/dddddd/000000', 16, 'Assault by other hot objects, sequela', 'Infection specific to the perinatal period, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (47, 'Pannier', 1, 'http://dummyimage.com/175x100.png/5fa2dd/ffffff', 9, 'Displaced trimalleolar fracture of left lower leg, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Malignant neoplasm of undescended testis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (129, 'Rank', 2, 'http://dummyimage.com/188x100.png/5fa2dd/ffffff', 5, 'Displaced transverse fracture of shaft of unspecified femur, initial encounter for open fracture type IIIA, IIIB, or IIIC', 'Puncture wound without foreign body of unspecified wrist, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (48, 'Alphazap', 1, 'http://dummyimage.com/198x100.png/5fa2dd/ffffff', 8, 'Rupture of synovium, left wrist', 'Burn of first degree of upper back, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (187, 'Bitwolf', 1, 'http://dummyimage.com/102x100.png/cc0000/ffffff', 15, 'Presence of right artificial elbow joint', 'Unspecified dislocation of right shoulder joint');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (159, 'Tampflex', 1, 'http://dummyimage.com/227x100.png/cc0000/ffffff', 5, 'Disorder of external ear, unspecified', 'Unspecified open wound of unspecified elbow, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (172, 'Hatity', 2, 'http://dummyimage.com/114x100.png/cc0000/ffffff', 20, 'Other shellfish poisoning, accidental (unintentional), subsequent encounter', 'Cocaine abuse with cocaine-induced mood disorder');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (172, 'Stringtough', 1, 'http://dummyimage.com/235x100.png/5fa2dd/ffffff', 10, 'Bipolar disorder, current episode depressed, moderate', 'Corrosion of unspecified degree of unspecified upper arm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (199, 'Bytecard', 2, 'http://dummyimage.com/151x100.png/ff4444/ffffff', 11, 'Dislocation of left acromioclavicular joint, greater than 200% displacement, sequela', 'Adverse effect of selective serotonin and norepinephrine reuptake inhibitors, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (112, 'Temp', 1, 'http://dummyimage.com/164x100.png/cc0000/ffffff', 15, 'Poisoning by other anti-common-cold drugs, assault, initial encounter', 'Bitten by cat, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (39, 'Home Ing', 2, 'http://dummyimage.com/124x100.png/ff4444/ffffff', 11, 'Other specified injuries left forearm, subsequent encounter', 'Unspecified fracture of shaft of left tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (71, 'Hatity', 3, 'http://dummyimage.com/143x100.png/cc0000/ffffff', 15, 'Unspecified fracture of right acetabulum, initial encounter for open fracture', 'Stress fracture, left femur, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (92, 'Ventosanzap', 3, 'http://dummyimage.com/110x100.png/dddddd/000000', 15, 'Diffuse follicle center lymphoma, spleen', 'Fear of flying');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (131, 'Lotstring', 1, 'http://dummyimage.com/240x100.png/dddddd/000000', 7, 'Unspecified contusion of spleen, initial encounter', 'Lateral dislocation of unspecified ulnohumeral joint, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (140, 'Biodex', 1, 'http://dummyimage.com/187x100.png/5fa2dd/ffffff', 8, 'Burn of unspecified degree of elbow', 'Burn with resulting rupture and destruction of left eyeball, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (189, 'Hatity', 3, 'http://dummyimage.com/179x100.png/dddddd/000000', 4, 'Acquired absence of unspecified ankle', 'Toxic effect of dichloromethane, intentional self-harm, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (157, 'Quo Lux', 3, 'http://dummyimage.com/222x100.png/cc0000/ffffff', 11, 'Medial subluxation of left ulnohumeral joint, sequela', 'Civilian injured by military aircraft, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (8, 'Job', 2, 'http://dummyimage.com/131x100.png/ff4444/ffffff', 16, 'Nondisplaced articular fracture of head of left femur, subsequent encounter for open fracture type I or II with delayed healing', 'Displaced transverse fracture of shaft of left radius, subsequent encounter for open fracture type I or II with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (51, 'Tin', 2, 'http://dummyimage.com/158x100.png/5fa2dd/ffffff', 8, 'Mycetoma, unspecified', 'Unspecified occupant of three-wheeled motor vehicle injured in collision with two- or three-wheeled motor vehicle in traffic accident');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (158, 'Asoka', 3, 'http://dummyimage.com/111x100.png/5fa2dd/ffffff', 17, 'Torus fracture of upper end of right radius, subsequent encounter for fracture with nonunion', 'Other injury of extensor or abductor muscles, fascia and tendons of unspecified thumb at forearm level, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (94, 'Regrant', 1, 'http://dummyimage.com/130x100.png/dddddd/000000', 12, 'Other disorders involving the immune mechanism, not elsewhere classified', 'Barton''s fracture of unspecified radius, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (184, 'Aerified', 3, 'http://dummyimage.com/143x100.png/ff4444/ffffff', 15, 'Nondisplaced articular fracture of head of right femur, sequela', 'Unstable burst fracture of first cervical vertebra');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (48, 'Stim', 2, 'http://dummyimage.com/133x100.png/cc0000/ffffff', 8, 'Displaced fracture (avulsion) of lateral epicondyle of right humerus, initial encounter for closed fracture', 'Displaced fracture of lower epiphysis (separation) of left femur, subsequent encounter for open fracture type I or II with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (112, 'Biodex', 1, 'http://dummyimage.com/174x100.png/cc0000/ffffff', 19, 'Nondisplaced fracture of lesser trochanter of unspecified femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Traumatic rupture of left radial collateral ligament');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (161, 'Fintone', 2, 'http://dummyimage.com/125x100.png/ff4444/ffffff', 11, 'Burn of second degree of unspecified axilla, sequela', 'Posterior dislocation of unspecified hip, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (179, 'Stringtough', 1, 'http://dummyimage.com/198x100.png/5fa2dd/ffffff', 4, 'Corrosion of unspecified degree of single right finger (nail) except thumb, subsequent encounter', 'Other fracture of lower end of left ulna, subsequent encounter for closed fracture with nonunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (15, 'Lotlux', 2, 'http://dummyimage.com/235x100.png/dddddd/000000', 17, 'Dislocation of metacarpophalangeal joint of right ring finger, subsequent encounter', 'Other mechanical complication of unspecified cardiac device, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (138, 'Stronghold', 2, 'http://dummyimage.com/205x100.png/dddddd/000000', 15, 'Person boarding or alighting a car injured in collision with heavy transport vehicle or bus, subsequent encounter', 'Displaced fracture of right ulna styloid process, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (178, 'Domainer', 2, 'http://dummyimage.com/231x100.png/cc0000/ffffff', 6, 'Unspecified superficial injury of lip, subsequent encounter', 'Abnormal findings on antenatal screening of mother');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (149, 'Overhold', 1, 'http://dummyimage.com/209x100.png/5fa2dd/ffffff', 7, 'Bucket-handle tear of lateral meniscus, current injury, left knee', 'Nondisplaced Type II dens fracture, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (42, 'Holdlamis', 3, 'http://dummyimage.com/111x100.png/dddddd/000000', 12, 'Other physeal fracture of lower end of right femur, subsequent encounter for fracture with nonunion', 'Terrorism, secondary effects');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (35, 'Konklab', 3, 'http://dummyimage.com/187x100.png/cc0000/ffffff', 10, 'Juvenile osteochondrosis of metatarsus, right foot', 'Chronic gout due to renal impairment, left elbow');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (65, 'Span', 2, 'http://dummyimage.com/137x100.png/cc0000/ffffff', 13, 'Unspecified fracture of right foot, initial encounter for closed fracture', 'Underdosing of other antiprotozoal drugs');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (86, 'Y-find', 3, 'http://dummyimage.com/192x100.png/cc0000/ffffff', 18, 'Other injury of bladder, subsequent encounter', 'Other multiple births, all stillborn');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (184, 'Greenlam', 3, 'http://dummyimage.com/197x100.png/ff4444/ffffff', 13, 'Poisoning by barbiturates, accidental (unintentional), sequela', 'Crushing injury of unspecified thumb, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (190, 'Treeflex', 3, 'http://dummyimage.com/186x100.png/ff4444/ffffff', 4, 'Pedal cycle passenger injured in collision with unspecified motor vehicles in nontraffic accident, sequela', 'Pathological fracture, hip, unspecified, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (99, 'Subin', 2, 'http://dummyimage.com/230x100.png/dddddd/000000', 10, 'Poisoning by anthelminthics, undetermined, sequela', 'Postdysenteric arthropathy, left knee');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (145, 'Sub-Ex', 3, 'http://dummyimage.com/164x100.png/dddddd/000000', 16, 'Hit or struck by falling object due to accident to sailboat, sequela', 'Unspecified occupant of pick-up truck or van injured in collision with railway train or railway vehicle in traffic accident');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (152, 'Hatity', 2, 'http://dummyimage.com/190x100.png/dddddd/000000', 20, 'Underdosing of keratolytics, keratoplastics, and other hair treatment drugs and preparations, subsequent encounter', 'Other atherosclerosis of native arteries of extremities, right leg');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (43, 'Fix San', 2, 'http://dummyimage.com/156x100.png/ff4444/ffffff', 3, 'Bitten by cat, initial encounter', 'Fracture of one rib, left side, initial encounter for open fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (102, 'Duobam', 1, 'http://dummyimage.com/191x100.png/ff4444/ffffff', 1, 'Type 1 diabetes mellitus with proliferative diabetic retinopathy with traction retinal detachment not involving the macula, left eye', 'Diffuse traumatic brain injury with loss of consciousness of any duration with death due to brain injury prior to regaining consciousness, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (180, 'Tampflex', 3, 'http://dummyimage.com/149x100.png/5fa2dd/ffffff', 12, 'Atrioventricular block, first degree', 'Localization-related (focal) (partial) symptomatic epilepsy and epileptic syndromes with complex partial seizures, not intractable, without status epilepticus');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (4, 'Quo Lux', 1, 'http://dummyimage.com/160x100.png/cc0000/ffffff', 15, 'Stiffness of right elbow, not elsewhere classified', 'Other specified personal risk factors, not elsewhere classified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (149, 'Bitwolf', 2, 'http://dummyimage.com/144x100.png/cc0000/ffffff', 1, 'Intentional self-harm by smoke, fire and flames, subsequent encounter', 'Nondisplaced transverse fracture of shaft of right tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (180, 'Stronghold', 2, 'http://dummyimage.com/242x100.png/ff4444/ffffff', 9, 'Laceration of unspecified muscle, fascia and tendon at shoulder and upper arm level, left arm, initial encounter', 'Poisoning by antihyperlipidemic and antiarteriosclerotic drugs, undetermined, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (14, 'Stim', 1, 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 5, 'Pedestrian on skateboard injured in collision with pedal cycle, unspecified whether traffic or nontraffic accident, initial encounter', 'Motorcycle driver injured in collision with two- or three-wheeled motor vehicle in nontraffic accident, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (195, 'Sonsing', 2, 'http://dummyimage.com/139x100.png/ff4444/ffffff', 20, 'Unspecified fracture of shaft of right radius, subsequent encounter for open fracture type I or II with delayed healing', 'Unspecified fracture of lower end of left ulna, initial encounter for open fracture type I or II');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (28, 'Span', 2, 'http://dummyimage.com/241x100.png/cc0000/ffffff', 1, 'Other foreign object in bronchus', 'Unspecified injury of thoracic aorta');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (98, 'Bamity', 1, 'http://dummyimage.com/225x100.png/cc0000/ffffff', 6, 'Displaced posterior arch fracture of first cervical vertebra, subsequent encounter for fracture with delayed healing', 'Mononeuropathy in diseases classified elsewhere');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (163, 'Tin', 3, 'http://dummyimage.com/146x100.png/dddddd/000000', 2, 'Displaced comminuted fracture of shaft of unspecified tibia, subsequent encounter for closed fracture with delayed healing', 'Posterior dislocation of right acromioclavicular joint, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (56, 'Wrapsafe', 2, 'http://dummyimage.com/155x100.png/dddddd/000000', 15, 'Displaced fracture of posterior process of left talus, initial encounter for open fracture', 'Retinopathy of prematurity, stage 4, unspecified eye');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (50, 'Flowdesk', 3, 'http://dummyimage.com/240x100.png/dddddd/000000', 8, 'Puncture wound with foreign body of larynx', 'Sprain of interphalangeal joint of left ring finger, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (150, 'Cookley', 3, 'http://dummyimage.com/122x100.png/ff4444/ffffff', 4, 'Chloasma of right upper eyelid and periocular area', 'Other specified fracture of left acetabulum, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (133, 'Namfix', 3, 'http://dummyimage.com/238x100.png/5fa2dd/ffffff', 2, 'Adverse effect of other bacterial vaccines, initial encounter', 'Salter-Harris Type I physeal fracture of upper end of radius, left arm, initial encounter for closed fracture');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (38, 'Pannier', 3, 'http://dummyimage.com/230x100.png/5fa2dd/ffffff', 1, 'Sarcoidosis of other sites', 'Sexual abuse complicating pregnancy, childbirth and the puerperium');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (102, 'Zathin', 1, 'http://dummyimage.com/187x100.png/cc0000/ffffff', 16, 'Foreign body in other and multiple parts of external eye, left eye, subsequent encounter', 'Other superficial bite of right shoulder, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (65, 'Sonsing', 3, 'http://dummyimage.com/127x100.png/dddddd/000000', 3, 'Fall (on) (from) other stairs and steps, sequela', 'Skeletal fluorosis, upper arm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (117, 'Zontrax', 1, 'http://dummyimage.com/105x100.png/ff4444/ffffff', 12, 'Pedal cycle passenger injured in collision with pedestrian or animal in nontraffic accident, sequela', 'Toxic effect of tetrachloroethylene, accidental (unintentional), initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (77, 'Cardify', 1, 'http://dummyimage.com/122x100.png/5fa2dd/ffffff', 9, 'Explosion of bomb placed during war operations but exploding after cessation of hostilities, civilian', 'Open bite of right cheek and temporomandibular area, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (170, 'Pannier', 2, 'http://dummyimage.com/160x100.png/cc0000/ffffff', 3, 'Cataract (lens) fragments in eye following cataract surgery', 'Unspecified fracture of navicular [scaphoid] bone of left wrist, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (176, 'Bigtax', 1, 'http://dummyimage.com/240x100.png/ff4444/ffffff', 9, 'Paraneoplastic pemphigus', 'Adolescent idiopathic scoliosis, thoracic region');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (146, 'Y-Solowarm', 2, 'http://dummyimage.com/246x100.png/ff4444/ffffff', 8, 'Incomplete lesion of unspecified level of lumbar spinal cord', 'Sicca syndrome with other organ involvement');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (135, 'Alphazap', 1, 'http://dummyimage.com/130x100.png/dddddd/000000', 4, 'Other specified injury of muscle, fascia and tendon of the posterior muscle group at thigh level, right thigh, subsequent encounter', 'Person boarding or alighting a motorcycle injured in collision with other nonmotor vehicle, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (180, 'Greenlam', 2, 'http://dummyimage.com/156x100.png/cc0000/ffffff', 20, 'Nondisplaced fracture of triquetrum [cuneiform] bone, unspecified wrist, subsequent encounter for fracture with malunion', 'Other osteonecrosis, unspecified bone');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (23, 'Ventosanzap', 3, 'http://dummyimage.com/195x100.png/cc0000/ffffff', 20, 'Displaced fracture of medial condyle of unspecified femur, subsequent encounter for closed fracture with routine healing', 'Nondisplaced fracture of third metatarsal bone, unspecified foot, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (128, 'Biodex', 2, 'http://dummyimage.com/167x100.png/ff4444/ffffff', 12, 'Parachutist injured on landing', 'Nondisplaced transverse fracture of shaft of right tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (114, 'Duobam', 2, 'http://dummyimage.com/111x100.png/dddddd/000000', 11, 'Displaced longitudinal fracture of right patella, initial encounter for closed fracture', 'Displaced fracture of middle third of navicular [scaphoid] bone of left wrist, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (120, 'Quo Lux', 3, 'http://dummyimage.com/126x100.png/cc0000/ffffff', 20, 'Contusion of unspecified part of pancreas, subsequent encounter', 'Burn of first degree of head, face, and neck, unspecified site, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (85, 'Aerified', 2, 'http://dummyimage.com/215x100.png/5fa2dd/ffffff', 6, 'Underdosing of other psychodysleptics, sequela', 'Other complications specific to multiple gestation, second trimester, fetus 5');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (199, 'Tres-Zap', 2, 'http://dummyimage.com/201x100.png/ff4444/ffffff', 10, 'Puckering of macula', 'Acculturation difficulty');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (15, 'Andalax', 1, 'http://dummyimage.com/123x100.png/5fa2dd/ffffff', 13, 'Ocular laceration and rupture with prolapse or loss of intraocular tissue', 'Laceration of unspecified renal vein, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (123, 'Greenlam', 2, 'http://dummyimage.com/146x100.png/5fa2dd/ffffff', 20, 'Other fracture of shaft of right tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion', 'Corrosion of unspecified degree of multiple left fingers (nail), including thumb, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (128, 'Zathin', 3, 'http://dummyimage.com/173x100.png/ff4444/ffffff', 4, 'Strain of flexor muscle, fascia and tendon of right ring finger at wrist and hand level', 'Diabetes mellitus due to underlying condition with diabetic cataract');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (36, 'Stim', 3, 'http://dummyimage.com/134x100.png/cc0000/ffffff', 20, 'Supervision of other high risk pregnancies, first trimester', 'Other dislocation of right ulnohumeral joint, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (25, 'Trippledex', 3, 'http://dummyimage.com/240x100.png/dddddd/000000', 6, 'Other osteoporosis with current pathological fracture, unspecified lower leg', 'Drug or chemical induced diabetes mellitus with proliferative diabetic retinopathy with traction retinal detachment involving the macula, unspecified eye');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (38, 'Tin', 3, 'http://dummyimage.com/159x100.png/cc0000/ffffff', 1, 'Assault by blunt object', 'Pathological fracture in neoplastic disease, right foot');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (176, 'Alphazap', 2, 'http://dummyimage.com/134x100.png/5fa2dd/ffffff', 15, 'Nondisplaced fracture of right tibial spine, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', 'Burn of second degree of unspecified forearm, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (188, 'Ronstring', 2, 'http://dummyimage.com/187x100.png/ff4444/ffffff', 17, 'Salter-Harris Type II physeal fracture of upper end of humerus, left arm, sequela', 'Nondisplaced unspecified fracture of unspecified lesser toe(s), subsequent encounter for fracture with malunion');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (5, 'Regrant', 1, 'http://dummyimage.com/116x100.png/5fa2dd/ffffff', 1, 'Pressure ulcer of left elbow, stage 2', 'Early syphilis');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (156, 'Fixflex', 1, 'http://dummyimage.com/187x100.png/ff4444/ffffff', 14, 'Other contact with nonvenomous lizards, sequela', 'Car passenger injured in collision with two- or three-wheeled motor vehicle in traffic accident, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (145, 'Namfix', 3, 'http://dummyimage.com/130x100.png/cc0000/ffffff', 2, 'Other injuries of lung, unspecified, sequela', 'Failed attempted termination of pregnancy with other and unspecified complications');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (158, 'Solarbreeze', 2, 'http://dummyimage.com/229x100.png/cc0000/ffffff', 14, 'Struck by dolphin', 'Malignant neoplasm of lymphoid, hematopoietic and related tissue, unspecified');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (100, 'Opela', 3, 'http://dummyimage.com/184x100.png/5fa2dd/ffffff', 8, 'Skeletal fluorosis, forearm', 'Bank as the place of occurrence of the external cause');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (149, 'Aerified', 2, 'http://dummyimage.com/226x100.png/dddddd/000000', 15, 'Nondisplaced subtrochanteric fracture of unspecified femur, subsequent encounter for closed fracture with nonunion', 'Constant exophthalmos');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (131, 'Zaam-Dox', 1, 'http://dummyimage.com/131x100.png/dddddd/000000', 14, 'Other injury of intrinsic muscle, fascia and tendon of left little finger at wrist and hand level, sequela', 'Other misshapen ear');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (91, 'Bitchip', 1, 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', 14, 'Nondisplaced fracture of distal phalanx of right index finger, subsequent encounter for fracture with delayed healing', 'Machinery accident on board fishing boat, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (62, 'Greenlam', 2, 'http://dummyimage.com/188x100.png/cc0000/ffffff', 19, 'Corrosion of third degree of unspecified lower leg, subsequent encounter', 'Adverse effect of other antacids and anti-gastric-secretion drugs, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (42, 'Viva', 2, 'http://dummyimage.com/146x100.png/dddddd/000000', 11, 'Rheumatoid arthritis of right wrist with involvement of other organs and systems', 'Laceration with foreign body of left little finger with damage to nail');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (39, 'Zathin', 2, 'http://dummyimage.com/121x100.png/dddddd/000000', 12, 'Eyelid retraction right upper eyelid', 'Laceration with foreign body of left great toe with damage to nail, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (144, 'It', 2, 'http://dummyimage.com/159x100.png/ff4444/ffffff', 3, 'Unspecified choroidal hemorrhage, left eye', 'Lymphoid leukemia, unspecified, in relapse');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (109, 'Voyatouch', 2, 'http://dummyimage.com/113x100.png/ff4444/ffffff', 9, 'Prolonged exposure in deep freeze unit or refrigerator, subsequent encounter', 'Nondisplaced fracture of fourth metatarsal bone, unspecified foot, subsequent encounter for fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (102, 'Tin', 1, 'http://dummyimage.com/126x100.png/5fa2dd/ffffff', 16, 'Maternal care for compound presentation, fetus 5', 'Laceration of axillary or brachial vein, right side, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (71, 'Voltsillam', 1, 'http://dummyimage.com/224x100.png/dddddd/000000', 17, 'Unspecified inflammatory spondylopathy, occipito-atlanto-axial region', 'Burn of second degree of unspecified site of right lower limb, except ankle and foot, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (136, 'Veribet', 2, 'http://dummyimage.com/171x100.png/dddddd/000000', 14, 'Supervision of high risk pregnancy due to social problems, first trimester', 'Nondisplaced fracture of neck of scapula, unspecified shoulder');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (57, 'Ronstring', 2, 'http://dummyimage.com/110x100.png/5fa2dd/ffffff', 12, 'Drowning and submersion in natural water, undetermined intent', 'Paralytic calcification and ossification of muscle, right hand');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (151, 'Opela', 1, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 11, 'Spasm of accommodation, unspecified eye', 'Nondisplaced segmental fracture of shaft of unspecified fibula, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (74, 'Daltfresh', 1, 'http://dummyimage.com/212x100.png/ff4444/ffffff', 11, 'Unstable burst fracture of second thoracic vertebra, initial encounter for open fracture', 'Puncture wound without foreign body of anus, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (46, 'Redhold', 3, 'http://dummyimage.com/129x100.png/ff4444/ffffff', 15, 'Adverse effect of other opioids', 'Strain of flexor muscle, fascia and tendon of left ring finger at forearm level, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (2, 'Viva', 2, 'http://dummyimage.com/171x100.png/cc0000/ffffff', 15, 'Absolute glaucoma', 'Puncture wound with foreign body of right wrist, subsequent encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (43, 'Redhold', 2, 'http://dummyimage.com/195x100.png/5fa2dd/ffffff', 10, 'Encounter for administrative examination', 'Fistula of joint');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (36, 'Ronstring', 1, 'http://dummyimage.com/123x100.png/dddddd/000000', 10, 'Other foreign body or object entering through skin, initial encounter', 'Unspecified superficial injury of unspecified lower leg, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (74, 'Zathin', 2, 'http://dummyimage.com/124x100.png/cc0000/ffffff', 17, 'Unspecified fracture of unspecified thoracic vertebra, initial encounter for open fracture', 'Displaced fracture of head of right radius, sequela');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (196, 'Cookley', 2, 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', 20, 'Other injury of muscle, fascia and tendon of triceps, right arm, subsequent encounter', 'Unstable burst fracture of third lumbar vertebra');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (45, 'Job', 3, 'http://dummyimage.com/115x100.png/cc0000/ffffff', 19, 'Paraneoplastic pemphigus', 'Adverse effect of predominantly beta-adrenoreceptor agonists, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (92, 'Sonair', 1, 'http://dummyimage.com/142x100.png/5fa2dd/ffffff', 15, 'Sprain of jaw, left side, initial encounter', 'Thoracic, thoracolumbar and lumbosacral intervertebral disc disorders with myelopathy');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (47, 'Transcof', 1, 'http://dummyimage.com/183x100.png/cc0000/ffffff', 1, 'Displaced comminuted fracture of shaft of left tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion', 'Fracture of unspecified part of right clavicle, subsequent encounter for fracture with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (196, 'Sonair', 2, 'http://dummyimage.com/206x100.png/dddddd/000000', 15, 'Nondisplaced fracture of right ulna styloid process, subsequent encounter for closed fracture with malunion', 'Displaced fracture of pisiform, right wrist');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (45, 'Overhold', 2, 'http://dummyimage.com/222x100.png/cc0000/ffffff', 3, 'Age-related osteoporosis with current pathological fracture, unspecified shoulder', 'Other fracture of head and neck of left femur, subsequent encounter for open fracture type I or II with delayed healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (190, 'Cookley', 3, 'http://dummyimage.com/105x100.png/cc0000/ffffff', 18, 'Hemorrhagic choroidal detachment, left eye', 'Jumping or diving into natural body of water striking water surface causing other injury');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (188, 'Rank', 2, 'http://dummyimage.com/142x100.png/cc0000/ffffff', 3, 'Stress fracture, unspecified humerus, subsequent encounter for fracture with malunion', 'Nondisplaced fracture of lateral condyle of right tibia, subsequent encounter for closed fracture with routine healing');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (82, 'Andalax', 2, 'http://dummyimage.com/197x100.png/cc0000/ffffff', 8, 'Displaced transverse fracture of shaft of right femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'Sprain of interphalangeal joint of left index finger, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (14, 'Vagram', 2, 'http://dummyimage.com/187x100.png/5fa2dd/ffffff', 10, 'Spontaneous rupture of flexor tendons, upper arm', 'Other specified disorders of Eustachian tube, right ear');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (82, 'Domainer', 3, 'http://dummyimage.com/248x100.png/ff4444/ffffff', 1, 'Puncture wound without foreign body of hand', 'Injury of other nerves at forearm level, right arm');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (95, 'Tin', 3, 'http://dummyimage.com/182x100.png/dddddd/000000', 10, 'Toxic effect of trichloroethylene, accidental (unintentional), initial encounter', 'Anterior subluxation of right ulnohumeral joint');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (174, 'Subin', 2, 'http://dummyimage.com/185x100.png/cc0000/ffffff', 15, 'Displaced transverse fracture of right patella', 'Puncture wound with foreign body of left lesser toe(s) with damage to nail, initial encounter');
insert into lesson (unit_id, name, type, video_url, flashcard_set_id, text, description) values (146, 'Flexidy', 1, 'http://dummyimage.com/104x100.png/ff4444/ffffff', 16, 'Other specified disorders of Eustachian tube', 'Lead-induced chronic gout, right shoulder, without tophus (tophi)');

-- JOIN_COURSE
create table join_course (
	join_course_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into join_course (student_id, course_id) values (7, 2);
insert into join_course (student_id, course_id) values (9, 20);
insert into join_course (student_id, course_id) values (17, 17);
insert into join_course (student_id, course_id) values (14, 26);
insert into join_course (student_id, course_id) values (5, 24);
insert into join_course (student_id, course_id) values (1, 23);
insert into join_course (student_id, course_id) values (10, 19);
insert into join_course (student_id, course_id) values (3, 26);
insert into join_course (student_id, course_id) values (6, 6);
insert into join_course (student_id, course_id) values (13, 13);
insert into join_course (student_id, course_id) values (1, 17);
insert into join_course (student_id, course_id) values (3, 24);
insert into join_course (student_id, course_id) values (13, 23);
insert into join_course (student_id, course_id) values (19, 14);
insert into join_course (student_id, course_id) values (20, 21);

-- JOIN_LESSON
create table join_lesson (
	join_lesson_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	lesson_id INTEGER NOT NULL REFERENCES lesson(lesson_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
insert into join_lesson (student_id, lesson_id) values (15, 78);
insert into join_lesson (student_id, lesson_id) values (13, 83);
insert into join_lesson (student_id, lesson_id) values (20, 173);
insert into join_lesson (student_id, lesson_id) values (3, 220);
insert into join_lesson (student_id, lesson_id) values (6, 136);
insert into join_lesson (student_id, lesson_id) values (19, 293);
insert into join_lesson (student_id, lesson_id) values (17, 102);
insert into join_lesson (student_id, lesson_id) values (15, 236);
insert into join_lesson (student_id, lesson_id) values (14, 166);
insert into join_lesson (student_id, lesson_id) values (1, 181);
insert into join_lesson (student_id, lesson_id) values (17, 225);
insert into join_lesson (student_id, lesson_id) values (13, 271);
insert into join_lesson (student_id, lesson_id) values (7, 165);
insert into join_lesson (student_id, lesson_id) values (18, 38);
insert into join_lesson (student_id, lesson_id) values (19, 231);
insert into join_lesson (student_id, lesson_id) values (15, 225);
insert into join_lesson (student_id, lesson_id) values (7, 183);
insert into join_lesson (student_id, lesson_id) values (2, 199);
insert into join_lesson (student_id, lesson_id) values (8, 105);
insert into join_lesson (student_id, lesson_id) values (15, 49);
insert into join_lesson (student_id, lesson_id) values (5, 123);
insert into join_lesson (student_id, lesson_id) values (11, 171);
insert into join_lesson (student_id, lesson_id) values (7, 273);
insert into join_lesson (student_id, lesson_id) values (10, 83);
insert into join_lesson (student_id, lesson_id) values (7, 259);
insert into join_lesson (student_id, lesson_id) values (3, 218);
insert into join_lesson (student_id, lesson_id) values (15, 148);
insert into join_lesson (student_id, lesson_id) values (3, 138);
insert into join_lesson (student_id, lesson_id) values (16, 10);
insert into join_lesson (student_id, lesson_id) values (12, 213);
insert into join_lesson (student_id, lesson_id) values (10, 36);
insert into join_lesson (student_id, lesson_id) values (11, 20);
insert into join_lesson (student_id, lesson_id) values (18, 82);
insert into join_lesson (student_id, lesson_id) values (19, 275);
insert into join_lesson (student_id, lesson_id) values (18, 267);
insert into join_lesson (student_id, lesson_id) values (4, 166);
insert into join_lesson (student_id, lesson_id) values (1, 196);
insert into join_lesson (student_id, lesson_id) values (8, 54);
insert into join_lesson (student_id, lesson_id) values (12, 285);
insert into join_lesson (student_id, lesson_id) values (9, 124);
insert into join_lesson (student_id, lesson_id) values (3, 34);
insert into join_lesson (student_id, lesson_id) values (14, 274);
insert into join_lesson (student_id, lesson_id) values (9, 268);
insert into join_lesson (student_id, lesson_id) values (18, 10);
insert into join_lesson (student_id, lesson_id) values (19, 61);
insert into join_lesson (student_id, lesson_id) values (20, 8);
insert into join_lesson (student_id, lesson_id) values (9, 280);
insert into join_lesson (student_id, lesson_id) values (12, 106);
insert into join_lesson (student_id, lesson_id) values (4, 75);
insert into join_lesson (student_id, lesson_id) values (18, 287);

-- NOTE
create table note (
	note_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	lesson_id INTEGER NOT NULL REFERENCES lesson(lesson_id),
	note TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON note
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into note (student_id, lesson_id, note) values (20, 141, 'Nicotine dependence, chewing tobacco, with withdrawal');
insert into note (student_id, lesson_id, note) values (4, 7, 'Causalgia of unspecified lower limb');
insert into note (student_id, lesson_id, note) values (8, 103, 'Contusion and laceration of left cerebrum without loss of consciousness');
insert into note (student_id, lesson_id, note) values (17, 17, 'Other reduction defects of left lower limb');
insert into note (student_id, lesson_id, note) values (2, 245, 'Acute hematogenous osteomyelitis, right humerus');
insert into note (student_id, lesson_id, note) values (18, 286, 'Displaced transverse fracture of shaft of right tibia, subsequent encounter for open fracture type I or II with delayed healing');
insert into note (student_id, lesson_id, note) values (6, 150, 'Open bite of unspecified wrist, initial encounter');
insert into note (student_id, lesson_id, note) values (12, 103, 'Fracture of unspecified carpal bone, left wrist');
insert into note (student_id, lesson_id, note) values (1, 105, 'Strain of muscle, fascia and tendon of long head of biceps, left arm');
insert into note (student_id, lesson_id, note) values (14, 29, 'Major laceration of tail of pancreas, initial encounter');
insert into note (student_id, lesson_id, note) values (7, 197, 'Acute lymphadenitis');
insert into note (student_id, lesson_id, note) values (16, 69, 'Displaced fracture of greater trochanter of left femur, initial encounter for open fracture type IIIA, IIIB, or IIIC');
insert into note (student_id, lesson_id, note) values (8, 37, 'Unspecified occupant of three-wheeled motor vehicle injured in collision with railway train or railway vehicle in nontraffic accident, initial encounter');
insert into note (student_id, lesson_id, note) values (3, 83, 'Other physeal fracture of lower end of left tibia, subsequent encounter for fracture with malunion');
insert into note (student_id, lesson_id, note) values (13, 153, 'Insect bite of other specified part of neck');
insert into note (student_id, lesson_id, note) values (10, 90, 'Posterior dislocation of right radial head, initial encounter');
insert into note (student_id, lesson_id, note) values (20, 55, 'Corrosion of third degree of right shoulder, sequela');
insert into note (student_id, lesson_id, note) values (20, 1, 'Displaced fracture of posterior column [ilioischial] of left acetabulum');
insert into note (student_id, lesson_id, note) values (16, 80, 'Intraoperative hemorrhage and hematoma of an endocrine system organ or structure complicating other procedure');
insert into note (student_id, lesson_id, note) values (4, 12, 'Partial traumatic metacarpophalangeal amputation of right ring finger');
insert into note (student_id, lesson_id, note) values (19, 99, 'Nondisplaced spiral fracture of shaft of right tibia');
insert into note (student_id, lesson_id, note) values (5, 102, 'Left lower quadrant pain');
insert into note (student_id, lesson_id, note) values (13, 236, 'Other malformation of placenta, second trimester');
insert into note (student_id, lesson_id, note) values (9, 38, 'Nondisplaced osteochondral fracture of left patella, subsequent encounter for closed fracture with malunion');
insert into note (student_id, lesson_id, note) values (18, 266, 'Toxic effect of carbon monoxide from other source, accidental (unintentional), initial encounter');
insert into note (student_id, lesson_id, note) values (18, 155, 'Nondisplaced fracture of medial condyle of left femur, initial encounter for closed fracture');
insert into note (student_id, lesson_id, note) values (16, 195, 'Other specified malignant neoplasm of skin of left upper limb, including shoulder');
insert into note (student_id, lesson_id, note) values (17, 28, 'Acquired atrophy of ovary, unspecified side');
insert into note (student_id, lesson_id, note) values (1, 213, 'Other contact with other marine mammals, subsequent encounter');
insert into note (student_id, lesson_id, note) values (1, 8, 'Unspecified open wound of unspecified lesser toe(s) with damage to nail, subsequent encounter');
insert into note (student_id, lesson_id, note) values (4, 254, 'Toxic effect of nitroderivatives and aminoderivatives of benzene and its homologues, undetermined, subsequent encounter');
insert into note (student_id, lesson_id, note) values (17, 184, 'Infection and inflammatory reaction due to internal left knee prosthesis');
insert into note (student_id, lesson_id, note) values (18, 65, 'Pathological fracture in other disease, left hand, sequela');
insert into note (student_id, lesson_id, note) values (3, 75, 'Other rupture of muscle (nontraumatic), right ankle and foot');
insert into note (student_id, lesson_id, note) values (10, 238, 'Effusion, right wrist');
insert into note (student_id, lesson_id, note) values (17, 91, 'Dislocation of unspecified parts of unspecified shoulder girdle, subsequent encounter');
insert into note (student_id, lesson_id, note) values (18, 185, 'Drowning and submersion due to fall off sailboat');
insert into note (student_id, lesson_id, note) values (2, 225, 'Unspecified fracture of left forearm, subsequent encounter for open fracture type I or II with malunion');
insert into note (student_id, lesson_id, note) values (20, 48, 'Laceration of other flexor muscle, fascia and tendon at forearm level, unspecified arm, initial encounter');
insert into note (student_id, lesson_id, note) values (1, 127, 'Contusion of unspecified foot, initial encounter');
insert into note (student_id, lesson_id, note) values (5, 165, 'Paraneoplastic neuromyopathy and neuropathy');
insert into note (student_id, lesson_id, note) values (13, 70, 'Displaced oblique fracture of shaft of left radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing');
insert into note (student_id, lesson_id, note) values (2, 296, 'Unspecified transplanted organ and tissue rejection');
insert into note (student_id, lesson_id, note) values (18, 128, 'Unspecified physeal fracture of phalanx of right toe, initial encounter for closed fracture');
insert into note (student_id, lesson_id, note) values (11, 54, 'Retinopathy of prematurity, stage 0, left eye');
insert into note (student_id, lesson_id, note) values (6, 292, 'Dislocation of interphalangeal joint of right lesser toe(s), initial encounter');
insert into note (student_id, lesson_id, note) values (16, 151, 'Injury of trigeminal nerve, left side');
insert into note (student_id, lesson_id, note) values (7, 126, 'Unspecified injury of left internal jugular vein, subsequent encounter');
insert into note (student_id, lesson_id, note) values (18, 206, 'Salmonella pneumonia');
insert into note (student_id, lesson_id, note) values (15, 131, 'Corrosion of third degree of multiple sites of lower limb, except ankle and foot');

-- RATING
create table rating (
	rating_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id),
	rate INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON rating
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into rating (student_id, course_id, rate) values (13, 24, 3);
insert into rating (student_id, course_id, rate) values (5, 14, 5);
insert into rating (student_id, course_id, rate) values (14, 4, 4);
insert into rating (student_id, course_id, rate) values (2, 17, 3);
insert into rating (student_id, course_id, rate) values (14, 15, 4);
insert into rating (student_id, course_id, rate) values (12, 8, 1);
insert into rating (student_id, course_id, rate) values (4, 10, 4);
insert into rating (student_id, course_id, rate) values (18, 29, 5);
insert into rating (student_id, course_id, rate) values (14, 30, 4);
insert into rating (student_id, course_id, rate) values (5, 7, 2);
insert into rating (student_id, course_id, rate) values (5, 1, 3);
insert into rating (student_id, course_id, rate) values (7, 4, 3);
insert into rating (student_id, course_id, rate) values (19, 25, 2);
insert into rating (student_id, course_id, rate) values (3, 2, 1);
insert into rating (student_id, course_id, rate) values (5, 22, 4);
insert into rating (student_id, course_id, rate) values (16, 18, 4);
insert into rating (student_id, course_id, rate) values (18, 1, 3);
insert into rating (student_id, course_id, rate) values (17, 11, 1);
insert into rating (student_id, course_id, rate) values (12, 15, 1);
insert into rating (student_id, course_id, rate) values (11, 16, 3);
insert into rating (student_id, course_id, rate) values (5, 15, 1);
insert into rating (student_id, course_id, rate) values (11, 5, 5);
insert into rating (student_id, course_id, rate) values (19, 4, 2);
insert into rating (student_id, course_id, rate) values (18, 12, 4);
insert into rating (student_id, course_id, rate) values (6, 29, 1);
insert into rating (student_id, course_id, rate) values (14, 8, 3);
insert into rating (student_id, course_id, rate) values (13, 24, 4);
insert into rating (student_id, course_id, rate) values (20, 21, 4);
insert into rating (student_id, course_id, rate) values (2, 25, 3);
insert into rating (student_id, course_id, rate) values (3, 26, 5);
insert into rating (student_id, course_id, rate) values (18, 26, 2);
insert into rating (student_id, course_id, rate) values (4, 22, 3);
insert into rating (student_id, course_id, rate) values (17, 29, 2);
insert into rating (student_id, course_id, rate) values (14, 30, 3);
insert into rating (student_id, course_id, rate) values (6, 17, 3);
insert into rating (student_id, course_id, rate) values (14, 10, 3);
insert into rating (student_id, course_id, rate) values (12, 25, 2);
insert into rating (student_id, course_id, rate) values (5, 27, 5);
insert into rating (student_id, course_id, rate) values (7, 16, 4);
insert into rating (student_id, course_id, rate) values (18, 5, 4);
insert into rating (student_id, course_id, rate) values (15, 19, 2);
insert into rating (student_id, course_id, rate) values (9, 24, 2);
insert into rating (student_id, course_id, rate) values (1, 2, 1);
insert into rating (student_id, course_id, rate) values (15, 19, 4);
insert into rating (student_id, course_id, rate) values (17, 8, 4);
insert into rating (student_id, course_id, rate) values (1, 4, 3);
insert into rating (student_id, course_id, rate) values (5, 18, 2);
insert into rating (student_id, course_id, rate) values (12, 4, 2);
insert into rating (student_id, course_id, rate) values (20, 5, 2);
insert into rating (student_id, course_id, rate) values (9, 19, 1);

-- COMMENT
create table comment (
	comment_id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES users(user_id),
	course_id INTEGER NOT NULL REFERENCES course(course_id),
	content TEXT,
	respond_id INTEGER REFERENCES comment(comment_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON comment
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into comment (student_id, course_id, content, respond_id) values (14, 8, 'Pointe-à-Pitre Le Raizet', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 18, 'Bologna Guglielmo Marconi Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 25, 'Yakataga Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (19, 23, 'Hearst René Fontaine Municipal Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 9, 'Galegu Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (18, 30, 'Piedmont Triad International Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 22, 'Hollister Municipal Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (15, 7, 'Urrao Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (18, 16, 'Luang Namtha Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (11, 3, 'Persian Gulf International Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (7, 30, 'Orinduik Airport', 6);
insert into comment (student_id, course_id, content, respond_id) values (1, 6, 'Overberg Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (2, 12, 'Eaker Field', null);
insert into comment (student_id, course_id, content, respond_id) values (8, 19, 'Pecos Municipal Airport', 5);
insert into comment (student_id, course_id, content, respond_id) values (2, 6, 'Chuuk International Airport', 6);
insert into comment (student_id, course_id, content, respond_id) values (10, 26, 'Parachinar Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (18, 17, 'St Catherine International Airport', 1);
insert into comment (student_id, course_id, content, respond_id) values (6, 7, 'New Ishigaki Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (4, 18, 'Herat Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (1, 4, 'Miller Field', null);
insert into comment (student_id, course_id, content, respond_id) values (17, 2, 'Chi Mei Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (18, 19, 'Pond Inlet Airport', 13);
insert into comment (student_id, course_id, content, respond_id) values (11, 21, 'Ouvéa Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (7, 13, 'Fort McMurray / Mildred Lake Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 2, 'Round Lake (Weagamow Lake) Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (2, 4, 'Allakaket Airport', 9);
insert into comment (student_id, course_id, content, respond_id) values (6, 19, 'Bimin Airport', 8);
insert into comment (student_id, course_id, content, respond_id) values (13, 8, 'Mojica Airport', 15);
insert into comment (student_id, course_id, content, respond_id) values (1, 6, 'Juína Airport', 11);
insert into comment (student_id, course_id, content, respond_id) values (15, 12, 'Balgo Hill Airport', 12);
insert into comment (student_id, course_id, content, respond_id) values (5, 8, 'Surgut Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (11, 18, 'Kilimanjaro International Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 3, 'Mareb Airport', 6);
insert into comment (student_id, course_id, content, respond_id) values (13, 14, 'Baicheng Chang''an Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (5, 23, 'Tongliao Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (3, 9, 'Robert L. Bradshaw International Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (16, 15, 'Paamiut Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (17, 4, 'South Jersey Regional Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (20, 5, 'Big Creek Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (1, 22, 'Latrobe Airport', 6);
insert into comment (student_id, course_id, content, respond_id) values (12, 2, 'Atlantic City International Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (4, 17, 'Bandon State Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (19, 14, 'Obbia Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (6, 14, 'San Carlos', 32);
insert into comment (student_id, course_id, content, respond_id) values (9, 17, 'Los Cerrillos Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (3, 24, 'Uttaradit Airport', 37);
insert into comment (student_id, course_id, content, respond_id) values (14, 22, 'Waukon Municipal Airport', 2);
insert into comment (student_id, course_id, content, respond_id) values (13, 9, 'Iliamna Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (18, 13, 'Ludhiana Airport', null);
insert into comment (student_id, course_id, content, respond_id) values (13, 15, 'Conakry International Airport', null);

-- ROLE
create table roles (
	role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON roles
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into roles (role_name) values ('Admin');
insert into roles (role_name) values ('Teaching Staff');
insert into roles (role_name) values ('Teacher');
insert into roles (role_name) values ('Student');

-- USER_TO_ROLE
create table user_to_role (
	user_to_role_id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL REFERENCES users(user_id),
	role_id INTEGER NOT NULL REFERENCES roles(role_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON user_to_role
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into user_to_role (user_id, role_id) values (1, 4);
insert into user_to_role (user_id, role_id) values (2, 3);
insert into user_to_role (user_id, role_id) values (3, 3);
insert into user_to_role (user_id, role_id) values (4, 1);
insert into user_to_role (user_id, role_id) values (5, 2);
insert into user_to_role (user_id, role_id) values (6, 4);
insert into user_to_role (user_id, role_id) values (7, 4);
insert into user_to_role (user_id, role_id) values (8, 2);
insert into user_to_role (user_id, role_id) values (9, 1);
insert into user_to_role (user_id, role_id) values (10, 2);
insert into user_to_role (user_id, role_id) values (11, 1);
insert into user_to_role (user_id, role_id) values (12, 2);
insert into user_to_role (user_id, role_id) values (13, 3);
insert into user_to_role (user_id, role_id) values (14, 1);
insert into user_to_role (user_id, role_id) values (15, 1);
insert into user_to_role (user_id, role_id) values (16, 3);
insert into user_to_role (user_id, role_id) values (17, 2);
insert into user_to_role (user_id, role_id) values (18, 1);
insert into user_to_role (user_id, role_id) values (19, 3);
insert into user_to_role (user_id, role_id) values (20, 1);

--SLIDE
create table slide (
    slide_id SERIAL PRIMARY KEY,
	sequence SERIAL NOT NULL,
	lesson_id INTEGER REFERENCES lesson(lesson_id),
	text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON slide
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

insert into slide (sequence, lesson_id, text) values (1, 75, 'Poisoning by anticoagulants, assault, initial encounter');
insert into slide (sequence, lesson_id, text) values (2, 126, 'Poisoning by antipruritics, undetermined, initial encounter');
insert into slide (sequence, lesson_id, text) values (3, 165, 'Congenital malformation of musculoskeletal system, unspecified');
insert into slide (sequence, lesson_id, text) values (4, 139, 'Retained (old) magnetic foreign body in vitreous body, unspecified eye');
insert into slide (sequence, lesson_id, text) values (5, 145, 'Superficial frostbite of unspecified ear, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (6, 120, 'Displaced fracture of distal phalanx of left lesser toe(s), subsequent encounter for fracture with routine healing');
insert into slide (sequence, lesson_id, text) values (7, 267, 'Osteomyelitis of right orbit');
insert into slide (sequence, lesson_id, text) values (8, 78, 'Poisoning by anthelminthics, undetermined, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (9, 106, 'Presence of fully implantable artificial heart');
insert into slide (sequence, lesson_id, text) values (10, 206, 'Unspecified open wound of unspecified great toe with damage to nail, sequela');
insert into slide (sequence, lesson_id, text) values (11, 233, 'Corrosion of unspecified degree of right axilla, initial encounter');
insert into slide (sequence, lesson_id, text) values (12, 17, 'Puncture wound of lip and oral cavity with foreign body');
insert into slide (sequence, lesson_id, text) values (13, 169, 'Burn of first degree of single right finger (nail) except thumb, initial encounter');
insert into slide (sequence, lesson_id, text) values (14, 257, 'Asphyxiation due to smothering in furniture, accidental, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (15, 65, 'Contusion and laceration of left cerebrum with loss of consciousness greater than 24 hours with return to pre-existing conscious level, initial encounter');
insert into slide (sequence, lesson_id, text) values (16, 183, 'Torus fracture of upper end of unspecified tibia, subsequent encounter for fracture with routine healing');
insert into slide (sequence, lesson_id, text) values (17, 296, 'Other juvenile arthritis, right ankle and foot');
insert into slide (sequence, lesson_id, text) values (18, 187, 'Displaced fracture of lunate [semilunar], left wrist, subsequent encounter for fracture with nonunion');
insert into slide (sequence, lesson_id, text) values (19, 221, 'Superficial foreign body, unspecified ankle, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (20, 266, 'Pedestrian on foot injured in collision with roller-skater, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (21, 2, 'Contusion of right eyelid and periocular area');
insert into slide (sequence, lesson_id, text) values (22, 285, 'Other specified fracture of unspecified pubis, subsequent encounter for fracture with delayed healing');
insert into slide (sequence, lesson_id, text) values (23, 185, 'Cerebral infarction due to unspecified occlusion or stenosis of unspecified cerebellar artery');
insert into slide (sequence, lesson_id, text) values (24, 38, 'Venous complication in pregnancy, unspecified, first trimester');
insert into slide (sequence, lesson_id, text) values (25, 46, 'Third [oculomotor] nerve palsy');
insert into slide (sequence, lesson_id, text) values (26, 116, 'Epidural hemorrhage with loss of consciousness of any duration with death due to other causes prior to regaining consciousness');
insert into slide (sequence, lesson_id, text) values (27, 288, 'Minor laceration of femoral artery, right leg, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (28, 34, 'Generalized contraction of visual field, right eye');
insert into slide (sequence, lesson_id, text) values (29, 89, 'Dislocation of other internal joint prosthesis, sequela');
insert into slide (sequence, lesson_id, text) values (30, 37, 'Salter-Harris Type IV physeal fracture of upper end of radius, left arm, subsequent encounter for fracture with delayed healing');
insert into slide (sequence, lesson_id, text) values (31, 281, 'Unstable burst fracture of second lumbar vertebra, sequela');
insert into slide (sequence, lesson_id, text) values (32, 147, 'Diseases of the digestive system complicating pregnancy, unspecified trimester');
insert into slide (sequence, lesson_id, text) values (33, 143, 'Underdosing of other drug primarily affecting the autonomic nervous system, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (34, 143, 'Anterior cerebral artery syndrome');
insert into slide (sequence, lesson_id, text) values (35, 203, 'Toxic effect of contact with venomous toad, undetermined, sequela');
insert into slide (sequence, lesson_id, text) values (36, 188, 'Chronic atticoantral suppurative otitis media, left ear');
insert into slide (sequence, lesson_id, text) values (37, 263, 'Other mastoiditis and related conditions, left ear');
insert into slide (sequence, lesson_id, text) values (38, 217, 'Tidal wave due to earthquake or volcanic eruption, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (39, 5, 'Poisoning by histamine H2-receptor blockers, accidental (unintentional), sequela');
insert into slide (sequence, lesson_id, text) values (40, 69, 'Unspecified fracture of lower end of unspecified femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing');
insert into slide (sequence, lesson_id, text) values (41, 120, 'Laceration of popliteal artery');
insert into slide (sequence, lesson_id, text) values (42, 59, 'Person on outside of car injured in collision with sport utility vehicle in nontraffic accident');
insert into slide (sequence, lesson_id, text) values (43, 36, 'Newborn affected by abnormality in fetal (intrauterine) heart rate or rhythm, unspecified as to time of onset');
insert into slide (sequence, lesson_id, text) values (44, 46, 'Drowning and submersion due to watercraft overturning');
insert into slide (sequence, lesson_id, text) values (45, 298, 'Accident to, on or involving ice yacht, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (46, 151, 'Major osseous defect, unspecified lower leg');
insert into slide (sequence, lesson_id, text) values (47, 33, 'Laceration of blood vessel of right index finger, initial encounter');
insert into slide (sequence, lesson_id, text) values (48, 110, 'Unspecified motorcycle rider injured in collision with other motor vehicles in traffic accident, sequela');
insert into slide (sequence, lesson_id, text) values (49, 3, 'Poisoning by sulfonamides, accidental (unintentional), subsequent encounter');
insert into slide (sequence, lesson_id, text) values (50, 82, 'Stress fracture, right ankle, initial encounter for fracture');
insert into slide (sequence, lesson_id, text) values (51, 273, 'Other fracture of upper end of right radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing');
insert into slide (sequence, lesson_id, text) values (52, 67, 'Pre-eclampsia');
insert into slide (sequence, lesson_id, text) values (53, 198, 'Accidental puncture and laceration of left eye and adnexa during an ophthalmic procedure');
insert into slide (sequence, lesson_id, text) values (54, 101, 'Encounter for fitting and adjustment of other specified devices');
insert into slide (sequence, lesson_id, text) values (55, 126, 'Coma scale, eyes open, to sound, 24 hours or more after hospital admission');
insert into slide (sequence, lesson_id, text) values (56, 173, 'Calculus of lower urinary tract');
insert into slide (sequence, lesson_id, text) values (57, 137, 'Anomalies of pupillary function');
insert into slide (sequence, lesson_id, text) values (58, 218, 'Pilonidal sinus with abscess');
insert into slide (sequence, lesson_id, text) values (59, 146, 'Maternal care for (suspected) fetal abnormality and damage, unspecified, fetus 1');
insert into slide (sequence, lesson_id, text) values (60, 24, 'Other fracture of head and neck of right femur, subsequent encounter for open fracture type I or II with delayed healing');
insert into slide (sequence, lesson_id, text) values (61, 173, 'Displaced associated transverse-posterior fracture of left acetabulum');
insert into slide (sequence, lesson_id, text) values (62, 7, 'Drug-induced chronic gout, unspecified knee, with tophus (tophi)');
insert into slide (sequence, lesson_id, text) values (63, 229, 'Arthropathies in other diseases classified elsewhere');
insert into slide (sequence, lesson_id, text) values (64, 86, 'Subluxation of interphalangeal joint of unspecified lesser toe(s), initial encounter');
insert into slide (sequence, lesson_id, text) values (65, 96, 'Unspecified nondisplaced fracture of sixth cervical vertebra, initial encounter for closed fracture');
insert into slide (sequence, lesson_id, text) values (66, 23, 'Exposure to tanning bed');
insert into slide (sequence, lesson_id, text) values (67, 269, 'Underdosing of ophthalmological drugs and preparations');
insert into slide (sequence, lesson_id, text) values (68, 40, 'Displaced apophyseal fracture of left femur, initial encounter for closed fracture');
insert into slide (sequence, lesson_id, text) values (69, 66, 'Toxic effect of metals');
insert into slide (sequence, lesson_id, text) values (70, 204, 'Other mechanical complication of carotid arterial graft (bypass)');
insert into slide (sequence, lesson_id, text) values (71, 283, 'Poisoning by unspecified drugs, medicaments and biological substances, assault, initial encounter');
insert into slide (sequence, lesson_id, text) values (72, 42, 'Nondisplaced intertrochanteric fracture of left femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing');
insert into slide (sequence, lesson_id, text) values (73, 48, 'Unspecified motorcycle rider injured in collision with other motor vehicles in traffic accident');
insert into slide (sequence, lesson_id, text) values (74, 17, 'Carcinoma in situ of rectosigmoid junction');
insert into slide (sequence, lesson_id, text) values (75, 278, 'Iridoschisis, unspecified eye');
insert into slide (sequence, lesson_id, text) values (76, 70, 'Nondisplaced fracture of coronoid process of right ulna, subsequent encounter for closed fracture with delayed healing');
insert into slide (sequence, lesson_id, text) values (77, 294, 'Other mechanical complication of prosthetic orbit of right eye, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (78, 73, 'Nondisplaced oblique fracture of shaft of right fibula, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion');
insert into slide (sequence, lesson_id, text) values (79, 246, 'Mild laceration of heart with hemopericardium, initial encounter');
insert into slide (sequence, lesson_id, text) values (80, 125, 'Pathological fracture, left fibula, subsequent encounter for fracture with malunion');
insert into slide (sequence, lesson_id, text) values (81, 214, 'Other contact with pig, initial encounter');
insert into slide (sequence, lesson_id, text) values (82, 163, 'Injury of pleura');
insert into slide (sequence, lesson_id, text) values (83, 26, 'Continuing pregnancy after intrauterine death of one fetus or more, first trimester, fetus 4');
insert into slide (sequence, lesson_id, text) values (84, 137, 'Subluxation of metacarpal (bone), proximal end of unspecified hand, initial encounter');
insert into slide (sequence, lesson_id, text) values (85, 263, 'Cervicalgia');
insert into slide (sequence, lesson_id, text) values (86, 156, 'Nondisplaced osteochondral fracture of right patella, subsequent encounter for closed fracture with routine healing');
insert into slide (sequence, lesson_id, text) values (87, 27, 'Other injury of rectum, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (88, 219, 'Displaced fracture of greater trochanter of right femur, initial encounter for closed fracture');
insert into slide (sequence, lesson_id, text) values (89, 221, 'Injury of optic nerve, left eye, sequela');
insert into slide (sequence, lesson_id, text) values (90, 166, 'Other specified disorders of synovium and tendon, unspecified knee');
insert into slide (sequence, lesson_id, text) values (91, 185, 'Poisoning by aminoglycosides, intentional self-harm, sequela');
insert into slide (sequence, lesson_id, text) values (92, 275, 'Laceration of other blood vessels at hip and thigh level, unspecified leg');
insert into slide (sequence, lesson_id, text) values (93, 114, 'Unspecified car occupant injured in collision with fixed or stationary object in traffic accident');
insert into slide (sequence, lesson_id, text) values (94, 209, 'Nondisplaced spiral fracture of shaft of unspecified tibia, subsequent encounter for closed fracture with nonunion');
insert into slide (sequence, lesson_id, text) values (95, 31, 'War operations involving flamethrower, civilian, subsequent encounter');
insert into slide (sequence, lesson_id, text) values (96, 295, 'Nondisplaced fracture (avulsion) of lateral epicondyle of left humerus, initial encounter for open fracture');
insert into slide (sequence, lesson_id, text) values (97, 125, 'Struck by other hit or thrown ball, initial encounter');
insert into slide (sequence, lesson_id, text) values (98, 75, 'Secondary osteoarthritis, left ankle and foot');
insert into slide (sequence, lesson_id, text) values (99, 70, 'Person on outside of pick-up truck or van injured in noncollision transport accident in nontraffic accident, sequela');
insert into slide (sequence, lesson_id, text) values (100, 191, 'Unspecified physeal fracture of upper end of unspecified fibula');
