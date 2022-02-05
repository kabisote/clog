-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE territories (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL UNIQUE,
    group_number INT DEFAULT 0 NOT NULL
);
CREATE TABLE phone_numbers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    phone_number BIGINT NOT NULL UNIQUE,
    source TEXT NOT NULL,
    territory_id UUID NOT NULL,
    do_not_call BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX phone_numbers_territory_id_index ON phone_numbers (territory_id);
ALTER TABLE phone_numbers ADD CONSTRAINT phone_numbers_ref_territory_id FOREIGN KEY (territory_id) REFERENCES territories (id) ON DELETE SET NULL;
