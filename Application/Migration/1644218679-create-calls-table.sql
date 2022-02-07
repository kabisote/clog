CREATE TABLE calls (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    phone_number_id UUID NOT NULL,
    agents TEXT NOT NULL,
    remarks TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
CREATE INDEX calls_phone_number_id_index ON calls (phone_number_id);
ALTER TABLE calls ADD CONSTRAINT calls_ref_phone_number_id FOREIGN KEY (phone_number_id) REFERENCES phone_numbers (id) ON DELETE CASCADE;
