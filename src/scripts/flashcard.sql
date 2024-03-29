-- DROP TABLE learnt_list;
-- DROP TABLE flashcard_share_permit;
-- DROP TABLE flashcard;
-- DROP TABLE flashcard_set;
-- DROP TABLE flashcard_type;

-- Flashcard type
CREATE TABLE flashcard_type (
  fc_type_id SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  description TEXT,
  sets_count INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON flashcard_type
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

INSERT INTO flashcard_type(type, description) VALUES('IELTS', 'Flashcard liên quan tới IELTS. Học chúng sẽ giúp bạn làm bài thi IELTS mượt như cá gặp nước.');
INSERT INTO flashcard_type(type, description) VALUES('TOEIC', 'Cung cấp cho bạn hàng tỉ flashcard. Bạn sẽ không còn sợ khi làm bài thi TOEIC nữa.');
INSERT INTO flashcard_type(type, description) VALUES('Từ vựng hàng ngày', '10 phút mỗi ngày với những từ vựng này, sau 1 tháng bạn bỗng trở thành người bản xứ.');

-- Flashcard set
create table flashcard_set (
  fc_set_id SERIAL PRIMARY KEY,
  fc_type_id INTEGER REFERENCES flashcard_type(fc_type_id) ON DELETE CASCADE,
	name TEXT NOT NULL,
	description TEXT,
  words_count INTEGER DEFAULT 0,
	system_belong BOOLEAN DEFAULT false,
	access VARCHAR(16),
	views INT DEFAULT 0,
	created_by INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON flashcard_set
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();


-- TRIGGER
CREATE OR REPLACE FUNCTION update_sets_count()
RETURNS trigger AS 
$$
	DECLARE update_count INT; type_id INT;
	BEGIN
		IF TG_OP = 'INSERT' THEN	
			type_id = NEW.fc_type_id;
		ELSE
			type_id = OLD.fc_type_id;
		END IF;

		update_count = (SELECT COUNT(*) FROM flashcard_set fs WHERE fs.fc_type_id = type_id);
		UPDATE flashcard_type ft SET sets_count = update_count WHERE ft.fc_type_id = type_id;
		RAISE NOTICE 'Update sets count of type: %', type_id;

		RETURN NULL;
	END;
$$
LANGUAGE 'plpgsql';

-- Create trigger
CREATE TRIGGER update_sets_count_trigger
AFTER INSERT OR DELETE ON flashcard_set
FOR EACH ROW
EXECUTE FUNCTION update_sets_count();


insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'Microcebus murinus', 'Dilation of Face Artery, Bifurcation, with Drug-eluting Intraluminal Device, Open Approach', false, 'private', 846, 11);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Naja haje', 'Release Left Inguinal Lymphatic, Open Approach', true, 'private', 739, 7);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'Petaurus breviceps', 'Fragmentation in Ampulla of Vater, Percutaneous Approach', false, 'public', 265, 12);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Phalaropus lobatus', 'Dilation of Right Ureter with Intraluminal Device, Percutaneous Approach', false, 'public', 967, 4);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Alligator mississippiensis', 'Insertion of Infusion Device into Lumbar Vertebral Joint, Open Approach', true, 'private', 254, 8);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'Paraxerus cepapi', 'Replacement of Lower Artery with Nonautologous Tissue Substitute, Open Approach', true, 'public', 22, 13);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Crocuta crocuta', 'Dilation of Right Radial Artery with Two Intraluminal Devices, Open Approach', true, 'private', 995, 17);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Choloepus hoffmani', 'Urinary System, Bypass', false, 'private', 446, 17);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'unavailable', 'Bypass Left Lesser Saphenous Vein to Lower Vein with Autologous Arterial Tissue, Open Approach', false, 'public', 969, 5);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Raphicerus campestris', 'Division of Left Upper Leg Subcutaneous Tissue and Fascia, Percutaneous Approach', false, 'private', 419, 4);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Phalacrocorax varius', 'Therapeutic Exercise Treatment of Integumentary System - Lower Back / Lower Extremity using Other Equipment', true, 'public', 437, 9);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (3, 'Bubalus arnee', 'Plain Radiography of Vasa Vasorum using Low Osmolar Contrast', true, 'private', 268, 8);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'Phalaropus fulicarius', 'Extraction of Left Shoulder Bursa and Ligament, Open Approach', false, 'private', 198, 12);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (3, 'Heloderma horridum', 'Lower Arteries, Drainage', false, 'public', 441, 7);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (1, 'Columba palumbus', 'Replacement of Left Hand Artery with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach', false, 'public', 360, 2);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Felis wiedi or Leopardus weidi', 'Extirpation of Matter from Right Hip Joint, Percutaneous Endoscopic Approach', true, 'private', 309, 11);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (2, 'Crotaphytus collaris', 'Revision of Synthetic Substitute in Left Breast, Via Natural or Artificial Opening Endoscopic', false, 'private', 177, 12);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (3, 'Lamprotornis nitens', 'Drainage of Right Thumb Phalanx, Percutaneous Approach', false, 'public', 960, 7);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (3, 'Psophia viridis', 'Bypass Left Ureter to Cutaneous with Autologous Tissue Substitute, Percutaneous Endoscopic Approach', false, 'private', 221, 15);
insert into flashcard_set (fc_type_id, name, description, system_belong, access, views, created_by) values (3, 'Tayassu tajacu', 'Supplement Right Thyroid Artery with Nonautologous Tissue Substitute, Percutaneous Approach', true, 'private', 876, 3);

-- Flashcard
create table flashcard (
  fc_id SERIAL PRIMARY KEY,
	fc_set_id INT REFERENCES flashcard_set(fc_set_id) ON DELETE CASCADE,
	word TEXT NOT NULL,
	meaning TEXT NOT NULL,
	type_of_word VARCHAR(15) NOT NULL,
	pronounce TEXT,
	audio TEXT,
	example TEXT,
	note TEXT,
	image TEXT,
	created_by INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER update_db_timestamp BEFORE UPDATE
ON flashcard
FOR EACH ROW
EXECUTE PROCEDURE update_timestamp();

-- TRIGGER
CREATE OR REPLACE FUNCTION update_words_count()
RETURNS trigger AS 
$$
	DECLARE update_count INT; set_id INT;
	BEGIN
		IF TG_OP = 'INSERT' THEN	
			set_id = NEW.fc_set_id;
		ELSE
			set_id = OLD.fc_set_id;
		END IF;

		update_count = (SELECT COUNT(*) FROM flashcard f WHERE f.fc_set_id = set_id);
		UPDATE flashcard_set fs SET words_count = update_count WHERE fs.fc_set_id = set_id;
		RAISE NOTICE 'Value: %', set_id;

		RETURN NULL;
	END;
$$
LANGUAGE 'plpgsql';

-- Create trigger
CREATE TRIGGER update_words_count_trigger
AFTER INSERT OR DELETE ON flashcard
FOR EACH ROW
EXECUTE FUNCTION update_words_count();

insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'euismod', 'Acquired clawhand, left hand', 'id', 'Unspecified injury of flexor muscle, fascia and tendon of left index finger at wrist and hand level, sequela', 'Drowning and submersion due to other accident to canoe or kayak', null, null, 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'primis', 'Epiphora due to insufficient drainage', 'odio', 'Malignant poorly differentiated neuroendocrine tumors', 'Corrosion of unspecified degree of multiple left fingers (nail), not including thumb', 'Displaced comminuted fracture of shaft of left femur, subsequent encounter for closed fracture with routine healing', 'http://dummyimage.com/178x100.png/cc0000/ffffff', 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'semper', 'Strain of flexor muscle, fascia and tendon of right thumb at forearm level, subsequent encounter', 'faucibus', 'Exposure to other man-made environmental factors', 'Poisoning by propionic acid derivatives, accidental (unintentional), sequela', null, null, 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'purus', 'Other disorders of autonomic nervous system', 'ipsum', 'Nondisplaced fracture of trapezium [larger multangular], right wrist', 'Subluxation of C0/C1 cervical vertebrae', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'eu', 'Other lymphoid leukemia', 'lobortis', 'Unspecified mood [affective] disorder', 'War operations involving explosion of improvised explosive device [IED], civilian', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'ultrices', 'Displaced fracture of medial phalanx of unspecified finger, subsequent encounter for fracture with nonunion', 'vel', 'Drowning and submersion due to falling or jumping from crushed passenger ship', 'Pedestrian injured in collision with other nonmotor vehicle in traffic accident', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'primis', 'Laceration of long flexor muscle, fascia and tendon of thumb at wrist and hand level', 'vestibulum', 'Superficial foreign body of unspecified hand, initial encounter', 'Partial traumatic amputation at knee level, left lower leg', 'Accidental malfunction of paintball gun, sequela', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'nulla', 'Whooping cough, unspecified species', 'primis', 'Crushed between (nonpowered) inflatable craft and other watercraft or other object due to collision, subsequent encounter', 'Moderate laceration of left kidney', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'purus', 'Corrosion of third degree of multiple sites of right shoulder and upper limb, except wrist and hand, initial encounter', 'habitasse', 'Dislocation of interphalangeal joint of left lesser toe(s), subsequent encounter', 'Basal cell carcinoma of skin of right ear and external auricular canal', null, null, 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'cras', 'Chronic meningococcemia', 'felis', 'Fibrosis due to nervous system prosthetic devices, implants and grafts', 'Other displaced fracture of base of first metacarpal bone, right hand, initial encounter for closed fracture', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'ac', 'Fracture of hook process of hamate [unciform] bone', 'cubilia', 'Myositis ossificans progressiva, right lower leg', 'Poisoning by diagnostic agents, intentional self-harm, subsequent encounter', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'erat', 'Traumatic spondylopathy, thoracolumbar region', 'cras', 'Displaced fracture of medial malleolus of right tibia, sequela', 'Displaced fracture of coracoid process, right shoulder, subsequent encounter for fracture with malunion', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'lacinia', 'Nondisplaced fracture of posterior process of left talus', 'bibendum', 'Unspecified injury of anterior tibial artery, right leg, initial encounter', 'Abrasion of fingers', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'erat', 'Multiple valve diseases', 'libero', 'Maternal care for Anti-A sensitization, unspecified trimester, fetus 4', 'Toxic effect of other insecticides, undetermined, subsequent encounter', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'et', 'Displaced fracture of unspecified radial styloid process, subsequent encounter for open fracture type I or II with routine healing', 'amet', 'Lateral dislocation of proximal end of tibia, left knee, subsequent encounter', 'Microgenia', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'vestibulum', 'Atherosclerosis of native arteries of extremities with rest pain, bilateral legs', 'nisi', 'Other voice and resonance disorders', 'Displaced fracture of anterior process of right calcaneus, subsequent encounter for fracture with malunion', null, null, 13);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'volutpat', 'Underdosing and nonadministration of necessary drug, medicament or biological substance', 'lacinia', 'Other secondary gout, unspecified elbow', 'Nondisplaced fracture of lateral malleolus of left fibula, initial encounter for open fracture type IIIA, IIIB, or IIIC', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'quam', 'Displaced longitudinal fracture of unspecified patella, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'sit', 'Unspecified intracapsular fracture of unspecified femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'Displaced subtrochanteric fracture of right femur, subsequent encounter for open fracture type I or II with malunion', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'nonummy', 'Laceration of extensor muscle, fascia and tendon of right ring finger at wrist and hand level, sequela', 'feugiat', 'Unspecified acute lower respiratory infection', 'Hemorrhage due to cardiac prosthetic devices, implants and grafts, initial encounter', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'tincidunt', 'Cerebral infarction due to thrombosis of right anterior cerebral artery', 'faucibus', 'Monoplegia of upper limb following nontraumatic intracerebral hemorrhage affecting right non-dominant side', 'Gastric ulcer, unspecified as acute or chronic, without hemorrhage or perforation', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'nulla', 'Maternal care for other (suspected) fetal abnormality and damage, fetus 2', 'orci', 'Toxic effect of ketones, undetermined, initial encounter', 'Nondisplaced spiral fracture of shaft of unspecified fibula, initial encounter for closed fracture', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'etiam', 'Stress fracture, right ankle', 'sagittis', 'Occupational exposure to environmental tobacco smoke', 'Open bite of right lesser toe(s) without damage to nail, subsequent encounter', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'elementum', 'Displaced oblique fracture of shaft of left tibia, sequela', 'primis', 'Laceration with foreign body, left knee, subsequent encounter', 'Nontraumatic compartment syndrome of right upper extremity', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (9, 'non', 'Other fish poisoning, assault, subsequent encounter', 'vulputate', 'Other mechanical complication of other vascular grafts', 'Unspecified injury of unspecified muscle, fascia and tendon at wrist and hand level, unspecified hand, sequela', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'leo', 'Contusion of left ear, sequela', 'luctus', 'Biliary cirrhosis, unspecified', 'Generalized rebound abdominal tenderness', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'nonummy', 'Postauricular fistula, unspecified ear', 'luctus', 'Trochanteric bursitis, unspecified hip', 'Other displaced fracture of lower end of right humerus, subsequent encounter for fracture with nonunion', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'luctus', 'Poisoning by immunoglobulin, assault, sequela', 'dapibus', 'Puncture wound of abdominal wall with foreign body, right upper quadrant without penetration into peritoneal cavity, subsequent encounter', 'Person on outside of ambulance or fire engine injured in nontraffic accident', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'integer', 'Anterior displaced fracture of sternal end of left clavicle, subsequent encounter for fracture with routine healing', 'in', 'Puncture wound without foreign body of left upper arm', 'Diffuse follicle center lymphoma, intrathoracic lymph nodes', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'magna', 'Strain of muscle(s) and tendon(s) of peroneal muscle group at lower leg level, unspecified leg', 'ullamcorper', 'Underdosing of antihyperlipidemic and antiarteriosclerotic drugs, subsequent encounter', 'Other injury of colon', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'fusce', 'Displaced fracture of neck of left talus, subsequent encounter for fracture with routine healing', 'aliquam', 'Fall on same level due to ice and snow, sequela', 'Fracture of angle of left mandible, initial encounter for open fracture', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'id', 'Other reduction defects of lower limb', 'in', 'Fused toes, bilateral', 'Drowning and submersion due to being washed overboard from water-skis, initial encounter', 'Adverse effect of other synthetic narcotics, subsequent encounter', 'http://dummyimage.com/168x100.png/dddddd/000000', 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'ipsum', 'Monoplegia of upper limb following other cerebrovascular disease affecting unspecified side', 'nulla', 'Nondisplaced Maisonneuve''s fracture of right leg, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'Adult sexual abuse, suspected, initial encounter', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'quis', 'Primary osteoarthritis, right hand', 'mattis', 'Coma scale, best motor response, abnormal, in the field [EMT or ambulance]', 'Diseases of the skin and subcutaneous tissue complicating pregnancy, unspecified trimester', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (9, 'amet', 'Other specified joint disorders, right hand', 'sapien', 'Discoid lupus erythematosus of unspecified eye, unspecified eyelid', 'Abnormal innervation syndrome left eye, unspecified eyelid', null, null, 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'in', 'Incomplete lesion of L5 level of lumbar spinal cord, subsequent encounter', 'in', 'Nonadministration of surgical and medical care', 'Struck by raccoon, subsequent encounter', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'ultrices', 'Other otosclerosis', 'maecenas', 'Superficial foreign body of lower back and pelvis', 'External constriction of unspecified upper arm, sequela', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'in', 'Toxic effect of ingested berries, intentional self-harm, initial encounter', 'in', 'Idiopathic gout, left wrist', 'Poisoning by angiotensin-converting-enzyme inhibitors, assault, initial encounter', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'tristique', 'Papyraceous fetus, first trimester, other fetus', 'praesent', 'Car passenger injured in collision with pedestrian or animal in nontraffic accident, sequela', 'Poisoning by antitussives, assault', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'lacinia', 'Other specified injury of vein at forearm level, right arm, sequela', 'vulputate', 'Immersion foot, left foot, subsequent encounter', 'Mixed conductive and sensorineural hearing loss, unspecified', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'at', 'Corrosion of second degree of left shoulder, initial encounter', 'sodales', 'Poisoning by unspecified general anesthetics, accidental (unintentional)', 'Encounter for fitting and adjustment of other gastrointestinal appliance and device', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'magna', 'Other nondisplaced fracture of lower end of unspecified humerus, subsequent encounter for fracture with routine healing', 'vel', 'Salter-Harris Type II physeal fracture of lower end of humerus, right arm, subsequent encounter for fracture with routine healing', 'Poisoning by thrombolytic drug, undetermined, subsequent encounter', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'aliquam', 'Nondisplaced fracture of olecranon process with intraarticular extension of right ulna, subsequent encounter for open fracture type I or II with routine healing', 'lorem', 'Lymphocyte-rich Hodgkin lymphoma, intra-abdominal lymph nodes', 'Concussion', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'dui', 'Unspecified motorcycle rider injured in collision with other motor vehicles in nontraffic accident', 'elementum', 'Burn of first degree of chest wall, initial encounter', 'Abrasion of abdominal wall', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'vel', 'Toxic effect of fusel oil, intentional self-harm, sequela', 'tempor', 'Adverse effect of other vaccines and biological substances, subsequent encounter', 'Blister (nonthermal) of right hand, subsequent encounter', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'vitae', 'Person on outside of bus injured in collision with pedestrian or animal in nontraffic accident, subsequent encounter', 'ornare', 'Other irregular eye movements', 'Stress fracture, hip, unspecified, subsequent encounter for fracture with malunion', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'donec', 'Syndrome of inappropriate secretion of antidiuretic hormone', 'odio', 'Unspecified soft tissue disorder related to use, overuse and pressure, right shoulder', 'Conjunctivochalasis', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'phasellus', 'Unspecified injury of other blood vessels at wrist and hand level of right arm, subsequent encounter', 'habitasse', 'Spontaneous rupture of flexor tendons, unspecified upper arm', 'Person on outside of bus injured in collision with heavy transport vehicle or bus in traffic accident', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'quisque', 'Pilonidal cyst and sinus', 'ultrices', 'Paralytic ptosis of bilateral eyelids', 'Nondisplaced oblique fracture of shaft of left femur, initial encounter for open fracture type IIIA, IIIB, or IIIC', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'sed', 'Unspecified injury of femoral artery, left leg, subsequent encounter', 'auctor', 'Nondisplaced fracture of second metatarsal bone, unspecified foot, subsequent encounter for fracture with routine healing', 'Puncture wound with foreign body of left upper arm, sequela', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'vel', 'Laceration with foreign body of abdominal wall, unspecified quadrant with penetration into peritoneal cavity, subsequent encounter', 'integer', 'Left bundle-branch block, unspecified', 'Personal history of malignant neoplasm of bone and soft tissue', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'eros', 'Displaced fracture of lateral condyle of right femur, subsequent encounter for open fracture type I or II with routine healing', 'suscipit', 'Nondisplaced fracture of right tibial tuberosity, subsequent encounter for closed fracture with routine healing', 'Hemangioma unspecified site', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'consequat', 'Nondisplaced osteochondral fracture of right patella, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'ultrices', 'Age-related osteoporosis with current pathological fracture, right hand, sequela', 'Poisoning by unspecified primarily systemic and hematological agent, intentional self-harm, initial encounter', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'tellus', 'Adverse effect of drugs affecting uric acid metabolism', 'eu', 'Lead-induced gout, hand', 'Anterior cord syndrome at C3 level of cervical spinal cord, subsequent encounter', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'mus', 'Laceration with foreign body of right cheek and temporomandibular area, sequela', 'hac', 'Coma scale, best verbal response, confused conversation, unspecified time', 'Carcinoma in situ of other female genital organs', null, null, 13);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'at', 'Bipolar disorder, unspecified', 'tempor', 'LeFort II fracture, sequela', 'Intermittent exophthalmos, bilateral', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'odio', 'Unspecified sprain of unspecified great toe, subsequent encounter', 'laoreet', 'Burn of unspecified degree of left palm, initial encounter', 'Toxic effect of carbon monoxide from utility gas, assault, initial encounter', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'donec', 'Subluxation of metacarpophalangeal joint of left middle finger, sequela', 'ornare', 'Deformity of bilateral orbits due to trauma or surgery', 'Salter-Harris Type II physeal fracture of phalanx of left toe, subsequent encounter for fracture with malunion', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'eu', 'Displaced fracture of base of unspecified metacarpal bone, subsequent encounter for fracture with routine healing', 'aliquam', 'Salter-Harris Type I physeal fracture of upper end of humerus, unspecified arm, subsequent encounter for fracture with routine healing', 'Encounter for change or removal of surgical wound dressing', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'sollicitudin', 'Primary open-angle glaucoma, bilateral, severe stage', 'diam', 'Other specified injuries of vocal cord, subsequent encounter', 'Other injury of extensor muscle, fascia and tendon of left ring finger at wrist and hand level, sequela', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'eu', 'Diverticulosis of small intestine without perforation or abscess without bleeding', 'venenatis', 'Other specified injury of left innominate or subclavian vein, sequela', 'Allescheriasis', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'nulla', 'Nephrotic syndrome with minor glomerular abnormality', 'ligula', 'Chronic multifocal osteomyelitis, unspecified hand', 'Calcific tendinitis, lower leg', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'volutpat', 'Salter-Harris Type I physeal fracture of lower end of ulna, right arm, subsequent encounter for fracture with delayed healing', 'cubilia', 'Displaced spiral fracture of shaft of radius, unspecified arm, subsequent encounter for open fracture type I or II with delayed healing', 'Influenza due to other identified influenza virus with gastrointestinal manifestations', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'diam', 'Superficial foreign body of other specified part of neck, subsequent encounter', 'suspendisse', 'Unspecified injury of unspecified blood vessel at forearm level, right arm', 'Nondisplaced fracture of shaft of fifth metacarpal bone, left hand, subsequent encounter for fracture with nonunion', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'vulputate', 'Toxic effect of other specified inorganic substances, assault, subsequent encounter', 'eget', 'Hairy cell leukemia not having achieved remission', 'Nondisplaced fracture of epiphysis (separation) (upper) of right femur, subsequent encounter for open fracture type I or II with nonunion', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'vestibulum', 'Preterm labor second trimester with preterm delivery third trimester', 'amet', 'Complete lesion of L5 level of lumbar spinal cord, sequela', 'Hypertrophy of bone, ulna and radius', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'etiam', 'Unspecified fracture of unspecified lower leg, initial encounter for closed fracture', 'ultrices', 'Person on outside of pick-up truck or van injured in collision with pedal cycle in nontraffic accident', 'Subluxation of unspecified interphalangeal joint of right thumb, subsequent encounter', null, null, 13);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'lacus', 'Type 1 diabetes mellitus with mild nonproliferative diabetic retinopathy', 'condimentum', 'Posterior synechiae (iris), left eye', 'Abrasion, right lower leg, sequela', 'Nondisplaced fracture of neck of fifth metacarpal bone, left hand, subsequent encounter for fracture with nonunion', 'http://dummyimage.com/106x100.png/5fa2dd/ffffff', 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (9, 'ut', 'Burn of unspecified degree of multiple sites of right lower limb, except ankle and foot', 'massa', 'Toxic effect of venom of other Australian snake, intentional self-harm', 'Basal cell carcinoma of skin of other part of trunk', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'sociis', 'Other infective (teno)synovitis, right wrist', 'vel', 'Monoplegia of upper limb following cerebral infarction affecting unspecified side', 'Choroidal detachment', 'Nondisplaced fracture of proximal phalanx of right little finger, subsequent encounter for fracture with delayed healing', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'phasellus', 'Eversion of bilateral lacrimal punctum', 'nibh', 'Other intraarticular fracture of lower end of right radius, subsequent encounter for closed fracture with delayed healing', 'Struck by turtle', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'nisl', 'Other nondisplaced fracture of base of first metacarpal bone, right hand, subsequent encounter for fracture with malunion', 'nulla', 'Corrosion of second degree of shoulder and upper limb, except wrist and hand, unspecified site, initial encounter', 'Nondisplaced spiral fracture of shaft of ulna, unspecified arm, subsequent encounter for open fracture type I or II with malunion', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'praesent', 'Other calcification of muscle, hand', 'in', 'Jumping or diving from boat striking water surface causing drowning and submersion, subsequent encounter', 'Passenger in pick-up truck or van injured in collision with unspecified motor vehicles in nontraffic accident, initial encounter', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'a', 'Displaced segmental fracture of shaft of left femur, subsequent encounter for closed fracture with malunion', 'dapibus', 'Other complications of anesthesia during pregnancy', 'Other incomplete lesion at unspecified level of cervical spinal cord, subsequent encounter', 'Legal intervention involving other gas, bystander injured, initial encounter', 'http://dummyimage.com/170x100.png/cc0000/ffffff', 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'mollis', 'Accidental scratch by another person, sequela', 'ut', 'Injury of bronchus', 'Migraine, unspecified, intractable, with status migrainosus', 'Military operations involving destruction of aircraft due to enemy fire or explosives, civilian, sequela', 'http://dummyimage.com/169x100.png/dddddd/000000', 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'lacinia', 'Nondisplaced comminuted fracture of shaft of left tibia, sequela', 'pulvinar', 'Drug-induced chronic gout, left ankle and foot, with tophus (tophi)', 'Supervision of pregnancy with history of ectopic pregnancy, second trimester', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'id', 'Term delivery with preterm labor, second trimester', 'posuere', 'Nondisplaced fracture of neck of unspecified talus, initial encounter for closed fracture', 'Nondisplaced fracture of proximal phalanx of right little finger, initial encounter for open fracture', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'erat', 'Superficial foreign body, left thigh', 'aliquet', 'Underdosing of other drugs acting on muscles, subsequent encounter', 'Other specified injury of left vertebral artery, sequela', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'vivamus', 'Contact with nonvenomous frogs, sequela', 'magna', 'Labyrinthine fistula, bilateral', 'Unspecified sprain of left great toe, initial encounter', 'Unspecified injury at C2 level of cervical spinal cord, subsequent encounter', 'http://dummyimage.com/126x100.png/cc0000/ffffff', 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'turpis', 'Other air transport accidents, not elsewhere classified', 'maecenas', 'Nondisplaced fracture of posterior wall of right acetabulum, initial encounter for open fracture', 'Blepharochalasis left eye, unspecified eyelid', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'pretium', 'Burn of unspecified degree of unspecified ear [any part, except ear drum], initial encounter', 'sagittis', 'Presence of other devices', 'Other fracture of T11-T12 vertebra, subsequent encounter for fracture with routine healing', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'fusce', 'Major laceration of right pulmonary blood vessels', 'rutrum', 'Crushing injury of unspecified foot, sequela', 'Deformity of finger(s)', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'sapien', 'Hereditary factor XI deficiency', 'nulla', 'Unspecified open wound of unspecified finger without damage to nail, sequela', 'Burn of third degree of left ankle', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'sagittis', 'Snow-skier colliding with stationary object, subsequent encounter', 'nibh', 'Sprain of interphalangeal joint of right great toe, subsequent encounter', 'Other fracture of upper end of left tibia, subsequent encounter for closed fracture with nonunion', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'vestibulum', 'Nondisplaced fracture of medial condyle of unspecified tibia, subsequent encounter for closed fracture with malunion', 'eleifend', 'Fracture of nasal bones, initial encounter for open fracture', 'Corrosion of second degree of multiple sites of right shoulder and upper limb, except wrist and hand, subsequent encounter', null, null, 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'nisi', 'Injury to rider of non-recreational watercraft being pulled behind other watercraft', 'sapien', 'Assault by being hit or run over by motor vehicle, subsequent encounter', 'Adverse effect of other drug primarily affecting the autonomic nervous system, subsequent encounter', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'sapien', 'Non-pressure chronic ulcer of right thigh with necrosis of bone', 'sit', 'Minor laceration of left internal jugular vein, initial encounter', 'Open bite of vagina and vulva, subsequent encounter', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'in', 'Superficial foreign body of vagina and vulva', 'mi', 'Driver injured in collision with other motor vehicles in nontraffic accident, subsequent encounter', 'Hallucinations, unspecified', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'volutpat', 'Late congenital syphilitic chorioretinitis', 'tellus', 'Unspecified fracture of shaft of unspecified ulna, initial encounter for open fracture type I or II', 'Ganglion, left shoulder', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'orci', 'Other specified injury of anterior tibial artery, right leg, subsequent encounter', 'nulla', 'Underdosing of emollients, demulcents and protectants', 'Spontaneous rupture of flexor tendons, unspecified site', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'libero', 'Conduction disorder, unspecified', 'nisi', 'Passenger on bus injured in collision with two- or three-wheeled motor vehicle in nontraffic accident, initial encounter', 'Other fracture of upper end of unspecified tibia, subsequent encounter for closed fracture with routine healing', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'quam', 'Other fracture of lower end of right femur, subsequent encounter for open fracture type I or II with nonunion', 'praesent', 'Corrosion of unspecified degree of elbow', 'Contusion of unspecified finger with damage to nail, initial encounter', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'nullam', 'Superficial foreign body of right back wall of thorax', 'volutpat', 'Postthrombotic syndrome with other complications of left lower extremity', 'Other juvenile arthritis, right ankle and foot', 'Unspecified open wound of unspecified part of thorax', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'semper', 'Familial chondrocalcinosis, left shoulder', 'amet', 'Adverse effect of other antacids and anti-gastric-secretion drugs', 'Infection and inflammatory reaction due to implanted electronic neurostimulator of peripheral nerve, electrode (lead), subsequent encounter', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'luctus', 'Preparatory care for renal dialysis', 'ligula', 'Crushing injury of unspecified external genital organs, female, sequela', 'Unspecified injury of unspecified blood vessel at forearm level, unspecified arm, initial encounter', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'vestibulum', 'Phantom limb syndrome with pain', 'posuere', 'Nondisplaced fracture of unspecified ulna styloid process, subsequent encounter for closed fracture with delayed healing', 'Other fracture of left lower leg, initial encounter for open fracture type I or II', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'vulputate', 'Disorders of the eye following cataract surgery', 'consectetuer', 'Displaced fracture of body of scapula, left shoulder, subsequent encounter for fracture with delayed healing', 'Unspecified nondisplaced fracture of first cervical vertebra, subsequent encounter for fracture with nonunion', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'cras', 'Displaced oblique fracture of shaft of left tibia, initial encounter for closed fracture', 'amet', 'Displaced transverse fracture of shaft of humerus, right arm, initial encounter for open fracture', 'Unspecified injury of other specified muscles, fascia and tendons at thigh level, right thigh, initial encounter', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'amet', 'Other disorders of pancreatic internal secretion', 'sed', 'Motor neuron disease', 'Burn of third degree of ankle', 'Injury of unspecified nerve at wrist and hand level of right arm, sequela', 'http://dummyimage.com/242x100.png/cc0000/ffffff', 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'sed', 'Passenger in heavy transport vehicle injured in collision with heavy transport vehicle or bus in nontraffic accident, subsequent encounter', 'lorem', 'Nondisplaced fracture of lower epiphysis (separation) of right femur, subsequent encounter for closed fracture with nonunion', 'Displaced fracture of medial phalanx of unspecified finger, subsequent encounter for fracture with routine healing', 'Unspecified nondisplaced fracture of surgical neck of right humerus', 'http://dummyimage.com/171x100.png/ff4444/ffffff', 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'odio', 'Laceration of other blood vessels at lower leg level, left leg', 'in', 'Subluxation of distal end of right ulna, initial encounter', 'Other specified injury of femoral vein at hip and thigh level, right leg, sequela', 'Pregnancy related exhaustion and fatigue, unspecified trimester', 'http://dummyimage.com/243x100.png/5fa2dd/ffffff', 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'placerat', 'Other osteoporosis with current pathological fracture, unspecified femur', 'accumsan', 'Sprain of interphalangeal joint of right ring finger, sequela', 'Poisoning by enzymes, assault, sequela', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'pellentesque', 'Displacement of esophageal anti-reflux device', 'neque', 'Glaucoma secondary to other eye disorders, right eye, mild stage', 'Unspecified early complication of trauma, subsequent encounter', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'aliquam', 'Atherosclerosis of nonbiological bypass graft(s) of the extremities with gangrene', 'in', 'Retinal detachment with retinal dialysis, right eye', 'Nondisplaced fracture of left radial styloid process, subsequent encounter for closed fracture with delayed healing', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'nulla', 'Traumatic compartment syndrome of unspecified upper extremity, initial encounter', 'molestie', 'Military operations involving intentional restriction of air and airway, civilian', 'Nondisplaced oblique fracture of shaft of unspecified femur, initial encounter for open fracture type I or II', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'ac', 'Adverse effect of phenothiazine antipsychotics and neuroleptics, initial encounter', 'pellentesque', 'Staphylococcal arthritis, shoulder', 'Spontaneous rupture of flexor tendons', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'dolor', 'Eclampsia', 'lacus', 'Displaced segmental fracture of shaft of ulna, unspecified arm, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'Monteggia''s fracture of left ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'erat', 'Malignant neoplasm of Waldeyer''s ring', 'volutpat', 'Toxic effect of rattlesnake venom, assault, initial encounter', 'Contusion of left great toe with damage to nail, sequela', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'vestibulum', 'Unspecified superficial injury of lower leg', 'dictumst', 'Salter-Harris Type II physeal fracture of lower end of radius, left arm, subsequent encounter for fracture with malunion', 'Nondisplaced apophyseal fracture of right femur, subsequent encounter for closed fracture with nonunion', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'malesuada', 'Other specified diseases of blood and blood-forming organs', 'in', 'Tear of articular cartilage of left knee, current, initial encounter', 'Laceration of other blood vessels at hip and thigh level, unspecified leg, subsequent encounter', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'lobortis', 'Burn of third degree of chin', 'ante', 'Maternal care for (suspected) fetal abnormality and damage, unspecified, fetus 3', 'Filamentary keratitis, unspecified eye', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'sit', 'Rheumatoid nodule, unspecified shoulder', 'nulla', 'Legal intervention involving sharp objects', 'Toxic effect of venom of brown recluse spider, assault, initial encounter', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'elementum', 'Corrosion of unspecified degree of lower back, initial encounter', 'nam', 'Displaced fracture of lateral malleolus of unspecified fibula, initial encounter for open fracture type I or II', 'Unspecified injury of other blood vessels at lower leg level, unspecified leg, initial encounter', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'in', 'Omphalitis without hemorrhage', 'ut', 'Chronic embolism and thrombosis of superficial veins of unspecified upper extremity', 'Superficial foreign body, unspecified foot, sequela', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'a', 'Fracture of unspecified tarsal bone(s) of unspecified foot', 'in', 'Underdosing of local anesthetics, subsequent encounter', 'Toxoplasma chorioretinitis', 'Toxic effect of carbon tetrachloride, assault, sequela', 'http://dummyimage.com/229x100.png/cc0000/ffffff', 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'elit', 'Underdosing of other narcotics, initial encounter', 'sed', 'Osteonecrosis due to previous trauma, left femur', 'Displaced oblique fracture of shaft of left tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'consequat', 'Toxic effect of other specified inorganic substances, assault, sequela', 'diam', 'Follicular lymphoma, unspecified, spleen', 'Displaced comminuted fracture of left patella, subsequent encounter for open fracture type I or II with nonunion', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'maecenas', 'Burn of first degree of other site of trunk, initial encounter', 'etiam', 'Toxic effect of trichloroethylene, intentional self-harm, sequela', 'Puncture wound with foreign body of other finger without damage to nail, subsequent encounter', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'lectus', 'Poisoning by insulin and oral hypoglycemic [antidiabetic] drugs, intentional self-harm, sequela', 'lobortis', 'Infection and inflammatory reaction due to internal fixation device of left tibia, initial encounter', 'Burn of second degree of right ear [any part, except ear drum], sequela', 'Displacement of biological heart valve graft', 'http://dummyimage.com/148x100.png/cc0000/ffffff', 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'amet', 'Spinal enthesopathy, site unspecified', 'nulla', 'Displaced supracondylar fracture with intracondylar extension of lower end of right femur, subsequent encounter for closed fracture with routine healing', 'Other streptococcal arthritis, ankle and foot', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'varius', 'Unspecified injury of femoral vein at hip and thigh level, unspecified leg, sequela', 'nibh', 'Maternal care for other specified fetal problems, second trimester, fetus 3', 'Salter-Harris Type I physeal fracture of right metatarsal, initial encounter for closed fracture', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'donec', 'Food in trachea causing other injury', 'dolor', 'Striking against or struck by other automobile airbag, sequela', 'Strain of unspecified muscles, fascia and tendons at thigh level', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'turpis', 'Unspecified fracture of left toe(s), subsequent encounter for fracture with delayed healing', 'platea', 'Other fracture of upper end of unspecified radius, subsequent encounter for open fracture type I or II with nonunion', 'Unspecified injury of femoral vein at hip and thigh level, unspecified leg, sequela', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'lobortis', 'Unspecified injury of unspecified foot, subsequent encounter', 'morbi', 'Person injured while boarding or alighting from snowmobile, subsequent encounter', 'Insomnia due to other mental disorder', 'Injury of other nerves at shoulder and upper arm level, unspecified arm, subsequent encounter', 'http://dummyimage.com/170x100.png/dddddd/000000', 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (9, 'vestibulum', 'Other fracture of upper and lower end of unspecified fibula, initial encounter for open fracture type I or II', 'pede', 'Chronic pain syndrome', 'Osteitis deformans of unspecified hand', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'libero', 'Sprain of metacarpophalangeal joint of unspecified finger, initial encounter', 'molestie', 'Corrosion of first degree of right forearm, initial encounter', 'Partial traumatic amputation of right shoulder and upper arm, level unspecified, subsequent encounter', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'erat', 'Other specified intracranial injury with loss of consciousness greater than 24 hours without return to pre-existing conscious level with patient surviving, sequela', 'ante', 'Displaced fracture of proximal phalanx of unspecified finger, initial encounter for open fracture', 'Fracture of unspecified part of right clavicle, subsequent encounter for fracture with delayed healing', 'Personal history of systemic steroid therapy', 'http://dummyimage.com/154x100.png/ff4444/ffffff', 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'et', 'Contact with hot tap water, undetermined intent, sequela', 'aenean', 'Toxic effect of venom of wasps, assault, subsequent encounter', 'Other spondylosis, occipito-atlanto-axial region', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'eget', 'Displaced fracture of right tibial tuberosity, subsequent encounter for open fracture type I or II with routine healing', 'non', 'Postprocedural seroma of a digestive system organ or structure following other procedure', 'Toxic effect of carbon monoxide from other source, intentional self-harm, initial encounter', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'imperdiet', 'Segmental and somatic dysfunction of abdomen and other regions', 'nulla', 'Burn of second degree of unspecified hand, unspecified site', 'Exposure to unspecified man-made visible and ultraviolet light, sequela', 'Asphyxiation due to smothering under another person''s body (in bed), assault, initial encounter', 'http://dummyimage.com/203x100.png/ff4444/ffffff', 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'lorem', 'Burn due to localized fire on board unspecified watercraft, sequela', 'non', 'Nondisplaced fracture of greater trochanter of left femur, initial encounter for open fracture type IIIA, IIIB, or IIIC', 'Laceration of unspecified blood vessel at shoulder and upper arm level, right arm, sequela', 'Person on outside of heavy transport vehicle injured in collision with other nonmotor vehicle in nontraffic accident', 'http://dummyimage.com/195x100.png/5fa2dd/ffffff', 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'morbi', 'Pressure ulcer of left upper back, unspecified stage', 'dui', 'Atrophy of orbit', 'Displaced fracture of anterior column [iliopubic] of unspecified acetabulum, subsequent encounter for fracture with delayed healing', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'lacus', 'Unspecified injury of superficial palmar arch of unspecified hand, initial encounter', 'justo', 'Poisoning by peripheral vasodilators, undetermined, sequela', 'Other specified industrial and construction area as the place of occurrence of the external cause', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'justo', 'Stress fracture, unspecified tibia and fibula, subsequent encounter for fracture with delayed healing', 'dapibus', 'Other and unspecified degenerative disorders of globe', 'Laceration of unspecified muscles, fascia and tendons at forearm level, left arm', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'rhoncus', 'Laceration of other muscles, fascia and tendons at shoulder and upper arm level, left arm, subsequent encounter', 'condimentum', 'Injury, poisoning and certain other consequences of external causes complicating childbirth', 'Frostbite with tissue necrosis of right toe(s)', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'nisl', 'War operations involving destruction of aircraft due to collision with other aircraft, military personnel, subsequent encounter', 'condimentum', 'Drowning and submersion due to sailboat sinking, initial encounter', 'Exposure to excessive heat of man-made origin, subsequent encounter', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'nam', 'Cerebral infarction due to unspecified occlusion or stenosis of middle cerebral artery', 'etiam', 'Other specified multiple gestation, unspecified number of placenta and unspecified number of amniotic sacs, first trimester', 'Blister (nonthermal), unspecified thigh', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'vulputate', 'Toxic effect of venom of other North and South American snake', 'fringilla', 'Burn of third degree of scalp [any part], subsequent encounter', 'Postauricular fistula, right ear', null, null, 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'leo', 'Poisoning by unspecified topical agent, accidental (unintentional), sequela', 'mi', 'Person on outside of three-wheeled motor vehicle injured in collision with two- or three-wheeled motor vehicle in nontraffic accident, subsequent encounter', 'Poisoning by propionic acid derivatives, intentional self-harm, initial encounter', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'quis', 'Voice and resonance disorders', 'suspendisse', 'Corrosion of second degree of right ankle, sequela', 'Nondisplaced transverse fracture of shaft of left radius, initial encounter for open fracture type I or II', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'sit', 'Hypertrichosis, unspecified', 'in', 'Laceration with foreign body of unspecified thumb with damage to nail, sequela', 'Hypertrophy of breast', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'sapien', 'Corrosions involving 10-19% of body surface', 'justo', 'Other specified spondylopathies, site unspecified', 'Other malformation of placenta, first trimester', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'lectus', 'Asphyxiation due to being trapped in bed linens, intentional self-harm, subsequent encounter', 'cubilia', '8 weeks gestation of pregnancy', 'Presence of other otological and audiological implants', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'arcu', 'Sprain of other specified parts of shoulder girdle', 'neque', 'Other specified bursopathies, unspecified ankle and foot', 'Cocaine dependence with withdrawal', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'etiam', 'Sprain of tarsometatarsal ligament of foot', 'vitae', 'Penetrating wound with foreign body of right eyeball, subsequent encounter', 'Nondisplaced fracture of medial phalanx of other finger, sequela', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'tortor', 'Fracture of unspecified carpal bone, right wrist, subsequent encounter for fracture with routine healing', 'vulputate', 'Unspecified injury of descending [left] colon, initial encounter', 'Lobster-claw hand, bilateral', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'volutpat', 'Unspecified malignant neoplasm of skin of right ear and external auricular canal', 'curabitur', 'Presence of orthopedic joint implants', 'Skin graft (allograft) (autograft) failure', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'convallis', 'Rheumatoid arthritis with rheumatoid factor of wrist without organ or systems involvement', 'at', 'Citrullinemia', 'Unspecified injury of right foot, sequela', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (9, 'pretium', 'Anorexia nervosa', 'integer', 'Alcohol dependence with withdrawal, uncomplicated', 'Stable burst fracture of fourth thoracic vertebra, initial encounter for open fracture', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'congue', 'Algoneurodystrophy, hand', 'cras', 'Erysipelas', 'Other infective otitis externa, unspecified ear', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'blandit', 'Injury of optic nerve, right eye, initial encounter', 'diam', 'Female cousin, perpetrator of maltreatment and neglect', 'Burn of first degree of trunk, unspecified site, initial encounter', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'donec', 'Periodic headache syndromes in child or adult, not intractable', 'velit', 'Other kyphosis, thoracolumbar region', 'Unspecified physeal fracture of lower end of right fibula, subsequent encounter for fracture with malunion', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (5, 'leo', 'Pedestrian with other conveyance injured in collision with car, pick-up truck or van, unspecified whether traffic or nontraffic accident, sequela', 'ipsum', 'Unspecified occupant of bus injured in collision with pedal cycle in traffic accident, initial encounter', 'Zygomatic fracture, right side, sequela', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'sit', 'Galeazzi''s fracture of unspecified radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', 'ultrices', 'Other fracture of fourth metacarpal bone, right hand, sequela', 'Otitic barotrauma, subsequent encounter', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'mauris', 'Fall on board fishing boat, initial encounter', 'nulla', 'Nondisplaced fracture of base of fourth metacarpal bone, left hand, initial encounter for open fracture', 'Other nondisplaced fracture of fourth cervical vertebra, initial encounter for closed fracture', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'porttitor', 'Poisoning by unspecified psychodysleptics [hallucinogens], intentional self-harm', 'quisque', 'Cystic meniscus, posterior horn of lateral meniscus', 'Poisoning by selective serotonin reuptake inhibitors, intentional self-harm', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'a', 'Laceration of superficial palmar arch of right hand, initial encounter', 'enim', 'Displaced fracture of neck of second metacarpal bone, right hand, subsequent encounter for fracture with routine healing', 'Burn of third degree of left ankle, initial encounter', null, null, 13);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'nibh', 'Electrocution, initial encounter', 'amet', 'Other acute skin changes due to ultraviolet radiation', 'Sprain of unspecified collateral ligament of unspecified knee, subsequent encounter', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'in', 'Malignant carcinoid tumors of other sites', 'proin', 'Contusion of left thumb without damage to nail, sequela', 'Other osteoporosis with current pathological fracture, vertebra(e)', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'donec', 'Other fracture of upper end of right tibia, subsequent encounter for closed fracture with delayed healing', 'tortor', 'Injury of cutaneous sensory nerve at lower leg level, unspecified leg, subsequent encounter', 'Smith''s fracture of unspecified radius, initial encounter for open fracture type IIIA, IIIB, or IIIC', null, null, 17);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'nulla', 'Atherosclerosis of nonbiological bypass graft(s) of the left leg with ulceration of ankle', 'maecenas', 'Discoid lupus erythematosus of left eye, unspecified eyelid', 'Bucket-handle tear of medial meniscus, current injury, left knee, initial encounter', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'luctus', 'Corrosion of first degree of lip(s), subsequent encounter', 'a', 'Unspecified Zone III fracture of sacrum, subsequent encounter for fracture with routine healing', 'Other chronic osteomyelitis, radius and ulna', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'venenatis', 'Other injury of muscle, fascia and tendon of pelvis, subsequent encounter', 'justo', 'Corrosion of unspecified degree of left shoulder, sequela', 'Nontraumatic intracerebral hemorrhage in hemisphere, cortical', null, null, 11);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'sed', 'Contact with other specified agricultural machinery, initial encounter', 'nam', 'Cholesteatoma of attic, bilateral', 'Complete oblique atypical femoral fracture, unspecified leg, subsequent encounter for fracture with routine healing', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'non', 'Displaced unspecified fracture of right lesser toe(s), subsequent encounter for fracture with nonunion', 'mollis', 'Vestibular neuronitis, right ear', 'Nondisplaced fracture of base of neck of unspecified femur, subsequent encounter for open fracture type I or II with nonunion', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (3, 'sapien', 'Congenital compression facies', 'quam', 'Strain of unspecified Achilles tendon', 'Poisoning by selective serotonin and norepinephrine reuptake inhibitors, undetermined, sequela', null, null, 1);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'phasellus', 'Other congenital malformations of esophagus', 'ante', 'Rapidly progressive nephritic syndrome with unspecified morphologic changes', 'Pathological fracture in neoplastic disease, unspecified femur, sequela', null, null, 8);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'at', 'Unspecified injury of pleura, subsequent encounter', 'elementum', 'Displaced fracture of distal phalanx of other finger, initial encounter for open fracture', 'Poisoning by antihyperlipidemic and antiarteriosclerotic drugs, accidental (unintentional)', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'urna', 'Displaced spiral fracture of shaft of radius, right arm, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', 'posuere', 'Unspecified fracture of upper end of right radius, initial encounter for closed fracture', 'Unspecified transfusion reaction, sequela', null, null, 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (10, 'justo', 'Other displaced fracture of upper end of right humerus', 'morbi', 'Maternal care for other specified fetal problems, second trimester, fetus 3', 'Strain of unspecified muscles, fascia and tendons at thigh level, left thigh', null, null, 10);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'elementum', 'Contact with transmission devices, not elsewhere classified', 'eu', 'Unspecified fracture of shaft of unspecified femur, subsequent encounter for closed fracture with nonunion', 'Lead-induced chronic gout, unspecified wrist, without tophus (tophi)', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'turpis', 'Ciguatera fish poisoning, undetermined', 'donec', 'Minor laceration of right internal jugular vein, initial encounter', 'Family history of malignant neoplasm of bladder', 'Salter-Harris Type IV physeal fracture of lower end of ulna, left arm, sequela', 'http://dummyimage.com/220x100.png/cc0000/ffffff', 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'vestibulum', 'Subluxation of metacarpophalangeal joint of right little finger', 'volutpat', 'Sprain of anterior cruciate ligament of knee', 'Unspecified displaced fracture of surgical neck of right humerus, subsequent encounter for fracture with routine healing', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'morbi', 'Coronary artery dissection', 'nisl', 'Poisoning by macrolides, assault', 'Other fracture of lower end of left femur, initial encounter for closed fracture', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'suscipit', 'Anaphylactic reaction due to fruits and vegetables, sequela', 'dapibus', 'Other injury of other part of colon, sequela', 'Amusement park as the place of occurrence of the external cause', null, null, 9);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'rhoncus', 'Failure of sterile precautions during kidney dialysis and other perfusion', 'turpis', 'Unspecified injury of unspecified muscles, fascia and tendons at forearm level, unspecified arm, sequela', 'Nondisplaced fracture of shaft of fourth metacarpal bone, left hand, subsequent encounter for fracture with delayed healing', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'posuere', 'Minor laceration of kidney', 'lectus', 'Acquired atrophy of ovary and fallopian tube', 'Alcohol use, unspecified with alcohol-induced psychotic disorder, unspecified', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'donec', 'Malignant neoplasm of nasopharynx', 'dolor', 'Other physeal fracture of lower end of radius, left arm, subsequent encounter for fracture with malunion', 'Pathological fracture in neoplastic disease, pelvis, subsequent encounter for fracture with nonunion', null, null, 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (17, 'et', 'Strain of intrinsic muscle, fascia and tendon of left index finger at wrist and hand level', 'cras', 'Burn of second degree of left axilla, initial encounter', 'Unspecified effects of vibration, subsequent encounter', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'habitasse', 'Poisoning by thrombolytic drug, accidental (unintentional)', 'faucibus', 'Minor laceration of liver, sequela', 'Fatigue fracture of vertebra, thoracic region, initial encounter for fracture', null, null, 14);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (2, 'primis', 'Dislocation of metacarpophalangeal joint of left index finger, sequela', 'augue', 'Puncture wound without foreign body of right ring finger without damage to nail, initial encounter', 'Lichen nitidus', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (7, 'habitasse', 'Poisoning by barbiturates, accidental (unintentional)', 'ridiculus', 'Adverse effect of oral contraceptives', 'Nondisplaced fracture of lower epiphysis (separation) of left femur, subsequent encounter for closed fracture with routine healing', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (18, 'nullam', 'Vomiting', 'suscipit', 'Person on outside of pick-up truck or van injured in collision with pedestrian or animal in nontraffic accident', 'Displacement of unspecified cardiac and vascular devices and implants, subsequent encounter', null, null, 5);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'condimentum', 'Poisoning by, adverse effect of and underdosing of monoamine-oxidase-inhibitor antidepressants', 'augue', 'Strain of muscle and tendon of long extensor muscle of toe at ankle and foot level, unspecified foot', 'Acute ethmoidal sinusitis', null, null, 2);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (19, 'sapien', 'Unspecified superficial injury of abdomen, lower back, pelvis and external genitals', 'justo', 'Displaced comminuted supracondylar fracture without intercondylar fracture of right humerus, initial encounter for open fracture', 'Unspecified injury of muscle, fascia and tendon of abdomen, lower back and pelvis', null, null, 15);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (16, 'suscipit', 'Laceration of other blood vessels at lower leg level, left leg, initial encounter', 'in', 'Assault by unspecified sharp object, sequela', 'Colic', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'donec', 'Unspecified injury of intercostal blood vessels, right side, subsequent encounter', 'eu', 'Toxic effect of other ingested (parts of) plant(s), accidental (unintentional), sequela', 'Puncture wound without foreign body of right shoulder, initial encounter', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (11, 'ut', 'Nondisplaced fracture of shaft of fifth metacarpal bone, left hand', 'lectus', 'Other secondary chronic gout, right shoulder, without tophus (tophi)', 'Arthritis due to other bacteria, unspecified knee', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (13, 'semper', 'Poisoning by hemostatic drug, intentional self-harm, initial encounter', 'eget', 'Salter-Harris Type IV physeal fracture of upper end of unspecified tibia, subsequent encounter for fracture with malunion', 'Displaced pilon fracture of unspecified tibia, subsequent encounter for open fracture type I or II with malunion', null, null, 7);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'et', 'Fall from in-line roller-skates, initial encounter', 'ligula', 'Activities involving animal care', 'Mechanical loosening of internal left hip prosthetic joint, initial encounter', null, null, 19);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'donec', 'Salter-Harris Type IV physeal fracture of right calcaneus', 'iaculis', 'Hordeolum internum right lower eyelid', 'Other fracture of upper end of unspecified ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (14, 'iaculis', 'Crushing injury of unspecified forearm, sequela', 'nascetur', 'Other dislocation of right wrist and hand, subsequent encounter', 'Maternal care for excessive fetal growth, unspecified trimester, fetus 1', null, null, 12);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'duis', 'Other chondrocalcinosis, left hand', 'cum', 'Drug-induced chronic gout, right wrist, without tophus (tophi)', 'Laceration of other specified blood vessels at shoulder and upper arm level, left arm, initial encounter', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (6, 'molestie', 'Carcinoma in situ of skin of left ear and external auricular canal', 'sed', 'Maternal care for viable fetus in abdominal pregnancy, second trimester, fetus 3', 'Unspecified trochanteric fracture of left femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', null, null, 3);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'porta', 'Other mechanical complication of other urinary devices and implants, initial encounter', 'viverra', 'Mechanical loosening of unspecified internal prosthetic joint, subsequent encounter', 'Malignant neoplasm of left spermatic cord', null, null, 13);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (1, 'lectus', 'Other foreign object in trachea causing other injury, sequela', 'faucibus', 'Split foot, right lower limb', 'Miscellaneous cardiovascular devices associated with adverse incidents, not elsewhere classified', null, null, 18);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (15, 'faucibus', 'Person on outside of car injured in collision with other type car in nontraffic accident', 'feugiat', 'Unspecified physeal fracture of lower end of right fibula, initial encounter for closed fracture', 'Crushing injury of right thigh, subsequent encounter', null, null, 16);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (4, 'pharetra', 'Nondisplaced fracture of anterior column [iliopubic] of right acetabulum, subsequent encounter for fracture with delayed healing', 'nibh', 'Displaced osteochondral fracture of right patella, subsequent encounter for open fracture type I or II with routine healing', 'Spontaneous rupture of flexor tendons, left shoulder', 'Contact with hot stove (kitchen), initial encounter', 'http://dummyimage.com/232x100.png/dddddd/000000', 4);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (12, 'lectus', 'Unspecified fracture of shaft of unspecified ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 'tristique', 'Posterior dislocation of left radial head, initial encounter', 'Other myositis, left lower leg', null, null, 6);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (8, 'amet', 'Other dorsalgia', 'luctus', 'Other nondisplaced fracture of lower end of right humerus, initial encounter for closed fracture', 'Nondisplaced spiral fracture of shaft of radius, unspecified arm, subsequent encounter for closed fracture with routine healing', null, null, 20);
insert into flashcard (fc_set_id, word, meaning, type_of_word, pronounce, example, note, image, created_by) values (20, 'duis', 'Neuromuscular scoliosis, lumbar region', 'justo', 'Displaced fracture of navicular [scaphoid] of unspecified foot, initial encounter for open fracture', 'Displaced spiral fracture of shaft of right tibia, initial encounter for open fracture type IIIA, IIIB, or IIIC', null, null, 19);


-- Learnt list
create table learnt_list (
	fc_id INT REFERENCES flashcard(fc_id) ON DELETE CASCADE,
	user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (fc_id, user_id)
);
insert into learnt_list (fc_id, user_id) values (35, 9);
insert into learnt_list (fc_id, user_id) values (83, 16);
insert into learnt_list (fc_id, user_id) values (55, 20);
insert into learnt_list (fc_id, user_id) values (83, 15);
insert into learnt_list (fc_id, user_id) values (129, 15);
insert into learnt_list (fc_id, user_id) values (56, 11);
insert into learnt_list (fc_id, user_id) values (88, 2);
insert into learnt_list (fc_id, user_id) values (45, 12);
insert into learnt_list (fc_id, user_id) values (98, 13);
insert into learnt_list (fc_id, user_id) values (45, 14);
insert into learnt_list (fc_id, user_id) values (166, 3);
insert into learnt_list (fc_id, user_id) values (155, 2);
insert into learnt_list (fc_id, user_id) values (188, 6);
insert into learnt_list (fc_id, user_id) values (196, 6);
insert into learnt_list (fc_id, user_id) values (147, 17);
insert into learnt_list (fc_id, user_id) values (35, 19);
insert into learnt_list (fc_id, user_id) values (49, 5);
insert into learnt_list (fc_id, user_id) values (152, 10);
insert into learnt_list (fc_id, user_id) values (19, 2);
insert into learnt_list (fc_id, user_id) values (52, 18);
insert into learnt_list (fc_id, user_id) values (49, 14);
insert into learnt_list (fc_id, user_id) values (170, 19);
insert into learnt_list (fc_id, user_id) values (189, 3);
insert into learnt_list (fc_id, user_id) values (163, 10);
insert into learnt_list (fc_id, user_id) values (116, 17);
insert into learnt_list (fc_id, user_id) values (99, 13);
insert into learnt_list (fc_id, user_id) values (81, 2);
insert into learnt_list (fc_id, user_id) values (108, 18);
insert into learnt_list (fc_id, user_id) values (174, 16);
insert into learnt_list (fc_id, user_id) values (13, 4);
insert into learnt_list (fc_id, user_id) values (25, 18);
insert into learnt_list (fc_id, user_id) values (154, 16);
insert into learnt_list (fc_id, user_id) values (66, 1);
insert into learnt_list (fc_id, user_id) values (194, 13);
insert into learnt_list (fc_id, user_id) values (158, 19);
insert into learnt_list (fc_id, user_id) values (85, 5);
insert into learnt_list (fc_id, user_id) values (147, 20);
insert into learnt_list (fc_id, user_id) values (174, 12);
insert into learnt_list (fc_id, user_id) values (37, 3);
insert into learnt_list (fc_id, user_id) values (10, 15);
insert into learnt_list (fc_id, user_id) values (85, 4);
insert into learnt_list (fc_id, user_id) values (29, 2);
insert into learnt_list (fc_id, user_id) values (169, 20);
insert into learnt_list (fc_id, user_id) values (19, 3);
insert into learnt_list (fc_id, user_id) values (191, 19);
insert into learnt_list (fc_id, user_id) values (163, 5);
insert into learnt_list (fc_id, user_id) values (123, 3);
insert into learnt_list (fc_id, user_id) values (81, 20);
insert into learnt_list (fc_id, user_id) values (135, 17);
insert into learnt_list (fc_id, user_id) values (157, 19);
insert into learnt_list (fc_id, user_id) values (50, 12);
insert into learnt_list (fc_id, user_id) values (1, 10);
insert into learnt_list (fc_id, user_id) values (131, 17);
insert into learnt_list (fc_id, user_id) values (125, 8);
insert into learnt_list (fc_id, user_id) values (23, 9);
insert into learnt_list (fc_id, user_id) values (193, 3);
insert into learnt_list (fc_id, user_id) values (182, 9);
insert into learnt_list (fc_id, user_id) values (120, 13);
insert into learnt_list (fc_id, user_id) values (57, 3);
insert into learnt_list (fc_id, user_id) values (63, 12);
insert into learnt_list (fc_id, user_id) values (57, 1);
insert into learnt_list (fc_id, user_id) values (152, 12);
insert into learnt_list (fc_id, user_id) values (111, 6);
insert into learnt_list (fc_id, user_id) values (113, 6);
insert into learnt_list (fc_id, user_id) values (143, 9);
insert into learnt_list (fc_id, user_id) values (165, 10);
insert into learnt_list (fc_id, user_id) values (77, 20);
insert into learnt_list (fc_id, user_id) values (145, 9);
insert into learnt_list (fc_id, user_id) values (44, 2);
insert into learnt_list (fc_id, user_id) values (11, 18);
insert into learnt_list (fc_id, user_id) values (110, 3);
insert into learnt_list (fc_id, user_id) values (119, 20);
insert into learnt_list (fc_id, user_id) values (139, 1);
insert into learnt_list (fc_id, user_id) values (5, 20);
insert into learnt_list (fc_id, user_id) values (19, 20);
insert into learnt_list (fc_id, user_id) values (87, 9);
insert into learnt_list (fc_id, user_id) values (38, 2);
insert into learnt_list (fc_id, user_id) values (4, 10);
insert into learnt_list (fc_id, user_id) values (65, 2);
insert into learnt_list (fc_id, user_id) values (146, 13);
insert into learnt_list (fc_id, user_id) values (192, 3);
insert into learnt_list (fc_id, user_id) values (192, 11);
insert into learnt_list (fc_id, user_id) values (173, 15);
insert into learnt_list (fc_id, user_id) values (155, 19);
insert into learnt_list (fc_id, user_id) values (62, 12);
insert into learnt_list (fc_id, user_id) values (171, 4);
insert into learnt_list (fc_id, user_id) values (139, 9);
insert into learnt_list (fc_id, user_id) values (153, 14);
insert into learnt_list (fc_id, user_id) values (193, 11);
insert into learnt_list (fc_id, user_id) values (130, 9);
insert into learnt_list (fc_id, user_id) values (61, 2);
insert into learnt_list (fc_id, user_id) values (184, 11);
insert into learnt_list (fc_id, user_id) values (10, 18);
insert into learnt_list (fc_id, user_id) values (112, 16);
insert into learnt_list (fc_id, user_id) values (56, 12);
insert into learnt_list (fc_id, user_id) values (155, 18);
insert into learnt_list (fc_id, user_id) values (46, 11);
insert into learnt_list (fc_id, user_id) values (186, 9);
insert into learnt_list (fc_id, user_id) values (17, 15);
insert into learnt_list (fc_id, user_id) values (141, 14);



-- Flashcard share permit
CREATE TABLE flashcard_share_permit (
	user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
	fc_set_id INT REFERENCES flashcard_set(fc_set_id) ON DELETE CASCADE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, fc_set_id)
);



-- FUNCTION
CREATE OR REPLACE FUNCTION check_flashcard_permission(arg_user_id INT, arg_fc_set_id INT) RETURNS BOOLEAN AS 
$$
	DECLARE 
		isAllow boolean;
	BEGIN
		SELECT CASE 
			WHEN 
				EXISTS (
					SELECT 1 FROM flashcard_share_permit 
					WHERE fc_set_id = arg_fc_set_id AND user_id = arg_user_id
				) 
				OR 
				EXISTS (                                                                       
					SELECT 1 FROM flashcard_set
					WHERE fc_set_id = arg_fc_set_id AND (created_by = arg_user_id OR access = 'public' OR system_belong = TRUE)
				)
			THEN true ELSE false 
		END INTO isAllow;

		RETURN isAllow;
	END;
$$ 
LANGUAGE plpgsql;