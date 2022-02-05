ALTER TABLE phone_numbers ADD COLUMN phone_number INT NOT NULL;
ALTER TABLE phone_numbers ADD COLUMN source TEXT NOT NULL;
ALTER TABLE phone_numbers ADD COLUMN territory_id UUID NOT NULL;
ALTER TABLE phone_numbers ADD COLUMN do_not_call BOOLEAN DEFAULT false NOT NULL;
ALTER TABLE phone_numbers ADD CONSTRAINT phone_numbers_phone_number_key UNIQUE(phone_number);
CREATE INDEX phone_numbers_territory_id_index ON phone_numbers (territory_id);
ALTER TABLE phone_numbers ADD CONSTRAINT phone_numbers_ref_territory_id FOREIGN KEY (territory_id) REFERENCES territories (id) ON DELETE NO ACTION;
