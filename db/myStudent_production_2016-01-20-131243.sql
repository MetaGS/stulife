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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: car_vendors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE car_vendors (
    id integer NOT NULL,
    country_id integer,
    featured_image_id integer,
    name character varying,
    slug character varying,
    address character varying,
    longitude character varying,
    latitude character varying,
    owner_name character varying,
    owner_mobile character varying,
    owner_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: car_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE car_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: car_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE car_vendors_id_seq OWNED BY car_vendors.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cars (
    id integer NOT NULL,
    car_vendor_id integer,
    featured_image_id integer,
    car_type character varying,
    brand character varying,
    model character varying,
    year character varying,
    price integer,
    deposit_months integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cars_id_seq OWNED BY cars.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: country_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE country_translations (
    id integer NOT NULL,
    country_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: country_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE country_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: country_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE country_translations_id_seq OWNED BY country_translations.id;


--
-- Name: course_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE course_translations (
    id integer NOT NULL,
    course_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: course_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE course_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE course_translations_id_seq OWNED BY course_translations.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    slug character varying,
    university_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    study_field_id integer,
    study_level_id integer
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: field_level_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE field_level_translations (
    id integer NOT NULL,
    field_level_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content text
);


--
-- Name: field_level_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE field_level_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: field_level_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE field_level_translations_id_seq OWNED BY field_level_translations.id;


--
-- Name: field_levels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE field_levels (
    id integer NOT NULL,
    country_id integer,
    study_field_id integer,
    study_level_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: field_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE field_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: field_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE field_levels_id_seq OWNED BY field_levels.id;


--
-- Name: house_units; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE house_units (
    id integer NOT NULL,
    house_id integer,
    featured_image_id integer,
    unit_type character varying,
    size integer,
    price integer,
    owner_name character varying,
    owner_mobile character varying,
    owner_email character varying,
    security_deposit_months integer,
    utilities_deposit_months integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: house_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE house_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: house_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE house_units_id_seq OWNED BY house_units.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE houses (
    id integer NOT NULL,
    country_id integer,
    featured_image_id integer,
    name character varying,
    slug character varying,
    address character varying,
    property_type character varying,
    longitude character varying,
    latitude character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE houses_id_seq OWNED BY houses.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    name character varying,
    imageable_id integer,
    imageable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: page_region_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE page_region_translations (
    id integer NOT NULL,
    page_region_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content text
);


--
-- Name: page_region_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE page_region_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_region_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE page_region_translations_id_seq OWNED BY page_region_translations.id;


--
-- Name: page_regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE page_regions (
    id integer NOT NULL,
    country_id integer,
    controller character varying,
    action character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: page_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE page_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE page_regions_id_seq OWNED BY page_regions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: study_field_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE study_field_translations (
    id integer NOT NULL,
    study_field_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: study_field_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE study_field_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: study_field_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE study_field_translations_id_seq OWNED BY study_field_translations.id;


--
-- Name: study_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE study_fields (
    id integer NOT NULL,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: study_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE study_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: study_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE study_fields_id_seq OWNED BY study_fields.id;


--
-- Name: study_level_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE study_level_translations (
    id integer NOT NULL,
    study_level_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: study_level_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE study_level_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: study_level_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE study_level_translations_id_seq OWNED BY study_level_translations.id;


--
-- Name: study_levels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE study_levels (
    id integer NOT NULL,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: study_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE study_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: study_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE study_levels_id_seq OWNED BY study_levels.id;


--
-- Name: universities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE universities (
    id integer NOT NULL,
    slug character varying,
    country_id integer,
    featured_image_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE universities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE universities_id_seq OWNED BY universities.id;


--
-- Name: university_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE university_translations (
    id integer NOT NULL,
    university_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: university_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE university_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: university_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE university_translations_id_seq OWNED BY university_translations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    name character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY car_vendors ALTER COLUMN id SET DEFAULT nextval('car_vendors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cars ALTER COLUMN id SET DEFAULT nextval('cars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY country_translations ALTER COLUMN id SET DEFAULT nextval('country_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_translations ALTER COLUMN id SET DEFAULT nextval('course_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_level_translations ALTER COLUMN id SET DEFAULT nextval('field_level_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_levels ALTER COLUMN id SET DEFAULT nextval('field_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY house_units ALTER COLUMN id SET DEFAULT nextval('house_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY houses ALTER COLUMN id SET DEFAULT nextval('houses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY page_region_translations ALTER COLUMN id SET DEFAULT nextval('page_region_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY page_regions ALTER COLUMN id SET DEFAULT nextval('page_regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY study_field_translations ALTER COLUMN id SET DEFAULT nextval('study_field_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY study_fields ALTER COLUMN id SET DEFAULT nextval('study_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY study_level_translations ALTER COLUMN id SET DEFAULT nextval('study_level_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY study_levels ALTER COLUMN id SET DEFAULT nextval('study_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY universities ALTER COLUMN id SET DEFAULT nextval('universities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY university_translations ALTER COLUMN id SET DEFAULT nextval('university_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
2	soogarjun@gmail.com	$2a$10$sSMFoLHCofOtUfpfq5C39OiFOS/9WZgW9zOVI7abOv6KR5/QG30j.	\N	\N	\N	0	\N	\N	\N	\N	2015-12-23 14:33:12.22767	2015-12-23 14:33:12.22767
3	sohcheehong96@gmail.com	$2a$10$9UnGBpwUSj1Rm3Lj4pIgr.UZcD5eFicFqz2kaZsAIRRAqu3NSRpV6	\N	\N	\N	0	\N	\N	\N	\N	2015-12-23 14:33:12.41581	2015-12-23 14:33:12.41581
1	chinwei.chee@gmail.com	$2a$10$5xk2nlE5VA1X45saIhrgX.7R2VGm1ykxlLK/ExP2tCoO8PYp6Lb.S	\N	\N	\N	14	2016-01-18 06:04:20.762502	2016-01-10 10:19:21.626675	175.143.226.123	219.92.135.248	2015-12-23 14:33:12.034059	2016-01-18 06:04:20.767918
6	ngjaz92@gmail.com	$2a$10$xSI1x0as0IM0YHEzeKJibOfdZdsJPuAUyhwJ9/u8KITLNAQZ6o.xy	\N	\N	\N	12	2016-01-18 12:27:05.123492	2016-01-18 05:39:39.510225	175.141.236.88	121.121.99.15	2015-12-26 04:50:46.693396	2016-01-18 12:27:05.13136
4	kajoon83@gmail.com	$2a$10$.8u3nTlSvNwezsrMupH56.ewnz3rYblzTcmrPCZJ9hOdPslQa6OAi	\N	\N	\N	12	2016-01-19 09:49:19.680094	2016-01-18 12:00:02.872606	219.92.22.81	175.141.236.88	2015-12-26 04:50:13.044959	2016-01-19 09:49:19.683706
5	tumar1993@gmail.com	$2a$10$MBHeFs0NTko8VzHqst5s3.egjVdbYBnJ7K9LoY5umaKXSmXfuSM3S	\N	\N	\N	7	2016-01-11 08:52:00.354256	2016-01-06 13:12:08.568836	219.92.23.100	118.101.202.7	2015-12-26 04:50:35.011066	2016-01-11 08:52:00.361875
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('admins_id_seq', 6, true);


--
-- Data for Name: car_vendors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY car_vendors (id, country_id, featured_image_id, name, slug, address, longitude, latitude, owner_name, owner_mobile, owner_email, created_at, updated_at) FROM stdin;
\.


--
-- Name: car_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('car_vendors_id_seq', 1, false);


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cars (id, car_vendor_id, featured_image_id, car_type, brand, model, year, price, deposit_months, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cars_id_seq', 1, false);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY countries (id, slug, created_at, updated_at) FROM stdin;
1	malaysia	2015-12-23 14:33:12.560052	2015-12-23 14:33:12.560052
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('countries_id_seq', 1, true);


--
-- Data for Name: country_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country_translations (id, country_id, locale, created_at, updated_at, name) FROM stdin;
1	1	en	2015-12-23 14:33:12.567092	2015-12-23 14:33:12.567092	Malaysia
\.


--
-- Name: country_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_translations_id_seq', 1, true);


--
-- Data for Name: course_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY course_translations (id, course_id, locale, created_at, updated_at, name, description) FROM stdin;
1	1	en	2015-12-29 08:54:38.241332	2015-12-29 08:54:38.241332	GCE A-LEVELS	<h4><strong>Why Study GCE A-Levels at First City UC?</strong></h4>\r\n<ul>\r\n<li>Wide choice of subjects</li>\r\n<li>Students can either follow a broad course of study or specialise in a particular area</li>\r\n<li>Successful placement in reputable universities around the world (Britain, Australia, USA, Canada and New Zealand)</li>\r\n<li>Some of our graduates are successful entrepreneurs and professionals</li>\r\n</ul>
2	2	en	2015-12-29 09:35:11.356571	2015-12-29 09:35:11.356571	Diploma in Automotive Technology	<h4 id="custom-title-h4-1" class="ui--animation ">Overview</h4>\r\n<ul class="ui--list list-circle parent-1">\r\n<li class="child-1 total-6 ui--animation">Focuses on repair, service, maintenance and diagnostic of motor vehicle.</li>\r\n<li class="child-2 total-6 ui--animation">Hands-on with 70% practical and 30% theory</li>\r\n<li class="child-3 total-6 ui--animation">Opportunity to work with different Asian &amp; European car models</li>\r\n<li class="child-4 total-6 ui--animation">Recognized by the <strong>Ministry of Education (MoE)</strong> and is fully accredited by <strong>Malaysian Qualifications Agency (MQA)</strong>.</li>\r\n<li class="child-5 total-6 ui--animation">Education financial assistance is available for DAT students.</li>\r\n<li class="child-6 total-6 ui--animation">Lifetime career placement is provided to all TOC graduates.</li>\r\n</ul>\r\n<div class="ui-row row-fluid">\r\n<div class="ui-column span6">\r\n<h4 id="custom-title-h4-2" class="ui--animation ">Program Facilities</h4>\r\n<div class="auto-format ui--animation">\r\n<p><a href="http://www.toc.edu.my/programmes/program-facilities/#automotive">Click here</a> to see our state-of-the-art servicing equipment.</p>\r\n</div>\r\n<div class="ui--space clearfix" data-responsive="{&quot;css&quot;:{&quot;height&quot;:{&quot;phone&quot;:&quot;10px&quot;,&quot;tablet&quot;:&quot;10px&quot;,&quot;widescreen&quot;:&quot;10px&quot;}}}">&nbsp;</div>\r\n<h4 id="custom-title-h4-3" class="ui--animation ">Course Intake</h4>\r\n<div class="auto-format ui--animation">\r\n<p>We have 5 intakes per year: Feb, Apr, Jul, Aug, Nov.<br /><a href="http://www.toc.edu.my/admission/payment-procedure/#intake">Click here</a> to know the exact dates of intake.</p>\r\n</div>\r\n<div class="ui--space clearfix" data-responsive="{&quot;css&quot;:{&quot;height&quot;:{&quot;phone&quot;:&quot;10px&quot;,&quot;tablet&quot;:&quot;10px&quot;,&quot;widescreen&quot;:&quot;10px&quot;}}}">&nbsp;</div>\r\n<h4 id="custom-title-h4-4" class="ui--animation ">Course Duration</h4>\r\n<div class="auto-format ui--animation">\r\n<p>2.5 Years</p>\r\n</div>\r\n</div>\r\n</div>
3	3	en	2015-12-29 09:40:30.220992	2015-12-29 09:40:30.220992	Cambridge A Levels	<p><span class="subtitle1"><strong>What is Cambridge A Levels?</strong></span><br />The Cambridge Advanced Level or A Level programme is pre-university programme conducted by the prestigious University of Cambridge International Examinations, United Kingdom.<br /><br />The Cambridge A Level programme is the gateway to the most prestigious universities worldwide, and with our 46 years of academic experience, Taylor's College has established itself as the Best Pre-University in Malaysia.<br /><br />Our curriculum and track records in academic excellence has resulted in the successful placement of our students into top universities of their choice.<br /><br /><span class="subtitle1"><strong>International Recognition:</strong></span><br />Students who complete their Cambridge A Levels receive international recognition from the Top Universities worldwide including those from the UK, North America, Australia and the European Union.<br /><br />For the UK alone, our Cambridge A Levels students have enrolled in all of the Top 10 UK Universities:</p>\r\n<ol>\r\n<li>University of Oxford</li>\r\n<li>University of Cambridge</li>\r\n<li>Imperial College London</li>\r\n<li>University College London (UCL)</li>\r\n<li>London School of Economics and Political Science (LSE)</li>\r\n<li>King&rsquo;s College London</li>\r\n<li>University of Edinburgh</li>\r\n<li>University of Manchester</li>\r\n<li>University of Bristol</li>\r\n<li>Durham University</li>\r\n</ol>\r\n<p><span class="subtitle1"><strong>Subjects Offered:</strong></span></p>\r\n<ul>\r\n<li>Accounting</li>\r\n<li>Biology</li>\r\n<li>Business Studies</li>\r\n<li>Chemistry</li>\r\n<li>Computer Science</li>\r\n<li>Economics</li>\r\n<li>Further Mathematics</li>\r\n<li>Global Perspective &amp; Independent Research (GPR)</li>\r\n<li>Law</li>\r\n<li>Literature in English</li>\r\n<li>Mathematics</li>\r\n<li>Physics</li>\r\n<li>Psychology</li>\r\n<li>Sociology</li>\r\n</ul>\r\n<div class="icon-arrow">Click <a class="link" href="https://college.taylors.edu.my/alevels/subject-overview">here</a> to view full descriptions of the subjects offered.</div>\r\n<p><br /><span class="subtitle1"><strong>Intakes:</strong></span></p>\r\n<ul>\r\n<li>January</li>\r\n<li>March</li>\r\n<li>July</li>\r\n</ul>\r\n<p><span class="subtitle1"><strong>Entry Requirements:</strong></span><br />SPM/O Level/equivalent: 5 credits (subject pre-requisites apply)</p>
4	4	cn	2015-12-31 06:31:36.606769	2015-12-31 06:36:11.535814	Foundation in Commerce	<p>Our programme bridges you from secondary studies to a university degree. The <a href="https://en.wikipedia.org/wiki/Foundation" target="_blank">Foundation</a> in Commerce will guarantee your entry into prestigious undergraduate programmes with SEGi, as well as our partner universities in Australia and UK. The foundation will also enable you to receive exemptions into selective SEGi degree, at the same time, provide basic knowledge in the areas of commerce and management.</p>
5	4	en	2015-12-31 06:36:38.035132	2015-12-31 06:43:30.759873	Foundation in Commerce	<p>Our programme bridges you from secondary studies to a university degree. The <a href="https://en.wikipedia.org/wiki/Foundation">Foundation</a> in Commerce will guarantee your entry into prestigious undergraduate programmes with SEGi, as well as our partner universities in Australia and UK. The foundation will also enable you to receive exemptions into selective SEGi degree, at the same time, provide basic knowledge in the areas of commerce and management.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>
\.


--
-- Name: course_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('course_translations_id_seq', 5, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY courses (id, slug, university_id, created_at, updated_at, study_field_id, study_level_id) FROM stdin;
3	cambridge-a-levels	1	2015-12-29 09:40:30.211267	2015-12-29 09:40:30.211267	\N	\N
4	foundation-in-commerce	4	2015-12-31 06:31:36.594417	2015-12-31 06:43:30.751036	\N	\N
1	gce-a-levels	2	2015-12-29 08:54:38.234188	2016-01-04 03:13:18.957173	0	0
2	diploma-in-automotive-technology	3	2015-12-29 09:35:11.342876	2016-01-04 03:13:50.245391	0	0
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courses_id_seq', 4, true);


--
-- Data for Name: field_level_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY field_level_translations (id, field_level_id, locale, created_at, updated_at, content) FROM stdin;
3	156	en	2016-01-11 08:04:44.198311	2016-01-11 08:18:25.309795	<p><strong>Master Studies</strong></p>\r\n<p>A master's degree is an academic degree granted to individuals who have undergone study demonstrating a mastery or high-order overview of a specific field of study or area of professional practice.</p>
4	157	en	2016-01-11 08:04:44.228382	2016-01-11 08:18:25.321651	<p><strong>PhD Studies</strong></p>\r\n<p>A PhD stands for 'Doctor of Philosophy', sometimes referred to as a 'doctorate'. It is the highest level of degree that a student can achieve.</p>
1	158	en	2016-01-11 08:04:44.122391	2016-01-11 08:53:54.885924	<p><strong>Foundation Studies</strong></p>\r\n<p>Foundation Studies Program teaches you in clear and concrete terms how to be a successful university student and is a pathway to undergraduate study.</p>\r\n<p>The program is designed for people who are returning to study, who may not have any qualifications, or for English as a second language students.</p>\r\n<p>No formal qualifications are required for entry.&nbsp; However, for semester one entry, applicants must be 18 years or over before 1 February in the intended year of study. For midyear entry, applicants must be 18 years or over before 1 July in the intended year of study.&nbsp;</p>\r\n<p>Applicants who have completed a recognised award at Certificate IV level or higher will not be considered for admission to this program.</p>\r\n<p><strong>Diploma Studies</strong></p>\r\n<p>This course has been specially designed for students who do not meet the entry requirements for the Bachelor of Education through the formal VTAC (or direct) selection process.</p>
2	155	en	2016-01-11 08:04:44.168477	2016-01-11 08:53:54.915794	<p><strong>Degree Studies</strong></p>\r\n<p>An academic degree is the state of recognized completion of studies at a school or university. A diploma is generally issued in recognition of having satisfactorily completed the prescribed course of study. The two most commondegrees awarded today are associate and bachelor's.</p>\r\n<p>degree student has usually passed an entrance examination and obtained an official right to take degree at the university where s/he studies. The duration of degree studies varies from 2 years to 5 years and requires full-time studies.</p>
\.


--
-- Name: field_level_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('field_level_translations_id_seq', 4, true);


--
-- Data for Name: field_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY field_levels (id, country_id, study_field_id, study_level_id, created_at, updated_at) FROM stdin;
151	1	1	3	2016-01-10 10:22:13.20412	2016-01-10 10:22:13.20412
152	1	1	4	2016-01-10 10:22:13.234345	2016-01-10 10:22:13.234345
153	1	1	5	2016-01-10 10:22:13.254599	2016-01-10 10:22:13.254599
154	1	1	1	2016-01-10 10:22:13.273199	2016-01-10 10:22:13.273199
159	1	3	3	2016-01-10 10:22:13.363283	2016-01-10 10:22:13.363283
160	1	3	4	2016-01-10 10:22:13.378781	2016-01-10 10:22:13.378781
161	1	3	5	2016-01-10 10:22:13.394074	2016-01-10 10:22:13.394074
162	1	3	1	2016-01-10 10:22:13.410151	2016-01-10 10:22:13.410151
163	1	4	3	2016-01-10 10:22:13.428122	2016-01-10 10:22:13.428122
164	1	4	4	2016-01-10 10:22:13.449391	2016-01-10 10:22:13.449391
165	1	4	5	2016-01-10 10:22:13.466079	2016-01-10 10:22:13.466079
166	1	4	1	2016-01-10 10:22:13.482528	2016-01-10 10:22:13.482528
167	1	5	3	2016-01-10 10:22:13.508739	2016-01-10 10:22:13.508739
168	1	5	4	2016-01-10 10:22:13.524734	2016-01-10 10:22:13.524734
169	1	5	5	2016-01-10 10:22:13.615929	2016-01-10 10:22:13.615929
170	1	5	1	2016-01-10 10:22:13.636072	2016-01-10 10:22:13.636072
171	1	7	3	2016-01-10 10:22:13.655126	2016-01-10 10:22:13.655126
172	1	7	4	2016-01-10 10:22:13.672022	2016-01-10 10:22:13.672022
173	1	7	5	2016-01-10 10:22:13.689038	2016-01-10 10:22:13.689038
174	1	7	1	2016-01-10 10:22:13.706194	2016-01-10 10:22:13.706194
175	1	8	3	2016-01-10 10:22:13.73066	2016-01-10 10:22:13.73066
176	1	8	4	2016-01-10 10:22:13.752355	2016-01-10 10:22:13.752355
177	1	8	5	2016-01-10 10:22:13.774077	2016-01-10 10:22:13.774077
178	1	8	1	2016-01-10 10:22:13.791488	2016-01-10 10:22:13.791488
179	1	9	3	2016-01-10 10:22:13.810127	2016-01-10 10:22:13.810127
180	1	9	4	2016-01-10 10:22:13.827725	2016-01-10 10:22:13.827725
181	1	9	5	2016-01-10 10:22:13.843822	2016-01-10 10:22:13.843822
182	1	9	1	2016-01-10 10:22:13.857827	2016-01-10 10:22:13.857827
183	1	10	3	2016-01-10 10:22:13.868587	2016-01-10 10:22:13.868587
184	1	10	4	2016-01-10 10:22:13.886663	2016-01-10 10:22:13.886663
185	1	10	5	2016-01-10 10:22:13.909796	2016-01-10 10:22:13.909796
186	1	10	1	2016-01-10 10:22:13.930812	2016-01-10 10:22:13.930812
187	1	11	3	2016-01-10 10:22:13.953843	2016-01-10 10:22:13.953843
188	1	11	4	2016-01-10 10:22:13.962511	2016-01-10 10:22:13.962511
189	1	11	5	2016-01-10 10:22:13.969884	2016-01-10 10:22:13.969884
190	1	11	1	2016-01-10 10:22:13.978083	2016-01-10 10:22:13.978083
191	1	12	3	2016-01-10 10:22:13.998062	2016-01-10 10:22:13.998062
192	1	12	4	2016-01-10 10:22:14.012248	2016-01-10 10:22:14.012248
193	1	12	5	2016-01-10 10:22:14.030069	2016-01-10 10:22:14.030069
194	1	12	1	2016-01-10 10:22:14.047326	2016-01-10 10:22:14.047326
195	1	14	3	2016-01-10 10:22:14.072198	2016-01-10 10:22:14.072198
196	1	14	4	2016-01-10 10:22:14.089889	2016-01-10 10:22:14.089889
197	1	14	5	2016-01-10 10:22:14.107397	2016-01-10 10:22:14.107397
198	1	14	1	2016-01-10 10:22:14.126027	2016-01-10 10:22:14.126027
199	1	15	3	2016-01-10 10:22:14.147684	2016-01-10 10:22:14.147684
200	1	15	4	2016-01-10 10:22:14.16609	2016-01-10 10:22:14.16609
201	1	15	5	2016-01-10 10:22:14.184686	2016-01-10 10:22:14.184686
202	1	15	1	2016-01-10 10:22:14.197994	2016-01-10 10:22:14.197994
203	1	16	3	2016-01-10 10:22:14.215891	2016-01-10 10:22:14.215891
204	1	16	4	2016-01-10 10:22:14.228488	2016-01-10 10:22:14.228488
205	1	16	5	2016-01-10 10:22:14.251762	2016-01-10 10:22:14.251762
206	1	16	1	2016-01-10 10:22:14.268713	2016-01-10 10:22:14.268713
207	1	17	3	2016-01-10 10:22:14.290155	2016-01-10 10:22:14.290155
208	1	17	4	2016-01-10 10:22:14.307709	2016-01-10 10:22:14.307709
209	1	17	5	2016-01-10 10:22:14.324501	2016-01-10 10:22:14.324501
210	1	17	1	2016-01-10 10:22:14.340844	2016-01-10 10:22:14.340844
211	1	18	3	2016-01-10 10:22:14.36089	2016-01-10 10:22:14.36089
212	1	18	4	2016-01-10 10:22:14.383971	2016-01-10 10:22:14.383971
213	1	18	5	2016-01-10 10:22:14.406054	2016-01-10 10:22:14.406054
214	1	18	1	2016-01-10 10:22:14.427077	2016-01-10 10:22:14.427077
215	1	19	3	2016-01-10 10:22:14.446338	2016-01-10 10:22:14.446338
216	1	19	4	2016-01-10 10:22:14.463203	2016-01-10 10:22:14.463203
217	1	19	5	2016-01-10 10:22:14.479658	2016-01-10 10:22:14.479658
218	1	19	1	2016-01-10 10:22:14.49669	2016-01-10 10:22:14.49669
219	1	20	3	2016-01-10 10:22:14.516148	2016-01-10 10:22:14.516148
220	1	20	4	2016-01-10 10:22:14.538153	2016-01-10 10:22:14.538153
221	1	20	5	2016-01-10 10:22:14.558021	2016-01-10 10:22:14.558021
222	1	20	1	2016-01-10 10:22:14.579324	2016-01-10 10:22:14.579324
223	1	21	3	2016-01-10 10:22:14.600212	2016-01-10 10:22:14.600212
224	1	21	4	2016-01-10 10:22:14.615019	2016-01-10 10:22:14.615019
225	1	21	5	2016-01-10 10:22:14.625146	2016-01-10 10:22:14.625146
226	1	21	1	2016-01-10 10:22:14.635137	2016-01-10 10:22:14.635137
227	1	22	3	2016-01-10 10:22:14.646622	2016-01-10 10:22:14.646622
228	1	22	4	2016-01-10 10:22:14.657866	2016-01-10 10:22:14.657866
229	1	22	5	2016-01-10 10:22:14.678625	2016-01-10 10:22:14.678625
230	1	22	1	2016-01-10 10:22:14.701674	2016-01-10 10:22:14.701674
231	1	23	3	2016-01-10 10:22:14.727029	2016-01-10 10:22:14.727029
232	1	23	4	2016-01-10 10:22:14.749011	2016-01-10 10:22:14.749011
233	1	23	5	2016-01-10 10:22:14.768732	2016-01-10 10:22:14.768732
234	1	23	1	2016-01-10 10:22:14.789948	2016-01-10 10:22:14.789948
235	1	24	3	2016-01-10 10:22:14.812873	2016-01-10 10:22:14.812873
236	1	24	4	2016-01-10 10:22:14.830995	2016-01-10 10:22:14.830995
237	1	24	5	2016-01-10 10:22:14.851026	2016-01-10 10:22:14.851026
238	1	24	1	2016-01-10 10:22:14.872721	2016-01-10 10:22:14.872721
239	1	25	3	2016-01-10 10:22:14.897023	2016-01-10 10:22:14.897023
240	1	25	4	2016-01-10 10:22:14.913705	2016-01-10 10:22:14.913705
241	1	25	5	2016-01-10 10:22:14.960148	2016-01-10 10:22:14.960148
242	1	25	1	2016-01-10 10:22:14.986692	2016-01-10 10:22:14.986692
243	1	26	3	2016-01-10 10:22:15.014486	2016-01-10 10:22:15.014486
244	1	26	4	2016-01-10 10:22:15.038122	2016-01-10 10:22:15.038122
245	1	26	5	2016-01-10 10:22:15.059961	2016-01-10 10:22:15.059961
246	1	26	1	2016-01-10 10:22:15.078686	2016-01-10 10:22:15.078686
247	1	27	3	2016-01-10 10:22:15.097581	2016-01-10 10:22:15.097581
248	1	27	4	2016-01-10 10:22:15.108707	2016-01-10 10:22:15.108707
249	1	27	5	2016-01-10 10:22:15.117586	2016-01-10 10:22:15.117586
250	1	27	1	2016-01-10 10:22:15.134965	2016-01-10 10:22:15.134965
251	1	28	3	2016-01-10 10:22:15.156993	2016-01-10 10:22:15.156993
252	1	28	4	2016-01-10 10:22:15.175709	2016-01-10 10:22:15.175709
253	1	28	5	2016-01-10 10:22:15.194242	2016-01-10 10:22:15.194242
254	1	28	1	2016-01-10 10:22:15.213438	2016-01-10 10:22:15.213438
255	1	29	3	2016-01-10 10:22:15.236669	2016-01-10 10:22:15.236669
256	1	29	4	2016-01-10 10:22:15.255455	2016-01-10 10:22:15.255455
257	1	29	5	2016-01-10 10:22:15.279033	2016-01-10 10:22:15.279033
258	1	29	1	2016-01-10 10:22:15.29923	2016-01-10 10:22:15.29923
259	1	30	3	2016-01-10 10:22:15.323622	2016-01-10 10:22:15.323622
260	1	30	4	2016-01-10 10:22:15.345651	2016-01-10 10:22:15.345651
261	1	30	5	2016-01-10 10:22:15.367922	2016-01-10 10:22:15.367922
262	1	30	1	2016-01-10 10:22:15.390862	2016-01-10 10:22:15.390862
263	1	6	3	2016-01-10 10:22:15.411388	2016-01-10 10:22:15.411388
264	1	6	4	2016-01-10 10:22:15.427346	2016-01-10 10:22:15.427346
265	1	6	5	2016-01-10 10:22:15.446297	2016-01-10 10:22:15.446297
266	1	6	1	2016-01-10 10:22:15.462898	2016-01-10 10:22:15.462898
267	1	13	3	2016-01-10 10:22:15.481796	2016-01-10 10:22:15.481796
268	1	13	4	2016-01-10 10:22:15.503475	2016-01-10 10:22:15.503475
269	1	13	5	2016-01-10 10:22:15.522845	2016-01-10 10:22:15.522845
270	1	13	1	2016-01-10 10:22:15.542628	2016-01-10 10:22:15.542628
155	1	2	3	2016-01-10 10:22:13.295346	2016-01-11 08:53:54.906283
156	1	2	4	2016-01-10 10:22:13.310708	2016-01-11 08:18:25.30634
157	1	2	5	2016-01-10 10:22:13.328259	2016-01-11 08:18:25.318754
158	1	2	1	2016-01-10 10:22:13.344811	2016-01-11 08:53:54.881244
\.


--
-- Name: field_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('field_levels_id_seq', 270, true);


--
-- Data for Name: house_units; Type: TABLE DATA; Schema: public; Owner: -
--

COPY house_units (id, house_id, featured_image_id, unit_type, size, price, owner_name, owner_mobile, owner_email, security_deposit_months, utilities_deposit_months, description, created_at, updated_at) FROM stdin;
12	6	74	Whole Unit	933	2500	Ant Hun	+6016 205 6625	mayi.6625@gmail.com	2	1	RM2,500 per unit. RM 700 - RM 1,100 per room	2016-01-18 12:12:10.204715	2016-01-18 12:29:33.369319
5	4	44	Master Room	250	1400	Edward 	+60198405916	thechia84@gmail.com	2	1	Fully furnished	2016-01-18 05:32:04.009936	2016-01-18 05:51:29.852228
6	4	48	2nd Room	180	1000	Edward	+6019 840 5916	thechia84@gmail.com	2	1	Fulluy Frunished	2016-01-18 05:55:24.019736	2016-01-18 06:00:29.979676
7	4	52	3rd Room	130	800	Edward	+6019 840 5916	thechia84@gmail.com	2	1	Fully Furnished	2016-01-18 06:20:35.640021	2016-01-18 06:22:53.939635
8	5	54	Whole Unit	406	1300	Poh	+6012 4381288	man9292utd@gmail.com	2	1	Fully Furnished	2016-01-18 07:23:03.622959	2016-01-18 07:31:36.30203
10	5	62	Whole Unit	406	1300	Poh	+6012 438 1288	man9292utd@gmail.com	2	1	Fully Furnished	2016-01-18 07:36:03.159507	2016-01-18 07:37:04.857841
9	5	59	Whole Unit	406	1300	Poh	+6012 438 1288	man9292utd@gmail.com	2	1	Fully Furnished	2016-01-18 07:34:18.195802	2016-01-18 07:38:10.618704
11	5	69	Whole Unit	406	1300	Poh	+6012 438 1288	man9292utd@gmail.com	2	1	Fully Furnished	2016-01-18 07:38:59.702151	2016-01-18 07:40:32.543102
\.


--
-- Name: house_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('house_units_id_seq', 12, true);


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY houses (id, country_id, featured_image_id, name, slug, address, property_type, longitude, latitude, description, created_at, updated_at) FROM stdin;
4	1	43	DK Senza	dk-senza	 Jalan Taylors, 47500 Subang Jaya, Selangor, Malaysia	Condominium	101.615951	3.059208		2016-01-18 05:07:10.632526	2016-01-18 05:33:09.170148
5	1	\N	Ritze Perdana	ritze-perdana	1, Jalan PJU 8/6 Damansara Perdana	Studio	101.605113	3.166934		2016-01-18 06:39:32.384194	2016-01-18 06:39:32.384194
6	1	\N	The Oak Suites	the-oak-suites	 J-1-9, Pacific Place Commercial Centre, Jalan PJU 1a/4a, 47301 Petaling Jaya, Selangor	Condominium	101.585407	3.111326	Fully furnished and "Free 5 kg Laundry per week (for the first year of operation)"	2016-01-18 12:05:32.8057	2016-01-18 12:06:27.840017
\.


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('houses_id_seq', 6, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY images (id, name, imageable_id, imageable_type, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
1	\N	1	University	2015-12-23 17:09:11.312967	2015-12-23 17:09:11.312967	taylor-gym.jpg	image/jpeg	167708	2015-12-23 17:09:10.197003
2	\N	1	University	2015-12-23 17:09:11.464616	2015-12-23 17:09:11.464616	taylor-campus.jpg	image/jpeg	128650	2015-12-23 17:09:10.346229
3	\N	1	University	2015-12-23 17:09:11.56465	2015-12-23 17:09:11.56465	taylor-library.jpg	image/jpeg	146353	2015-12-23 17:09:10.282218
4		\N	\N	2015-12-29 08:05:08.128686	2015-12-29 08:05:08.128686	predatel.jpg	image/jpeg	115330	2015-12-29 08:05:07.590989
5	\N	2	University	2015-12-29 08:18:58.363893	2015-12-29 08:18:58.363893	pic5.jpg	image/jpeg	113903	2015-12-29 08:18:57.929647
6	\N	2	University	2015-12-29 08:21:18.002047	2015-12-29 08:21:18.002047	3_exterior_perspective3.jpg	image/jpeg	148477	2015-12-29 08:21:17.546292
7	\N	2	University	2015-12-29 08:28:27.2889	2015-12-29 08:28:27.2889	KBUBuilding.jpg	image/jpeg	50455	2015-12-29 08:28:26.998228
8	\N	2	University	2015-12-29 08:29:46.524755	2015-12-29 08:29:46.524755	images.png	image/png	5858	2015-12-29 08:29:46.157277
10	\N	3	University	2015-12-29 09:37:34.717092	2015-12-29 09:37:34.717092	download.jpg	image/jpeg	9851	2015-12-29 09:37:34.565395
11	\N	3	University	2015-12-29 09:37:59.11996	2015-12-29 09:37:59.11996	images.jpg	image/jpeg	12237	2015-12-29 09:37:59.044726
12	\N	4	University	2015-12-29 09:43:13.032376	2015-12-29 09:43:13.032376	segi_(1).jpg	image/jpeg	49435	2015-12-29 09:43:12.514111
13	\N	4	University	2015-12-29 09:43:13.178034	2015-12-29 09:43:13.178034	Segi2.jpg	image/jpeg	121435	2015-12-29 09:43:12.717298
14	\N	4	University	2015-12-29 09:43:13.202295	2015-12-29 09:43:13.202295	Segi.jpg	image/jpeg	252047	2015-12-29 09:43:12.689002
15	\N	5	University	2015-12-31 06:49:50.514733	2015-12-31 06:49:50.514733	helpuni.jpg	image/jpeg	98171	2015-12-31 06:49:46.900849
16	\N	5	University	2015-12-31 06:49:51.040175	2015-12-31 06:49:51.040175	HElP.jpg	image/jpeg	524947	2015-12-31 06:49:47.379884
17	\N	5	University	2015-12-31 06:49:51.413551	2015-12-31 06:49:51.413551	HELP_Student.gif	image/gif	70623	2015-12-31 06:49:46.896291
18	\N	6	University	2015-12-31 07:08:29.034625	2015-12-31 07:08:29.034625	INTIBIGPIC_010.jpg	image/jpeg	90935	2015-12-31 07:08:28.1681
19	\N	6	University	2015-12-31 07:08:29.33696	2015-12-31 07:08:29.33696	inti.jpg	image/jpeg	174590	2015-12-31 07:08:28.162606
21	\N	7	University	2015-12-31 07:14:54.864843	2015-12-31 07:14:54.864843	aboutus_baccollege.png	image/png	239094	2015-12-31 07:14:54.344184
22	\N	7	University	2015-12-31 07:15:09.388406	2015-12-31 07:15:09.388406	IMG_20150710_111156-510x287.jpg	image/jpeg	47785	2015-12-31 07:15:09.189631
44	\N	5	HouseUnit	2016-01-18 05:34:42.603789	2016-01-18 05:34:42.603789	20150610_120022.jpg	image/jpeg	261604	2016-01-18 05:34:41.656533
45	\N	5	HouseUnit	2016-01-18 05:34:43.774202	2016-01-18 05:34:43.774202	20150610_120141.jpg	image/jpeg	255011	2016-01-18 05:34:42.755426
46	\N	5	HouseUnit	2016-01-18 05:34:46.050949	2016-01-18 05:34:46.050949	20150610_120212.jpg	image/jpeg	213213	2016-01-18 05:34:45.030919
47	\N	5	HouseUnit	2016-01-18 05:34:47.405524	2016-01-18 05:34:47.405524	20150610_120221.jpg	image/jpeg	226436	2016-01-18 05:34:46.443884
48	\N	6	HouseUnit	2016-01-18 05:57:41.599204	2016-01-18 05:57:41.599204	20150306_104845.jpg	image/jpeg	303984	2016-01-18 05:57:40.789241
49	\N	6	HouseUnit	2016-01-18 05:57:56.9743	2016-01-18 05:57:56.9743	20150306_105039.jpg	image/jpeg	242106	2016-01-18 05:57:56.09641
50	\N	6	HouseUnit	2016-01-18 05:57:58.60434	2016-01-18 05:57:58.60434	20150312_175019.jpg	image/jpeg	154163	2016-01-18 05:57:57.987413
51	\N	6	HouseUnit	2016-01-18 05:58:02.309466	2016-01-18 05:58:02.309466	20150731_161108.jpg	image/jpeg	203183	2016-01-18 05:58:01.819764
52	\N	7	HouseUnit	2016-01-18 06:21:42.016788	2016-01-18 06:21:42.016788	20151220_105358.jpg	image/jpeg	125648	2016-01-18 06:21:41.32229
53	\N	7	HouseUnit	2016-01-18 06:21:44.648969	2016-01-18 06:21:44.648969	20151220_105409.jpg	image/jpeg	129621	2016-01-18 06:21:44.166325
54	\N	8	HouseUnit	2016-01-18 07:23:22.612615	2016-01-18 07:23:22.612615	IMG-20160111-WA0011.jpg	image/jpeg	106066	2016-01-18 07:23:21.42659
55	\N	8	HouseUnit	2016-01-18 07:23:22.741034	2016-01-18 07:23:22.741034	IMG-20160111-WA0013.jpg	image/jpeg	92965	2016-01-18 07:23:22.0855
56	\N	8	HouseUnit	2016-01-18 07:23:24.520277	2016-01-18 07:23:24.520277	IMG-20160111-WA0015.jpg	image/jpeg	102032	2016-01-18 07:23:23.907081
57	\N	8	HouseUnit	2016-01-18 07:23:25.557958	2016-01-18 07:23:25.557958	IMG-20160111-WA0012.jpg	image/jpeg	107452	2016-01-18 07:23:24.962551
58	\N	8	HouseUnit	2016-01-18 07:23:26.642935	2016-01-18 07:23:26.642935	IMG-20160111-WA0014.jpg	image/jpeg	116593	2016-01-18 07:23:26.041115
59	\N	9	HouseUnit	2016-01-18 07:34:29.614667	2016-01-18 07:34:29.614667	IMG-20160112-WA0005.jpg	image/jpeg	139006	2016-01-18 07:34:29.163328
60	\N	9	HouseUnit	2016-01-18 07:34:31.518538	2016-01-18 07:34:31.518538	IMG-20160112-WA0007.jpg	image/jpeg	125032	2016-01-18 07:34:31.215931
61	\N	9	HouseUnit	2016-01-18 07:34:33.428172	2016-01-18 07:34:33.428172	IMG-20160112-WA0006.jpg	image/jpeg	113960	2016-01-18 07:34:32.895172
62	\N	10	HouseUnit	2016-01-18 07:36:26.789739	2016-01-18 07:36:26.789739	IMG-20160112-WA0010.jpg	image/jpeg	123481	2016-01-18 07:36:26.116979
63	\N	10	HouseUnit	2016-01-18 07:36:26.841712	2016-01-18 07:36:26.841712	IMG-20160112-WA0008.jpg	image/jpeg	164921	2016-01-18 07:36:25.914882
64	\N	10	HouseUnit	2016-01-18 07:36:27.365017	2016-01-18 07:36:27.365017	IMG-20160112-WA0012.jpg	image/jpeg	133523	2016-01-18 07:36:27.071897
65	\N	10	HouseUnit	2016-01-18 07:36:28.466952	2016-01-18 07:36:28.466952	IMG-20160112-WA0014.jpg	image/jpeg	161934	2016-01-18 07:36:27.83522
66	\N	10	HouseUnit	2016-01-18 07:36:29.323348	2016-01-18 07:36:29.323348	IMG-20160112-WA0009.jpg	image/jpeg	165713	2016-01-18 07:36:28.740326
67	\N	10	HouseUnit	2016-01-18 07:36:30.989096	2016-01-18 07:36:30.989096	IMG-20160112-WA0011.jpg	image/jpeg	178080	2016-01-18 07:36:30.322924
68	\N	10	HouseUnit	2016-01-18 07:36:31.692757	2016-01-18 07:36:31.692757	IMG-20160112-WA0013.jpg	image/jpeg	217009	2016-01-18 07:36:31.152014
69	\N	11	HouseUnit	2016-01-18 07:39:51.15613	2016-01-18 07:39:51.15613	IMG-20160112-WA0015_(1).jpg	image/jpeg	197393	2016-01-18 07:39:50.252288
70	\N	11	HouseUnit	2016-01-18 07:39:51.384	2016-01-18 07:39:51.384	IMG-20160112-WA0016_(1).jpg	image/jpeg	221953	2016-01-18 07:39:50.7585
71	\N	11	HouseUnit	2016-01-18 07:39:52.252202	2016-01-18 07:39:52.252202	IMG-20160112-WA0017_(1).jpg	image/jpeg	206849	2016-01-18 07:39:51.524881
72	\N	11	HouseUnit	2016-01-18 07:39:53.344672	2016-01-18 07:39:53.344672	IMG-20160112-WA0018_(1).jpg	image/jpeg	214095	2016-01-18 07:39:52.473044
73	\N	11	HouseUnit	2016-01-18 07:39:54.055322	2016-01-18 07:39:54.055322	IMG-20160112-WA0019_(1).jpg	image/jpeg	187807	2016-01-18 07:39:53.476771
74	\N	12	HouseUnit	2016-01-18 12:22:01.744346	2016-01-18 12:22:01.744346	55007b2a6b145.jpg	image/jpeg	80804	2016-01-18 12:22:01.064936
75	\N	12	HouseUnit	2016-01-18 12:22:02.416611	2016-01-18 12:22:02.416611	55007b2e6853d.jpg	image/jpeg	95324	2016-01-18 12:22:02.156364
76	\N	12	HouseUnit	2016-01-18 12:22:05.790631	2016-01-18 12:22:05.790631	55007b2fe28b4.jpg	image/jpeg	100177	2016-01-18 12:22:05.530444
77	\N	12	HouseUnit	2016-01-18 12:22:09.69123	2016-01-18 12:22:09.69123	55007b3ca0d04.jpg	image/jpeg	90070	2016-01-18 12:22:09.341683
78	\N	12	HouseUnit	2016-01-18 12:22:14.804281	2016-01-18 12:22:14.804281	55007b3cd0f2e.jpg	image/jpeg	100132	2016-01-18 12:22:14.232045
79	\N	12	HouseUnit	2016-01-18 12:22:18.825629	2016-01-18 12:22:18.825629	55007b22cc34d.jpg	image/jpeg	95146	2016-01-18 12:22:18.239945
80	\N	12	HouseUnit	2016-01-18 12:22:21.654233	2016-01-18 12:22:21.654233	55007b34c4c08.jpg	image/jpeg	97851	2016-01-18 12:22:21.103849
81	\N	12	HouseUnit	2016-01-18 12:22:23.76191	2016-01-18 12:22:23.76191	55007b276fda0.jpg	image/jpeg	74774	2016-01-18 12:22:23.213679
82	\N	12	HouseUnit	2016-01-18 12:22:25.781847	2016-01-18 12:22:25.781847	55007b2857b7b.jpg	image/jpeg	107970	2016-01-18 12:22:25.232509
83	\N	12	HouseUnit	2016-01-18 12:22:27.938209	2016-01-18 12:22:27.938209	55007b3882e1e.jpg	image/jpeg	101096	2016-01-18 12:22:27.679937
84	\N	12	HouseUnit	2016-01-18 12:22:32.445343	2016-01-18 12:22:32.445343	55007b23807fa.jpg	image/jpeg	103053	2016-01-18 12:22:31.884372
85	\N	12	HouseUnit	2016-01-18 12:22:35.143231	2016-01-18 12:22:35.143231	55007b246296f.jpg	image/jpeg	103549	2016-01-18 12:22:34.57631
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('images_id_seq', 85, true);


--
-- Data for Name: page_region_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY page_region_translations (id, page_region_id, locale, created_at, updated_at, content) FROM stdin;
2	2	en	2015-12-23 14:33:12.800613	2015-12-31 06:17:55.686876	
1	1	en	2015-12-23 14:33:12.776172	2016-01-11 08:54:33.682565	<h1 style="text-align: center;"><a href="https://en.wikipedia.org/wiki/Malaysia">Malaysia</a></h1>\n<div class="row">\n<div class="col-md-12">\n<div id="accordion2Primary" class="panel-group panel-group-primary">\n<div class="panel panel-default">\n<div class="panel-heading">\n<h4 class="panel-title"><a class="accordion-toggle collapsed" href="#collapse2PrimaryOne" data-toggle="collapse" data-parent="#accordion2Primary">How to Study in Malaysia</a></h4>\n</div>\n<div id="collapse2PrimaryOne" class="accordion-body collapse" style="height: 0px;">\n<div class="panel-body" style="text-align: justify;">If you have already decided on a course and university, the second step is to learn about the process. You will need to meet an approved agent by the Ministry of Education to pass some documents and pay a registration fee ranging from RM2000-RM4000. (A note of caution- some agents will attempt to extract additional charges from students.) After this, your approval of visa will take about 4 months, but students do not need to worry about the lengthy duration as there are plenty of intakes in Malaysia to accommodate incoming students at various dates . After the visa approval, students can then begin to purchase their flight tickets. Upon arrival in Malaysia, a representative from the university will receive or meet you at the airport. They will aid you in obtaining your temporary student visa, and then recommend you to make living arrangements in the university-provided hostels. However, students should know that they have the option of staying outside of the university campus, by renting houses, condominiums, etc. Our website also provides costs and locations of other living accommodations.</div>\n<div class="panel-body" style="text-align: justify;">The whole process is not too difficult or complicated, students can be rest assured to not worry too much about it. Do note that if the level of your English is not up to standard, universities will recommend you to participate in their (usually free) English courses before or during the duration of your semester.</div>\n</div>\n</div>\n<div class="panel panel-default">\n<div class="panel-heading">\n<h4 class="panel-title"><a class="accordion-toggle collapsed" href="#collapse2PrimaryTwo" data-toggle="collapse" data-parent="#accordion2Primary">Summary</a></h4>\n</div>\n<div id="collapse2PrimaryTwo" class="accordion-body collapse">\n<div class="panel-body" style="text-align: justify;"><strong>Step 1: Documents</strong> <br />-&nbsp;&nbsp; Passport<br />-&nbsp; Certificate of Graduating high school or Degree<br />-&nbsp; (There can be another document also. About additional documents the agent should notify you)</div>\n<div class="panel-body" style="text-align: justify;"><strong>Step 2:&nbsp; Meet Agent</strong><br />- You can find proved agent for countries in this page below.<br />- Ask him about University (one more) and pay first registration.<br />- If there needs additional documents , then provide it.<br />- Wait for approving and learn English language.<br />- Buy ticket and come.<br />- Be ready to pay 6000-7000$( for international students) as first payment for university.<br />- Start to study.</div>\n</div>\n</div>\n<div class="panel panel-default">\n<div class="panel-heading">\n<h4 class="panel-title"><a class="accordion-toggle collapsed" href="#collapse2PrimaryThree" data-toggle="collapse" data-parent="#accordion2Primary">Breakdown of Living Cost in Malaysia</a></h4>\n</div>\n<div id="collapse2PrimaryThree" class="accordion-body collapse">\n<div class="panel-body">\n<p>The average international student should be prepared to spend about RM1,000 to RM1,500 per month for living expenses in the vicinity of a city. The cost is broken down as below:</p>\n<p><strong>Accommodation</strong><br /> You should estimate about RM450++ for your accommodation per month. The rental will vary depending on the geographical area, the type of accommodation (on-campus living in a hall of residence (hostel); or off-campus living in an apartment, condominium, single-story house, double-storey house, etc.), the facilities provided in the house (e.g. with or without air-conditioning) and of course, the number of people sharing the room (or the apartment/house).</p>\n<p><strong>Food / Housekeeping&nbsp;</strong><br /> Your food and housekeeping expense is estimated to be around RM600++ per month. This is based on about RM20++ for a total of three meals per day. Naturally, if you refrain from eating out, opting to cook at home and share cooking expenses with your friends, it would be cheaper.</p>\n<p><strong>Clothing&nbsp;</strong><br /> Your clothing expenses like washing, ironing, dry-cleaning, etc. may cost around RM60++ per month. However, plenty of accommodations provide facilities such as washing machines or laundry services, which will indefinitely reduce laundry expenses.</p>\n<p><strong>Public Transport</strong><br /> Students who stay on campus or near campus may not incur any cost of travelling to and from classes. However, other methods of travelling<br />(ie buses, cabs, etc.) may cost approximately RM20++ per month.</p>\n<p><strong>Telecommunication / Mobile Phone Bills and Internet&nbsp;</strong><br /> The mobile phone and internet packages in Malaysia are very competitive. How much you spend will depend on your usage and the promotional package you choose. The average student may spend about RM30++ per month for mobile, and RM50++ per month for at home internet-use.</p>\n<p><strong>Books, Reading Materials and Stationery</strong><br /> We have estimated the cost to be around RM50++ per month, but it would largely depend on the course you have signed up for and the number and nature of projects in your course.</p>\n<p><strong>Medical / Hospitalisation Insurance&nbsp;</strong><br /> Although you may not need to pay for medical expenses every month, if you keep aside RM50++ month, it would be sufficient for you in case you need outpatient treatment at a private clinic. This estimate includes the amount you will have to pay for your medical and hospitalisation insurance (from your institutions).</p>\n<p><strong>Personal Expenses&nbsp;</strong><br /> How much your personal expenses would be per month would depend on your personal lifestyle. This includes your socialising needs, toiletries, haircut, clothes, movie, etc.</p>\n<p>Using the estimate above, the total cost of living will average from between RM1,000 and RM1,500 per month or about RM12,000 to RM18,000 per year for one student.</p>\n<p>It is important to remember that the above estimate is only a guide in planning your budget to study in Malaysia. Individual expenses will vary according to the location you are at, course taken and your personal lifestyle.ифлф</p>\n</div>\n</div>\n</div>\n<div class="panel panel-default hidden">\n<div class="panel-heading">\n<h4 class="panel-title"><a class="accordion-toggle" href="#collapse2PrimaryFour" data-toggle="collapse" data-parent="#accordion2Primary">NEW TITLE HERE</a></h4>\n</div>\n<div id="collapse2PrimaryFour" class="accordion-body collapse in">\n<div class="panel-body">NEW BODY HERE</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<p>&nbsp;</p>\n<p>&nbsp;</p>
\.


--
-- Name: page_region_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('page_region_translations_id_seq', 2, true);


--
-- Data for Name: page_regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY page_regions (id, country_id, controller, action, name, created_at, updated_at) FROM stdin;
2	1	universities	index	how-to-come	2015-12-23 14:33:12.794179	2015-12-31 06:17:55.658201
1	1	pages	home	about-country	2015-12-23 14:33:12.766859	2016-01-11 08:54:33.672665
\.


--
-- Name: page_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('page_regions_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20151203095548
20151203095552
20151204073727
20151205161521
20151205164132
20151205164648
20151205164852
20151209144422
20151209145809
20151229040905
20151229110713
20160102105419
20160102111021
20160102111026
20160106141427
20160106141431
20160108231242
\.


--
-- Data for Name: study_field_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY study_field_translations (id, study_field_id, locale, created_at, updated_at, name, description) FROM stdin;
1	1	en	2016-01-04 03:12:51.477864	2016-01-04 03:12:51.477864	Pre-University Programme	\N
3	3	en	2016-01-04 03:12:51.59166	2016-01-10 13:23:54.668384	Agriculture	\N
4	4	en	2016-01-04 03:12:51.62787	2016-01-10 13:23:54.687937	Architecture	\N
5	5	en	2016-01-04 03:12:51.662264	2016-01-10 13:23:54.707285	Arts & Design	\N
7	7	en	2016-01-04 03:12:51.729043	2016-01-10 13:23:54.725604	Computing & IT	\N
8	8	en	2016-01-04 03:12:51.761585	2016-01-10 13:23:54.756006	Communication & Broadcasting	\N
9	9	en	2016-01-04 03:12:51.795068	2016-01-10 13:23:54.782104	Economics	\N
10	10	en	2016-01-04 03:12:51.829008	2016-01-10 13:23:54.801064	Education	\N
11	11	en	2016-01-04 03:12:51.860672	2016-01-10 13:23:54.818527	Engineering	\N
12	12	en	2016-01-04 03:12:51.893412	2016-01-10 13:23:54.834623	Environmental	\N
14	14	en	2016-01-04 03:12:51.970142	2016-01-10 13:23:54.857313	Hospitality & Tourism	\N
15	15	en	2016-01-04 03:12:52.006343	2016-01-10 13:23:54.89082	Humanities	\N
16	16	en	2016-01-04 03:12:52.047619	2016-01-10 13:23:54.912356	Languages	\N
17	17	en	2016-01-04 03:12:52.084278	2016-01-10 13:23:54.928022	Law	\N
18	18	en	2016-01-04 03:12:52.118137	2016-01-10 13:23:54.943237	Manufacturing	\N
19	19	en	2016-01-04 03:12:52.159182	2016-01-10 13:23:54.960409	Marketing & Sales	\N
20	20	en	2016-01-04 03:12:52.191236	2016-01-10 13:23:54.998661	Mathematics & Statistics	\N
21	21	en	2016-01-04 03:12:52.221389	2016-01-10 13:23:55.032638	Media	\N
22	22	en	2016-01-04 03:12:52.252296	2016-01-10 13:23:55.069177	Medical Diagnostic & Treatment	\N
23	23	en	2016-01-04 03:12:52.282727	2016-01-10 13:23:55.103166	Medicine & Healthcare	\N
24	24	en	2016-01-04 03:12:52.314229	2016-01-10 13:23:55.136141	Occupational Health	\N
25	25	en	2016-01-04 03:12:52.348565	2016-01-10 13:23:55.173338	Personal Services	\N
26	26	en	2016-01-04 03:12:52.380254	2016-01-10 13:23:55.202844	Science	\N
27	27	en	2016-01-04 03:12:52.419509	2016-01-10 13:23:55.216554	Social Sciences	\N
28	28	en	2016-01-04 03:12:52.458709	2016-01-10 13:23:55.235736	Social Services	\N
29	29	en	2016-01-04 03:12:52.494288	2016-01-10 13:23:55.251306	Transport	\N
30	30	en	2016-01-04 03:12:52.530762	2016-01-10 13:23:55.269696	Veterinary	\N
6	6	en	2016-01-04 03:12:51.696533	2016-01-10 13:23:55.288436	Business Management & Administration	
13	13	en	2016-01-04 03:12:51.931256	2016-01-10 13:23:55.307521	Finance	
2	2	en	2016-01-04 03:12:51.508675	2016-01-11 08:02:11.731757	Accounting & Finance	FOUNDATION STUDIES\r\nFoundation Studies Program teaches you in clear and concrete terms how to be a successful university student and is a pathway to undergraduate study.
\.


--
-- Name: study_field_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('study_field_translations_id_seq', 30, true);


--
-- Data for Name: study_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY study_fields (id, slug, created_at, updated_at) FROM stdin;
1	pre-university-programme	2016-01-04 03:12:51.470602	2016-01-04 03:12:51.470602
3	agriculture	2016-01-04 03:12:51.582439	2016-01-10 13:23:54.664355
4	architecture	2016-01-04 03:12:51.621063	2016-01-10 13:23:54.683279
5	arts-design	2016-01-04 03:12:51.655238	2016-01-10 13:23:54.703423
7	computing-it	2016-01-04 03:12:51.723037	2016-01-10 13:23:54.721574
8	communication-broadcasting	2016-01-04 03:12:51.754379	2016-01-10 13:23:54.746339
9	economics	2016-01-04 03:12:51.788451	2016-01-10 13:23:54.778288
10	education	2016-01-04 03:12:51.822996	2016-01-10 13:23:54.796557
11	engineering	2016-01-04 03:12:51.854364	2016-01-10 13:23:54.814883
12	environmental	2016-01-04 03:12:51.887235	2016-01-10 13:23:54.830889
14	hospitality-tourism	2016-01-04 03:12:51.963192	2016-01-10 13:23:54.85137
15	humanities	2016-01-04 03:12:51.999219	2016-01-10 13:23:54.88348
16	languages	2016-01-04 03:12:52.037528	2016-01-10 13:23:54.908665
17	law	2016-01-04 03:12:52.077155	2016-01-10 13:23:54.924816
18	manufacturing	2016-01-04 03:12:52.1114	2016-01-10 13:23:54.940018
19	marketing-sales	2016-01-04 03:12:52.151117	2016-01-10 13:23:54.956964
20	mathematics-statistics	2016-01-04 03:12:52.18435	2016-01-10 13:23:54.990089
21	media	2016-01-04 03:12:52.215162	2016-01-10 13:23:55.023041
22	medical-diagnostic-treatment	2016-01-04 03:12:52.246203	2016-01-10 13:23:55.058966
23	medicine-healthcare	2016-01-04 03:12:52.276464	2016-01-10 13:23:55.096724
24	occupational-health	2016-01-04 03:12:52.308185	2016-01-10 13:23:55.128507
25	personal-services	2016-01-04 03:12:52.340259	2016-01-10 13:23:55.164367
26	science	2016-01-04 03:12:52.374437	2016-01-10 13:23:55.19941
27	social-sciences	2016-01-04 03:12:52.409614	2016-01-10 13:23:55.213655
28	social-services	2016-01-04 03:12:52.450934	2016-01-10 13:23:55.232361
29	transport	2016-01-04 03:12:52.486584	2016-01-10 13:23:55.247974
30	veterinary	2016-01-04 03:12:52.523825	2016-01-10 13:23:55.264589
6	business-management-administration	2016-01-04 03:12:51.690212	2016-01-10 13:23:55.284966
13	finance	2016-01-04 03:12:51.924636	2016-01-10 13:23:55.302487
2	accounting-finance	2016-01-04 03:12:51.502963	2016-01-11 08:02:11.726272
\.


--
-- Name: study_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('study_fields_id_seq', 30, true);


--
-- Data for Name: study_level_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY study_level_translations (id, study_level_id, locale, created_at, updated_at, name, description) FROM stdin;
3	3	en	2016-01-04 03:12:45.634704	2016-01-04 03:12:45.634704	Degree	\N
4	4	en	2016-01-04 03:12:45.664925	2016-01-04 03:12:45.664925	Master	\N
5	5	en	2016-01-04 03:12:45.691242	2016-01-04 03:12:45.691242	PhD	\N
1	1	en	2016-01-04 03:12:45.57215	2016-01-10 10:21:47.097853	Foundation/Diploma	\N
\.


--
-- Name: study_level_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('study_level_translations_id_seq', 5, true);


--
-- Data for Name: study_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY study_levels (id, slug, created_at, updated_at) FROM stdin;
3	\N	2016-01-04 03:12:45.625382	2016-01-04 03:12:45.625382
4	\N	2016-01-04 03:12:45.659236	2016-01-04 03:12:45.659236
5	\N	2016-01-04 03:12:45.685318	2016-01-04 03:12:45.685318
1	foundation-diploma	2016-01-04 03:12:45.562553	2016-01-10 10:21:47.084896
\.


--
-- Name: study_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('study_levels_id_seq', 5, true);


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY universities (id, slug, country_id, featured_image_id, created_at, updated_at) FROM stdin;
2	first-city	1	7	2015-12-29 08:13:21.632121	2015-12-29 08:29:48.556418
3	toc-automotive	1	\N	2015-12-29 09:33:41.894364	2015-12-29 09:33:41.894364
4	Segi University	1	14	2015-12-29 09:36:52.604083	2015-12-31 06:24:08.657492
5	help	1	16	2015-12-31 06:46:19.569269	2015-12-31 06:52:09.268669
1	taylor-university	1	3	2015-12-23 14:33:12.689913	2015-12-31 06:56:25.225966
7	brickfields-asia-college	1	\N	2015-12-31 07:08:29.469952	2015-12-31 07:08:29.469952
6	inti-university	1	19	2015-12-31 07:04:18.28331	2015-12-31 07:33:13.854168
\.


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('universities_id_seq', 7, true);


--
-- Data for Name: university_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY university_translations (id, university_id, locale, created_at, updated_at, name, description) FROM stdin;
1	1	en	2015-12-23 14:33:12.698086	2015-12-23 18:13:14.599827	Taylor's University	<blockquote><span class="subtitle1">Taylor&rsquo;s University, The People&rsquo;s Choice<br /> A world-class leader in education, year after year. </span></blockquote>\r\n<p>Taylor's University is a member of the Taylor's Education Group, which also comprises of Taylor's College, Taylor&rsquo;s International School, Garden International School, Australian International School Malaysia, Nexus International School, Putrajaya and Nexus International School Singapore. Since its inception in 1969, Taylor's has become one of Malaysia's most successful and reputable private higher education institutions.<br /><br /> Taylor's has continuously provided excellent services for its students in terms of diverse study options, relevant curriculum and teaching methods, ongoing partnerships with leading universities worldwide, strong industry linkages, up-to-date facilities and well-equipped campuses.<br /><br /><strong><span class="subtitle1">Achievements</span></strong><br /> Taylor's was voted the <strong>Most Popular Private College and/or University in Malaysia</strong> for two consecutive years in 2008 and 2009, out of more than 100 other institutions. These results were based on the Malaysian Student Survey which surveyed close to 9,000 respondents aged 16 to 19.<br /><br /> In July 2010, Taylor's University was rated <strong>'Tier 5: Excellent'</strong> by the Ministry of Higher Education in the 2009 Malaysian Qualifications Agency Rating System for Malaysian Higher Education Institutions <strong>(SETARA '09)</strong>, which measures the quality of teaching and learning at the undergraduate level in universities and university colleges in Malaysia.<br /><br /> The quality of teaching and learning at Taylor's University was once again acknowledged when it garnered a 'Tier 5: Excellent' rating in the Rating System for Malaysian Higher Education <strong>(SETARA '11)</strong> and again in 2013 <strong>(SETARA &rsquo;13)</strong>, by the Ministry of Higher Education Malaysia.<br /><br /> Taylor&rsquo;s University bagged the <strong>Gold</strong> award in the &ldquo;Education &amp; Learning&rdquo; category in the <strong>Putra Brand Awards for five consecutive years since 2010</strong>. Taylor's University is also the only educational institution honoured with a &ldquo;Putra Brand Icon&rdquo; award. Putra Brand Awards winners were chosen via an online survey by 6,000 respondents nationwide making it the largest consumer research sampling of its kind and the most prestigious consumer award in the country.<br /><br /> Another milestone achieved for Taylor&rsquo;s University is the recognition of being named the <strong>Reader&rsquo;s Digest Trusted Brand Gold Award</strong> in the Private University/ College Category for four consecutive years since 2011, as voted by consumers.<br /><br /> Taylor&rsquo;s University has also been recognized for its innovative teaching methodologies at the national level. In 2013, the <em><strong>Anugerah Akademik Negara (AAN) 2013</strong></em> was awarded to Mr. Lim Chee Leong, Head of the e-Learning Academy (eLA), InTeLLeCT in the <em><strong>Kategori Anugerah Pengajaran (Kelompok Sains Gunaan)</strong></em>. Lim Chee Leong is the first individual from a private university to be awarded this prestigious award from the Ministry of Education, Malaysia, which was presented to him by Y.A.B. Prime Minister, Dato' Seri Najib Tun Razak .<br /><br /> Taylor&rsquo;s University Career Services Centre has also received recognition from leading employers through the inaugural award initiated by <strong>TalentCorp</strong> in partnership with gti <strong>Media</strong> as the Most Resourceful Career Centre (Private University) during the <strong>Malaysia's 100 Leading Graduate Employers 2014</strong> Awards Ceremony.<br /><br /> Taylor's continues to play a strong role in developing Malaysia's human resource capital, and boasts strong network of alumni, many of whom have become leaders in their respective fields.</p>
2	2	en	2015-12-29 08:13:21.642223	2015-12-29 08:13:21.642223	First City University	<p>Since its inception in 1990, KBU International College has an excellent track record in producing employable graduates and entrepreneurs. In recognition of our excellence in providing tertiary education, the Ministry of Higher Education elevated KBU to <strong>FIRST CITY UNIVERSITY COLLEGE</strong>. First City UC will continue KBU&rsquo;s proud tradition of providing the best learning experience for its students. The courses offered will continue to be industry relevant. These will be the springboard for our graduates to be successful in their chosen careers.</p>\r\n<p>Quality education at First City UC is further enhanced by its compliance with the requirements of the Agensi Kelayakan Malaysia or Malaysian Qualifications Agency (MQA). Constant monitoring is also carried out by First City UC&rsquo;s very own Quality Assurance Department and its international university partners.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Vision</strong></h3>\r\n<p>To be a premier private institution of higher learning offering multidiscipline quality programmes at Certificate, Diploma, Degree and Postgraduate levels to both local and international students.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Mission</strong></h3>\r\n<p>To provide the highest standard of tertiary education in a national and international context.</p>
3	3	en	2015-12-29 09:33:41.905484	2015-12-29 09:33:41.905484	TOC Automotive College	<h3 id="custom-title-h3-1" class="ui--animation ">WHO WE ARE</h3>\r\n<div class="auto-format ui--animation">\r\n<p>Established in 2004, The Otomotif College is the <strong>pioneer in professional automotive education</strong> that ensures mobility and employability.TOC&rsquo;s passion is what drives us to provide the <strong>best learning experience</strong> in automotive and motorsports education. We believe we play an integral part in shaping the fundamentals and the future of the automotive industry.</p>\r\n</div>\r\n<p>"TOC&rsquo;s passion is what drives us to provide the best learning experience in automotive and motorsport education.</p>\r\n<p>We believe we play an integral part in shaping the fundamentals and the future of the automotive industry.</p>\r\n<p>TOC currently offers Diploma in Automotive Technology, Diploma in Motorsport Technology and other automotive short courses."</p>
4	4	en	2015-12-29 09:36:52.613779	2015-12-31 06:21:13.673336	Segi University College	<p><em><strong>SEGi University</strong></em> is a private university located in <a title="Kota Damansara" href="https://www.google.com/maps/place/%D0%A3%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%82%D0%B5%D1%82+%D0%A1%D0%B5%D0%B3%D0%B8/@3.147652,101.577359,3a,75y,4.34h,90t/data=!3m7!1e1!3m5!1s23qinT7oWnZD4w86eJJlZw!2e0!6s%2F%2Fgeo3.ggpht.com%2Fcbk%3Fpanoid%3D23qinT7oWnZD4w86eJJlZw%26output%3Dthumbnail%26cb_client%3Dmaps_sv.tactile.gps%26thumb%3D2%26w%3D203%26h%3D100%26yaw%3D4.3302541%26pitch%3D0!7i13312!8i6656!4m2!3m1!1s0x31cc4efc1320915b:0x71780032b534e07b!6m1!1e1">Kota Damansara</a>, <a title="Selangor" href="https://www.google.com/maps?q=selangor&amp;ion=1&amp;espv=2&amp;bav=on.2,or.r_cp.&amp;bvm=bv.110151844,d.c2E&amp;biw=1242&amp;bih=606&amp;dpr=1.1&amp;um=1&amp;ie=UTF-8&amp;sa=X&amp;ved=0ahUKEwjvnaLeuYXKAhXDjo4KHZmCDb0Q_AUIBigB">Selangor</a>. SEGi is the largest private higher education provider in&nbsp;<a title="Malaysia" href="https://en.wikipedia.org/wiki/Malaysia">Malaysia</a>.<sup id="cite_ref-4" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-4">[4]</a></sup> Previously, it was known as SEGi University College until end of 2014, when the Ministry of Education (Malaysia)&nbsp;announced its upgrade to university status. The university have 4 campuses (<a title="UEP Subang Jaya" href="https://en.wikipedia.org/wiki/UEP_Subang_Jaya">UEP Subang Jaya</a>, Kuala Lumpur, <a title="SEGi College Penang" href="https://www.google.com/maps/place/%D0%9F%D0%B8%D0%BD%D0%B0%D0%BD%D0%B3,+%D0%9C%D0%B0%D0%BB%D0%B0%D0%B9%D0%B7%D0%B8%D1%8F/@5.3539403,100.0826684,10z/data=!3m1!4b1!4m2!3m1!1s0x304a9403095390dd:0x29c305a5f38f633f">Penang</a> and<a title="Sarawak" href="https://en.wikipedia.org/wiki/Sarawak">Sarawak</a>) and eight Recruitment Centres (<a title="Batu Pahat" href="https://en.wikipedia.org/wiki/Batu_Pahat">Batu Pahat</a>, <a title="Bukit Mertajam" href="https://en.wikipedia.org/wiki/Bukit_Mertajam">Bukit Mertajam</a>, <a title="Ipoh" href="https://en.wikipedia.org/wiki/Ipoh">Ipoh</a>, <a title="Johor Bahru" href="https://en.wikipedia.org/wiki/Johor_Bahru">Johor Bahru</a>, <a title="Kota Kinabalu" href="https://en.wikipedia.org/wiki/Kota_Kinabalu">Kota Kinabalu</a>, <a title="Kuantan" href="https://en.wikipedia.org/wiki/Kuantan">Kuantan</a> and <a title="Seremban" href="https://en.wikipedia.org/wiki/Seremban">Seremban</a>).<sup id="cite_ref-5" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-5">[5]</a></sup>SEGI courses covers business, computing, engineering and an increasing range of programmes in the Medical sciences. SEGi also offers programmes affiliated with Abertay University, <a title="University of Sunderland" href="https://en.wikipedia.org/wiki/University_of_Sunderland">University of Sunderland</a>, University of St Mark and St John, University of York St John, <a title="University of Greenwich" href="https://en.wikipedia.org/wiki/University_of_Greenwich">University of Greenwich</a>, all from the United Kingdom, University of Southern Queensland, Australia and Upper Iowa University in the United States. This university famously known for winning Putra Brand Award in year 2010, 2012, 2013, 2014 and 2015<sup id="cite_ref-6" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-6">[6]</a></sup></p>
5	4	cn	2015-12-31 06:24:08.665666	2015-12-31 06:24:08.665666	Segi University College	<p><em><strong>SEGi University</strong></em> is a private university located in <a title="Kota Damansara" href="https://www.google.com/maps/place/%D0%A3%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%82%D0%B5%D1%82+%D0%A1%D0%B5%D0%B3%D0%B8/@3.147652,101.577359,3a,75y,4.34h,90t/data=!3m7!1e1!3m5!1s23qinT7oWnZD4w86eJJlZw!2e0!6s%2F%2Fgeo3.ggpht.com%2Fcbk%3Fpanoid%3D23qinT7oWnZD4w86eJJlZw%26output%3Dthumbnail%26cb_client%3Dmaps_sv.tactile.gps%26thumb%3D2%26w%3D203%26h%3D100%26yaw%3D4.3302541%26pitch%3D0!7i13312!8i6656!4m2!3m1!1s0x31cc4efc1320915b:0x71780032b534e07b!6m1!1e1" target="_blank">Kota Damansara</a>, <a title="Selangor" href="https://www.google.com/maps?q=selangor&amp;ion=1&amp;espv=2&amp;bav=on.2,or.r_cp.&amp;bvm=bv.110151844,d.c2E&amp;biw=1242&amp;bih=606&amp;dpr=1.1&amp;um=1&amp;ie=UTF-8&amp;sa=X&amp;ved=0ahUKEwjvnaLeuYXKAhXDjo4KHZmCDb0Q_AUIBigB" target="_blank">Selangor</a>. SEGi is the largest private higher education provider in&nbsp;<a title="Malaysia" href="https://en.wikipedia.org/wiki/Malaysia">Malaysia</a>.<sup id="cite_ref-4" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-4">[4]</a></sup> Previously, it was known as SEGi University College until end of 2014, when the Ministry of Education (Malaysia)&nbsp;announced its upgrade to university status. The university have 4 campuses (<a title="UEP Subang Jaya" href="https://en.wikipedia.org/wiki/UEP_Subang_Jaya">UEP Subang Jaya</a>, Kuala Lumpur, <a title="SEGi College Penang" href="https://www.google.com/maps/place/%D0%9F%D0%B8%D0%BD%D0%B0%D0%BD%D0%B3,+%D0%9C%D0%B0%D0%BB%D0%B0%D0%B9%D0%B7%D0%B8%D1%8F/@5.3539403,100.0826684,10z/data=!3m1!4b1!4m2!3m1!1s0x304a9403095390dd:0x29c305a5f38f633f">Penang</a> and<a title="Sarawak" href="https://en.wikipedia.org/wiki/Sarawak">Sarawak</a>) and eight Recruitment Centres (<a title="Batu Pahat" href="https://en.wikipedia.org/wiki/Batu_Pahat">Batu Pahat</a>, <a title="Bukit Mertajam" href="https://en.wikipedia.org/wiki/Bukit_Mertajam">Bukit Mertajam</a>, <a title="Ipoh" href="https://en.wikipedia.org/wiki/Ipoh">Ipoh</a>, <a title="Johor Bahru" href="https://en.wikipedia.org/wiki/Johor_Bahru">Johor Bahru</a>, <a title="Kota Kinabalu" href="https://en.wikipedia.org/wiki/Kota_Kinabalu">Kota Kinabalu</a>, <a title="Kuantan" href="https://en.wikipedia.org/wiki/Kuantan">Kuantan</a> and <a title="Seremban" href="https://en.wikipedia.org/wiki/Seremban">Seremban</a>).<sup id="cite_ref-5" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-5">[5]</a></sup>SEGI courses covers business, computing, engineering and an increasing range of programmes in the Medical sciences. SEGi also offers programmes affiliated with Abertay University, <a title="University of Sunderland" href="https://en.wikipedia.org/wiki/University_of_Sunderland">University of Sunderland</a>, University of St Mark and St John, University of York St John, <a title="University of Greenwich" href="https://en.wikipedia.org/wiki/University_of_Greenwich">University of Greenwich</a>, all from the United Kingdom, University of Southern Queensland, Australia and Upper Iowa University in the United States. This university famously known for winning Putra Brand Award in year 2010, 2012, 2013, 2014 and 2015<sup id="cite_ref-6" class="reference"><a href="https://en.wikipedia.org/wiki/SEGi_University#cite_note-6">[6]</a></sup></p>
7	1	cn	2015-12-31 06:56:25.237635	2015-12-31 06:56:25.237635	Taylor's University	<blockquote><span class="subtitle1">Taylor&rsquo;s University, The People&rsquo;s Choice<br /> A world-class leader in education, year after year. </span></blockquote>\r\n<p><a href="https://www.google.com/maps/@3.064907,101.6162181,3a,75y,136.55h,89.28t/data=!3m6!1e1!3m4!1sx7ruYEOX0Rq_s5KFCTG7ew!2e0!7i13312!8i6656">Taylor's University</a> is a member of the Taylor's Education Group, which also comprises of Taylor's College, Taylor&rsquo;s International School, Garden International School, Australian International School Malaysia, Nexus International School, Putrajaya and Nexus International School Singapore. Since its inception in 1969, Taylor's has become one of Malaysia's most successful and reputable private higher education institutions.<br /><br /> Taylor's has continuously provided excellent services for its students in terms of diverse study options, relevant curriculum and teaching methods, ongoing partnerships with leading universities worldwide, strong industry linkages, up-to-date facilities and well-equipped campuses.<br /><br /><strong><span class="subtitle1">Achievements</span></strong><br /> Taylor's was voted the <strong>Most Popular Private College and/or University in Malaysia</strong> for two consecutive years in 2008 and 2009, out of more than 100 other institutions. These results were based on the Malaysian Student Survey which surveyed close to 9,000 respondents aged 16 to 19.<br /><br /> In July 2010, Taylor's University was rated <strong>'Tier 5: Excellent'</strong> by the Ministry of Higher Education in the 2009 Malaysian Qualifications Agency Rating System for Malaysian Higher Education Institutions <strong>(SETARA '09)</strong>, which measures the quality of teaching and learning at the undergraduate level in universities and university colleges in Malaysia.<br /><br /> The quality of teaching and learning at Taylor's University was once again acknowledged when it garnered a 'Tier 5: Excellent' rating in the Rating System for Malaysian Higher Education <strong>(SETARA '11)</strong> and again in 2013 <strong>(SETARA &rsquo;13)</strong>, by the Ministry of Higher Education Malaysia.<br /><br /> Taylor&rsquo;s University bagged the <strong>Gold</strong> award in the &ldquo;Education &amp; Learning&rdquo; category in the <strong>Putra Brand Awards for five consecutive years since 2010</strong>. Taylor's University is also the only educational institution honoured with a &ldquo;Putra Brand Icon&rdquo; award. Putra Brand Awards winners were chosen via an online survey by 6,000 respondents nationwide making it the largest consumer research sampling of its kind and the most prestigious consumer award in the country.<br /><br /> Another milestone achieved for Taylor&rsquo;s University is the recognition of being named the <strong>Reader&rsquo;s Digest Trusted Brand Gold Award</strong> in the Private University/ College Category for four consecutive years since 2011, as voted by consumers.<br /><br /> Taylor&rsquo;s University has also been recognized for its innovative teaching methodologies at the national level. In 2013, the <em><strong>Anugerah Akademik Negara (AAN) 2013</strong></em> was awarded to Mr. Lim Chee Leong, Head of the e-Learning Academy (eLA), InTeLLeCT in the <em><strong>Kategori Anugerah Pengajaran (Kelompok Sains Gunaan)</strong></em>. Lim Chee Leong is the first individual from a private university to be awarded this prestigious award from the Ministry of Education, Malaysia, which was presented to him by Y.A.B. Prime Minister, Dato' Seri Najib Tun Razak .<br /><br /> Taylor&rsquo;s University Career Services Centre has also received recognition from leading employers through the inaugural award initiated by <strong>TalentCorp</strong> in partnership with gti <strong>Media</strong> as the Most Resourceful Career Centre (Private University) during the <strong>Malaysia's 100 Leading Graduate Employers 2014</strong> Awards Ceremony.<br /><br /> Taylor's continues to play a strong role in developing Malaysia's human resource capital, and boasts strong network of alumni, many of whom have become leaders in their respective fields.</p>
6	5	en	2015-12-31 06:46:19.578425	2015-12-31 06:46:19.578425	Help University	<p><strong>HELP University</strong> (<a title="Malay language" href="https://en.wikipedia.org/wiki/Malay_language">Malay</a>: <span lang="ms"><em>Universiti HELP</em></span>; formerly known as HELP University College) is a private university in Malaysia and is located at ELM Business School, No. 15, Jalan Sri Semantan 1,Off Jalan Semantan, Bukit Damansara, <a class="mw-redirect" title="Damansara Heights" href="https://www.google.com/maps/@3.1518538,101.6713543,3a,75y,343.96h,89.32t/data=!3m6!1e1!3m4!1stihceOeSsCLBPaBY_w3WvA!2e0!7i13312!8i6656">Damansara Heights</a>, <a title="Kuala Lumpur" href="https://en.wikipedia.org/wiki/Kuala_Lumpur">Kuala Lumpur</a>, <a title="Malaysia" href="https://en.wikipedia.org/wiki/Malaysia">Malaysia</a>.</p>\r\n<p>It was founded in 1986 by its President, Paul Chan Tuck Hoong, and CEO Chan-Low Kam Yoke.</p>\r\n<p>HELP University is a member of the HELP Group which comprises <a class="external text" href="http://www.help.edu.my/" rel="nofollow">HELP University</a>, HELP Academy, <a class="external text" href="http://www.helpcat.edu.my/" rel="nofollow">HELP College of Arts and Technology</a> (HELP CAT), <a class="external text" href="http://www.his.edu.my/" rel="nofollow">HELP International School</a>, and <a class="external text" href="http://www.thelittletreehouse.com.my/" rel="nofollow">The Little Tree House Kindergarten</a> (a joint venture with OSK).</p>\r\n<p>HELP first offered twinning programmes with the <a title="University of Glamorgan" href="https://en.wikipedia.org/wiki/University_of_Glamorgan">University of Glamorgan</a>, <a title="Wales" href="https://en.wikipedia.org/wiki/Wales">Wales</a>, <a title="United Kingdom" href="https://en.wikipedia.org/wiki/United_Kingdom">United Kingdom</a>, and the <a title="University of Southern Queensland" href="https://en.wikipedia.org/wiki/University_of_Southern_Queensland">University of Southern Queensland</a>, <a title="Australia" href="https://en.wikipedia.org/wiki/Australia">Australia</a>. It has partnerships with universities in the <a title="United Kingdom" href="https://en.wikipedia.org/wiki/United_Kingdom">United Kingdom</a>, <a title="Australia" href="https://en.wikipedia.org/wiki/Australia">Australia</a>, <a title="New Zealand" href="https://en.wikipedia.org/wiki/New_Zealand">New Zealand</a>, the <a title="United States" href="https://en.wikipedia.org/wiki/United_States">United States</a>,<a title="Canada" href="https://en.wikipedia.org/wiki/Canada">Canada</a>, <a title="Indonesia" href="https://en.wikipedia.org/wiki/Indonesia">Indonesia</a>, <a title="Vietnam" href="https://en.wikipedia.org/wiki/Vietnam">Vietnam</a>, <a title="China" href="https://en.wikipedia.org/wiki/China">China</a>, and in <a title="Europe" href="https://en.wikipedia.org/wiki/Europe">Europe</a>.</p>
9	7	en	2015-12-31 07:08:29.484443	2015-12-31 07:08:29.484443	Brickfields Asia College	<p>Brickfields Asia College (BAC) has established itself as the Fastest &amp; Smartest Way to UK Law &amp; Business degrees. The college has established an excellent reputation as a provider of quality education and its graduates are highly sought after by local and international firms in both the public and private sectors.</p>\r\n<p>&nbsp;</p>\r\n<p>BAC currently has partnerships and affiliations with more than 25 foreign universities and professional organisations, offering its students access to over 100 world-class Law and Business degrees and professional qualifications that can be completed either locally or abroad.</p>\r\n<p>&nbsp;</p>\r\n<p>BAC&rsquo;s students have swept multiple World and National Awards at pre-university, university and post graduate levels over the past three years. The college&rsquo;s A-level students, Amanda Kong Hwei Zhen and Judith Pretha received the Cambridge Learner Awards for the Best Student in the World for Law for 2013 and 2012 respectively, while Sharon Lau Foong Yee received the Cambridge Learner Awards for the Best Student in the World for Business Studies. BAC students also secured 70 First Class Honours (LLB) degrees over the past 3 years from the partner universities. Since 2005, BAC&rsquo;s CLP students secured every Tun Hamid Omar Foundation Award for Best Overall Student as well as 50 out of 62 Book Prizes and 51 out of 63 Second Uppers awarded.</p>\r\n<p>&nbsp;</p>\r\n<p>In 2013, BAC opened its new RM110 million campus in Petaling Jaya which has provided an engaging experience for students looking to have a balance between studying and leading a fun student life. This campus houses the Brickfields Business School which offers degree programmes in business management, business accounting, finance and dual honours such as Business and Law, Business and Marketing and Business and Economics.</p>\r\n<p>&nbsp;</p>\r\n<p>BAC was awarded the Brand Laureate Best Brand in Legal Education for 2012 and 2013 as well as the SME Recognition Award 2013 for Service Excellence. In 2014, BAC was awarded the SME Corporate Social Responsibility Excellence Award and the SME 100 Award honouring Malaysia&rsquo;s Fast Moving Companies. These awards are testament to BAC&rsquo;s commitment to making every student&rsquo;s educational experience at the college an enjoyable, rewarding and successful one.</p>
8	6	cn	2015-12-31 07:04:18.292878	2015-12-31 07:29:47.780908	INTI University	<div class="extraHeader">\r\n<div id="crumbs">&nbsp;About INTI</div>\r\n</div>\r\n<div id="container" class="one-column">\r\n<div id="content">\r\n<div id="post-4539" class="post-4539 page type-page status-publish hentry">\r\n<div class="spacer_10">&nbsp;</div>\r\nStudying at INTI International University and Colleges brings benefits that come directly from the strength of the Laureate International Universities network. The Laureate Network is the largest and fastest growing global network of private universities that provides INTI with access to global resources, best practices, teaching methods, international faculty and management tools that are truly world class. Find out more about INTI by clicking on any of the links below.\r\n<div class="spacer_20">&nbsp;</div>\r\n<div class="sssLandingPanel">\r\n<div class="item">\r\n<div class="font14"><strong>INTI International<br />University &amp; Colleges</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_laureate.png" alt="" /></div>\r\n<div class="texter">Spanning across Central, North and East Malaysia, INTI International University and Colleges was founded over 25 years ago and is a leading provider of quality education, offering the widest array of pathways to graduate success...<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/laureate-international-universities">Read More</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>International Partner<br />Universities</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_internationalPartner.png" alt="" /></div>\r\n<div class="texter">INTI collaborates with many award-winning higher learning institutions globally including:<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=1">Australia</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=2">United States of America</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=3">United Kingdom</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=4">New Zealand</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=5">Italy</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=6">China</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>New Kuala Lumpur Campus</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_IICKL.png" alt="" /></div>\r\n<div class="texter">Strategically located in the heart of Malaysia's business capital, our new INTI International College Kuala Lumpur campus is designed to bring out the best in tomorrow's business leaders in the highly competitive business arena.<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/new-kuala-lumpur-campus">Read More</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>Campuses<br />&nbsp;</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_campus.png" alt="" /></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=1">INTI International University</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=2">INTI International College</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=2"> Subang</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=3">INTI International </a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=3">College Kuala Lumpur</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=4">INTI </a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=4">International College Penang</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=5">INTI College Sabah</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=6">I</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=6">NTI College Nilai</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>
10	6	en	2015-12-31 07:33:13.861782	2015-12-31 07:33:13.861782	INTI	<div class="extraHeader">\r\n<div id="crumbs">&nbsp;About INTI</div>\r\n</div>\r\n<div id="container" class="one-column">\r\n<div id="content">\r\n<div id="post-4539" class="post-4539 page type-page status-publish hentry">\r\n<div class="spacer_10">&nbsp;</div>\r\nStudying at INTI International University and Colleges brings benefits that come directly from the strength of the Laureate International Universities network. The Laureate Network is the largest and fastest growing global network of private universities that provides INTI with access to global resources, best practices, teaching methods, international faculty and management tools that are truly world class. Find out more about INTI by clicking on any of the links below.\r\n<div class="spacer_20">&nbsp;</div>\r\n<div class="sssLandingPanel">\r\n<div class="item">\r\n<div class="font14"><strong>INTI International<br />University &amp; Colleges</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_laureate.png" alt="" /></div>\r\n<div class="texter">Spanning across Central, North and East Malaysia, INTI International University and Colleges was founded over 25 years ago and is a leading provider of quality education, offering the widest array of pathways to graduate success...<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/laureate-international-universities">Read More</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>International Partner<br />Universities</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_internationalPartner.png" alt="" /></div>\r\n<div class="texter">INTI collaborates with many award-winning higher learning institutions globally including:<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=1">Australia</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=2">United States of America</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=3">United Kingdom</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=4">New Zealand</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=5">Italy</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/international-partner-universities?tab=6">China</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>New Kuala Lumpur Campus</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_IICKL.png" alt="" /></div>\r\n<div class="texter">Strategically located in the heart of Malaysia's business capital, our new INTI International College Kuala Lumpur campus is designed to bring out the best in tomorrow's business leaders in the highly competitive business arena.<a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/new-kuala-lumpur-campus">Read More</a></div>\r\n</div>\r\n<div class="item">\r\n<div class="font14"><strong>Campuses<br />&nbsp;</strong></div>\r\n<div class="imager"><img src="http://newinti.edu.my/main/wp-content/themes/newinti/images/about-inti/landing/img_campus.png" alt="" /></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=1">INTI International University</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=2">INTI International College</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=2">Subang</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=3">INTI International</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=3">College Kuala Lumpur</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=4">INTI</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=4">International College Penang</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=5">INTI College Sabah</a><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=6">I</a></div>\r\n<div class="texter"><a class="blueArrowLink" href="http://newinti.edu.my/main/about-inti/campuses?tab=6">NTI College Nilai</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>
\.


--
-- Name: university_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('university_translations_id_seq', 10, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, encrypted_password, name, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid) FROM stdin;
2	kgh817@hotmail.com	$2a$10$Nbk.8CfK4/wOUIWJK12tIO/HD63Lf5y.wV.hQ/TV0W9geu52XHjQ.	Kou Ghee Hoong	\N	\N	\N	1	2015-12-24 04:18:53.188809	2015-12-24 04:18:53.188809	175.138.158.145	175.138.158.145	2015-12-24 04:18:53.176491	2015-12-24 04:18:53.192472	facebook	10153761878268771
1	jacky5283@hotmail.com	$2a$10$WhBuGV5sfvN3wuc46txPmuyewLakJMc5s3838d28nVZi.xc3zszji	Chee Chin Wei	\N	\N	\N	2	2015-12-24 04:22:07.969672	2015-12-24 03:37:09.123365	110.159.134.137	110.159.134.137	2015-12-24 03:37:09.101822	2015-12-24 04:22:07.98029	facebook	10153178446191109
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: car_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY car_vendors
    ADD CONSTRAINT car_vendors_pkey PRIMARY KEY (id);


--
-- Name: cars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: country_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY country_translations
    ADD CONSTRAINT country_translations_pkey PRIMARY KEY (id);


--
-- Name: course_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY course_translations
    ADD CONSTRAINT course_translations_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: field_level_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY field_level_translations
    ADD CONSTRAINT field_level_translations_pkey PRIMARY KEY (id);


--
-- Name: field_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY field_levels
    ADD CONSTRAINT field_levels_pkey PRIMARY KEY (id);


--
-- Name: house_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY house_units
    ADD CONSTRAINT house_units_pkey PRIMARY KEY (id);


--
-- Name: houses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: page_region_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY page_region_translations
    ADD CONSTRAINT page_region_translations_pkey PRIMARY KEY (id);


--
-- Name: page_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY page_regions
    ADD CONSTRAINT page_regions_pkey PRIMARY KEY (id);


--
-- Name: study_field_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY study_field_translations
    ADD CONSTRAINT study_field_translations_pkey PRIMARY KEY (id);


--
-- Name: study_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY study_fields
    ADD CONSTRAINT study_fields_pkey PRIMARY KEY (id);


--
-- Name: study_level_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY study_level_translations
    ADD CONSTRAINT study_level_translations_pkey PRIMARY KEY (id);


--
-- Name: study_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY study_levels
    ADD CONSTRAINT study_levels_pkey PRIMARY KEY (id);


--
-- Name: universities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: university_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY university_translations
    ADD CONSTRAINT university_translations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_car_vendors_on_address; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_address ON car_vendors USING btree (address);


--
-- Name: index_car_vendors_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_country_id ON car_vendors USING btree (country_id);


--
-- Name: index_car_vendors_on_featured_image_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_featured_image_id ON car_vendors USING btree (featured_image_id);


--
-- Name: index_car_vendors_on_latitude; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_latitude ON car_vendors USING btree (latitude);


--
-- Name: index_car_vendors_on_longitude; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_longitude ON car_vendors USING btree (longitude);


--
-- Name: index_car_vendors_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_name ON car_vendors USING btree (name);


--
-- Name: index_car_vendors_on_owner_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_owner_name ON car_vendors USING btree (owner_name);


--
-- Name: index_car_vendors_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_car_vendors_on_slug ON car_vendors USING btree (slug);


--
-- Name: index_cars_on_brand; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_brand ON cars USING btree (brand);


--
-- Name: index_cars_on_car_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_car_type ON cars USING btree (car_type);


--
-- Name: index_cars_on_car_vendor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_car_vendor_id ON cars USING btree (car_vendor_id);


--
-- Name: index_cars_on_featured_image_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_featured_image_id ON cars USING btree (featured_image_id);


--
-- Name: index_cars_on_model; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_model ON cars USING btree (model);


--
-- Name: index_cars_on_price; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_price ON cars USING btree (price);


--
-- Name: index_cars_on_year; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cars_on_year ON cars USING btree (year);


--
-- Name: index_countries_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_countries_on_slug ON countries USING btree (slug);


--
-- Name: index_country_translations_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_country_translations_on_country_id ON country_translations USING btree (country_id);


--
-- Name: index_country_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_country_translations_on_locale ON country_translations USING btree (locale);


--
-- Name: index_course_translations_on_course_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_course_translations_on_course_id ON course_translations USING btree (course_id);


--
-- Name: index_course_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_course_translations_on_locale ON course_translations USING btree (locale);


--
-- Name: index_courses_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_courses_on_slug ON courses USING btree (slug);


--
-- Name: index_courses_on_university_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_courses_on_university_id ON courses USING btree (university_id);


--
-- Name: index_field_level_translations_on_field_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_level_translations_on_field_level_id ON field_level_translations USING btree (field_level_id);


--
-- Name: index_field_level_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_level_translations_on_locale ON field_level_translations USING btree (locale);


--
-- Name: index_field_levels_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_levels_on_country_id ON field_levels USING btree (country_id);


--
-- Name: index_field_levels_on_study_field_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_levels_on_study_field_id ON field_levels USING btree (study_field_id);


--
-- Name: index_field_levels_on_study_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_field_levels_on_study_level_id ON field_levels USING btree (study_level_id);


--
-- Name: index_house_units_on_featured_image_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_featured_image_id ON house_units USING btree (featured_image_id);


--
-- Name: index_house_units_on_house_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_house_id ON house_units USING btree (house_id);


--
-- Name: index_house_units_on_owner_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_owner_name ON house_units USING btree (owner_name);


--
-- Name: index_house_units_on_price; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_price ON house_units USING btree (price);


--
-- Name: index_house_units_on_size; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_size ON house_units USING btree (size);


--
-- Name: index_house_units_on_unit_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_house_units_on_unit_type ON house_units USING btree (unit_type);


--
-- Name: index_houses_on_address; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_address ON houses USING btree (address);


--
-- Name: index_houses_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_country_id ON houses USING btree (country_id);


--
-- Name: index_houses_on_featured_image_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_featured_image_id ON houses USING btree (featured_image_id);


--
-- Name: index_houses_on_latitude; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_latitude ON houses USING btree (latitude);


--
-- Name: index_houses_on_longitude; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_longitude ON houses USING btree (longitude);


--
-- Name: index_houses_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_name ON houses USING btree (name);


--
-- Name: index_houses_on_property_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_property_type ON houses USING btree (property_type);


--
-- Name: index_houses_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_slug ON houses USING btree (slug);


--
-- Name: index_images_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_images_on_imageable_type_and_imageable_id ON images USING btree (imageable_type, imageable_id);


--
-- Name: index_page_region_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_region_translations_on_locale ON page_region_translations USING btree (locale);


--
-- Name: index_page_region_translations_on_page_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_region_translations_on_page_region_id ON page_region_translations USING btree (page_region_id);


--
-- Name: index_page_regions_on_action; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_regions_on_action ON page_regions USING btree (action);


--
-- Name: index_page_regions_on_controller; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_regions_on_controller ON page_regions USING btree (controller);


--
-- Name: index_page_regions_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_regions_on_country_id ON page_regions USING btree (country_id);


--
-- Name: index_page_regions_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_page_regions_on_name ON page_regions USING btree (name);


--
-- Name: index_study_field_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_field_translations_on_locale ON study_field_translations USING btree (locale);


--
-- Name: index_study_field_translations_on_study_field_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_field_translations_on_study_field_id ON study_field_translations USING btree (study_field_id);


--
-- Name: index_study_fields_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_fields_on_slug ON study_fields USING btree (slug);


--
-- Name: index_study_level_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_level_translations_on_locale ON study_level_translations USING btree (locale);


--
-- Name: index_study_level_translations_on_study_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_level_translations_on_study_level_id ON study_level_translations USING btree (study_level_id);


--
-- Name: index_study_levels_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_study_levels_on_slug ON study_levels USING btree (slug);


--
-- Name: index_universities_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_universities_on_country_id ON universities USING btree (country_id);


--
-- Name: index_universities_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_universities_on_slug ON universities USING btree (slug);


--
-- Name: index_university_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_university_translations_on_locale ON university_translations USING btree (locale);


--
-- Name: index_university_translations_on_university_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_university_translations_on_university_id ON university_translations USING btree (university_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_provider ON users USING btree (provider);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_uid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_uid ON users USING btree (uid);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

