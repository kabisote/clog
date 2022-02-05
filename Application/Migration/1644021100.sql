ALTER TABLE phone_numbers DROP CONSTRAINT phone_numbers_ref_territory_id;
ALTER TABLE phone_numbers ADD CONSTRAINT phone_numbers_ref_territory_id FOREIGN KEY (territory_id) REFERENCES territories (id) ON DELETE SET NULL;
