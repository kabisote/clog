

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.territories DISABLE TRIGGER ALL;

INSERT INTO public.territories (id, name, group_number) VALUES ('a4d103e6-1225-44f1-bfe6-03f0d8f4e5a3', 'Campo Filipino', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('5364e426-5cb0-420c-b93b-0acfc9ccf3e1', 'Cresencia Village', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('0bdd4641-ea76-4c51-8de9-c2bc12f7f331', 'Camp Allen', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('99026966-39dd-4926-902d-ad87516b31ad', 'Dizon', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('544e98c8-5a7f-4618-81a8-dc9d6a815f3f', 'P. Burgos', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('7f624dea-9f97-40ea-ac76-3f3c207421ff', 'Zamora', 1);
INSERT INTO public.territories (id, name, group_number) VALUES ('4ebc4a86-2879-424f-9598-8f7f1e34a8ef', 'T. Alonzo', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('befe412e-db18-4f2b-86ba-8bb876d3a292', 'New Lucban', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('fa4b064e-f445-483b-9050-acb7573802d0', 'Caguioa', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('9e838de5-40db-4e6f-b656-06436483b39c', 'Rimando', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('bbff0db6-c61c-4c52-90f0-7cede6f03ddd', 'Slaughter', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('d4a9a1fe-351d-471a-99fb-196b63100fc2', 'Trancoville', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('0f09fd39-a8d3-4722-841a-c7afc39478b5', 'Malvar', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('347b1979-c914-4a34-9b26-30c345462120', 'Sgt. Floresca', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('eba74e66-af4b-4c14-a5f6-ab8318ecd22f', 'Magsaysay', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('d2fb3640-e601-46cd-bb2d-e03f77fd91ad', 'Bokawkan', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('374f37a0-f626-4b35-a323-ecc2ca9dc56e', 'Pinget', 3);
INSERT INTO public.territories (id, name, group_number) VALUES ('59849033-201d-42e4-ab2b-3297aea04a39', 'Tabora', 4);
INSERT INTO public.territories (id, name, group_number) VALUES ('f8a95ebd-3a0c-4341-ab21-058993f79b6f', 'Camdas', 4);
INSERT INTO public.territories (id, name, group_number) VALUES ('adfca4a8-398d-4068-9a49-f5838ad9fa03', 'Guisad', 4);
INSERT INTO public.territories (id, name, group_number) VALUES ('bca2a866-0a5e-4735-a360-a8d83bb52317', 'Pinsao Proper', 4);
INSERT INTO public.territories (id, name, group_number) VALUES ('0989599e-0e24-4b5e-a020-7b45d22527ab', 'Pinsao Pilot', 2);
INSERT INTO public.territories (id, name, group_number) VALUES ('e96ad8da-f2fc-430d-868e-e7cb38ec949a', 'Leonila Hill', 5);
INSERT INTO public.territories (id, name, group_number) VALUES ('20a8f0bf-7ad0-446c-8e40-909cd37bf9a6', 'Ambiong', 5);
INSERT INTO public.territories (id, name, group_number) VALUES ('c75b52a6-4ec0-4279-92aa-7cd1a357eead', 'San Antonio Village', 5);
INSERT INTO public.territories (id, name, group_number) VALUES ('8c2b582c-1905-4702-9aab-2d76709e19aa', 'Lopez Jaena', 5);
INSERT INTO public.territories (id, name, group_number) VALUES ('f83ce4da-47c8-4734-a1c7-c800b940757f', 'Quirino Hill', 5);
INSERT INTO public.territories (id, name, group_number) VALUES ('5254ab57-f5e3-4824-849a-84c3367286e8', 'East Modern Site', 6);
INSERT INTO public.territories (id, name, group_number) VALUES ('b33adf4f-7f2f-4724-a5c2-54d5eabdc557', 'Brookspoint', 6);
INSERT INTO public.territories (id, name, group_number) VALUES ('5237d5b8-de74-4823-a1e8-220e884287c3', 'St. Joseph', 6);
INSERT INTO public.territories (id, name, group_number) VALUES ('880d2d68-1f82-4bc5-aafd-bc952b7aa964', 'East Bayan Park', 6);
INSERT INTO public.territories (id, name, group_number) VALUES ('b4b43c75-c38b-43fe-8e60-a5e03f77a0ea', 'Aurora Hill (South Central)', 6);
INSERT INTO public.territories (id, name, group_number) VALUES ('7a22396b-278e-492a-a304-578ec9c87532', 'Sumulong', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('a895b5a7-03c0-47f1-b6f9-cdece022be81', 'Laubach', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('2277426a-3084-467f-9b87-4c30ad781b39', 'Bonifacio', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('ccb2c7c2-9508-4cd1-bfa6-46256f8c83fa', 'Sanitary Camp', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('b2f343e9-46da-4d52-b43e-8cfcb48316c9', 'Happy Homes', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('f8d278a2-d35a-4f6c-9358-1e54288f833c', 'Gen. Luna', 7);
INSERT INTO public.territories (id, name, group_number) VALUES ('bf02990f-21ca-40ab-b8ef-4c90b5929f77', 'Guevarra Street', 8);
INSERT INTO public.territories (id, name, group_number) VALUES ('538bc0c6-3f34-4b67-ba11-9b9f532b459c', 'Brookside', 8);
INSERT INTO public.territories (id, name, group_number) VALUES ('8152f657-da21-4a98-83c4-d3259cff0880', 'Holyghost', 8);
INSERT INTO public.territories (id, name, group_number) VALUES ('ea99844a-c30e-4ec9-b4d8-4b49c59a6e28', 'Honeymoon', 8);
INSERT INTO public.territories (id, name, group_number) VALUES ('d56cfbd3-c260-41aa-880c-60c8170f37e5', 'Imelda Village', 8);
INSERT INTO public.territories (id, name, group_number) VALUES ('2312e2fa-29e0-4d2f-8648-151b35afcd44', 'Pacdal', 0);
INSERT INTO public.territories (id, name, group_number) VALUES ('e39a0e11-308b-4216-8e8f-dcba8b321e17', 'Kabayanihan', 0);
INSERT INTO public.territories (id, name, group_number) VALUES ('738b11e3-1a7f-4c20-91c6-fa4e493b7ee0', 'Hilltop', 0);
INSERT INTO public.territories (id, name, group_number) VALUES ('5ae4e416-3e22-49c8-bf01-bf06f57cf8fb', 'Kagitingan', 0);
INSERT INTO public.territories (id, name, group_number) VALUES ('f615897a-076e-4f7d-93b0-c50df870e13f', 'Public Market', 0);
INSERT INTO public.territories (id, name, group_number) VALUES ('ad86f31f-b720-4f54-951a-fa4b867f586b', 'Outside our Territory', 0);


ALTER TABLE public.territories ENABLE TRIGGER ALL;


ALTER TABLE public.phone_numbers DISABLE TRIGGER ALL;

INSERT INTO public.phone_numbers (id, phone_number, source, territory_id, do_not_call) VALUES ('527b740e-69f8-4344-af3c-d8f5d6010355', 9162232260, 'google maps', '544e98c8-5a7f-4618-81a8-dc9d6a815f3f', true);
INSERT INTO public.phone_numbers (id, phone_number, source, territory_id, do_not_call) VALUES ('330afb5b-f9ea-4c19-8f6f-7bcb3a3e31ac', 9212104210, 'directory', '544e98c8-5a7f-4618-81a8-dc9d6a815f3f', false);


ALTER TABLE public.phone_numbers ENABLE TRIGGER ALL;


ALTER TABLE public.calls DISABLE TRIGGER ALL;

INSERT INTO public.calls (id, phone_number_id, agents, remarks, created_at) VALUES ('c0094086-a30a-45f7-bc7c-5007e230f003', '527b740e-69f8-4344-af3c-d8f5d6010355', 'Marc', 'Sobrang interesado. Huwag na daw akong tumawag.', '2022-02-07 15:54:06.098489+08');
INSERT INTO public.calls (id, phone_number_id, agents, remarks, created_at) VALUES ('fdeee38d-fd19-4f5f-98ea-40824367eaa5', '527b740e-69f8-4344-af3c-d8f5d6010355', 'Cherry', 'The quick brown fox jumps over the lazy dog.', '2022-02-07 18:49:54.795844+08');


ALTER TABLE public.calls ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('3734bf69-02d3-40a9-a626-cf84f864f636', 'g2@ntb.org', 'sha256|17|qQ8pcVmSWFMrPeURvJd6Xw==|YdgusT+pwN++NwhWmGlYFqYhq1D8qsJraWVyQms4wOI=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('23a487b4-605a-4c5a-8d47-f627edfaa6b3', 'g3@ntb.org', 'sha256|17|j+mhSxeonkOpmcGm1ksJqg==|C0sVvMNH3LJ16+Y+UGf0RQnLYUYLSAa8+ltxm8oFmVI=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('95033a39-6a51-4dee-8308-b9a803e34e93', 'g4@ntb.org', 'sha256|17|GM6vYzSgi3hRtHKAgF2a2w==|8K7XPh8QLETZL4kPs0cM6Ortb3NphDm2D1z+RQsJOFg=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('a4d308bc-0c90-4dfa-a93d-5422df7b20a7', 'g5@ntb.org', 'sha256|17|u/PtyB6phS6GhSEucBgYIw==|21yAQMiYUfktisRZxxYj0yf0U/1YXkA+R3UGHXAFa7k=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('e84a6c9e-57fc-4439-a86e-cdcfdb64d702', 'g6@ntb.org', 'sha256|17|kNwxuSOW0ydIew1wez+1AQ==|QBFS13leudyR1fAaXIEBz9wdu2eVzPetBE89tALUDNM=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('ea296d28-8b1e-475e-b8b1-a7fa90656639', 'g7@ntb.org', 'sha256|17|JyBxmtgDAPHBcE0t4O0tdA==|VcAIkMMt6VQwdeMgt1zsqP3DC2VHja3BDPtGBwtRXS4=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('816708a8-c84b-4af0-a900-e83c61a55d9e', 'g8@ntb.org', 'sha256|17|oZgtAYT6V94YPCK5YjO4DA==|ivb+lED1mLZxVPWJz4Otifr5PkNBC9txxzIgq77jd9Q=', NULL, 0, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('f765fb43-cb6e-4ab3-a6f2-c4c68996c6d3', 'g1@ntb.org', 'sha256|17|lk9xEujXKsyNKjYo8Dw9zw==|7Z979QY9KkNnRIkUKjBVqFrSLoq62tKoXJU/DMcGCxQ=', NULL, 0, 6);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, logins) VALUES ('b536d6e2-35b8-4edd-ad2a-2361db89e48b', 'mai@devera.tugas', 'sha256|17|4Livzh8Jhq5BvjNcNeNtoQ==|9JtPKCy7Y3M+i/0zo8Ryt18VFGAJ0gfSMCmfwXfMXDk=', NULL, 0, 2);


ALTER TABLE public.users ENABLE TRIGGER ALL;


