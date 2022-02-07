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
CREATE TABLE calls (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    phone_number_id UUID NOT NULL,
    agents TEXT NOT NULL,
    remarks TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE INDEX calls_phone_number_id_index ON calls (phone_number_id);
ALTER TABLE calls ADD CONSTRAINT calls_ref_phone_number_id FOREIGN KEY (phone_number_id) REFERENCES phone_numbers (id) ON DELETE CASCADE;
ALTER TABLE phone_numbers ADD CONSTRAINT phone_numbers_ref_territory_id FOREIGN KEY (territory_id) REFERENCES territories (id) ON DELETE SET NULL;
