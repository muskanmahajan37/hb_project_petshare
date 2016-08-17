--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: connections; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE connections (
    request_id integer NOT NULL,
    pet_id integer,
    owner_id integer,
    seeker_id integer,
    connection_status character varying
);


ALTER TABLE public.connections OWNER TO vagrant;

--
-- Name: connections_request_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE connections_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connections_request_id_seq OWNER TO vagrant;

--
-- Name: connections_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE connections_request_id_seq OWNED BY connections.request_id;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE owners (
    owner_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.owners OWNER TO vagrant;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE owners_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_owner_id_seq OWNER TO vagrant;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE owners_owner_id_seq OWNED BY owners.owner_id;


--
-- Name: pet_photos; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE pet_photos (
    photo_id integer NOT NULL,
    pet_id integer,
    image_url character varying(200),
    caption character varying(100)
);


ALTER TABLE public.pet_photos OWNER TO vagrant;

--
-- Name: pet_photos_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE pet_photos_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_photos_photo_id_seq OWNER TO vagrant;

--
-- Name: pet_photos_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE pet_photos_photo_id_seq OWNED BY pet_photos.photo_id;


--
-- Name: pets; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE pets (
    pet_id integer NOT NULL,
    name character varying(50),
    age integer,
    gender character varying(1),
    size character varying(10),
    color character varying(50),
    breed character varying(50),
    animal_type character varying(3),
    owner_id integer,
    is_available boolean,
    character_details character varying(300),
    health_details character varying(100),
    image_url character varying(200)
);


ALTER TABLE public.pets OWNER TO vagrant;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE pets_pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pets_pet_id_seq OWNER TO vagrant;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE pets_pet_id_seq OWNED BY pets.pet_id;


--
-- Name: seekers; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE seekers (
    seeker_id integer NOT NULL,
    user_id integer,
    household_size integer,
    children integer,
    pet_experience character varying(10)
);


ALTER TABLE public.seekers OWNER TO vagrant;

--
-- Name: seekers_seeker_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE seekers_seeker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seekers_seeker_id_seq OWNER TO vagrant;

--
-- Name: seekers_seeker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE seekers_seeker_id_seq OWNED BY seekers.seeker_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    email character varying(64),
    password character varying(64),
    phone_number character varying(12),
    birthdate timestamp without time zone,
    occupation character varying(50),
    address character varying(100),
    city character varying(50),
    state character varying(2),
    zipcode character varying(15),
    image_url character varying(200)
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: request_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY connections ALTER COLUMN request_id SET DEFAULT nextval('connections_request_id_seq'::regclass);


--
-- Name: owner_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY owners ALTER COLUMN owner_id SET DEFAULT nextval('owners_owner_id_seq'::regclass);


--
-- Name: photo_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pet_photos ALTER COLUMN photo_id SET DEFAULT nextval('pet_photos_photo_id_seq'::regclass);


--
-- Name: pet_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pets ALTER COLUMN pet_id SET DEFAULT nextval('pets_pet_id_seq'::regclass);


--
-- Name: seeker_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY seekers ALTER COLUMN seeker_id SET DEFAULT nextval('seekers_seeker_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY connections (request_id, pet_id, owner_id, seeker_id, connection_status) FROM stdin;
1	1	1	4	Interested
2	1	1	5	Interested
\.


--
-- Name: connections_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('connections_request_id_seq', 2, true);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY owners (owner_id, user_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Name: owners_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('owners_owner_id_seq', 6, true);


--
-- Data for Name: pet_photos; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY pet_photos (photo_id, pet_id, image_url, caption) FROM stdin;
1	1	https://howlingforjustice.files.wordpress.com/2012/06/ghost-with-jon-snow-got1.png?w=400	My human BFF and I ready for battle.
2	1	https://cdn.cloudpix.co/images/jon-snow/jon-snow-on-the-iron-throne-with-ghost-game-of-thrones-and-ghost-34478429f2e282ab1f7d85393f0d2ede-large-388205.jpg	My human BFF and I on the iron throne.
3	5	https://s-media-cache-ak0.pinimg.com/564x/82/33/02/8233028427798cc7bd701c70a6a02317.jpg	When I was a wee pup with my human BFF.
4	6	http://img0007o.psstatic.com/115008713_calvin-and-hobbes-pajama-dancing-canvas-print-44-ebay.jpg	Dancing with my little buddy.
5	6	http://images4.fanpop.com/image/photos/23700000/Calvin-Hobbes-calvin-and-hobbes-23762777-1280-800.jpg	We got moves!
6	6	http://i.onionstatic.com/avclub/5449/21/16x9/960.jpg	Exploring with my little buddy.
\.


--
-- Name: pet_photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('pet_photos_photo_id_seq', 6, true);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY pets (pet_id, name, age, gender, size, color, breed, animal_type, owner_id, is_available, character_details, health_details, image_url) FROM stdin;
1	Ghost	6	M	140lbs	white	direwolf	dog	1	t	Super loyal, badass warrior, independent traveler, and perfect right hand guard in battle.	Runt at birth but no longer now	http://45.media.tumblr.com/bffe4197139c20b9290544400ba80723/tumblr_o69pqtZRSn1s6bxzqo3_r2_540.gif
2	Summer	6	M	138lbs	light beige and white	direwolf	dog	4	t	Super loyal and protector of Bran Stark. Always saving Bran and his friends from white walkers.	Sporting battle scars.	null
3	Nymeria	6	F	139lbs	grey and white	direwolf	dog	2	t	Faithful to Arya and biter of Joffrey.	null	null
4	Lady	6	F	128lbs	grey and white	direwolf	dog	3	t	Superfriendly and gullible. Saintly.	Bleeding stab wounds.	https://s-media-cache-ak0.pinimg.com/564x/ce/2f/76/ce2f76182c44d8cef10cdb1abc38fd56.jpg
5	Grey Wind	6	M	141	grey	direwolf	dog	5	t	Super loyal, badass warrior. Notorious reputation for fighting in battles. 	null	http://vignette2.wikia.nocookie.net/gameofthrones/images/f/f8/GreyWindSeason2Debut.jpg/revision/latest?cb=20160716040036
6	Hobbes	3	M	14lbs	orange white stripes	tabby	cat	6	t	Precocious, mischievous, and adventurous. 	null	https://somethingokay.files.wordpress.com/2012/11/hobbes-from-calvin-and-hobbes-7.gif
\.


--
-- Name: pets_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('pets_pet_id_seq', 6, true);


--
-- Data for Name: seekers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY seekers (seeker_id, user_id, household_size, children, pet_experience) FROM stdin;
1	7	5	3	False
2	8	6	3	False
3	6	0	0	False
4	9	99	0	True
5	10	7	0	True
6	11	2	0	True
\.


--
-- Name: seekers_seeker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('seekers_seeker_id_seq', 6, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, last_name, first_name, email, password, phone_number, birthdate, occupation, address, city, state, zipcode, image_url) FROM stdin;
1	Snow	John	jsnow@gmail.com	123xyz	415-555-5555	1980-12-01 00:00:00	King of the North	123 abc st	San Francisco	CA	94122	null
2	Stark	Arya	astark@gmail.com	123xyz	415-555-5555	1986-01-01 00:00:00	No one assassin	123 abc st	San Francisco	CA	94110	null
3	Stark	Sansa	sstark@gmail.com	123xyz	415-555-5555	1984-08-14 00:00:00	Wife of Ramsay Bolton	123 abc st	San Francisco	CA	94123	null
4	Stark	Bran	bstark@gmail.com	123xyz	415-555-5555	1988-03-01 00:00:00	Raven	123 abc st	San Francisco	CA	94117	null
5	Stark	Robb	rstark@gmail.com	123xyz	415-555-5555	1979-09-11 00:00:00	former King of the North	123 abc st	Colma	CA	94014	null
6	Watterson	Calvin	cwatterson@gmail.com	123xyz	415-555-5555	1980-01-01 00:00:00	Comic book star	123 abc st	San Francisco	CA	94121	null
7	Lannister	Tyrion	tlannister@gmail.com	123xyz	415-555-5555	1975-07-11 00:00:00	Queen's Hand	123 abc st	San Francisco	CA	94115	null
8	Lannister	Jamie	tlannister@gmail.com	123xyz	415-555-5555	1972-10-31 00:00:00	King's Guard	123 abc st	San Francisco	CA	94109	null
9	Lannister	Cersei	clannister@gmail.com	123xyz	415-555-5555	1972-10-31 00:00:00	Queen Mother	123 abc st	San Francisco	CA	94109	null
10	Targaryen	Dani	dtargaryen@gmail.com	123xyz	415-555-5555	1980-02-29 00:00:00	Mother of Dragons	123 abc st	San Francisco	CA	94109	null
11	Greyjoy	Theon	tgreyjoy@gmail.com	123xyz	415-555-5555	1980-08-29 00:00:00	Ramsay's Pet	123 abc st	San Francisco	CA	94123	null
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 11, true);


--
-- Name: connections_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (request_id);


--
-- Name: owners_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- Name: pet_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY pet_photos
    ADD CONSTRAINT pet_photos_pkey PRIMARY KEY (photo_id);


--
-- Name: pets_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (pet_id);


--
-- Name: seekers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_pkey PRIMARY KEY (seeker_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: connections_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES owners(owner_id);


--
-- Name: connections_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES pets(pet_id);


--
-- Name: connections_seeker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_seeker_id_fkey FOREIGN KEY (seeker_id) REFERENCES seekers(seeker_id);


--
-- Name: owners_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT owners_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: pet_photos_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pet_photos
    ADD CONSTRAINT pet_photos_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES pets(pet_id);


--
-- Name: pets_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY pets
    ADD CONSTRAINT pets_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES owners(owner_id);


--
-- Name: seekers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
