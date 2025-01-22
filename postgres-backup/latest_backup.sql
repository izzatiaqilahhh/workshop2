--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-01-22 01:17:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 17167)
-- Name: block; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.block (
    block_id integer NOT NULL,
    block_name character varying(10) NOT NULL,
    block_gender character varying(6) NOT NULL,
    number_of_floors integer NOT NULL,
    staff_id integer NOT NULL
);


ALTER TABLE public.block OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17166)
-- Name: block_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.block_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.block_block_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 225
-- Name: block_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.block_block_id_seq OWNED BY public.block.block_id;


--
-- TOC entry 230 (class 1259 OID 17187)
-- Name: complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaint (
    complaint_id integer NOT NULL,
    complaint_type character varying(50) NOT NULL,
    complaint_issue character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    image bytea,
    date_created date NOT NULL,
    date_resolved date,
    student_id integer NOT NULL,
    room_id integer NOT NULL
);


ALTER TABLE public.complaint OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17217)
-- Name: complaint_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaint_assignment (
    complaint_id integer NOT NULL,
    worker_id integer NOT NULL,
    date_assigned timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    remarks character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.complaint_assignment OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17186)
-- Name: complaint_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complaint_complaint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.complaint_complaint_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 229
-- Name: complaint_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaint_complaint_id_seq OWNED BY public.complaint.complaint_id;


--
-- TOC entry 233 (class 1259 OID 17230)
-- Name: complaint_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaint_status (
    status_id integer NOT NULL,
    complaint_status character varying(20) DEFAULT 'Pending'::character varying NOT NULL,
    description text,
    date_update_status timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    complaint_id integer NOT NULL
);


ALTER TABLE public.complaint_status OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17229)
-- Name: complaint_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complaint_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.complaint_status_status_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 232
-- Name: complaint_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaint_status_status_id_seq OWNED BY public.complaint_status.status_id;


--
-- TOC entry 224 (class 1259 OID 17160)
-- Name: floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.floor (
    floor_id integer NOT NULL,
    floor_no integer NOT NULL,
    block_id integer NOT NULL
);


ALTER TABLE public.floor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17159)
-- Name: floor_floor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.floor_floor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.floor_floor_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: floor_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.floor_floor_id_seq OWNED BY public.floor.floor_id;


--
-- TOC entry 228 (class 1259 OID 17174)
-- Name: hostel_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hostel_staff (
    staff_id integer NOT NULL,
    staff_no character varying(5) NOT NULL,
    name character varying(25) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    phone_no character varying(11) NOT NULL
);


ALTER TABLE public.hostel_staff OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17173)
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hostel_staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hostel_staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 227
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hostel_staff_staff_id_seq OWNED BY public.hostel_staff.staff_id;


--
-- TOC entry 222 (class 1259 OID 17150)
-- Name: house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house (
    house_id integer NOT NULL,
    house_no integer NOT NULL,
    floor_id integer NOT NULL
);


ALTER TABLE public.house OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17149)
-- Name: house_house_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.house_house_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.house_house_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 221
-- Name: house_house_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.house_house_id_seq OWNED BY public.house.house_id;


--
-- TOC entry 237 (class 1259 OID 17268)
-- Name: maintenance_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_company (
    company_id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    company_office_no character varying(20) NOT NULL,
    company_email character varying(50) NOT NULL
);


ALTER TABLE public.maintenance_company OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17267)
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_company_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_company_company_id_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 236
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_company_company_id_seq OWNED BY public.maintenance_company.company_id;


--
-- TOC entry 235 (class 1259 OID 17257)
-- Name: maintenance_worker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_worker (
    worker_id integer NOT NULL,
    worker_no character varying(5) NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(12) NOT NULL,
    phone_no character varying(10) NOT NULL,
    specialization character varying(100) NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.maintenance_worker OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17256)
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_worker_worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_worker_worker_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 234
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_worker_worker_id_seq OWNED BY public.maintenance_worker.worker_id;


--
-- TOC entry 220 (class 1259 OID 17140)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    room_no character varying(15) NOT NULL,
    hostel_block character varying(10) NOT NULL,
    capacity integer NOT NULL,
    current_occupants integer NOT NULL,
    house_id integer NOT NULL,
    CONSTRAINT room_check CHECK ((current_occupants <= capacity))
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17139)
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_room_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 219
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
-- TOC entry 239 (class 1259 OID 17685)
-- Name: staff_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_log (
    log_id integer NOT NULL,
    staff_id integer,
    login_time timestamp without time zone,
    logout_time timestamp without time zone
);


ALTER TABLE public.staff_log OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17684)
-- Name: staff_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_log_log_id_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 238
-- Name: staff_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_log_log_id_seq OWNED BY public.staff_log.log_id;


--
-- TOC entry 218 (class 1259 OID 17125)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    matric_no character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(12) NOT NULL,
    phone_no character varying(11) NOT NULL,
    gender character varying(6) NOT NULL,
    course character varying(100) NOT NULL,
    faculty character varying(100) NOT NULL,
    year_of_study integer NOT NULL,
    room_id integer NOT NULL,
    CONSTRAINT student_gender_check CHECK (((gender)::text = ANY ((ARRAY['Male'::character varying, 'Female'::character varying])::text[]))),
    CONSTRAINT student_year_of_study_check CHECK (((year_of_study >= 1) AND (year_of_study <= 4)))
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17124)
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_student_id_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 217
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- TOC entry 4754 (class 2604 OID 17729)
-- Name: block block_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block ALTER COLUMN block_id SET DEFAULT nextval('public.block_block_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 17730)
-- Name: complaint complaint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint ALTER COLUMN complaint_id SET DEFAULT nextval('public.complaint_complaint_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 17731)
-- Name: complaint_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status ALTER COLUMN status_id SET DEFAULT nextval('public.complaint_status_status_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 17732)
-- Name: floor floor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor ALTER COLUMN floor_id SET DEFAULT nextval('public.floor_floor_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 17733)
-- Name: hostel_staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff ALTER COLUMN staff_id SET DEFAULT nextval('public.hostel_staff_staff_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 17734)
-- Name: house house_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house ALTER COLUMN house_id SET DEFAULT nextval('public.house_house_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 17735)
-- Name: maintenance_company company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company ALTER COLUMN company_id SET DEFAULT nextval('public.maintenance_company_company_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 17736)
-- Name: maintenance_worker worker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker ALTER COLUMN worker_id SET DEFAULT nextval('public.maintenance_worker_worker_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17737)
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 17738)
-- Name: staff_log log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_log ALTER COLUMN log_id SET DEFAULT nextval('public.staff_log_log_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 17739)
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- TOC entry 4979 (class 0 OID 17167)
-- Dependencies: 226
-- Data for Name: block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block (block_id, block_name, block_gender, number_of_floors, staff_id) FROM stdin;
1	Lekiu	Female	9	1
2	Lekir	Female	9	2
\.


--
-- TOC entry 4983 (class 0 OID 17187)
-- Dependencies: 230
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint (complaint_id, complaint_type, complaint_issue, description, image, date_created, date_resolved, student_id, room_id) FROM stdin;
1	Plumbing	Leaking tap in the bathroom	Water from sink keep coming out	\N	2024-12-01	\N	3	3
3	Security	Broken lock on main door	The door lock is broken, and it feels unsafe.	\N	2024-12-03	\N	2	3
4	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink.	\N	2024-12-04	\N	3	3
5	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2024-12-01	\N	4	4
6	Plumbing	No hot water in the shower	The water heater seems to be broken.	\N	2024-12-05	\N	5	4
7	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2025-02-06	\N	3	3
8	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink	\N	2025-01-08	\N	3	3
2	facility	electrical	The power keeps tripping and we have no lights.	\\x89504e470d0a1a0a0000000d4948445200000780000004380806000000e8d3c143000000017352474200aece1ce90000000467414d410000b18f0bfc61050000d2d649444154785eecdd078015d5dd37e0ffeed27bef28cd062a88155b2c51d38cc99bfa46d36d696a7a37d5f4a22631d1f437f54b4c31312696d81bf68a88280888f45e77d9e5bbe7ee5cb85c1758da02c3f324e39d397366eed4cbeefeee39533568e0b0b59133471d7564dc7beff86caa296b636deef61ad8d1aaaa8aff2d8e030000000000ec8aaab3d73d440a7e9b0a7f5381c160303435ac973e3bd2674865390000000000c0aea2a64b97ee5fccc67363d0a0413163c60bd954a3c6d0a6646d637cb3ae4898036c4655a9edeffa16c0558d4d8201000000000076197b4400bc3efc2db5fe2d0f8085bfc0a6bcf433a2bc2b6821300000000000b02bc9fd33802bc3df62f45b18299666f31acb8aa300eb55a5ff67016f5536567c2dfcaf7122fd47080c0000000000ec32f69000380b7f8bc1efdae8ddab6ff4eb37303a75ee2cb801362b7d762c5bba3466cd7a21e6ce9b9d05c0eb43e0f2301800000000006067aace5e73ad18fe66ff1b3a6444ecb3ef01d1b94b17e12fd02ce9b3227d66a4cf8ef41952fa3c297ebfa4a0f40a0000000000b0b3ed010170630be094d0a496bffd070c6a2c06d80ae933247d9634a6bea52129bd020000000000ec3cb90f801b5bff360ea9db67806d953e4b4a9f2b5aff020000000000bb923da20be8524a939ef90bb0ad8a9f25a56f976404c10000000000c0ae60cf0880b394c6337f81ed61fd6789d4170000000000d8b5ec21cf004eff15d400dbcffacf149f2d0000000000c0ae630f69015c20a301b6a70d3e537cc0000000000000bb863d270006000000000000c8390130000000000000404e0880010000000000007242000c00000000000090130260000000000000809ca81a3470d8da6c7c9b0d1a34b0300ccaa6366dc68c1985e1856c6afb3aeaa823e3de7bc717c71b1aea63eddab585d78638e6d8938a65dba25dbb76317060bfe8dbb77b1c70c08898f8d484e8dcb953ac5eb52ae62f581a0d6bdbc5934f4e2cbc6743f17dabaaaab225813cb9ebce9ba3bababa788f37dee7a5570000000000809d67bb04c02904b9ecb2efc76b4e7f7556d23c7ffdebdfe2631ffd443128dd9e765400bccf3e23624dedc2e8d3b74f2caf6d174b57b78b798b56458fee3d22ea9747bf1e55d12a96c47efbed1f8f3ff15c3cf8c0c34260c82901300000000000b02bda2e01f06bcf38bd18003ff5d4c4b8e1fa1bb2d24d7bc52b5f11fbedb76f9c77defb0acbdc98956e1f3b22003ef5d413e32d6f7e4d7cffc77f8affdeb73496acea128b96ae8aaaeaea58b3664db4aaa98ece1ddb46ff1e6be263e79d10b3a73d10d75f7f67ac5add10850dc8d602e4850018000000000028e9d4b9532c5bba2c9bdabc2dadbf25b64b003c70e080183c78704c99323566cf9e9d956e5abf7e7d63c89021317dfaf478e1859959e9f6b1bd02e014e6a465478f1919a3460e8d7b9ea88dffdcb33c962e5d11ad6a1a8aa16f56b158afbebe216aeb5237d1ade3a8916be2c0bd56c5b4697363d6ac058df580dc688900b85bb76ef1c52f5d1c5fbbe41b3167ce9cac140000000000766f53a64ecec6366ee89011d9d8aeafa6a6266eb9e5a6b8e28a9fc41ffff8ffb2d28d7beb5bdf12ef7ffff971e2892f8ffafafaac74fbc912cc6d9302dc14b83637fc4d66cd9a5d5c667b87bfdb530a75870d1f1203fb778d3f5d3739fef09fd9b172c5b268d7b6f14436ac8d6848f5b246bea9ac43fb9a585bbf26ee7eb26d3c3ba77b1c7ffc6171d041a31a5708ec50fdfaf589b1630fcea69a3676ece862bdddc1fefbef17679cf1da1873c8e8ac040000000000f22105bc1b1b763729c4bdecb2cbe392af7d25def086d767a54d4bf353bd547f4784bfc93605c00306f48f9ffdfcaa787ad2846252bf35435af6a73ffd49f4eddb375bebaea35dfb76d1bb4787983865593c36ad6b74685b1d3535d5d19052df82626bbfb55585ffaf7fce6f43c3daa82ed4a96a581d373f581bd366af8d5ebdda46878e1d8af337e63def3933fef2975fbf64d86fbf7db21a4d4bcb7df6b31fcda63694cad3fc9d6573ef9fe657eeefc6f66557d2d4b9da156ce9f92e1dffedadf2bcb6e439edddbb577cea5317c5b8718767251b3afae8230af32f2cdc933db31200000000807c4b3db2befd1d6fcfa69aefacb79f55ec0116689ebffce56ff1898f7f32bef5ed6f6e34044ee5697eaa97eaef28db14007fffd2efc6c9279f146ddab4c94ab65c5af6e5a7bc3cbef9adaf6725bb8e7e7dfb44fb8eede2f1a9ed62f9f2d5515d385aa9d56f0a7b53ebe034143b7e2d94ad9b4e9970e1b5a65555acae5d13b73db422d6d4af89eeddbb34ae74131e7ae8b1c2897fe706c3d34f3f93cdddb94e39e584f8d18fbe954d6d3f95fb9c5a6feeccd07a73d23178f5ab4fdd609b7ff2935f168fcfeee6924bbe5bdcfee66ace35509a5f7e7c5e7c7156b16c6ba52f41a463de1c8f3f3e21befbdd1fc545179d1f471e796856da284d5f70c179c5f94f3cf154560a00000000906f279c70427cf9cb5f280ecd95ea7ee52b5f2c2e0bdb4b7903d1cae9f2f2ddd9a642e0960a7f936d0a800f39e49058bc78718c197d6893cdb39b331c32e6b0e23ac68d3b2a5bebaea357cf0ef1c2ece5316d4e43b4699d5af7a6a77c364a2170b1d56f4a7fd34b693a7b0ee8dab555d1b6b0ccf4c2b22beb3a44cfeeed1b176493fef5af1be2d04377cdee6e4bc17465687ae38db716873d5d0a6ad337c9aebefa1f5949a35ffce277d958cb183ffec1f8def7ae888f7ce4fdeb42e0f4fae10fbf3fbefdedcb8bf30100000000f6147ffdebdf8a8fe44cad80bffad52f65a51b97eaa4ba69993ffff9eaac14b68fa6b2c2d290174d85c02d19fe26db1400b76edd3a962e5d560c70b7d6a2458b8aebd89656c43b4aab9a88e5759d63e5eac281aa4e296ff1ffeb5afb36b6f86d1355d56d0b330a95ab5a6d30d4d4b489c5cbea63f1ca0ed1b66da16c1750d97d7165f7bca99567f9fc14eaa53ae79fffee62b857b94ce5fa36d7657573cc9cb9e1b3a437b7cdc9e6eaa4e95427b5502dd549fb9ab6b77cb94d49ad50fffef7ebb2a98ddb11db525aa67cdd9b6b8d5bb9becafaa57596a4f9a556bea5654ae733d5ddd83550526aadbed75e038baf95d23295cb958e4372f2c92f8b9ffffcf2b8ecb2afc7d7bef6b9183468409c71c62be3d8638f8cce9d3bc66b5e735a1c7cf0fae76977efde2d7af4e85eb8b75efad99142de4b2ffd497cf4a31f88f3ce7b57310c4ea1f0830f3e9ad50000000000d833d4d6d6c63bdff1eeb8f38e3be3ccb3ce8ccf5ffcd96cce4ba579a94eaa9b9649cbd2329a6a0dbba9815d5b0a793ffb99cfc7b7bff3adb8ecb2ef175fd3744b84bfc93605c079b7b6f0bf14e0a6e7fa6605e9ff45c5c6bfd5ada26df5a2e8503d3fdad6ac2e0c2ba24df5faa15dab555153bf28dab56d1faf7ed52bb225779e14b655765f3c6040df75a15c0afb52c8f799cf7cb5382f756d9ca4ae82d3f8ac59b38be5693a49eb4bad754beb4a755270b7b5d2fba7ed2b6f41bab96d4e9a532749752ebffca7c5f9a9a571dad70b2e3867dd3269ff2a972949c168b2b996be3b725bd23249a94eb2b1ed4d8e39e68875e7b239f593b41da5ed4add73a76d4a36760d542aed4b3a0e95eebbefc1e2b12897ae9f14aaa7737fce39ef88af7ffdfb71e1859f5e17b45f73cdbfe3ce3bc7c7d2a5cbe3da6baf8fc71e7bb258deb76fef68dfbe5d2c58b03056af6efa07907beeb93f6ebbedee38f5d413e3f6dbef29beffee66f8f0e18dafc31a5f0100000000b6460a72dffdeeb38bc1ee7bdef3ee2643e05496e6a53aa9aef0b76535d522765303bbbe3ffef1ffc56f7ff3db78ed19a7175fd3744bd96101f045175df0926f23a4b2dd497d7d7db46fdf3e1ad63664256552ebdfea36d1a5cdd2e8db616ef468bf387ab45d183ddb2f280ebdda2f8cee85e9c13d96c61d773f169ff9fae613fdf4fcdb52cbcb346cae856749e572a52195974b01620a04cba5b0afb25ea925670a3b37f50ce252885992eaa780b014963647f9b69702d0f2f76cce363777bf52a0595a77a95be2f216bd69bc32a0dc523b725bd232e5dd2997d65b6aa55b29d52d3f96cdd9bf14e0969649417c6af1bb25d27ba6fd4fc7219dd3f220385d1f697da5ed4daf69ba3c549f3c794af1f5befb1e8a19336616c79bd2a3478f983f7f4136d5b4d4edf3f1c78f8b1b6eb8a5f87ac4111b3e137857f297bffef9259f9769f8ea255f2eceffc4273fd6e4fc1b6fbabe381f000000006073d6ac59b341089cfeee58520a7f6fbef996629d5417d8366f7deb5be2acb79f55ec863dbda6e996a205f0261c7cf0e838e2b05151bfa62e7bbe6f14bb802e76035df86fc39a95317755df585adfb5d84ab8a1aaa630b429cc6b1d0dd1aa30d4447db48bb56beb63c58acd7f5326057ca5d69a69f8c0073e91cd494dc5370c77cb552e571a52794929942d0f0493d2740ae3d2780a70d3fa3717e296e6a716bfe5dbb5a58161f9b6a765cbdfb739dbdc9c3a252fbe382b1b5b6fdab417b2b16db7a3b7a57299caf7694a0a604be726b5ccdd9ce9d35fba0de5dbdd1c69bbd2f94c2d8653105cdeea389defd4323949afa56b342d337bf6ec6217d0471fdd387f637af7ee557ceddbb7cf46bb804ee16fa9dbe72baffcd5ba6702efaacf97beeaca9fc665975efe92211d9364dab4e94dcebfecb2cb8bf301000000009aa31402a7a0f77def3b3f2eb8f043c520b814fe9e77eef9c25fd80ed2337f2ff9da57e2e31ffb447cf4231f2fbea6e9d2338177b41d16005f7ae9e52f698e9eca7627ab6b1ba2579786e8d8be75d4d7a7c8b7b10be85237d0495561aaa630231dc8345e1df5515dd550180ae385c2d655cba36a6d6d5415cab64529242d0d3b4a0a9d530bce1416a6d070732ab72b0d9beb2679635260d89c9072672885b35b1a86ee4ce9fc5576d1dd92d27590aea5f256caa91be652089b5ecbbb65bef0c2cf14bb807ecb5b5edfacaec4a74d9bd16417d0e5e16f7a1670925ebffffd2be2e31fbf60970c81afbffe86e2e763e5f0c94f7cba38ffdbdffa4e93f3affde7bf8af301000000009a2b05bc29e84d81ef873f7c6131085e1ffed667b560e728f580b93b4b21efb7befdcdf8c4c73f19a567fea6d7349dca5b2204d60278136eb9e5ee58b6604a1cbc5fb762185cd5c4d15a5b4c84b304b81811a718b8f05aa85c5355f8a0ac2a4ca796c151932aec341b0b304bd3e5ad494b2d38536be0a69ee59aec8840b4d48574e93d9bb3cd5bb25fdb22ad276ddb1bdff8daace4a576f4b6f4efdf2f1b6bb4b116c749e93dcb5b910f1e3c301b6b39a56ddb6bafc6f72e75039db6bdb2fbe72475019d9e013c7ffec275fb5769e5ca95c5d7a65afe8e1ab5ff4bc2df92347df9e557c6273e71411c70c0be59e9ae6df5ead5c5d7da3acfda0000000000b69f14f4a6c0f7f7bfff43fcee77bf17feb2cb286f58ba3b6a2afc2d69c9105800bc09335f9c138b172f8ba346d644eb56110d8d79ee860ad36b1a1a624dfddac28763e1b5f001b9a66e6d34ac591df56b6a0bcb34644379bbe1969782b8d4dd6e65cbcaf4dcddf4dcd724056e95a15b7997c0e5dd3b6f6c7de5ddfd6e8df49cdad46d700a309bb3cdcda9b3bda43035b566ad7c3673e9b8ede86d49ef5d7e7e526be9cdadb71404a7d7745cb7d5a6baf84eef5179fe4b617e79d09b8ed1eb5ef7aae26b49daaf934f7e5936d568debcf9d95844e7ce1db3b18865cb96c7f2e5cb8b5d40575ab870717ce31b97be24fc2db9fbeefbe29bdfbc2c162d5a9c950000000000ec99529ef1d9cf7c3e3ef7d98b85bfb01d6c2afc2d69a9105800bc296bd7c6a4675e88aada17e2e4c3db465d434df159bfd5d51ba6c035352920ae8e36ad5b155e5b47bb360dd1b6754361bcaa6cc82a6f420af84acf6b2d0d9581ecb6b8e492ef1603c3f2f53ff8e0a3f18b5ffcae383fb5602d75fd5c9a570aee4aad73537929e44beb4b215ea97e1a9a7ab6ed9628bd4f0a4d93cd6d73d29c3adb4b6a199d94bf570a334bc769476e4b5a6f7aafd27ad3b1dfd87a53189deaa7303ad54dc7735bbb806eea1a2897deb3f21a4ea173e998955c7df53f8a41727a2d49d7de39e7bca3f80ce0cb2efb7a4c9cf84c3cfcf0e3c57969bd4b972e8fd7bce6b438f8e051c5b2d4fdf3ca95ab5ef20ce099335f5cb7dcc6a4e3f6e28b8dcfd60500000000005a4ea98be7a686dd59ca0a2fbcf082e2972a3616fe96a4f9a95eaa9f96db11aa060d1cb6d54d53d3c99831e38538eed80d5bee6da93beebc2d060d1ab8dd9a731f75d49171efbde38be30d0df5b176eddac26b431c73ec49c5b2e64a072645bdfbec33247af6ec10135f681fb73fb23656d7d647eb566b0b27a53a5a5547f468377fdd337e5b573744eb9abac27bae0f894bad863b55cf6d1c812d9402d714aeef8850bba5a52f35a420bbbc7beaddd15d77de1cd5d5d585fbbbaa38a44f8bc6d7ed277d96fde18fbf8bf3ce7b5fdc70fd8d59290000000000b0abe9d4b9532c5bba2c9bdabc2dadbf25b6a905707a5078870e1db2a9ad930293b48ebababaac64d7518a729e79666acc9db73c0edc6b75bcedd43671d03eeda37dbbb651575f138b96d6c69a86ea42dd56d1aaba2adab4ae8aaaea36515dd3ba3034be4655abc25078058ae16f6a15cde62d5fdef8c1bf74c9d2e22b0000000000b06bdad230774785bfc936b500fefd1f7e1be3c61d154f3d3531962cd9ba676a76edda2df6df7fbfb8e3f63be21def787756ba6db6570be04a0307f58f11c3074455d5da98316b45d455758f4eddfac5bdf73c1a7575aba27d9b866828b6fc2d3fa4a5f1aae818dbd63d327bae3cb4004efb90ba884e5d30a7aeb277772dd10238193a74484c9932359b020000000000d8b46d0a80070ce81f5ffbfa2571f4d1e3a275ebad6be15a5b5b1bb7dd7a7b7cfef35f88d9b3b7cf73397754009cb46edd26faf5ef1dddbab48d5e3dbbc661471c1ddff8e17f63f1922551959e0d9c1dcdf49e957ab49e998d01bbbb960a80010000000000b6c43605c0bbaa1d19000324026000000000006057b44dcf000600000000000060d7210006000000000000c8090130000000000000404e0880010000000000007262cf0980abb25780ed6183cf141f300000000000c0ae610f08801b83992a010db01dadff4cf1d9020000000000ec3af69016c08d01cddab56b8baf00db62fd6789f0170000000000d8b5ec190170ca68aaaa62d9d2a58dd300dba0f85952f84c29cf7fd3240000000000c0ce96fb00b894d1a461d6ac178a6500db227d96943e5704bf0000000000c0ae640f79067061a8aa8ab9f366c78b33673416036c85f419923e4b1a93dfd290945e010000000000769e3da20be8c656c08dff9b3275723c33e9a958ba6489670203cd923e2bd26746faec489f21a5cf9352eb5fad800100000000805d45d5a081c37297821e75d49171efbde38be3eb43deb585f1e27f5361fa6ff1359b93fe03b0a1eccb238de3d958f1b514fe36ceab9200030000000000bb88dc07c04965089c45be59e89bbbdd07b6bbaad2ff8be3c25f00000000006057b54704c0c986dd3d9707c0891018d8982ce02dbc64916ff1bf89f0170000000000d8d5ec310170a3520be04a026060635e1af296b700060000000000d8955467af7b88d4756ba9fbd672a9c06030189a1ad64b9f1d8dad7e372c070000000000d855548d1a79a8e6af0000000000000039b087b50006000000000000c82f0130000000000000404e0880010000000000007242000c000000000000901355a3461eba361b07d869ead6d4455dedeaa86fa88ff0a904000000007ba6aa889aea9a68dda66db46ed53a2b04604b68010cec74ab57af8a552b57447dbdf01700000000f6686ba3f877c2f4f7c2f4774300b69c0018d8a952cbdfdadad5d9140000000040a3f477c3f4f74300b68c0018d8a952b7cf00000000004df1f743802d27000676aae2337f01000000009ae0ef87005b4e000cec5c9ef90b000000006c8cbf1f026c310130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003bbbd1e3dbac797be74714c7cfac9e2f0b9cf7f263a77e99ccd05000000005ad221630f8931878cc9a600b6cda85123e3fffde977f1e043f7c6ef7effeb38e9e413b3396c4cd5a89187aecdc6c98156ad5ac511471c1e871f71680c193224d63634c473cf4d892953a6c6bdf78e8ff9f317643523860d1b1a03070e883beeb82b2b8196b774e9e26c6ccb75ecd821ce3bef9c78efd9ef8d76eddac533cf4c2e96efb3cf8858b870517cff7b97c61ffff8c7a8af6f2896ef0823471d10ef7ce73b62f0e0c1594985b56be3f1279e882baffc692c28bbff00000000208f3e7ff167e25def7a5771fca73ffd697ce3ebdf2e8e6f8bce9dbb6663c0b6183274ef18376e5c8c18312cfaf7ef170b172c8c29539f8ff1f7de174f3e39211a1a76dcdfd2b756f7eedde29ffffc5b2c5fb122fef6b7bf1733b0b1630f89b3df7b7e3cf0c083592d2ab57800dcba75eba8ababcba6763fbbeaf6d7d4d4c4596f3fb3f00febdb8b3743ba499f7b6e6a2c5eb4287af6ec59bca957afae8d5ffdead771e5953f8b11c387c795575d11cf3cf34c9c7bcefbb3b540cbdb9a00b84d9b36f18e77bc3dce7fdf79c5eb3d05bfdffbdef7e386eb6f2cce3ff5b453e2a31ffd48e11fb1e1f1ecb3cfc517bff8a5b8fbae7b8af3b6a7a1c386c4bffef5cf58b162654c9a34292bddd0c89107147e40ed1c73e6cc89ff7deb9931b5f08f2900000000e451bf7e7de3f63b6e8d7ffef3dae2f4e9a7bf268e3df6f898337b6e717a6b0980d9d9faf6ed13279d7c5274edba653d4f2e5ebc34fefbdf9b0bf7c09cac64e738fae871f1bef79f1b071d7460717ae9d2a5f1fcf3d3a24fefded1a7b06fc90b3366c62f7ef1abf8eb5fff1e6bd7ee3a6d475ff7fad7c617bff8f978cfbbcf8d871e7a383a75ee1437de785d5c77dd7fe22b5ffe5a568b4a2d1a00efb5d7e038e8e083e2e6ffde122b57aecc4a771f1d3a7488134f3a211e7fecf198366d7a56baf3f5ead533be7fe9778a376e0ac07efdebdfc6d34f4f8a356bd66435220e39644c9c79d6ffc6cb5f7e523cf2c8a3317cf8b06228f5e0030fc57bdf7b5e560b5ade9606c06f78c3ebe3231ffd48f187c9992fcc8cef7dffd2b8e6efd74443c3861f65d5d55571c6ebce888f7cf8a218506ce97e677cf5ab97c4e4679ecd6a6cbbb3cf7e6f7cfa339f2cfc207b464c78f2a9ac7443bfffc36fe3c8238f288ecf9b372fdef4c6b7ec529f1f00000000b0bd5c78d187e2820b3e142f3ff994e2f44dffbd312ebdf4f2f8c1e53f2c4e6f2d01303bd3c1a30f8e9ffef4c7d1b66d9bac64cbac58b122ce7eef793161c2c4aca465bdfbddef2cdc9b1f2c06be3ffcc115f1f0c38fc4bc79f3b3b98d3d6d8e1c3932ce3defbd71f8e187c5b5ffbc2ebef0852f477d7d7d5663e74abd80a6f0fab8634f2a06d7c99ffefcfb58bc78719c73f6fb8ad33b53754d751c7cd041c51e7ab7446ac8f9c8a38f46c30eeac1b4c502e014fea60ba7f096f1e0830fc4d4a9d31a67ec46f61eb2771c76e8a185b1b571fffd0fec12214e0aa57ff5eb9fc5800103e2f39ffb42dc72cb6dd99ca6a59b3cddec25026076b62d09803ff2910be3031ffc40b12be5cb7ff0a362f7ce75b59b6e91dfba4deb38f3ccb7c5073ef0fee8daa54b9c77fefbe2969b6fcde66e9bd20fb4871c72682c59dcf80f4fa5f2003879f1c559f1d6b7fe6fcc98fe42560200000000bbbfd420e3ee7bee2cf680f7d6b7bcad58f6a73fff21f6da6baf387adcb12f69c0b12504c0ec4cdffaf6d7e3e4934f8c0f5ff4f1b8fdf63bb2d2e639fef8e3e2fb977e3bfef3efebe3b39ffd4256da72def086ff89cf5ffce9c2fbdf109ffbdc17366838d894f7bef7ddf1c10fbd2ffefca7abe36b5ffb5656ba739dffbe73e2fcf3370c80d3f380972d5db64be45b679c717a7ce9cb1767535be60b177f39aeb9e69fd9d4f6d52201f0c08103e3c8230f8faaaaea78f4b1c76272f69cceddd1887d46c4e8830f8eb56b1b8acfd49d39f3c56ccecef1c94f7e34fef76d6f8d8f7df49371d34d3767a54d3be080fde217bffc69b46fdf3e2b1100b3f33537004edd3e4f78eaf16297ceaf3be3f5b172e5aa6c4ef3b46fdf2eaef9c7dfa37bb76e85cfa371dbf40367c9d604c0c98c1933e2d5af7e6df11fa8ad75cd3ffe5a7c3de3b5ff537c6d4995effde94f7f22ce3ee7ec183e6cdfe234bb870b2efc503c3b7972fceb5fffce4aa874ecb1c7c4d843c7c6e597fd202bd9b82da9bb33ed4adb997a51e8d0b143ac58be227ef6b39f17cb4adb973cf4e04371e79d7715c7772769bf5e7c71e666efad0346ee1fa79c724adc78e38df1d40efa06f05bfff7cdd1a963e775c777474bef97fcf10f7f2abe0200007b96534f7d79fcf82757c4473ffaf1f8fbdfae2996a5defcbef5ed6fc639e79c57ec19746b0980d9997efef32b8bdd0ebfe5cd6766255b66678595e939bfffef4fbf8fbbeeba3b2ef8d047b2d2c6aeda3ffbb94fc7a1871e1253a74e8def7ef7b2625654925adba656b7175df8d1b8f5d6dbb3d296d1b65ddbf8f2972e8e979d707cb46bd72e2b6d74ccd12f8be5cb5714c7fff0c7df1633af92d49af6c1071f2a2c7b494c9f3e232b6d19a905f098d1a3a3baba3a2b699e14c63ff6f8e33bac05f0966dcd561830a07f6ec2df246d7fda8fb43f478d3bb2b87f3b4befdebde2cd6f7953dc71c75d9b0d7f7bf4e8113fb9f28a0dc25fd8dd545555c59d77deb1c5e16f929649cb76efd13d6ab6b02b866db17af5ea6c6cbd418306c5ab5ffdaa6c8a2d9502e85208bd312958490167f990ca9a92c29af27a4d49a146799da6d655f99ea52064635efdea5716eb3547dac6547f779142bce6eedbeeacb49f1bbbb676a45de19ad896f35cdaf6144497879329fc4dc16f2adf1dc3dfe648c76c77ba9f0100002a75e8d03ece3bffdcf8e3fffb7dfcfb3fff8a3befba3d1e7bece162f8bb68d1e2b8aeec0bb1d75efbaf58b26449fcf4a75716eba4ba6999b4ec39e79ebdd55deac2ce3474e89062b7c91b93e60d19ba7736b5f3a49037dd939ff9f4e7b392d450aa7dfcf4673f89e38e3ba6d8c36ceafaf9273ff961ecbffffac63d57fee467f1e49313e2539ffe44b161564b4a7f3339ed15a7163e2f1e2f6cd755eb866f7ffbfbebc2dfe4173fffe506f36fbce1a6622fc4a905734b4b016e7a36f1030f3cb845437a5ceb8e0a7f931d1a00f7eddbb71892e625fc2d591702170e5fdabfb49f3bc3f1c71f1f353535f1f39ffd322bd9b8f48f6caa577e43a4e18f7fd44283dd436d6d6d4c796e4aecb7dffa6ff56ca9fdf6ddafb88ecd751bbd3d7dfef317c7e597ff60dd70e5955715cbd3b7acd871860d1d5a6c559742a434a496aea9a55d65509742b465cb97aeab3767ceec6259b9520bbaca75954beb4d65a5e02a0d7dfaf4dd64c8d3bfff80e2bad87d0d1a3cb078cdeca8d69b7996aeffd44ab65c0a9493bc06bf49691f5baae57d6a89db52ad7f0100803dc7c73efe91f8f0872f8c356beae2f9e79f8ff1e3c7c7dfafb9a6f877aff7bcfbbdc5bfe395ac5e5d1bef7ed77b8bf3529d54372d9396fdd8473f121ff9c845594dd87d5c79d515f1e31fffe0252d54935496e65d79e51559c9ce9182dd430e19133fbee2ca58b66c79561af1b2138e8bc1830765538d5ab76e1d6f7cd31bb2a9c6d6b4dfffdee5c5bf61bffce52765a52da34f9fdec5d74f7df273f1931fff74ddf0bbdffebe585e72e38dffdd60fe273ff9d9e2a3672bf76d4fb6c302e074928e3ee6a862489aa7f0b7a43c044efb59ba285bd2983107c7c2858b8adf12d89cd494fcfffeefb71bdc1069483709ec2e263efd748c1a352a9bda72a30e1c555c474b4acffabdecd21fac1b7ef2932bb339ec48295c290fe5d274ea663605c325298849ddcf9677559ac6535929a449c16e0a72efba7b7d20555a5779b83b7af4c1c520b03cb84a61f0f01123b2a90da5f5a6f769a910881d235d1b8f3efa5836059b97be34e08b1f0000c0ee6ed8b0e1b170e1c278cfbbcf89f3cf7b7f7cf4231f8f8b3fffc5f8d637bfd3e4efc9e9efd7695eaa93eaa665d2b28b172f8e61c38767b560f771f59fff1a078f3e38aef8f1e51b84c0693c95a5797fb9fa6f59e9cef1b2138e2db62ebde1869bb29246fbedd7f463fc2acb5377caf3e72f88e38e3f362b6959071e38aaf837d72de92560f5ea2def39747b2876013d66741c76d8a15b348c1d7b4871d91d65873c03b857af9ec58ba2baaa26962e5bba55fd6daf5cb1bc98d6b7942143f68af61d3a6653cd97be4dd0b953e768585b1f77dc7e67cc9b373f9bb3e3fdf0479715bba0fe9fd76fba9b51d89535f719c0c9073ff481e2b70b8f3ffe847861c6862dc73667afbd06c72db7fe37bef7bd4be3473fdc3edfbe6ace33802b75e9da391e7ef8c1626be014086fad8d3d0338951f78e081d954c4134f3cd1e473822bebdd70fd0df1bef77db038beb97554be77f933809f7d6e52b12cd9d87b97d7497ef6d39fc5d7bffead6caa51659d4f7cfc93c5d7f4cc987273e7ce8da38e3ca6d84a378571a9e5edc6a46e57cb9f29bab16755965a05a7f214f2a6968a952de84aad824be595eb4eca5b0557b6686ceabd2bbbd24d2d987bf6e8b9ee79a82529684ecba5edac7cce68e93d2b9f299a02edf2f5a46d4ad395cf002e2d5f5239bfb4dde98b0d95eb2bed63daae146e97dbdc334ecbb73bfd6097ce6549e539addcc6a47cfde5eb3ae6e8c6903f297fce6cb9f2edadac533a6e4d5d5795d74679ddf273593a5f952acf7753d7c9965e13255bbb4f4d29dd5b25a56b6253e7391d9bf22f3f946f4353e72f6d7f52fe3e49f9796d4ae97a4c7f5cd8d4759b6cee7897eea7a47cdb9bda86a6eea7a6d655b90de5d7665a67e574c9e6aef192cae3dcd47d5df959b3a5d76949699f162f5eb2c97d6fce6744d2dcf5010000bba657157e1ff9ee77bf1d93263d13e79ff7bec2cff7b3b239cdd3bf7fbff8c9953f8e7df7dd272ebce0a29704544df10c6076a62baffa51f4e8d133def4c6b76625517c46eefbde7f6e3cfcf02385fbe003c5b29f5cf9a362abdb2b7e74655c75d5cf8a65c95ffff6a798356b56bcff7d1764253bde37be71498c1e7370bcf215a767258d52cbe0dfffe1d7d9d47adffbdee5f17fbffe4d36d5e8073fbcb49841bde17fde9295ec78ef7ef73be3c28b1aff4e9da41e057efeb35fc59557fe342bd9b89df5ace533ce383dbef4e58bb3a92df3858bbf1cd75cf3cf6c6afbda21d1f2d0a1438be16f92c2d191071cb0c5c3de7bb76cffe8e9fd9ada8ecd0d69ff92b4bf43860c298eb794fafa35d16a1b9e659a3e003ef2d10bb329d8f53d35e1a9e2eb98d1638aaf5be2e0830f2abe3ef554e33af2a8149aa620b634a420b714d896dc3bfeae62d7f5e5f54adef086d7175fcbe7a575fcf8c73f2c966f4a7affd23229d44dcba570b8248da73a695e79bd141e97d74bdb9702e9529d349efce52f7f2b4ea760390d693c85bfcd914289144295070b29c05dbae4a5c17d0a7fd3bca47397cec5e94a69b952f895c29a64fe820dbf00540a6bba76ed527c2d57d97234852129b449a14c1ad27892b6374da76d2fcddf5448d3941412a580250548a5f5efbfff4b9f599b82a1143aa500a6542f854b69f97269db532bc6529d141c95073829e84beb484a752a83ab8d49816d0a8ecad75d19dca580b87c5fd271a90ccb9254965a6ea73aa97e3a5f95fb92d65dde05781a4fe7a23952f83b71e24bf72badb3b4be741cd2f14ac7b6248da73ae5c7398da763585e6f6baf896dd9a74ae97895777f9e8e63c9a6ce733a36a5b23424a56030d5496595db9f86adb96ed2f6a5eba6b44cdac6caeb368d3775bc4bf76e49294c2dd54bdb98d65d2eadabfc7e4aaf95e76e63520f04e99aded47ea5f59742e1d27694aef1f2ed4df5d2f696d76beabede98cd5da74d49e7b5fcde2f1dc7cae536f71951d2dcf5010000bb9ef48cdf37bef1cdd1bb77eff8e7b5ff88318734ff6f75e9199d6999b46c5a4773c25fd8d9162c5818ddbb77cba61aa540f2d24b7f500c7cbff7fd6f17c3d234fefdefff6083f037e9d3a74fcc9d3b2f9b6a19a9215279d7cf2513264c78c9f6dd7bcff8f8c3efff984dad377bd6ac6200dc92fef6b7bfc7d9ef3d7fddf0a73f5d5d0cda4f38e1f8acc6aee79fd7fe2bdef3ee7337d8eee60cef7ae7d9c56577941d12003ff1c493ebfe60be6cf9b2b8e3ce3be3f6dbefd8a2a1a5bb544cefd7d4766c6a48fb95f62f49fb9b1e8add92e6ce995b0c71d27380b754ead3fd94534f2ebec2eee2befbef8fb56bd7c6b1c76d79b713c7bfecf8a8afaf8ffbef7f202bc99752405bd9e236b59c4d416c29d84df5d20fd895c169a9f56f0a592bd79102d843c61e924d6d5c0a734b528bde14d21e35eea8aca4b06daf3ba35856deda378da7f5a77949daceb47d37ddb4be7bfab46d69bb362585472940289742af1472a421858ae5ad2037a5a950b8526ab5d61c2940aa94829b545e0a8152a893c2c9e7a64c294e27a9f55e73c2afe64821510a56cad757dea575490a8f5250531e92a7e54aa158b9f2c0b1f4eff5f6086d528bc0f2f72fbd4f3a6625a9ac7c5f4a2d1d2bdf3f8566a57ae935ed5b0a9c4a4aeb2cdf97349ecec5e6f625cd4ff5cab7b5241db392343fbd6f0ab94a9a3ace693c6d6f29c0dbda6b625bf6a929e978955ac526e9fd2b5bb536a5f25e4b41790a057784b46fe5ef97b6311dcbf2eb366d73e5f14ef7607997f0492a2bdfbfb4dd69fde5c16b5a6fe5b5557eee36252d9b3e8b36a572fd49daa674cda42f3f94a47acdb9af37a6f23a4dfb5e7e9d6e4cf9b595964bdbd5d4be575e834953d76073d7070000ec7a9e7c6242bcee75af8fe9d3a7c59ffef48778f39bdf98cdd9b8b7bcf5cdf1fb3ffc36a64d9b16af7ded19c575c0eee0d9679f2bf67c3b70e0fabf2d25bffae5ffc537befeed38e698a3e388230e2f8efffa57ff97cd6d94ba56eed4a9634c7872d37fd7d9de56ad5c155dba343672a9945a28bfed7fdf5e0c215370f9fe0f5c10757575d9dcf53a76ea547c8e774b5ab468713cf0c083eb86ef7ee7d26257d4a7bff6d5598d5d4fea6afba1871ede60bb9b33a4eef1d3b23bca0e098057ae5c19b7de7a7b2c5fb12c3a75ec1423860f2b9ca0f9c5ae3a9b3ba493dc92d2fb35b51d1b1bd2fea4fd4afb97f633ed6fdaef96f4f0238f15fb3f3feaa823b392e63be69871c5e0f889c79fcc4a60d79782b9071f7c305ef18a53a35dbbb659e9e6b56fdf2e5e71da69f1c0fd0f342bdcdb1da5803685ab954ac1e9cb5f7e72f17540e18794a6ea554aad86536bdd349c7adaa959e9a6a56e7f2aa52fa924a560f7de7bee2d4e974b3ff4a779a94edadef4195bd9d5f3d648a150a965590a365210bc3521d8f6d654a896c297a65ab16eabd2fe6eac7572492970ac0ca74acb95076029a029575a57532d9db75453c17a7abfd412bb5cda9e52b89f86a69487a74979abed249d87ca7d49d2b9d8dcbea4eba9a96593ca639d945a946fec382769df4b61e3d65e13dbb24f4d49d7690a1ab7e6be496174e9fc34d5fa737b49fb56a974eecbafdba4fc9a29bf164acaefcba4742e53b7db49e938545e5ba573b729a565cb83e84a1b5b7f92aedf5288dedcfb7a532ab7237d91b1749d6e4ce9cb9de5d2b55cb9ef4d9d93a4f21a6ceefa0000805dd79cd973e3cd6ffedf983cf9d9c2ef5a9befdaf6c2429da7274e8ab7bce57f63dedc97fefe0cbbaa1bae6fec15ed0d6f6c6c6453ee8f7ffc537cf2939f8d4f7cfcd3c5f14aaf7865e3df566fbffdf6e26b4b9933776ef4eedd2b3a66bf67a700fb2d6f79739cffbe738ac3f12f3b2e0e3b7c6c1c71e46171eeb9ef2d96bdebddef8861c3d67f617ef8f061317b76d37f036b291d3ab48fb66dda444bb7a0ce831df674e1d5ab56c72db7dc560c47d31f248f3aea88a8aede710f336e49693fd2fea4fd4acf384efb99f6b7a5dd79c79dc5fecfdff39e776625cdf7f6779c59f8077a8e2e36d8edfceca7bf882e5dbac4eb5fffd27f6c37e60d6f784374ecd4317edacc16a0bbab992f34fd5ce414a896a4407663f5925237cd496517cc9bb3b956ba4953217165596a9d9cb6b91440975a2f6f8bd4ca2c0563cd6959d67923dd3e974b41c6c6428e7229c8280f35537093ca2a5b51a6b03aadaf144e550657dbaab9c1500aeaca43b2ed1d4a97af3b0da56e814b9a0a4f2ba596dd955de46ead14a8556ed3e6c2a7746ed2721beba9a439c7baa9fdac2cdbda6b624bf7295d9395f54b0163ba4e536bd4d27551de127b63d276a6bae967a4d2f9296f6dbaa5ca5bf2a7a1b23bebcdddab49baced2b2693b4adbd49cfb7763d2f557be4dcd09b8d3674f3a96cdd1d435d4d49723b624f0dd1e9afb05aae69c9324af5fc80200803d4d5d6d5df4ebd737264d6afc7bd2a63cfdf4d3316060ffe232b03b99366d7af1ef24679df5b61834e8a53d685dff9f1b9acc5a52dd33cffcdff8f7bfaf8f2d7d56f6b67af081878a59d6f1c71f579cfec2173f1f9ffeccc7e3fcf3cfdde870d1451f8a9ffeec27c5d078e0a001c5e774a746552d2985d6a5903a0d3fbae2f2e8d4b953fce5ea0d1f73b82ba9aea98e316346c761871dba45c3d8b1871497dd517668225b0a8153489a9710b832fcbdedd69d13fe26e98f81e91b25871e3636defef633b3d2cdfb9f37bc2e0e3d746cfce8473f69b2593fecca6ebcf1a678e081070aff587daaf803e3e6a43a9ff8e4c763fcf8fbe2969b6fcd4af329b5ee6d4a6a5ddb5ca92be66297cc15dd406f2fe987864a4d95a510b8f4bcdfd41ab8fc19c15babb205680a2952d8db945230915e37d62aae1472944298522bc14ae5c1dea65a8e965a2ca7f929602a85702da93c542d1fb657d054b9def2ee5f37261dffd2f92805e8db6b9b522057b94d69a80ce8cba56e835378b82defdfd4b5d254d9d65c135bba4fa9256865ddf2d6a169b95496c2d3d41ab832b4af94ba294edb9bb67d7b281d83d2d09cf5968e653a47a5c03e5ddb9b6a7dbb25cab7a77cd898b40de9ba6daa656f539a0afbb7470bfb1da1b95f8669aeedbd3e000060c7db6fbf7d0a3fcb778d7bef1d9f956cdcf87bef2bd61db1cff0ac04761f975df6c358b1626531906c2a04ae94ba8b4e7557af5e1d975dbaf50d18b6d6dd77df13cb0bbf639f7bded9c590f1e28bbf144f3fbde92f6a2c59b2242ebaf0a3c5e5defffef38b65fff94f63ebe796f2bad79fb12e903ef7dcb3a363878ef1e18b3e16cf3cf36c5663d773fa6b5e1dbffaf5cfe2673fffc9160dbff8e555c56577941d9ec6a6703485a4e521705555553677f7d264f8dbc2fd9f57faf11557156fda8f7eeca278f35bde94956edc3bdff58ec28dfed9b8e79e7be31fffb8362b85ddcb073ef0a1c23f42cbe2473ffac1ba2e2c9a92c2bd2baef8512c5bb62c2eb8e0c2ac349f1e7ee8e175dd2d972bb59e2d3d5337d56bcef37ccb6d69fda694ba76de6bafbdb292f552599ad7540be214446f6cb92d95ae87f26021858aa52e55cba5b2526bbbf49a829bca40a6f8ef40164a2669bd95cfcf2c8575a5a0b014446dee19f729144debdb5ce0d354805d192296c2e7cae0b0727fd236a6f7ac7c266a4bab7cff5270d654ebc792ad0dca5377bfe93c6ea91482a667c36e8dd2716eeadc9682afa682e5e65e135bbb4fcd91c2d3142e6fae9be0a634e7d9b25baba97b38bd5f3a5e1b53baaeb6542940ded26bae148a37756ecb95d6dfd49701d2bd5efaf24873efebedada96b2b9535b7c56fa5edbd3e000060e738f2a8a38aaff7dc7d4ff1351930a07f7cffd2ef1687345e72eff8c690f888c38f28bec2ee24f5a8fabef77da8d83be59faffe439c79d6db9a6cf098f2afd4d5f29ffefc87e8debd5bbcff7d17c4ac592ddf8d720a71afbaeae73174e890f8c0fbcf8b850b16c63bdef19ee2338a53cfb2956ebae9e678cb9bcf8cc71f7f228e3bfed8624f70a955739a6e4935598bd8e38e3d29c61e7264bce94dff5b6c68ba2bfbe7b5ff2a3e4b393d53794b8677bdf3ece2b23b4a8b34c74d21690a4b972c595cfcc34eea377c77347cf8d0e2f62f5ebc6897087f93f4dce10fbcff8278e28927e3339ff944fcfaff7e1e679c717ab46fdf3eab919e7fda3e0e3ffcb0f8e6372f890f7ff843c56f7e7cfc639f8ab56bd7663560f7929e1172ce39e7c53efbec13fff79b5f478f1eddb339ebf5e9db3b7e5398376cd8b038fbec7376c87345962d5d5e7c1d38b0f9e1c6a041838aaf4b972c2bbe6e2fef7bdf078b2d7dd3b37bcba5d6b3a9456f295cdd58bd1ffff887c5d7f44c87f2c037956f490be24db9e6efd7149f275cde9a378da7b26f7feb3bc5e9145897b62549d3e9fdd373824b5217d6956177a98bd792ca568a29284941d15d776fd8b23129af9bc653c8520a62d26b0a928e397a7dd052ea06b7bc45650a04d3facb0399d42d6c79d7b71b6b399a429bf2ae759b0a3d9b0a7bd3b332d37b96873e955dd1a6f74afb5359de54d7ce691f2a9ff79ad6bdb9169f4d2905545b1a48a5f72f5f261df774cc4ae7a3a9e0ab39ddef36259dbf749c2bf7afb28be172a5f72d6dcfd668ea38a7f15456ba3ed331d89a6b626bf669532ad75319ce35759e2bbf5891f6ada990767b2adfced2fb9542fad2fd56fee582f2fb794b95bac42edfe7f49e9bea1e3b6d4f53cf7d6e4a53eb4feb4eeb28b598df92fb7a6ba5cfd3caf39faeadf2fd4ce3a96c735f6ad998edbd3e000060e738f2c8238a41d3840913a2759bd6f1810fbe3ffe7bf38d71f24927158734fefef7bfaf38ef89c71f2fb6863cf2280130bba7a7263c156f7ae35b8ba1e8c73ffee1f8cff5d7161be795ba2bfec8472f2c96a5ae9627177ec77fe31bffb7c503d472bffdcdef8abf67bff7ecf7147b864d0d36bffffd1fc4ab5ef9dae2738b2fbbf487f1858bbf1caf7fdd9be2631ffd64b19bea238e38bc9825cd993337befeb56f666b62531aea1be2a1871e8e071e78708b86471e79b4b8ec8e52356ae4a12d9602b669d326868f181e139f9ab85b868fe99b1b071cb07ff1a1f64d7d4362676addba75b11be877bdfbedc56fa0a48be6d9679f8b9a5635eb1eda3d75eab4c20d7df92eff6d09f62c4b972ecec6b6dc91471d193ffbd955b172c58af8ca57be1ad766df9649dd187fe10b9f8f9aea9a78f77bde5b7cdec18e3074e8def19ffffc3b962c5d1acf3cf3d267db3665df7df78df6eddbc52b5ff1eae2b323b65629c0adecaaf9def1776d10d8feeca73f8baf7ffd5bd9d47a9baa577a067092ba604e816b0a8553b7cc49e57ba710f7ec73ce2e76d95c2ed54b416d69b92405ba29942e57be5c53f39bda87d236a6d6c169fd29a8480149a91bd61478a520a1dcc6ba682d0f8e53a8d254b7c4e5eb4b816453ddd0a610a83c9049e16f795098d69142a9caf030053d95c14de5b2e575cab7b1b4df25a99bdb542fbd9607cd1bab97c2a6f220bb721f92f2759502a1ca63948e61e5bacadfb3727b2a95f6afb45d254d9d8f1412a5b0b4a4b44ce99895afabfc3d4bcb555e07e5e73f29df8fd2f1282d93f629059ce5fb595259b7242d935acd965f334d9df3f2e59a9adfdc6b22d9927dda94cafba8a9f3d1d479aebc5fd2755ff99ea94e6ab1dcd4f5d79c6d4b4ad7633a2795d744f9b9afbcaed3b14ccfe42d7fffa6b6a7748c2b8f7de535986c6cdfd27ba7f76aea33a3b4fecd6defc63e73ca8f7d92b6a1f25e2c1da3d279dbd831aebc4ed37acacf77699fd2970e2adfb35ce5fb95546e5773d7070000ecfafef0c7df157eaeef13dff9ce77e3a31ff9700c1d36b4f0b3ff75f1d5af5e529cffb9cf7db6f07bd4ab62ca7353e23bdffd5e7cea539f8c1766cc8833cf7c47717e7375eedc351b835d430a545ffbdad7147bfe2af57a9b72afd458ef5fd7fe3bfef4a7aba3a161c7857bcdd5b76f9ff8f92fae2a765bfdd7bffc3d7ef0831fc5c2858bb2b9eba58684679ffdae78f77bde154b962c8d0f7df0a29d125e17c3f4f3cf8d934f3a2de6cf5f909536cfdfff7e756199f9f1def79e9795ecd9aa5a320066c74b41f051e38e8c43c71e1243860e2996a587ebdf75d7bdf1f8638f6bf5cb2e675b02e0243d33e4aaabae8cbdf7de2b9e7bf6b9e23fb6e907cdf40588f3ce3d2fa64c793eabb9631c78d0a878d7bbde19030634afdbd514fafeea97bf8c891337fdbc05f2654b83ad3dcdc682b05dc9eeb08d7b9a8d858dbb92a682e51d2905ad9581f5f6b0bdf7a3a58f0b0000b0e3fccfffbc2ebefd9dc62feea7bf7b5dfcf92fc41d77dc599c2e39fef8e3e2ab977c795d2f7a175e70515c7bed75c5f1e61200b3ab6adbb64decbdf7dec5ae8b9f9b32b5d8ca7657d3ae5dbbf8f8273e526c7c931a37de79c75d31a9ac4153bf7efde2b4d34e2986c077dc7e677cf18b5fd9e2f0757b79ddeb5e1b5ffcd2e7e3b1c71e2ff666db5c43870c89d35e716afcfdefff882f7ee12b59e99e4d000cec54db1a0027a97781f450fa73cf3ba7f8adaa2baffc69fce42757465d6d5d5603762e61c7a6ed0ee1eaee1036ee6976f573d2d25ffc28bddf8eb88f04c00000c0a68c3a7064b1d7bb6bff796dd4d5adc94a37d4ba75ab38fdf4d7c4d39326c5934f4cc84a9b4f000cdbee9043c6c4dbce7c6b8c3beac8e8d4b953561ac5d0fafe071e8c6bfefe8fb8f1c6ff66a53b47fa5bff57bef28538e1c4138ae17a73a55ce0fefb1f884bbefa8d6dea79334f04c0c04eb53d026060f7a6752d5b634f0ee5d3bea767f894ee97d23d54d915fbf6220006000076360130c096a9ce5e010080dd407aee710a7c5397cf6948e3a9eb67812a000000008916c0c04ea5053000000000b0295a00036c192d80010000000000007242000c0000000000009013026060e7aaca5e01000000002af9fb21c0161300033b554d754d360600000000b0217f3f04d872026060a76adda66d360600000000b0217f3f04d872026060a76addaa75b4f1431c000000005021fddd30fdfd10802d23000676bab66ddb45bbf61da2a6a6c6333d00000000604f5615c5bf13a6bf17a6bf1b02b0e5aa468d3c746d360e000000000000c06e4c0b60000000000000809c100003000000000000e4840018000000000000202704c0000000000000003951d5a953e7b5d93800000000000000bbb1aa458b570a8001000000000000724017d00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e48400180000000000002027aa162d5eb9361b0700803d469bd635d1aa5575d4d45447757555560a00ecee1a1ad6467d7d43ac59d310b575f559290000ec3904c00000ec5152f0dbb66d2ba12f00ec015218bc7af51a413000007b145d400300b0c768dfae75b46fdf5af80b007b88f46f7efab73ffd0c0000007b0a013000007b84f487df366d6ab22900604f927e0610020300b0a710000300907ba9db67e12f00ecd9d2cf02e967020000c83b01300000b9979ef90b00e067020000f60402600000722db5f4f1cc5f0020493f1368050c0040de09800100c8b556adfcc80b00ace767030000f2ce4fbc0000e45a4d8d1f790180f5fc6c000040def9891700805cd3fd330050cecf060000e49d0018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809ca85ab478e5da6c1c000072a76b9776d918d0f2ea62e99c79b1acbe71aa5df7fed17d37be25572d7c3116ae6a1cafe9d42bfa746edd3801ec76162fc96e660000c82101300000b92600869d69525cf6dab3e237331ba78ef9d27d71d9ab1bc77747ffbaf088f8c25d8de303defedbf8c785fb364e00bb1d0130000079a60b68000000000000809c100003000000000000e4840018000000000000202704c0000000ecc256c5e47f5f1e179ffde638e594d38ac36bcefa507ce3b7f7c70b9b798467dd9c47e2b7dff8509cf59ac6e5de78f637e3b78f2d2cce7be4d71f8f8f7dac71f8d6f5b38a655b6f565cffadd2fabe13c5d5d5cd89877ffbcd38fb8d8def7dca1bcf2d6cf32331a7ae7109000000d85104c0000000b4882993276563cd5337e7c6b8f8f493e3ad9fff6d5cf7c8d458b87061719835717c5c7de907e28c13df12dfbcb731d0adb4e0e6cfc519af39372ebd7a7c4c9cd5b8dcd447fe1297bee70d71ee9fa7c70b0fdd16b7deda38dc397149b654f335d4d76763c992987867697d77c6c4054fc58fce7c7d9c73e95fe291a98defbd70ea23856d3e37ce38f38a98200406000060071200030000b0eb5972437cf2cd9f8deb5e2ca5a5d5d1ae4bf7e8debd4bb42bfd265b3725fe7cc139715945a25a37e1f238fb5337c49c86ac60ddb21da3752c8b87befde1f8f9946cd6569af5fcc657f0dc959f8e5f3e57d8a6ea76d1a563ebacb451dd73bf8a4f5db16541380000006c090130000000bb98bab8fd1bdf88db9765939d0e88737f716bdc79f3f571e38d37c59dfff941bc7eafecd7d98669f19b2ffe2aa6374e152c8d6b2efd7d4c2b85bf1b2c7b4bdc7edd25716aaf19316d66367fbb9b1977ddb524c65ef4fbb8f3bedbe3e6dbee8a7bd27bf659ffebf7cc7f5e1d0f66e3000000b0bd0980010000d8b5d4dd187fb9a994fe56c7e8f32f8d730f6e974d17f438323efb8db7c5806c329efb73fc5f29519d7575fcf5a152fafbd2655bf73925bef495d746cf6c7a47687ff2e7e347678d88d2bb16dff3632746fb6c3a164d8967b6bcd76900000068160130000000bb967bee8e75196e1c1eaf7d43f76cbcccbe6f8ed7ed9b8dc7a278f0deac4be6c79e8cc98d63054d2fdbfad0d7c769fdb2891de0e0a38f8d0d3b7e2ebce7616362dde6c6dc983d2b1b05000080ed4c000c0000c0ae65e9f258998dc6807de280ca34b5a85ff4ed9d8d16cc78f699c691bafa58971d6f74d90362bfe1d9e80ed0aa55136fdaa57374ca4601000060471200030000b0db6ba85f938d010000c09e4d000c0000c0ae6be19c68bab7e4ba585396f976ebd3371b2b336b5a4ccd46373425a64ecf46010000206704c0000000ec5a0ed827f6ca4663e58371cfa3d978b9ba3be3eec7b2f182bd87674fd82d5fb6e1fef8efcd75d94499e937c56dd3b271000000c8190130000000bb9661a7c72b8665e3313faebdea1fb1209b6a541713aef851dc527a5070f5d878e5ab3a378e6fb0eccaf8ef973f11d7cc290b81573d16dfbbf0e7f15c3609000000792300060000a045ccfaf3fbe394534edbe8f0ae5f4cc96a0e8e777ff0d4e8944dad1cffd5f89f377d31aefadbed71fbed7f8fab3ef1c678ef6fa64543716e75ecf5ce8fc41bbb14270a365c3696dd155f79d509f1b2ec3d5e76e2d9f1fb193da34fcf6c3e000000e48c001800008016d1b06a492c5cb870a3c382a5eb5beab63efe0b71c5bb8746eb6c7ad994ebe2aa4b3e161ff9c8d7e2aa9b5f8c52cd4ec75c1c3ffb40d6fd73262dfbeb8f1d115dd7fdc65b17cbb3f7585ed7298ef9c26fe303fb67b3000000206704c0000000ec825ac7c80ffc36aeb9ecac38a44729065eafbadde038e933bf8fff5cf6aae89195add73af67eeb0fe33fd75e1517bdf1c8d8bf5ff7e8debd7b0c19f386b8e8177f89cb5edd3dab07000000f953b568f1cab5d9380000e44ed72eedb2316077b66ae18bb170553651d3297af5e9bcae75f096ab8b6b3e704c7c657ce3d45eeffe7ff1d70f0c6d9c00f6088b97943e500000207fb4000600006097d7ae7bffe8df3f1b361bfeae8a858fff272efbf837e35f0bb2a2727577c6dd8f65e3d13ef63f48f80b0000407e0880010000c89179f1a7734e8e53de7d71fce696bfc497cefa58fcf5f185d1d8d6af3118fec2999f8bffae2c1644743a2e5e312e1b070000801cd005340000b9a60b68d8f3d44db822ce7cefafe2b9baac6063aa7bc7a9dff86d7ced24cf04863d8d2ea00100c8332d80010000c895d623df1fbfbbe6fbf1f6437a6ca4abe8ea6837f8c4f8ccefff22fc0500002077b400060020d7b400863ddcaa85f1e2338fc7bd931b1f06dc61e0c171c80183a34fe74d3f4518c8372d800100c83301300000b9260006002a09800100c8335d4003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c0000b09bab5fbd3c56d76713bb8086da95b1a2b6219b62c76a88da852fc6b3cf4d8d190beb0a5399fae531ebf9a9f1ecf37362e92e746d000000b0e3552d5abc726d360e0000b9d3b54bbb6c8c5dc9b407fe1b4fcccf2632356dbb45bfa123e2c0bdbb464d56b6e8a9bbe3ee691de2c0d3c6c45e59d92e6ffa2371dd8415b1f75147c7a8ae59d98eb4f8a9b8e1f6a9b1b2eb3ef1f2e34744c7ac78e79911f75cfb78ccaee91747bcf290189095b223d4c6f3e3ef8847e6d446fac5becdc0c3e255637b472c9c1837dd352596157fdbef16234f1b17fbb649e3bba096be5f5a5271df62f7fafcda832c5eb22a1b030080fcd1021800006871f575b5515bdf2a3a77eb1addb3a1e3da4531f5b17be3bf8f2f58d78ab1614d5dd4d6d6c56ed580b1be719bd7b45403d8ce7d63effebd63d05efd7681f037e955d896de3170c8a0c2189b372deefae7bfe386c71765d35ba076464c9d531bedf73a325e7bfa2b1bc3df8259535e8865d53de2a0535e19af3b7d170e7f9396be5f5a52b66f1a600300002d4d000c0000ec1c6d7ac7a8230f8b71d970ec8927c691035bc78aa91362e2f2ac0e9b57dd23f63becb0387448a7ac60676b17830f3e2c0e3fa077eccab9632e2c5f15ab0b2f1dbbf6d8e097fb95ab6b0bf757e7e8ae03040000803d922ea00100c8355d40ef9aa6dcf3ef7874f9de71fccb47468facac68fe1371fdddd3a3d341af8c6386442c78fcb6b87d6a87187dfae13134abb272d6d3f1e053d363feb2ba585bd53a3af5d83b461fb94ff42ef51b9dd42f8ec90f3c164fcf5f1175f50d51d5aa53f4d9f7e03862f8faeea5a37e7e4c1c3f21262f58166bd656474ddb2eb1d7c187c4e87e65d74cc3d278f6a14763d29cc667ecd6b4ed18030e38340e19dc7ee3dfa69d7a7ffcfdf11531f4d897c5e8ee59d906ebd9c8f61434ac98158f3f3821a62d5e1df585391dfb1d18c7f69d13b76cb21bd917e2feeb27c6f2bd0e8f130ee852367d70ecb766723cfcfca2a82dec5fab4e7d62f4b84362f0466f89caf564163f1db7de3b3f7a9775d15b3ff799b8e789e7b37350136dbb0e8a31878f8cfec5752f89276fbf3f9eefb07fbceab08165d3fbc5b13d66c5f889f36379f1587689e1871e19237b961dc9ecbc4d9cdb784eda741b1a471cb8369eb86fc3f72fb7f2d9fbe296c9f531ec9871b17f7906def0623cf0df09b164c0a171d2a86ea920963cf7683c30796e2c2d9ccce2b5d37b781c76d8d0e8563a091be98eb8d815f9dc9e71f4f1fb455a53a96bf27d46b789998f4e8f85b5ed363cdfe51a56c6b4471f8c275f2c3bf7fb8d892387758eeae2fbcd8bbadabac201691dad6baaa2f7c893e3f0c18dcbbdf0e423f1c48c25b1724d61b99ab6d16df0c8387c54bfe8509d1dd315f55157573898adda44ebc261ecddbb67cc9d3b3f1aea6a634de1fa69ddba26aada0f5ab7dd1b6ae679d9c26332eab00e31f58129856352d8e6f6fd62ecb18744af790fc79d8fcd29ac3fed47e7183cf6b0185bbacf4af7cbd10745eb090fc7338b6ab37333228e387c487429bfd156cd8e271f9a1453b27bb655a7ee31e2c04363ff75377f760d0f3e20062f7d2626cc5d11f53d47c5ebc6357de7d42f9a12f73dfc6ccc5b5e17f5c5f5f58cfd0f392446acbb209a7f2f35ac78211ebeefe998b9acecdeedf5425cff786cf0f9c5ae4317d00000e4d946ff66010000d0e2d6d4477de1d794ea8dfca6d230fbf1b8ed81a9b1accd801875c41171d4c8bed16ac97371f7ad1362deba7ea317c4a3b7de1b4f2c88e83de4e038f6b8436354ff9a983fe1deb8ebd9daacd2b29870c7033171714d0c38e88878f97187c43e5d57c5d407c6c7630bb32ab12a9eb9fbee787ceedae899d633eee018d6754dcc78e4aeb867ea960407ab62caf8f1f1f8ac35d16dc8c8386cec81b17fb63de5dd5da7ee7cc7dff6704c5dde2e06ee3b260e3b6478f45cf154dc3169f166ba91ad2fccaf8dda757de8364eaf98f6443cb6a46b0c3fe8c01833bc67b45a3e2b1eba77522ccd6abd54e57a320da9bcac8bde6593e2b6f19363514ddf183deef838e1f061d16de5f4b8efaea7a270c80b1a624d5a4f0a26cba7e74f8afb9e2f1cef512363cc7e03a253fda29874df23f1c2bab75b148fa5f336b73e7a0e3bb0709c46c6de6d5e88fb1e9a152b36d14570fbc1bda353dda298316d5956d2a861da8c7861555574ebdb187dae9cfa60dcfee49ca8ebba778c1e3b26c6ecdb376a164c8cdbcaaf9d8d7447dcd815797d45d7e4f3e2e947e744cd801171d0a81131b8c9feb71be28507ef8a875ea88b6e230e89134e3a2246a773ffe4f8183fad702d761b10fbed53d8fe42cdd6dd0615c687c7e0e2e6a66be6aeb8fff955d161d07e71d47147c4a143bac4cae71f8edb1e4b0fcf6e17fd870e8ffd0a955b17a63af5298ca765fba7f50d8f7e695b5a778bbd0be3fb0ded131dd22a5fa299e7658b8ec98278eac925d1ebc0c3e2d8b17b47f7ba59f1e87df7c63d4fac8c9ea30e8b138ed827fab45a1ed31e78249e29dd8a456b62f6230fc7f436831acfcdb06e513ff7a9b8e5f6b2ebb5616e3c74c7233179599b183cf2d038f688fd6240cdd2787afc9df1e8fc751b5bd886da58f6fc53f1f48a2e316ce40171d0d00dbe62b24ec3fc09f1df3b27c6fce819c30e39a2b06d697d8be2893bef2fdbb666de4bc57bf7b198b1aae2de7d764556010000a06509800100805dc4aa98f2dcdca8adea1abdfa65451b58164f4d98116b7aec172f3b66648ce8db33fa0d3b284e387648745c313d264c29a5369d63f0fe23e290238e892346f68f5eddfac48831636258e786583067565667412c5cda109df73e38c6eedd333a15eaec7fe4e171e44107c4908e8d6152c38c09f1f4c27631a4b49e5efd63d491c7c7d8be6b63eed3cfc4dc62adcd4beb79725e44ffb1c7c7b8918363d0c0c1b1df98a3e2b0d4ddf5f393a294492f78fad9985ddf2d0e38e1e818bb6fff42bde131f6f843a3efdaad0b916adb0c88a30bc769bfbd07c7909187c5cbf6ed1a6b97ce89e9dbdabdf6bcc5b1646da7187ac84131a457c7e8d677448c1b77488c3e707074aa08093750d8b7fd5e76488c4adbb3ef41f1b243fa479b35f36346764a1aa63e135356b48e4187af3f4ea38e3c260ee8501b1b648595da0c8cfeddaa63d9cc6959009dd4c6b33316c4da4e03639ff420e28699f1e884c249e877709c72e47e316460ffc66d183b20da6c70ed6c89aae83bfaf838f6a0e1317cd8c0e8d1647fd74b0a87ab2eaafbec17e3f6ed13dd3af68c21630e8ba3c78c8a7dfad6142ed53e8565bb476a48daaa73bfc2f890e8d7392dd73a7a0d1b11071e362e8e3ba850d6ad670c2a9cc383fab68ad5f36617f6b34df4183c24860fe814ad0ab5dbf52c8ca765fba7f50d899e6985359d6240617cf8e0ee9bee8a7b33e7654bf5296ce7a8813da3d7c09171ec7e3d62cde2a5d1e1c0a38af759f15a397460b45fbb38e66db0fec239ee7cc0fa735358c72963fa46cdd2e7e3c9198d17d5d28913635a5db738f0f82363f4b03ed1abef90c2fd71648ce8b822a63ef5fc06d7c89a8e7bc7892716f629ed7fbf8d748dde79408c2cecef5169df0bdbdb2dadefd0bda2cbda853167665627b3b97ba9c97bf7d843a2cf56debb000000db4a000c0000ec1cb573e3c9f10fc43dc5e1beb8f9fadbe2d179f5d169c8be31bca9c4aa764ecc5b16d1a557efa85fbe3c969586aaaed1bd5d432c9c37a7b15e75ebe8317078ec9dbab0ad5f5dac33ef85a9316f65e3ec461da37de13d96cd981813672f2e76ef1cd129faeddd27bab469fc3569ce9c85b1a65df7e8d36ee5faf75abe32ba77eb5cd89605f1e2e262b5cd2aaea74defd87b40f9af5fd5d16f68bfe8b02e085b11b3e6af88e8da378694752b1bd12df6eed774fbcdcde9d0ab6f14b3c44cfb9e5da27dd447ddd6649de53ab58bb685ed9d3e6172cc5a94babb2de8dc2786f4ed14d9a16b5af75e31b86c7e759f6ed125d6c49a6c7b5e9cbb28d6b6e91983fa96afa44d0c1dd83daab2a9a6b589e1437a47ab95b362eabcaca87646cc5cd810dd070f6d3c0673e7c682fa36d16faffe1bfc125cdd77ef18d0beecdad9225da257bf4ded70d2213ab4ab8e86f953e3a1e7e7c78ada1466a6f0b67ff46a5bdef977a59ae8dc77488c48dd2437d4c58ac2b5b768f6d498b1645309fb56dacc79d9329dd3ead6a92e36e56f13ed3b96bf4175e17c3644c306bbd22a7a0f1ab0e1b919d43f7ad7ac89c5f31715a66ae3c5f9c59b3ffad697ddfbcbab0af763fb58bb687ebcd8b8585187c246b4cfc637a6ba4db718b4efa0e85578d3fad5695df363c6730b0a57f64b6dfa5edac8bd5bdd2306f5dedc56000000ec18e5bf5f010000b49c86d5b164d1e258988625b5d1a6e7e01873ec4971d2813d9afe4565f9aa585d7859f0f4ed71d3cde5c3c3317d55c4da7589527ad6eb0371d3bfaf8fbf5f777361fe9d71cfe3f363e5062bed1963c61d107d6a16c4d3f7dd1dffbeeefaf8e70d77c67dcf2e6e0c340b56aeae8d58f542dcb7c17b1586a71bfb885edbcc2caeb89e9ad62f6d85d9bd53742c6cebaa95a93be9daa85b537869d5ea25f5ba75daba00f8258ac1db76d06b541c33aa67d4cc7f36eebde3e6f8e7b537c4bf6f7d38262fda7827d54daad89eda358503d0d471eadc61f361dea0c1d1afcdea983d23758f5cb8549e9d190babbac780bdb2b5ad4cad885b45eb97acbc5b74e9583897ab57c506df0fd86edac43e878d89a19d56c6f4c7ee8b1baebf3eaef9f71d71e78459b16233d7cfca5913e2b61b6e886bfe7553dc50b8ee6e7b684a2ca96f815fe1b7d775b245da44bb979ce4f6d1ae70be56ae485d7baf28dc478597859336bc170bc37d330a676eedda755d51375b7a2ef7f83be2da6bff5db8f70bebbae5c17874deaa0d9ec9bd511b1ca38ddfbbbdba36d92f380000c00e2700060000768e768362dc6927c7abd270cab171ec61236348f7d61bff25a5ba3172e97dd02be375a737318cdbab383f5e7c346e7f727e34f41a19c7befce5f1dad34f8bd35f715cecdba571764975972131eee453e38c579d547cfee75e1debe2c5b2e704175b2fb6df3b8e6feabd4e7f598cee5eacb659c5f5ac6d7869409505da6ddaa666836da275eacb77cd9a0dbab24d162d6ba96e64ab4b877843e9f9afd968a3eae832ecb038e55585e37aead171d4c841d1a9764ec5b353b75c9b568503909e379b4dafb3744533c2d9deb177dfb6b17af68c9815cb62eaaca5d1aacf5eeb5b921776ac2ad63611da67c162eb368d2173b1de4bd51613beadd4ae6f8c3eeee438e3d52f8f53c78d8911bd0be7f4d9d2b37c3762f9e4b8f781e7636987bde3c8e34e8ad30bd7dc19af3c310eedff92047bc7db11c7e425d634d132bd2ed263a4dbb44d67a63aaad246f41ad5c4bd9886c363687199e69bf9d0f8787c6e43e1f3e48838f5b4d3e275af39355e7de2b0a8f89868866cdb9ab8c75beede050000d89000180000d83d74ed13bdda442c9c33b3226859157367cfcfba718e58306f49ac891eb1cfe183a357fb52a03c37e62f298e34aa5f1df35e782116a4d0a9a66df1f99fa38f1919035aa5ee801b9feedbbf57d7a85a393f5e4c0d10cb342c9917b396d635bbc561713dabe6c70b8d0d87d759f9c2bc5892bacced9da63a44ef6e6d2316cf8cc9e5efd7b020a6ce6aa910a953746857d8ae654b36d8b7a58503579ecdd5af9e1f33a62f2c96d5b4ed1afd868d8ce30eee1bad5377d6b31beb6c8dde3d3a4755eddc787e66f9bbaf8a67672c8cb5d9d4a6f41e31303ad5ce8b195367c6ec65ada2d7807eeb7fe1edd733ba57ad8c39335377c26556cd8c394b23ba74cbfa2d2eb6365e15cb16976fc3b298bff825e964f334d4c592d9d30bd74b61bcba757448cf913eecf018d13562f582b985f3bf117317c6e2b51d62f0a8fda25fe1ba686c955a1bf316ed8440717b1f9326d5c6dc17370cc41b66cf8cb9b5d5d1b547cfc25497e8dfb3707f2c9c17d32b6ebc95f3e6c4bcd2cddf6c8b62eea2ba889e43e3c8bd7b468752dfe5b30bc7bd716c0b74893edd0b1f4c8b0ad7ee06876455cc5a2000060000760e01300000b09be819070cef16f5b327c46d8fcf8c45abeba37ef5e298fed0f8b8fbbe87e391d98dc9508f5e5da2552c8a694f3786c229b09c3cfec978a1ae38bbd1aae9f1f8c38f15969bdc181ea54078d29498bda63abaf72a26b2d166e8f018d866594cbefb81983c6f65d4d6d7c58a7993e3cebbee8ff10f4e89e5c55a9bd766e8beb177fb1531f5fec6f5ac5ebd3216cd7834ee98b4385af5191223b25e627b8fdc37fad62c8d4977dc11f74d981acf4e9a1077defc40cc6fd5a9b1c20ed72d7a776b1d6be74d8a3b27cd2f3e6375deb30fc4dd850357deee74d5d4a7e3c1471e8c7b0b754ac777e2e4795157d5357af5cd2a6d8536c3f78fa11deae3c5876e8b3b1e7f369e7deee9b8ef96bbe299daf62fe95ab7499d0646ff4eb531f7e919b1a44dbf183ea8ecd7dd367bc7c8c11d62c5f30fc73dcfce8f15ab57c78a4533e381bb9e8d45ad7ac7f0e15937dbdd7b46b7560d31f7a9fb62e2bcc6e7c24e1eff404cafddca96b7d50b62e2434fc4f8fb1e8de9e94b0329109ef1744c5b12d1b647efacb569eb68551351bb74412c5a5eb8ced265dcbb7b74ad5a11b39f9b194b0a050db5cb62fae385eb67f14ef8157e7b1f9326b58afa598faf3f37e93e7b6866ac4ee771afc67deebdff90e8de303b1ebd73424c4fcf9e2edcb3c5fbe8dec2b5f8d89c667f21a351e3b51e0b5f88a7e6a5e758d7c7ea7953e29ec76745f9c74473f5db7770746998174fdedbb86dabb3cfa5e79617de03000060271000030000bb8df6238e8c130fe8122b9f7f346ebde186f8e70d77c78333d7469f5147c6e103b25f6ffa1f10870e6e1b8b26dd17ffbe2e3ddff38178b666dfd82f35242ce938228e1ad32fda2e7936ee2cac273d2bf8ce49cba3d390317178a9dfe0eade71d8cbc6c6e0360be2c97b6e8debaebb296eb8e7d958d671ef38e2a87da37363adcdabee11638e1d1dfd6b1ad7f3ef1b6e8d5b1f9e156b7b1f10c71f3e687db8d966508c3bf188d8bf77552c9cfe6c3c3d657ec4e043e38421a98be8963160ecd8d8b76be1fd9fbeaff87cd5bba6d4c4c883fa45ea9dbaa4e37e63636cffd6b178ddf1bd2f9e5ed621861e3626f6d9a64cb05b1c7ce2d171c8de1d63f5cca9f1f433336359b7fde3f8837a6cf0fe1bd729f6d9ab7bd4d6ae8eb67d0744638c5f521dbd461f1987f6ab8e794fdd1737dc7073dc70c7a3f1c2da9e71d0316363ef75dbdd370e3b627874ab5a1c13ef49cf986dbc76460f68de16bc54b6be35b3e2c15b6f8a7ffceba6b8393bf7c71c5cba20fbc7c1237b47f582a7e3d69b6f8d7b9eab2d1ce46171e8fe3d62cd8b8fc6cdd75f1fffb8feae787c61afd86f70cb5d0beb6def63d294363178ccb088671e683c37f73c130b5bf78bb1c71d148553d6a8ddb038eef8fda2dbcae9f1607af674e19e5d771f1dda7f8bffb831e0c08362af764be2e97b0aebfae70df1ef7b9f8f9afd8747d6167ccb74da37c61d3628da2f6bdcb67f173e971e5dd63f8ed8af6b56010000a065552d5abcb239bd690100c06ea96b979d1198b0e3d5c7eae5aba22e5a45fb8ea52e722bd4af8e65abd64475ebf6ebbb787d8986a85d995a5d6e623d050db52b63455dc366d6b579a5f5b46ed731da6eeccd2ad44ebe27ae7baa558cde8ae79c6eb586baa85ddb3ada6c6a1b0b7556acac8d8656eda2537377666bcc7e34aebb6f510c3c76f3cf5d6e987a7ffcf3f15531e2c4e362d4c61a4e3773bb1b6aeb626d9bd61bbd26b654fdeae5b1724d75b469df3e9abe840ad762edda68537ed05bea1837d3f63e262f95ddd79bd9dfc663195b741f6dcce6cfcb9668def6b36b58bc645536060000f9b3cdbfde000000b4bc9a68dbb16374da44689b9eeddba95067d3816d0a7e36b39e82ea36ed9bb1aecd2bada7a96c68cdbc8971ebf5b7c72373cb9e675a3f3f263cbf24a2b08d2dda96b07a33e16f929e699bcec1f60aba56cc88f137fd37ee7a6ee5faee7c1b56c6b3cfcd8ddaaa0ed1657307a061413cfeec8288ee83629f4df59addccedaedece41674ddb749d6d2a642c5c8b95077d7b1fe36db4bd8fc94b65f7f566f6b7f1586e7bf89b6cfebc6c89e66d3f0000c08ea605300000b9a60530bb8d8605f1d8adf7c773cb235ab56955fcb66e435d6dac898e316cdcb17170cfed9250edc256c594f177c5637352abed56515315b1b67e4dd435b48abe071e13e336da1576434cb9e7c678745e43e137dc3de55801db4a0b600000f24c000c0040ae0980d9bd3444edc2d9317de18a58b3a6265a75ec1c83faf5dc2e2d1d7717f5cbe6c4f4392b62f59afa68d5b673f4eedf2bba6cb27966432c79715accaded107d06f589ce1a5f02cd2000060020cf04c00000e49a001800a82400060020cff48b0500000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c0000002d61fa2371ddf58fc4b46c1200000076040130000000b484fabaa8adad8bfa6c1200000076040130000000000000404e542d5abc726d360e0000b9d3b54bbb6c0c68098b9eba3bee9ed6210e7c599f9875d713f1e28afa889ab6d16df0a838e2a0bed13eab17d1102b664e8cfb9f9c198b56d5c5daaa9a68db75501c7ce8fe31b0c3faef2ad7cf7d26ee79e2f998bf6c7d9d31878f8cfea55bbb61654c7bf4c178f2c5e5b1babe21aa5a758a3efb8d892387758eea58144fdcfa604cebb85fbce2f041d937a06be3b9f177c4c445dd63d4296363efecad6aa73c10374daa8ba1478f8b033a170a1a96c6b30f3d1a93e694ad77df83e388e15da3a6719175fbbacfe83631f3d1e9b1b0b65d0c3df66531ba7b61f1152fc4c3f73d1d3397ad8efac2121dfb1d18c7f67a21ae7f3c62f4e987c7d06c1dc0ceb178c9aa6c0c0000f2470b60000000b69b8635a99be3c531f1eea76245cfe171e8d831b1ff8076b1fcf987e2bff7bf180d59bd95531f8c9b1f9c1e2b3b0c8851471c1dc71eb277745b393deebfe3c9989bd5896593e2b6f19363514ddf183deef838e1f061c53af7ddf5542c28566888171ebc2b1e7aa12eba8d38244e38e98818ddbf26e63f393ec64fab2dccef16037ab68adab973e2c562fd647ecc9d5f5bd8c6f9316b565694d6336b7ed4d6748dbe29fc8d553165fcf8787cd69ae83664641c36f6c0d83fad77c2bdf1dfc717acdb87c67d9d174f3f3a276a068c8883468d88c11d0b336a67c4f8db1e8b19abdac5c07dc7c461870c8f9e2b9e8a3b9e5dd1b820000000ec400260000000b6b31551ddefc83861ccf01834b07fec37e6e8386e58a758336b723cb5acb1469b5e7bc7fea3c6c4cb8e191923fa768d5e03f78b7107f68e56b50b62e6c2c63a316f712c59db29861e72500ce9d531baf51d11e3c61d12a30f1c1c9d8a29ec924295baa8ee535876df3ed1ad63cf1832e6b0387acca8d8a76f633bdd1e7dba459bfa85f1e2ece264c4ec3931bfa157f4edd510f36795a2e6d931676143b4edd5377a14a61a664c8827e745f41f7b7c8c1b39b8b00f830bfb70541c36b075ac787e523c9bb2e575aaa2efe8e3e3d88386c7f06103a3479b88054f3f1bb3ebbbc501271c1d63f7ed5f587e788c3df690e8b356000c0000c08e2700060000603beb1c03f6ee948d37eabc77dfe812cb62e19cc6f6b3359dfac48861a94be886a85db93c962d9a13935f581af5c5b9994eeda26dac88e91326c7ac45a92be582ce7d6248df4ed1a6f8db6c87e8d0ae3a1ae64f8d879e9f1f2b6ad3badb448fc1fda357dbaca3e6be03a24f9bda583067517132bdd676ed19fb75eb18b50be636b6244ea1707d9be8ddbf67b1ce9c390b634d9bdeb1f780f25f99aba3dfd07ed161ede298b7aee570d2257af52bafb72266cd5f11d1b56f0c29ef81beba470ceabdbe036c000000d85104c00000006c676da37dea0ab95cc714e646ac58bea4717ad5ec78f48e9be39fd75e1fd7dd747bdc74e763f1ec928675cfd72dea352a8e19d5336ae63f1bf716ebde10ffbef5e198bca81413b7897d0e1b13433bad8ce98fdd17375c7f7d5cf3ef3be2ce09b36245a99fe6e81dfd7bb48a15f3e7c4f22c9cedd2ab5ff4e8d7233aac5c10b39667a1704df7e8dfb7718995ab6b236a5a17d65ea17ba7e8180db16ae5a69e1d5a1b756b0a2fad5abd64f95e5d2b0f0a0000006c7f0260000000b6b33551b74137c905b56b0aa5116ddb7728fc77454cbcef9198b2ac430c3bfce878e5ab5e19af7bcdcbe3b4b17d2b42d3eae832ecb038e555a7c5e9a71e1d478d1c149d6ae7c41377de1fcf94d6dfae6f8c3eeee438e3d52f8f53c78d8911bd23163dfb70dcf6d8fcac4244fffe3da3d5d2f9f1c2d25931776987e8d9afb00ddd7b478f364b63c1ec55316fd18a68d5bb7f0cccea5757177e555edbb0ee59bfeb2c5f15ab0b2f6dda9637edad541d5555859726965fb44c17d0000000ec780260000000b6b325316bfa8609f0ca69b3635174886e3d53c43b2fe62f6e880e83f68f517dbb46a9b7e6daf98ba33c22ad5f3d3f664c5f18694d356dbb46bf6123e3b883fb46ebd40d737aa66f435d2c993d3d662d2d8c57b78e0ebdfac7a8c30e8f115d23562f985bd88a46d5037a45f7aa65b170f2a258daa65bf4ed9e4a7bc7a0de6d62d1fca70adbd22a7a959aff16f4efd535aa56cd8f174acf22ceac7c615e619d9d5376bc095da24ff7c23e2e9a1bcf6f700856c5ac050260000000763c0130000000db594d2c99f2403c3a6371ac5ebd3a16cd7834ee98b828a2dbe0d8b718bef68a9e5dab63c5eca9317d695d34a42077c684b86bf292488d674b564d7d3a1e7ce4c1b877d2fc585ddf18084f9c3c2feaaaba46af94d7562f88890f3d11e3ef7bb46c3d4fc7b425116d7bf48e2e8dab29d4eb177dba35c48b336647f4e813fdb2e27efd0a1b337b4ecc896ed1b7ec79bf6d86ee1b7bb75f1153ef7f2026cf5b59d887958dfb306971b4ea3324466ca627e77efb0e8e2e0df3e2c97b27c4f445ab0bcb2f8ee90f8d8fe796b7ce6a645e7c34ae4b5d603f94d26c000000d83eaa162d5eb9361b070080dce9da65535db502dbdb82c76f8bdba77688838eee1453ee991acb8abf7156479bae43e2f063f68bde596bdf8625cfc55d773f13f3eb1a3b4aae6add35f6d9b74bcc78727ef43df66531ba1814af8ae90f8c8f4766ad88faec37d7546fc898b131ba5fe3bddd307f52dcf1c09458585bea70b93adaf7d92fc61d3e24ba947de5b976f23d71dd534ba2f741a7c43143b2190dd3e2aeeb9e8c79ddf68f571e3b74c3eea757cd8cfbee7a225e5c511f8d6ffdd2f596f675f4e987c7d0c6a27556ce7a3cee7e68662cad6fdcae565d87c7518316c79d4fc6fafa2f3e1cd73e302ba2ffd878cd61eb5b20033bdee2259b7a96370000ecde04c00000e49a00185ad606a168435dac58591bd1ba7d7468d35407540d51bb7265d436b48af61ddb46960dbf54b69e8656eda253a9bfe80af5ab97c7ca35d5d1a67dfb68f2adb65243edca5851d710addb755cd75575f3d5c7eae5aba26e13dbdd505f1f5153a37b2e686102600000f2ccef98000000ec18e9b9bc1d3b6e24fc4d5260db313a6d2afc4db2f56c2c444d6adaa6f56cdff037a96ed3beb0dead097f939a68bb99edae16fe020000b09df93d13000000000000202704c00000006c379d068e888346ed1dbdb269000000a0657906300000b9e619c0004025cf00060020cfb40006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c000000000000901302600000601bac8a852fbe182fce591a755949d1aa85f162a17cced20d4a01000000d8c1aa162d5eb9361b070080dce9daa55d36b687593539fe7de555f1bb1b1f8dd9ab23daf61d1da79c796e9cf7ca11b1bd8e48dd845fc6b91fba321e5fdc5098ea16afbff286f8eca17531e117e7c5877ef2443416bf2eaebce93371687189f5665dff9df8ce8db30b6323e3ad5f7f771cd6bab1bcd1acb8fe5bdf8d1be7441c74d6b7e39d63b2e21d68ddf61c74667ca725de10809d6af19255d9180000e48f16c0000090337513ae88379ff8b6f8fc6f6e8d89b316c6c2850b63d6c45be3379f7f5bbce2c2eb6241562f9efb65bceb94d3e29453be10ffcd8a9a6f56fce6ab3f2e86bf9d861e19279cf0bf71dac1a9f8b7f1d52b52f8db29861ef5b238e16da7452aaeb464e29d71ebadb715861fc767bff5e086ad8763494cbc33cdbb2d1e7a212bdac1d66dcf4333b31200000080dd93001800007265695c73e9ffc57375119d8ef9545c73e77df1c00377c52dbfbd30c6768a5876d737e39b376771eb9aa5b160610a8897c496b7835a124b97a5d701f1fa4b7e10dff94ed68a77c9d2682c7e5d5cf2c36fc777de73686cd0b8b709f3fff6b9f8d683ba8a06000000d81e04c00000902bf7c4dd8fa4be9707c4eb3ff03f31b0d8df73ebe8bcff99f1f98ffd4f9c70c211d1b36e7ec47fbf10a79c7f75cc4ab3e3bef8566a097cf1fa76c0ab26ff35be71f69be394620be1d7c6591fff69dc35a731a47dee17ef2994bd3ffe5c5c7856fcf9fc54e7a3f1d977155e4beb9c75759c5fb1cea60c183b367ac6fcf8db977e1813369101fff7e2f41ea7c5bb7e31252b49fe1b176fd082b96c7ac1f8b8ec9cd7169779cd39bf2caebbeef97fc4c56735969df2c64fc635cf37fd860beebd3cce794d5a4f61bf2ffe6b4cae4cc7ebe6c45d577d22ce2ad629acffac2fc66f1f5b98cd4cd66fc70d736e8c6f14df736b5a59030000006c3901300000e4cac171e088f43a33fef69ddfc5c4a5eb43cec1aff9547ce73bdf8e4f9cd62f2b69da827f7d385ef1d66fc4d58fbc10b5a9a07e514cbae5a771e19b3f1d372c2956d96e56ecfdd6b8e098f685cdfd7ff1b9ab2665a52fb56a716357d60bcaf62762752cdea0057369fae9f8f9072f8c3f4e5a112b0bcbcd7af8c7f1e12f7d2f3ef9ceafc68dd31bcb164ebd25bef2ce2fc5ed9519f0945fc4d917fcbf98b4babe506f564cbcee1bf1b6377c2bd637509e14579ef9fab8f0aa5b63d2a2fac2747d2c9a745d5cfa9e37c485ff2a85c0ebb7e357177d3eae9e386b2b5b59030000006c3901300000e44abf78fbe7ce8abd0a3fe92f7be8b238ebc4e3e2d857be233ef88ddfc57d2f944590277f296efcc91b0bb59323e213375e1f377ef9e4c2f88a983ebf4b1cb8fffef1a61ffe376e4be5375f13178c2acc5a767bfcbfeb96c6b0f7fc226ebcf18a785371e17ef1a69f14eadcf8ddb8e45785d7d23afbbd317eb26e9d1bb768ce8a78f5c7de15fb5637c4b45f7f397e313d9bb14da6c6aa237f19b7df7653dcf99fcfc591ed23e6ffe78f31f9b5bf6e2cbbfd927859a12c96dd147fbfa571897566ae89a37e96f63bd5fb41bca66744c3ecabe39bbf6cdcb025577f2f7efe5c5db43ff25371ed2d3715f6fba6b8e557e9782f8bbbbef1ad28f5aedde8b998d9e943f1c76237dcdf8f5767a5000000003b920018000072a6f5c80be2ff5d7b555cf4c63131a4634dac9a3b31eebdfab278ff1927c4ab3e734b2cc8ea35ad438c7ec797e287bffdbff8e45135b174ce8bf1e273936366961dcf9dfd62e3c8f634f8acf8dc5b0744344c8a9f7cf1ff6d66fb9aa35fbcec9507343e7bb8c7feb16ff73432204e7e4d56d6ee9438696c1a6988faca16c0a3ff37ce3fb8d86f76a1de9171fe5bf62d8e3ef7e8c35157f8df2db73c5458aa4d8c3d795cd4cf2b1c9b175f8c79dd4f8b5353b5954fc623cf14ab67fac56b2f3a334664ab03000000680902600000c8a1d67dc6c4599fba2aaebeedaeb8e796abe38a8b4e8cfead1b62ce0d9f8e8bfeaff1c9bf1bd3f8acdc57c4b8c38e89135f75469cfee60fc4d55376e4af0ead63e4873e1faf4fad6d1fbd22bef4afa55979cbeb3c784874c9c6937e7d7b378e4c9f1a530aff9b5a6c085c1b777dad705c4e2f0d6f8f9f4d4ce5b3e2f9f24714177eddaa69958d02000000b41001300000e4c9ac07e31f7ffb7bfceda689517a5c6febce7bc511677d33be9b5ad946434c78f0a1c6194d7a34be77ee57e3ba894ba3d749e7c4f77e794d5c77cb5df1db3337fddce06dd6fad0f8c4674f8d4eb132eebafcfa5836382b6f614b17cecfc61ad5ad59d338d2a9737489fed19807778e532eb926fef9cf970e5fdc748fd7000000003b9c0018000072e5b1f8e3255f8b4b3ef3b9f8e584f2fe8d17c653931616c7da77ec5c7c6dda0b313365a0bd5e17977ceb9c38fea0fed1a7f3b2b8efa1998db377a0d6c77f323e737ca788f9d7c77f1ecb0a33fb0c4be175612f264d5cd74574dd838f44b1e1edf6f4d0bfe39a757d502f8cbffce3fee258cfd163a35f748e03f6ed59985a1a0f3d30337af5ef1ffd8b43bb78fe9e5be2b1e975d1aaa6581d00000060a711000300409ef47b63bc2b85a80dd3e237ef3a395e7ff6c7e3631f3b37def8b2d7c457c6af2cfc06b057bcf55dc735d6dd77ff1851fc8de0d1f8d5073f1e17ff795261bc7b742d2c1ef3fe1ddff9e6efe36f7ffb7b5cf591b3e2474fb5c4af0e9de3d42f7e2a8eefb432561636b5dcbe878f89b4592bc77f2d5efbfa73e36367bf214efce87dd1b65be3fceda57d87c9f1fd37bd2d3ef8b18fc707dffae6f8dea30d8563b66fbce56da38bf3479ff3a1382665d47fbb20fee782cbe3777ffb7d5cf6feb3e282af5d1a9ffdeadfe3c5e2438601000000761e01300000e44ae738f59b7f8ccbde3e267ad4ac8ae98fdc16b7defa484c5d5e1fed068f8b0b7ff6dbf8c0be59d538353ef28923a26bf5b29872ef6d71dddfee8a59312e2efac61b6358eb6531e1cf97c625977c23fe6fd6abe3536fddc15d40977439353ef7e123a37d36b9ced19f8d2bde7f60615b1b62d5f447e2f689ede2f46f7c3a4eee90cddf4ebabfea8b71f131cbe3c15b6f8b7b272f8e68b74fbce9f21fc47b4a5d52f778557ce7d79f8b9306d7c4ecbb7f1bdfbfe4d2f8cd7df3a3cde057c5b77e7541ac3bb4000000003b49d5a2c52bd766e30000903b5dbbb4cbc6f64475b174ceff6fef4ee0ecaaebbbf17f66cb2cd9f7044808fb22fbbe09b882202eb85485a756aab6dad6da6aad5dfeb5edf368aded53abed432bb6d2bab6958abb82ecc8be853540028484eceb4c26b32fff7beedc90c5840488554ede6f5f877bceef7ccf7667e2b9339ff9fdceea740e262d136766e20edf8a4addba9e4acdd86ceec0da9375cbd6a5a7656266ee78c35f80cab96e18ccd8b13fdf73eadfb02aabbb5b3265da96efc9d6aa359d033b796f01f865d4ded1539b030080f211000300506a7b76000c006c8f001800803233043400000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a024ead6b7770fd7e60100a074c68f6ba9cded79060606d3d33794debec10c0ef9d80f40d2505f97e6510d6919559fc6c6865aeb9ea7bda3a736070000e523000600a0d4f6d400b8abbb3f9ddd03696b694c4b73431aeaeb5357575b09c01e697838191c1a4a4fef60ba7a0632a6b5316dad4db5b57b16013000006566086800002891e1e1e16af8dbdd3b9849e39b33a6ad298d0dc25f0052bd1714f784e2de50dc238a7b4571cf28ee1d0000407908800100a044060787aa3d7fc78f1d55fd253f006c4f718f28ee15c53da3b877000000e5e1374200005012450faea2375731ecb3f017809d29ee15c53da3b877e8050c0000e5e1b74200005012c52feffbfa87aacffc05805d51dc338a7b8700180000ca43000c00002550fce2be98068786d350ef633e00bba6b86714f78e4df7110000e0a5cf6f860000a064eaea6a3300b013ee190000503e0260000028093db70078a1dc430000a03c04c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030000cfe984134eaacd01000000f0cb4e000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c00000c02f97c1be747575a76fb0b65c3594feeeee7475f757e600000000d891baf5edddc3b5790000289df1e35a6a73e5363c3c9cc1c1c1acede8cfb449adb5d6dde384134ecadd77df990c7664f1238f64fe9235e91e4c468d9d917d0e3e3c87cc68dd4d7f593a94758fdd9c5b1f599bdee2a7942947e5f5671e9051bd4b73f7f57765515711fd3667cecbcfcb7153ab1b6ca12b8bef7f304bba9389079c9843a66e73465d8b73ff034bd33de9c09c72f0e45ae3cfd39a3c7efb82acfd1f3b1ec00bb7726d77268d6b4a434343eaeaea6aade5d6ded1539b030080f2d103180000d8b9de45b9f587d7e6aef9cbd33930d2d4b37651e6dd7a557e74c733e91b694a3a1ecb0d3ff8416e78aca3d6f03c74cdcf7d0faf4d6ff38c1c76dcb139f9a8591955695e76ffdd59d4559709738ec871c715e1ee48f9d6fab37ef9d22c5dba340fdf757f566ddb4db8bf3dcb2beb96aede586bf879db98d5ffa3c703000000182100060000766ad13df766797f53661c774e5efffaf373fef9e7e7820bceca816392de250fe69135b5c2e1fef4f6f6a5b7ef050c34d4df9ffecacbe85987e7b03973b2f78422fead340f1463414fcd81c71d943973a66674b57507eaea52d7b330f73eb4ce50d1000000c01ea9e1e37ff4a77f5e9b070080d269696eaccd955f310c7477ef5046b736d55a768fcb2efb62ce3de38caced9f96434fdd2f136aeda96fcdd46913d3366142268d9f90c1a76ecc35f72d4fcfe070fa3b96e4c905cb323c634ea634576a87bab3fcd17b72e73df7e791c7e6e7c967d6a6bf7572268f694a5d3af2d80dd7e48e056bb7d8767e96ae5891871f7a28cb370c6668b82bab9e7c220be66fc8e883f7cab89133d8426f563ef154d636cdc941933764f9e255199cb15fa6b7d68632ed5d99279eaa1c73cc5e396cd6f84ac392dcfd839b735fc7e81cbcd7e6bd753c56b9863b1e4ec7e883536d5e724f7e70f37d95e57dd3f8f4adb9f9ee87f2d893cb333c7956a68c5a97f9b7df92db1f9897f94f2e4957cb8c4c1b575c4fa13d8be72d4b67e578078f5e95db7f7a5b1e78747e9e5e5df9fa4c9994314d5b0cb1bacd7bf3f4f2aed44f9c9a89cd9bfe5eb7f6fe2c1ccec4b6e5b9e7e6bbf2d033c39931674a8ab716e0c5dad83d90d6e686d4d7d7ef314340f7f6d686b300008012d203180000d8a9d1d520754d9e98b73afd5b74adad1f3b3d73e6ccc9b4d14963db844c1edf9a864a7b43cbf84c9e3c216dd5fcbd3d0f5f73556e9db7223da32a3595f6a6eee59977ebb5b9e39962f0e8c6b44d9cb2cdb6533271c2c8ebe86a47e051195d999f3c796c9efba9ce4d997df4219990ce2cb86b5ee5c83b3298be6a4fe5a277f166c37d3dd51ecccf360f566a2acb6b1efe69ee58964c18db94c1ee3579f8b63b72db8d37675ee7a84caeb6adcf9377de900736f584de64c363b9f6a647d2d95c39f7b18dd9b87c5e6ebde68e2ceaadad4f6f16dd7eed16efcdd80caf5f98fbaebdaaf6de148647ce75e393b9eb9627d2bef529030000006c45000c0000ecd4fe271f9799cd035937efe67cefbbdfcf4f6eba270f3eb52a1bb70823db661d9d538e9a59ed95da3cf3c89c72cad199d55659e8ea4fd3b4a9d9eb6567e6dc579e5e693f3daf7acd919992fe2c7b7a6986d29659479fbccdb627e7e8238faabe1e58ed723c210756e64f39e5e04c2e167764e386b48f3e28c71ed096e1cef9b9e7b1ddf30cdeded107e4b5af3d33a79cf9da9c73c4a4a4677956351f9d736a6daf3f79ef34a6272b966e13396f1cc894d35f9fd79e5939f733cfc9eb8e9b96c6fee5997bffb2eaeaa1a5f767eef2818c3968d37b73665e7bce3199ded09b250f3fbe7580dd3b9809c79f9b0bce3f3fe79f7dc8767a410300000008800100805dd13c3ba7beee9c9c75ec41d96b5c43bad72ccafcfb7e9aabbefbc3fcf4890dcffdbcddb62939f898d373ca21132b3f800ca6afab3b1dabd7a7bb58d7d9990dd5a2dda93e138f382e735a86b3fe917bf2c4b3bd6d5fb829b3e63c3bdc72f3b4c9d5e710378f9bf86c5bfde8b6ed0fc73c66760e9cbaf9c7aee63907679f4ae1c0dad55957595efaf4d20c647cf699d5929ecafbd2554c83d3b3d7948664e3ca2cef1ad9aeaa6ddf1c367bbb4701000000789600180000d835f5ad99bcdf1139e595afcb1bdef8fabcf68cc3326d545f56deffd39f1dfa782b83e978ea8efce47bdfc9b7bef5dd7cffc73fce35773e331200ffbcd44fcd31c7ee93a6e13579f8ee85d90d19f00b3366ec363d7547a5a91816bbab08be07d2d73f5c59589f47affb717e5c795f364df72d2fba56f757d617dbd4d4d5f9010e000000d829bf3f00000076aabbe899bae5f372eb9b3266daa139e3c8e99585ed0c7dbc85a1a5f7e486fb96a667ccbe39f1ec7373eeebdf900bdf746ca6d5d6ffbcd4cf3c3ac7ce6ccac08a8772fff22268fd0518e8cfa627f98e18ca70712a8d8d694a63f1523135479e5b795f7e663a33878e2dd603000000ec3a01300000b05377153d53af7f24ebb619eb79e3c691318a9b4635555fb767c39a7519485be61c774c664d6a4ddba886a4b76f9b60f4e76154f639eea8cc68eacf334f2f4f5dad75447dd1a13659bf369b3b2f0f6563f76eee2bbc6649166fb9cbf625595679cbea264ca93ecb78f2c4a27ff0daac5bdf9cb6b6ca7b539d9a33b861753a071a52ef2736000000e079f2eb04000060a7f69fd9946c5c901bafbe350fce5f98850be7e7c15bafca4fe675244d3373f07e6d23857575d5a0b56bd9fccc5fb824ebfb92d6d16d95b6ae2cbc7f41d6163d89d73e93bb6e7c38ebb64e647f3e9a67e7f823a7a5b1b3339db5a611d3327d72e5047a16e6f61be656ce7561e6ddf1933cb87ac741f60bd2d89147afbb3df3162fcee2f97373fd4df3b3314dd9fba07d33aab27af401876466d3609eb9f327b963feaa7474adcbb2876ecb4db7de9d5bee7e2a3d237b01000000d8650260000060a7f639f9553969ff0919d5b322f31fbc2ff7defb50e62fef4efd98bd72dcd927659f22cd2c8c3b28c71e382e759d8bf3e0bd77e681c57d19b5ff493979765b06573f981b8a9ec4373e908dfb1e9d036a99f1cf5bf39c13f2b229dba6cda3b2ffc92765f698faf4ad7daa72ae73f364f79c9c74f884dafadd64f211396df6c63c76d7ddb9ebc1a7b26eb039338e3e2b27ccacfd28366a9f9c7cf6b1d9bbad374b1ffc69aef9f10db9edf1d5a99b7c504e3ffd908c1ea902000000d86575ebdbbb7f410fc30200809fbff1e35a6a73e5363c3c9cc1c1c1acede8cfb449adb5d6dde384134ecadd77df595b1a4c5f575f062a738dcdad294673debec1f4f7d7a5a9698bbf391dec4b57efe04eb6fb0518ec4f7f5d53b63cd5ddae7aed4973dba8ece8d287fabbd3d3bfb3f71560f75bb9b63b93c635a5a1a12175d5f1f1cbafbdc3180b000094971ec00000c0f3d09051b567d53e7748d9b075f85b6818b50bdbfd0234fc9cc3df42f5da771cfe16ea9b76e57d05000000786e0260000000000000809210000300000000000094840018000000000000a02404c0000000000000002521000600009ed3dd77df599b03000000e0979d0018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030040c90c0fd766006027dc330000a07c04c0000050220df575191c1aaa2d01c0732bee19c5bd030000280f0130000094445d5d5d9a1aebd2d33b586b0180e756dc338a7b47710f010000ca41000c00002532aa31e9ea19c8c0a05ec0003cb7e25e51dc338a7b070000501e026000002881a2e756313534d4a775545dda37f4098101d8a1e21e51dc2b8a7b4671efd8741f0100005efa04c000005012c52feeebebeb33aaa9aeda9b6b6d7b6f3abbfaabbfe41f1eae1501b0c72aee05c53da1b83714f788e25e51dc338a7b87f0170000caa36e7d7bb75f050100505ae3c7b5d4e6f60cc3c3c3191c1cac4e030395d7e186f40f54da867cec072069a81f795e7c43dd601a1b1bd2d03032ed6901707b474f6d0e0000ca47000c0040a9ed690170616868e8672600d8a4e8f1bbedb4a7110003005066026000004a6d4f0c800b454fe022f82d5e374d00b0e959bf9b1e1bb0a70efd2c000600a0cc04c0000094da9e1a00173685bec25f00b6b429f4dd53c3df82001800803213000300506a7b7200bc2d4130c09e6d4f0e7cb725000600a0cc04c00000949a001800d8960018008032abafbd02000000000000f0122700060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501275ebdbbb876bf30000503ae3c7b5d4e6f614cb73d567fe6f7eb2b2b6b849dbac9cf6e677e48263a7a5a9d6b4475a7e553ef3b7d764658eccc57ffbab39a6d60cc09ea5bda3a736070000e523000600a0d4f6bc00f8f17cee0d17e72b4b6b8b5ba9cfb4d7fe55befaa9576452ad658ff3f8e7f386777d354b737afee2eecfe6fc5a33007b160130000065660868000028a9137eef3bf9def746a6cbfff8cc4cab1fcacaabff3c7f7d5d7fad0200000080b2110003004049354f9899993347a6232ffcab7cf415ad95d6eedc73db032305153d0bbe954fbff7ed79cd6bcea94c6fc8c57ff0c5dcb272eb8078e735fd5979cb17f30717bfa156f3f6bcf7d3dfca825ae7aa3b3f7361b5fd6d7f7fff4843e1d64fe7f545ed07be9ee5b5a62cff7a3e50b49dfbc7b9aaabd6d6b320dffaf4fbf3d6ea7ecfc95bdffbd7f9d6a61d575d9b3fabaefb44ae5ef9937cba7a0e9fa8b41646ceeb436fad6dfbb1efe6e981ea0a00000080d212000300c01ea12933a68fafce75ac59537d5dfb83dfcbb9eff874ae98bb247d45c3e0fa3c7efd17f3bb6fffa35cdd512d491ebf34ef7a57ad66fcbed977fc863c51adf9587eb076a4a4e3ea3fcadb7ff78bb9fef1f5699cbe6fa6372ecf03577cbab2dde7f3487f72d22987a767ddba3c75e7bdcf86bdf75c7f5d9657dad6dd7357eea965c91d375c9fbb8ab6bd8fcea96d45c3d5f9d8f917e75357cccda2eec1caf97567d1dcffcea7de715e7ef707eb46364a6fda8b6dd63d967ffbf0ff972b1e5d5e99ef481111afbde277f2c6ca79ddba705d3a2b17b8eae6ff9377ffe94dd9942d03000000949100180000f604fdf3f2e31b46e2d7038f38aaf2dfae2c5e332e471c7a68def68fd7e6c69f5c959f5cf79d7ce86595559d37e53f7fb8a15afbf88faecea2a164c6bbfe25375e7159fee58aabf3afef3935c79c3023dd6b46a2d49b7f70533a2baf27ffc9b5f9d1572fcb577ff49d7ce2bc6372d2118d595b84c4a79e96e38a9f3c1ebf35375483e5c7f3d33bd6577e1aa94ffdd0bdb9e5b6a22d99fbc0e3d5d7834f3f2be32aaff7ffd367735dfb505a4ffe78be7ffd3595f3bb293ffe8bd333a672b45b3efd996c3d92f593593ae677f21f3fbd337717cff6edbf3e7ffdb97bd35ff991e7e80f7f3f37dd78556ebce9fbf9d0cc55a91c19000000a0b404c0000050528f7ee30ff2d18f56a6dffed5bcee15efc9d797561ac79c995f7beb8cca4c5b8efed5bfc83f7ef5cbf9c3531ab261e5b22c7b724196d646575eb56259f575dcd831d5d795d7fc6b2ebbe9a12c5b3798c37feb73f997bffdc3bcf5a0a29b6e32767431b474f2f07f7f36dfbaf3c9acdc3026e7ffe565f9c7bffc60ce985e59d1f49abcf6d46a029c07e6565e3aeecb039573d9eb8d6fc891e9ce43f715c1ef3db9f9ceeecaebc179f579c5f9cdcbb537173d9527e4dc4b2eccb4a6ca6cc5a4f33f9037ef5599e9be35d7d482e31133f2860f5f94035b6a8bf3e7e6e16277adafcebb2f9e96eae64dd372e125e754f608000000505e0260000028a9358fde981b6ea84cb73f9a557da332f5d88bf3b9fffaabbcb6e85e5bd1fff477f367179f9b534f383daf38ef8db9e0edbf952b9edafa478419ffeb4ff2c123c7272b6fca65bf7f492e78cd9939e98cf3f3becfdd91da08d039f3a37f9ef36636a5f3912bf2a90fbe23e7bde2f49c7ad6dbf3b1ef3c9d914eba4d79f9a947565ebb73e7cdf7a4ffe6dbf3605a73c4cbdf9aa3f64a96de714b962f7f200f175d73f73a296714f96f9ecad3d50ecb6d1933b678dde4e01cb85ff1da9d8d239d946bead3d0589b2d3cb56864b8e989d352dddd26fbed9bbd6bb300000000652400060080923afd2f8ae1906bd39d37e5475ffc504edfd49536f7e7efdeff7ff2c3473764ca2bdf97bfbbfc3bf9e1f5b7e4ab176d1597264d87e592cb7f929b7ef21fb9f493efcb5b4f393063fb56e5beaffc6e7efb4b8b476a26bd227ff9bd1b72fd0fbf94bffbbd8b73de3133938d0b73ddff7e4f3e71d348043ceeecd37270e575fdc30fe4eab90f67a8feb89c7eeac139e3e409c9820772c7adf7a6e8073cf9f4b3aa75c9f44cab76d51dcae040b5a1667956acaacd3e97b1a353ed973c3498ad365fbd269b9e1e0c000000504602600000d8232dc9d26284e5296fca273ff3be9c79e4cc4c1bdb993bef2dc689de6443e65df3ed5cf6e94fe79acefd73d239efcbc7fff1ebf987771421f1501ebfffc1caeb33b9f3caafe7737ff6d53c36f1889c79d187f297ff72453e7e72b17d671ebaefa9622699f1babcba487617fc38ff7ecffae4c853f2f2a6e4f8979f94d6a187f3f5ff7cacb27242ce7cf5d1d5f2e4a81cf3b2e2c795e5b9e1c7f36a3d892bd6de985b16143307e7e8e3ab2ddb77ccb139acbaf9d5b9f29e4d5bf7e791ef5f972daf10000000a06c04c00000b0479a98f1c5e37d57ff287ffbd75fcf95577e3b97fdfec5f97ff3b6fc11616cfaeef9422ebbe25bf9cbdff8ad7cee6bdfce955ffb4c3efddd6270e5fa1cf7f297575ec767d18f3e9faffcf09ff2d177fd792eabece7cacbfe285fb8abd87e724e3f7ba43f6ff18cde334ede2b197a2a4f2e4a0e3efdac5447a23ef5b41c57bf3e4f3cb13e693d292f7f36d46dca6b7fe35d995d399da55fffadbceb0f3e9faf5df6e779c7db3e9bfb879231affd8dfcaf6d3a2b6f65dc1b72f1ab8b0b5c932b7ffbad796ff12ce4f7be35bf7e556fe5ac00000000ca4b000c00007ba453f3e14fbf35fb3775e6916ffe7d3ef9c94fe7cbcbcfcfc7abbd7b373bfaf7ff3d9f3a6f5646adbe2b5ff9eca7f2c9cf5e91477a27e5d8f75f96cfbfb57838efd8bcf5f397e5fdc74e4aef533fcc659facd45c7653568f9a95f33ef5eff9fd4d1d7a2b0e3efbb45af8ba574e1e79d06fd2f4f2541f0f5cd17adaab2a67b559d3e11fcabf7cfee21c3ba9374f5dffd57cf6b21f66c186519975de27f35f7ff1f26c1acc7afb9a72e65f5c9e8f9e36294dfdcb32f7861b73d35393f3becf7e2087d62a00000000caa86e7d7bf7706d1e00004a67fcb896da1cdbd79375cbd6a5a76562664e7caef7aa56d7302653a68ddd7ef8dabf212b57776670a7fb7afe7ad62dcbba9e964c9c3931cf7bcf3deb5239f517b62d00a5d4ded1539b030080f211000300506a026000605b02600000cacc10d000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000000000008092a85bdfde3d5c9b070080d2193faea536b7e7191c1c4a77ef607afb063338e4633fc0eed2d6fad2fd7bfae26ed0505f97518d8d696cd873fb05b477f4d4e60000a07c04c0000094da9e1a0077f70c6443577fda5a1ad3d2dc9086fafad4d5d55602f0a27476f7d6e65e5a8a5f006d792b2802e096514db5a53d8b00180080323304340000944c11fe7655a649e39b33a6ada9fa0b7ee12f00dbde0afa0787d2d3d75f5b020000ca42000c000025520cfb5cf4fc1d3f76d41e3db427003b5704c20395fb4631010000e5e1374200005022c5337f8b619f85bf00ecaabe8181da1c000050067e2b04000025d2db37587de62f00ecaac1a1e2e9c00000405908800100a0448a5fe237d4fb980fc0ae29a25f8f8907008072f19b21000028993abfc9076017b965000040f90880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000e017a2270fffc3ffcaaf5dfa68fa6b2d0000002f56ddfaf6eee1da3c000094cef8712db5b93dc3cab5dd9936a9b5b6b4fbac79fc8ecc5f5b5bd8a47174f63ef090ec3da1690ffecbd23579fcf605593be9c09c72f0e45a1b50769dddbdb5b917ab3f8f5efaee7cf01b4bb2d73bbf90cb3f78689a56de962f7eee5f73cd032b327294e64c3bea95b9e0ed6fcbb9474f4d53b56df71bd3da5c9bdb33b477f4d4e60000a07cf400060000766ae3eaa559ba747956ad599d35c5b46a79962e9a9fbbaefb41ae79705d866a757b9e8d59bdb4f2deacde585b06783e9a72e807ff3d97be73ef2cfdc66fe43d454fe06927e4e5fb4ec8b4238fcc11d5697a7aeeb922fff7b72fcc796ffb3fb96e95bec20000c073d30318008052d30378f75874eb95b97bf98c9c70e1a9995d6b1bea5e9efb6eba2d4f6f6cc9fe67bd2ec7ec911d6017e5d66fdd93e5338ecf85a76d7a6780b2db7d3d8047f43f7a793ef0a12f6541777df6d9d413b8b66e447f56ddfec57ce27fff671e193c38effdfb4b73f1a1bbb72fb01ec00000501e0d1fffa33ffdf3da3c0000944e4b73636d6ecfb0b17b20a35b77ff00a1ed8b1fcdd2ce31d9ebb059195f6bab6b1a932975abf2f88a0de96fd93b074c1b090f063b16e6813beece3d0fcdcbfcf98bb2bcab3e13a74e48f316e30ff5ae5d90b9b7dd95fb1e79ac5ab37ab02d53268f49535dad20bd593b7f6e6ebbebbe3cf2d8fccc7f7a7506474fc9e4314da9cbaadc7ff50db9e7e9c14cdf6f6a4622feae2cb8f9eadcf6d0da8c9ab34f2634541bb3e6c16b72fddd0bd23de180cc185db46cbddf279fe9c8f0b88999d856ec7744c76337e69a3b9ecef0c4b62cbbe7a7b9fba125199e3127539a87d2bdfcb1dc75db1d79e0d1cab6cbfb326e4673657fcbd23966af1c366bd33b03945ddfc0606d6e37e8bf259f7cf7dfe4bec917e437cfeaca0dfffdf55cd7736a2e38714ad6de7469fee68aa5997ddce1d967ce8939ffbc23b2fafa6fe43fae7c2607ffcad99955fbffbadd6154d39e75bfeced1da8cd010040f918021a000078c146358d84cdc34323030bf53d737b7e78cd7d796afd50c64e9e92c96307b3f6c9fb72edb50fa7bd5a910c2dbb2b57dff0601677376642ad66e5bcdb72cd1dcfa46fa422cbeefc496e78f09974374dc8e44acdd8c1559977ebb5b9e399a26272268ee94feffa6559de55dda072e06559baaa2fbdbdcbb374f9a601a9dbb374e986f40e4eccb469c5726f16dd3ab2dfcefab195fd8e4d7de73379f0c66b73fba2cdbdf986fb7a2afbd99827eeba354fb46f0e087a17dd916b6e9d97e51bebd23aa1724efd8b72eb8d8f65436d3dc00bb1e08b9fcb75dd07e592cf7c2cbff2b17fcfa56f9f9e676ac3414f38f37d7947eb7fe6bd6ffa58ae5a57299e78623efa995fcf81ddd7e4f35f9c3fb2030000806d088001008017a8370b17afaabc3664e294a2f7eb407a86c664e6f4fd72fc39afcd99a79c9c53ce3c27a7cf69ce70e73379ba082f2a962e5c92feb4e580d35e95d3ab35afc95947cdceac09cd95f66a45162ea9ccb51d90d35e757a4ea9d49cf9da3373d4ec7d32615451519f19d327555edbb37a652dec5db92a6bd2929696e1ac5ebe62a4ad6b79566d4ceaa64ccff4ca62dfa27b3377797f9af63929e757f677ca2967e6b5e79f967d5bfab37ceebd5934923ed7f46670c27179dd05e7e7fcf3cfca21e3d664de43cbd35f373947bfeebcbcf2f49373faabcecd593386e2e9bfc00b775fbefdc3656939f3ddf9957d8ae5a60cf4177f9032540b819fc801c53382dff04cfef5f2078b82649f77e657cf6ccdf26f7f3db78eb40000006c45000c0000eca2f55970fb1db9bd3add92eb7ef8e3dcbb6230f5130fcbcb6616eb1b336ef61139e1f46332bb3919eaef4e57d7baaceb2c7ad176a5b3d655b6b5fa9cc9ee2c7974415676f4a5b2874c3cf0f81c73d8d45447694e6b464a96e4d1f9abd2d13758f9c965620e3ce1981c366da462d4acbd33a5f2ba66e548d8bb6ae5da0c8f9e954366346760dd9a6a6fe3be652b2a675c97e9fbec53fdc167e5921519485be61cb2579e1d35b5615a0e9cd5960cacc89295b5b6aab6ec7bd8ec3cfb44cc8ee559d993d44d9f93fd9e6dac9cf7a10756cf03e00559705beeaefc1fd631a79ff5ec337f972c5b9b1cf7e17cee9d7b67e91621f01fbfa25650a93cb3f2ffb3e97e380f2ca8350100006c41000c0000eca29eac5fba344babd3ea6c1c1e9d19879d9a73ce3aa816dc2643ddcbf3e04d3fca77afbc32dffede8ff3e31fdf9847d66e1a9279c4e4a34ec9cb268d4acfb207f3d36b7e90ef5cf9ddfcf0babbb370c3a6bac939ead4c33369544f963df8d35cf3fdefe6caeffe28d7ddbd30cf968c9a99e913928155cbb32aed59beaa378d132767bf291353b771657568e8356bd6570a2765fa8ce2c79e81f4f517c3548fcbf86d1ed53b7efcb8ca7f87d3bd71d378d223eab6fc69a9bfbfb287a46decf8ad7f881ad5943deba999c06e75e0d139bc35997bcb8db5111092bd674eaa345c9b47dff6a55cba4508fcb2638fac55f4e7a65be626ad2fcb5107d69a000000b6200006000076d18c9c70e19b7361757a632e38ffd539edb019697df6a78a8d79ec96db327f4d5da61e71465e7deeb9b9e04d6fca2b0e68adadafa99f9843ce3e2f6fbce0dc9c7dea113968e6e80cb72fcebdd7dff1ec30ccf5130fc9d9e7bf2117bceeec9c7ae44199397a38ed8beecbf5b72faa3d27b82dfbcc1c97f4aececa35abb36e634366cc9a99fa19d332b93a34f4ca2c5b35984cd93bb34615f58d69ac26b5fde9df6aa8e7a4af7f247669696dabbe6e5765e3a2d7706ff7d62171868632f2f4638017e2f4bceb4d33d373d317f26fb5debc47bce78339a5f5c1fcd3afbc291fff517b46d56f1a0efad19190f8996fe4cb377567c69bde95d3aa5b0000006c4d000c0000ec266bb2aea3f232fdf09c7ad0d48c6b6b4d53fd507a8b219c9f3594ee358b33ffe95519686acda49907e5c8535e9513673725031d69ef2e4abab366f1fc3cbd6a204dad1333f3a02372caab4e48b56443478a92c2e8bda667743ab3feb19559533735338a07fd8e9a95bda754ce64d16359df9b4c983e33d5fcb762f2c4a2a7efda2c595c3c5f7393de2c5eb2b6f23a2e13278fb46cd7d871195b5739feeae559b54587e6be679655ae1ae0853bf07dbf9b57b62ece37feec33b9ab7856fac473f2e96fff5b3e72fe7139e2c8a373c21b3e9a3f79fba69ec08fa67f9f77e6a3bffebe7ce87d078dec000000601b026000006037199db696cacb8ac772efd20de9eada9095f36ec95d9bbaf5560d64d563f7e5c17beec82d739fc9daaeeeac5d3c370f2fed4f9a2665cad8a264551ebbefa1dc73fbad99bb785df539c28be73e926ac9c4c9294aaac64fcfd4e6cae1962fcff0e469a98ef49c5199397d7c06d614cf011e9799fb6ceed53bfa804332b36938ab1fb83eb7cd5b96b56b9765de6dd7e781d5c3699a79480ed8348ef5f6d4ef9383f6ad5c5ccfc2dc7ee3dccc5fbc388be7dd91eb1e5c552b0078819a4ecf1ffdfdfb72f0daefe50f2ffe8dfcf3edabd2df72402ef8c8a7f27f3e55993ef2c6bce677be94bf7ce5e85a4fe02772c0affe6a4edbf4d0600000806dd4ad6fef3662190000a5357e5c9148ee3956aeedceb449db0cb9bc1b2cbaf5cadcbdbc1802fad4ccaeb56dcfd0bac772d3adf3b2b677e4c78cfab65939e980fedcfee0f2cc38e1cd39add878706de6dd727b1e5bdd9b4d9d69eb5b26e7b053cfc8211347fe467570eda3b9e5f6c7b2bae7d98ab44c3934a79e71486a2555abeefd616e5ed89b092f3b27af3ca416f6b63f94abae9d9f8da30fcaabce39225b3ef277a8fb99dc7bf3bd59dc39383274735d43c6ec75544e3d714ec6d6f6dbfee055a96c9e835e754e8edc7ae33c73ef4db97b51d7c879d7b765f64907a4eff607b37cc6f1b9b07a71c09ea0b37bcb9104768ffe55d7e66f3ef8c95cbdbc3f4da3f7cda1c7cdaefdff577b16dd3b2f8b3656da5b5a32d8d397bddef9855cfec143b33b33e031adcdb5b93d437b474f6d0e0000ca47000c0040a909807f1186d2dfdd9bfe34a6a5b569c7c30e0df6a5ab7730754dcd696dda7ed5605f777a0792a6966238e95ae36e30d4df9d9ea247f10bd96fedbc77f739012f1d3f8f0078447f56ddffa3fcf77f7d37d73fb022234769ceb4a35e990bdefeb69c7bf4843c71e9bbf3c16f2cd9ed21b000180000ca43000c0040a9098001d8dd7e7e01f0aee8cfa3975e924f0ffe61fef9778ec8eebacb09800100a03c04c00000949a001880dded171b00ff7c08800100a03c0c580600000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030000000000009484001800004a6678b83603003be196010000e523000600801269a8afcbe0d0506d09009e5b5d651202030040b908800100a0449a4735a4a777b0b604003b57fcf1100000501e026000002891d6e68674f50c6460502f600076cda8c6c6da1c000050060260000028918686fa8c6d6b4afb863e213000cfa918fab9b172df28260000a03c7cc207008092696d694c5b655adbde9bceaefe6a103cec018f007bbc6d6f054d0df56919d5545b020000caa26e7d7bb75f050100505ae3c7b5d4e6f63c838343e9ee1d4c6fdf6006877cec07d85dda5a5fba7f4f5fdc0d8a67fe16c33eefc93d7fdb3b7a6a730000503e026000004a6d4f0e800180ed1300030050668680060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004aa26e7d7bf7706d1e00004a67fcb896dadc9eedfe9b3af3f87d5d59fa645f3ad60d647828d9f20781e1babadadc36edb5d7c270ad6467eb0b3baa298cd48d14bf987deda8a6b0e3bacd0b9b6a5eccb1765e33d2b87bf6b5fd9aadd76fde7057f651d83de753b7c39ac2f3d9d7ae9dcfe6a21dd7d4662ab66c2fec4addd635bb7ebc9dad2feca8a6b075dd0e8ebb0bfbda514d61c7753f7bbc1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9fc62ff7d345416f71e5b9fe36736e6f50735e5dd47358facdcc3b577f4d4e60000a07c04c0000094da9e1e0017c1ef8dffbd3eed6b06aacbbb1a186cb2754ded75e4a56a7beb0b3baa298cd48d14bf987deda8a6b0e3bacd0b9b6a5eccb1765e33d2b87bf6b5fd9aadd76fde7057f651d83de72300deb49f9dad2feca8a6b075dd0e8ebb0bfbda514d61c7753f7bbc1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9fc72fdfb983dae3e7f7e66eb1e1f040b80010028334340030040495df5ef6bf3bd2fac7e36fc0580451d4379cf0f36e6435777d55a000080b211000300400915e1ef5d5777d49600606bff784f8f101800004a4a000c000025f3c04d9dc25f0076aa0881ffed81deda12000050160260000028991baf585f9b0380e7f6899bbb6b730000405908800100a0448adebf1d9ef90bc02e2a9e09ac17300000948b001800004a64febd9ee708c0f3f3bd05fdb5390000a00c04c0000050224b9fecabcd01c0aeb97b9991230000a04c04c0000050221bd6f9253e00cfcf920d43b5390000a00c04c000005022c37e870fc0f334385c9b0100004a41000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000007e718e9f987ffeeb19f9afbf9e9c8b6b4dbf348e9b90af7c727a7ef87f26e5d76b4d000000f0cb4e000c0000c02f4e435d46b7d657a7e65ad32f8dcab98da99cd798d6ba5fbe73030000801d100003000000000000948400180000809796e92d79cbebc7e503ef189fdfbb706cde727453a6d656fdacc69c76f6d8fcd6af8ccf47de3c26e7ce6a4866b7e592378fcb6fbfae2d87d6aa76d9acd6bcf74de3f2bbe7b6e6b0cae2be2f1b9ddf7cd3f87cfc6de3f29e139b327da40a0000007e61ead6b7770fd7e60100a074c68f6ba9cded193e79d1c2eaeb961ff287eb6a33155bb5d75e0bc3759b8b765c537b1d79a9dadefac28e6a0a237523c52f665f3baa29ecb86ef3c2a69a1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9d4edb0a6f09cfb3a6952be72714b26a63fdffad0aafccb4e8e75e4eb26e78f5fd39c890db5869aae15ddf9e77f5a9f1fad1f59ae1ee780b1f9bbf78cc951a347daaa8606f3d39bfb73f8592d99b4a1279ffec4ba5c555bf533c73b7162ae7c67a5ae726efff19135b9b4683f7142bef38e62dbdefcd7938db9f0e8863416b535eb1774e623ffdc997995f9adf6b7d3f770c4d6759b179eefbe765453d871ddcf1eefc51c6be735238dbb675fdbafd97afde60d77651f85dd733e2fe2df47cda6f95d3b9fcd453baea9cd543cbbef3f9a549bdb33b477f4d4e60000a07cf400060000e02561eaa993f2f1d716e1ef70963cd299cf5fb6369ffe76571edd98b44d6fcd07df333687d46a9396fce13b47c2dfa18dfdf9d177d6e74fbed2911f2daacb29a737674cadea056b1d9537540ef6c0bd9df99b2b3a73f5d34319a8344f38b02def3d7da4040000007e1104c0000000bc0434e5ed67b56472e5a7d80d8f6ec81f5eb6213f78a437d7ddd09e0f7da92b4f0f252dfbb6e557cfa895bf7674ce9a5c791de8cf9597afcedfded09ddbefdd98bffddcea7c6d71326aa4ea856b1cce0357adcd87bed699efdcd699bff887f5f9fe8a62457d0e3ea8b55a02000000bf0802600000005e025a7350f501bb4379e0de8d59556dab79a233772e2966ea336bdfe66ad36bf769ac86bc7d4ff7e4d227aa4d3583f9f747fbd3575b7ae106f3c44d83b5f9425f1e5a35549b070000805f1c0130000000bffc8e6fc8d4ea4fb083597667b5650b8359b86e247c6d6e1ef93177ce8491d7ceae2d43da9a4a6d676d16000000ca46000c0000c02fbfeee1e7d56b774dd770f5b5beaeaefa0a0000007b0a0130000000bffc1e19cceafe62a621fb9d556dd942530e9f36f2e3ed86ce81eaebe28e911ec113f61e95d3ab739b1d32a731936af3000000503602600000005e02ba72efa2a2576f7d8e3c695c8e1c69ac9af5cab139734665666820f7df5e4d8973e74f7bb3b0c88027b6e403ef6ecbec6a6b32fbf8f1f9d8098db525000000281f0130000000bf041a73de5fcfc8373fbd79baa23a4dcb478f2fd60fe61b3fd898f97dc9a8bd47e7d3ff7b6afefec353f2b98f4ecb3fbcbe39632b15ab1fe8cc3f2c2a6a2b16b5e7f337f6a727759979ccf85cfeb733f29dbf9e99cb2f6e4bcb92feacaf9501000040d90880010000f825509796d6fa8cdeced4da502b79a2237ff9af1db965c570eac736e6b0394d396c9f86b40c0ee6911bd7e543ffd65d2b1cf1c07757e78fbfd995b9ab87d2d9379cf40d66eecdebf347b70d66648068000000289fbaf5edddc5185a0000504ae3c7b5d4e6f60c9fbc6861f575cb0ff9c375b5998aadda6baf85e1bacd453baea9bd8ebc546d6f7d6147358591ba91e217b3af1dd514765cb7796153cd8b39d6ce6b461a77cfbeb65fb3f5facd1beeca3e0abbe77cea765853783efbdab5f3a9cbd459cdd9afe8f63b3894271febcfaaa2bdba76c4739ecf891373c5bb5a3269434f3efd8975b96a537bedb5b0edf136d9714ded75e4a56a7beb0b3baa296c5db783e3eec2be9ef3fa6baf859d1defc51c6be735238dbb675fdbafd97afde60d77651f85dd733efff3ff3e36d9714d6da6e2d97dffd19ef564ecf68e9eda1c0000948f1ec0000000bce4ac5adc9b3b1fe9cd1db5f0f7674c68ce3bffd794fce79f4ecc1ba6d5daaa1a72fe51a352445d439d43797aa4110000004a43000c000040f9acafcf7efb3565f2e496fceec7a6e74b1f9e927fa84c5ffaf3a9f9bd232a3f0a0f0de6d69b3af368ad1c000000ca42000c0000400975e7539f5f9b7f7d70201dc3f5d977dfa61c5e99f61d9b74aeeecb955f5f9b3fbb7db0560b000000e5e119c00000949a67006fff598f85ad6b76fd99913b5b5fd8514d61a46ea4f8c5ec6b4735851dd76d5ed854f3628eb5f39a91c6ddb3afedd76cbd7ef386bbb28fc2ee399f97c6334e37d995baad6b76fd783b5b5fd8514d61ebba1d1c7717f6b5a39ac28eeb7ef6782fe6583baf1969dc3dfbda7ecdd6eb376fb82bfb28ec9ef3f10ce05f469e010c004099e9010c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c00000000000000025210006008012a9f3091f80e7a9a1ae3603000094825f0f010040898c9dd8589b03805db3f758bf1e02008032f1091f00004a64affd47d5e60060d79c30d31f0f0100409908800100a0440e3aaead360700bbe682039b6a730000401908800100a0448e3a734cc64dd6930b805d337b5c7d7eeda8e6da1200005006026000002899b3de3aa1360700cfed2f5ede5a9b030000ca42000c00002553f4023ef1b5e36a4b00b07dbf7d7c8bdebf000050420260000028a173de3d49080cc00e15e1efe75febb9f1000050460260000028a92204bee037a664bc67020350533cf3f7f2f3470b7f0100a0c4ead6b7770fd7e60100a074c68f6ba9cdedd9eebfa9338fdfd795a54ff6a563dd408687922d7f1018aeababcd6dd35e7b2d0cd74a76b6beb0a39ac248dd48f18bd9d78e6a0a3baedbbcb0a9e6c51c6be735238dbb675fdbafd97afde60d77651f85dd733e753bac293c9f7deddaf96c2eda714d6da662cbf6c2aed46d5db3ebc7dbd9fac28e6a0a5bd7ede0b8bbb0af1dd514765cf7b3c77b31c7da79cd48e3eed9d7f66bb65ebf79c35dd94761f79ccf2ff6df47436571efb1f5397e66635e7f5053de6dc8e7aaf68e9eda1c0000948f001800805213000300db1200030050668680060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002889baf5edddc3b5790000289df1e35a6a7394cef29bf3c5ff7c381db5c52d8d3beacd79df2ba6d7967e81fabbb26e633266425b9a6a4d3f63dbeba86f4c4bf3e84c3dfce49c73eafe19df506b2fb965d77f2d5f7f6a76de75c9cb33b3b2dcf9c4cdf9ee75f3b2ac6ba8b2549fb65927e6ad6f3c3653b7fb7e74e5c71f5e997b56d5162b9ac6d4a7754a734ef9ada93971afffc9bf7d1e4af7dafef4b534657cdb8e8ebbfdf31dbbdfe89cfdbe89396cf21ef2b7da372fcb27ff3979ddd766e6b85ad35616aeca3ffe494f0efce4ac9c3ba7d6f6acf5f9da45eb93df9c938b5e5e6b82e7a1bda3a736070000e5a307300000f012d69259c79d96b3cfdc7a3aed90f1b5f5bf608f5e9b2ffdfbb579a4b6b8635b5cc71927e594c327a47deed5f9f2771e4967ad628fd27d7fbef7c387d33ef994bcfdddefcc256f393e1356dc91fff8d1820cd64ab6a7ed883179cd2513aad3d96f1f9dbdfb7b73f5c797e7d6f65ac1ff889edcf897cbf2952b771e2e6d7bbe939675e65b1f5f917bff47cf17000080b211000300002f614d997cd05139fed8ada797edb565cfeffe6c5cdf9e7595a9a367dbf87064ddc6fe64b0676d9e7ce8c9acdaa2a47fe3c876eb8a820ca6bb63a4764b833d1b466ad67755f6b659b5bdbbd85965bb67f7b123db5cc719afcb25afde37c38be7e6ae95b592c2604f3aaac7dadeb58c78f69c3b7ab61b966e777d6dbf5b9d62b56d43aa97b049d1a3799bb61d5d7fa1baae7a9ccafbfccc823cb878636d4dc5b3d7b2cd310a0b57645df37e39e38d4765d684f199b8cff139fbd0b1e95bba288b6a25dbd334bb2d27bd6a426d9a9c0b3f35210735f665ee8fba6b152306bbfab276556f65ea4f5fad6d2b030369afaeef4de7760b8a5ebe23ebd7766c79f283e9ac7c03f50d25c3958b5abbaa2fdd03b555dbb1edf9fecaff9d9883067b73fb36e7dbd7513bd68eceb7afbfb67e07c7dbc1faea7ed70e6cf57d526ddbea9a6ad7fa33d759ecaf37edd51eda5b1a5957bc6f835d3d997fcb86ac7cf6989bb7dbfefbba1b3cc77b51fdba57afb7721ef33b32f7f1adbee19fe39a0000005e5a0c010d0040a91902bac4aa43272fcafebf72515e35a3d6b6adcec7f3bdffba218f6f481a1a92c1c164dc4167e79de71d9c31d58247f2cdcfdd94be7df7cdfac54fa767686c8ea9ee6f63e6fdf0ca5c35bf33c38d8da91b18caf8634ecd3e4fdc92f527fe66de7664b1ed609eb9f5dbf9ce3dabd253579f86c1a10cb74ccd89af7f53ced8bb616448e3072a07de64d699f9c88587d716b6b0a3eba80d0d3de19523c7eb7cf427f9c6354fa423a3d2da3090eebe64d23117e457cf9a99eaa8c883cbf2d36ffe3877ade84f636b53867b7b3334fec8bcf5a2d3b34f51f09ceb17e43b975e93f5c7bc33ef3e6da4f774f75ddfcaa5b7aecc8cd37e2d179d38f2efa87a4df367e6c2f7bf32fbede4fa9fad7f6a5cf66f5c9627d70d3dfb1e0c2eb933dff8fedcace8499a1a2ba7d6b8778e9abd3e73976d1e027a6b8359f0a3afe43b2b0ecac5bf767a7e7670ef912195179c382dbf7d515badad501b6a79af09f9938f4da82c0f65f1b797e79bdfea4bdfa8fad4f70d65b0b539677d627a4eab0d13bde1ce15f9b74bbbd359b9a69686e174f5d565fff7cdcc3b5f5e1bc47ba02b37fcefd5b96dc1709a2adf44fd9dc3697ed9f85cfcb18999d638322cf1c291ca8a861cbfdde18b77f17c9f3dd6501ac654ceafbb38df969cf3991939aefa65dafa7a9a2a5f839ee1c69cf4ffed95d71c505ccf73af5ff7ed25b9f4bb8d79f397a667e43bb333dff9c0ea3c94b6fcca3f4dcb8145d340e59a2e599fbe77ed93f79c5bf962b577e45b7fb62ef3560fa7a1f2960cf6d765dc1913f36b1f1897b1d57d8cbc077dc7b564ddfd3de91eacbd0713376fd734aa2efdc30d39e9950db9f3aadd3704f4965fbba6e1a1f4a63147fdfef45c70d4c8d76ec9d716e7dfee6acc81a3fab260c9707274ed7dde744deb929651494f7732f9559372d125636bd7441919021a008032d30318000028a915b9fe8a1bb2a0fed0bced83efcf877ffbfdf9d08587a6fe891bf29f37aea8d58c58b9be39af79f7fbf291df1d0961bbefbd3a3f9e5f9703cfbb281ffaadf756b67d4b0e5f71771edaa2036bf7c33fce9577b567dacb2faaeefbc3bf7d51ce9ada9e3bbefbe33cd89dcc7cc545f9c82bf7ae54ee9d57ffee6f6e3ffc7d0e83eb3bd39d719952a49dbdf372ed0d4fa7fea0d7e6bd1fb8241ffcc0fbf31b67cdc886b937e7b6f523f5ddf7df9ebb568dcf29eff9f5fccefbdf930fbde7ccecddfb58ee7ca87717d6ef9783673566f5e2272bc72c0ce6f1c5ab336ad4a8acacb48df4fd6ccf134b36a469afd995ea9d5fffb336ac4acf216fce879e7d0f9ec94f7e786fd64e38361757be2e1ffaad5fcf25af6ccdc2055b84e55be9cf8a3bbe9b1f3dde9769871ebe9df0f739b4f76555473271767375b1ebd695f9cf6f0de5808fee9d8fffcbec7cec4b7be5d507f4e7fa4faece53d58a8db9e1dfbb3378cae47ce4f2d9f9bd7f99955f3da73e4bbedb9ea7abeb0732f773ab735b674b2ebc74df7cf40bfbe6639f9f90e94fb5e7eb5f2ebe3926e4a2af4dcbf15393f1e74dcb9f7c6d7bc1e573181848c716e7bbe4ca75b9737963cef8ab59f9d8178af39d96a35b7b72cd976b4f8cded89e6bbfd597896fdf2b7f50b99e8f5cbe775e77f850eeff4e47aad1d64ed64f3ca525937b7b33ffe1a2b862617716f7d6a779636f166c4ab1efefcd92c1a6ec77426365a12b3ff9cbb579acb12d175d3e271fffb739f9834fb4a5e1b6b5f9ca7f748dd4d72c5f5a9fd77d7676ed3d18c8ed9f5f9b797595f7edf395ebb87cdffcc15fb665c9cd23df9b3bd3b76ea467eed6d350e5abb18585abf3957feccdd877cca8ec7f763efa6fb372d12b9387fe76556edfe2df6d56f5a7fbcc69f983afcda9fd51c0c8353d39655cdef7a57df3917fa99c5be59a866e5893fffec9f6ba53030000fcf213000300002f611b32f73fff39fff7735b4edfcbfdc5aa850f675efbe81c75ee99995debbcd934ebcc9c77c4e8ac7fece15ae03762af63cecac1e3467aad16cf707d60fe8a64d6b179dd4163477ad7364ccec9af3e2c139e1d19b652f3d0e20ccc3a25171eb3a9666c8e7be329993db0b8b2eef9f62c1b4a5f676d68e6cab4e2a9db73c58d8b3338f9c01c35adb2baf9b0bcf137df9b5f3f67ff8caf9de69823f7cbf4accf8a2523cbbd3dfd196a68cca891c54ac1e179dbfb2ec985478f8489cfbdbe2107cf999efa95cfe4f16adafb54162e6fcda1c7cd49f3f2c5995f34753f99a7d73466df838b7ea1cfe3fac71c98979f3c35b52f41e5ebf2789eec1a9b979d7562a6571b1b32fea0b372c2dedbfbf17463eeffd657f2d5bb3666ceabdf99779d32b1d6be7dfd8bba72e7b5ebabd3755f5a962f7c6c7d1635b4e4b40b5a2b6b0732f7273d69386d7c5e5feb119ac65139f1574767f2facaf55443d0c1f476579a9b379d4b7d665db44f3efa3753b26fb1b87143eebb3739f4dd53b2e931d30d9327e49c731ab3b1728e0b469a76d9c830d1b540737167aefbccfa3c31d094c3cf2ece37d9fb6d7be7635fd82b2f9f5dfba237b6e5c8e31ad2bfb02fcb8be5eecaf7cd605d1a9f1de8a029c77d6c763efafb13526ddad9fa19ad993375288be78e84b7ebe6f6a5fdc03139f980c12c9a3b12ce2eb8b737fdb35b72f494cac2c39d796879438efd9da99953fb461a75f0d4bcf19c86acbbb173abebdfe7f55372d8e4dafb5879dfe63d9acc79cbd467db46cd9e94d79c5dbbaee7349807ff7659fee9c3db4e1d79a6565158f093aeacdb774cde726ecbc8f763e5bf73de352e0734f665decd5b04b9935bf3aad7b76efe7750bda6a69cfca1a207f748d3a88327e7cce3ebb2e4d60dd93ad6060000786910000300002f61a373f8f9efcc25efde727ad5c870b61b368ef4a0dd6678e89953c625dd1b53eb4359555f8c0ffdacf6746e4cc64c9c5c0b926a268dab0d1b5dd8414dc3e44c1a9d7475b6d71a76d5c63cf2836fe44bff3e327df5fb0f65c394e3f2965f3929936b15833dcbf3c0f557e7bfbef6d55c7ad9e5f9fca5b7e4990c65a8164a4f38f6b81cd6b23c375cfeaff9872f7f2bdfbbfe813cb96ef3334e77b6bee1c0d999911559f8446561e1a22cc9b4cc3a6146a60eaece92e595e32f78262beba767ce0145f5f3b8febabaad6bb6fb7569c8b489950db7b5fee1cc5d3c94035efdce5cf0b25ad0fc1c7a1eefca2d577454a7bb6fe8cdea71a3f3eeff3723c75477dd978e75959a3bd6e5f31f5894cf6e9afe6263d657dec7ceb545cdb89cfae651e9bb7e55feef7b16e78b7fb532d7ddddb5f959b2ab062a5fa9a1ccff7fcf6cdebe327de5c78349c7e056df53bba2e3fa359b03cd8fafceddab9b72c69fcec8d9cfbe378359f3d0da7cefef96e69f8a63bdf7e97cf9aacab10687477a654f199f33ceaacf92cb97e66fdefb4cfeedd255b9e3a1decdcf09ded9fab4e590a31ad2fe5077d66520f3eeefcfd4c34767ff031bb2e6f1eeca31bab2e0e1a18c3fa235d5e87d6dd1d29869dbf46ade7b76e3cf5c7f7de316bf6ea8be6f0d993c6beb5f4154b7dba96208e939f993a2c7ee56d3846c791a1dc510e38b3bf32f5b7c5d3efb3bebb3b0f2b5dbb8668b070e574e61abb3a85ed340eef8f816db7de0995c357738593750795f0000005e7a04c00000c04b587d468d199f8913b69cda36f7367dc9289e3dfc9bf948314c7231fdce7bf3deb79cf06ccfe5743f9a6f5ffeed5cf7546f261f74545e79de85f9b5f79d9ed9b5d555ad07e6bc4bde93df7ccb2b73e2ac31d9f0f49df9ce57bf9a2b1faef5c6dde9fa43b2ffb4812c796a51963db52cbd3366e5a086fd337bda863cf3647be63fbd22d9fb801cb1b3147677ea1b4e43ebc44c99b46b071dfbea29f9bd7f9a5d9d2eb9b029f52bfab2a01aec6ed672705b4e7febb8ada6575e3221271d3cb27eef0bf6caeffef38cbcf5bd6d9991fe3cf08f2bf3b93f5e935a47eb8afaecf5eaadb73ffd9de3f39a4bc66efdf5d80523c3446f0e353ff67733f3f283375feb92ff5896cb3ed399a5adcd39fee24979c75fed958bcedbf2bd68cce1ef9f95dfffa7a9b9e0cdcd19b7aa37377e6659fef1b3edb59eab3b5b9fec777273da16f5665e7b679e7aa221b38f69cede95a9e5d1de3cb6ba3b8b5635e4c0d3b77c4ef12fb1e92d5b7f5d2ad3d9ef9e90334f7db6bfef0e54ae719bed5e7ef184bce61da347826f000080971801300000504e5327645cd666d9a2da72cdd3cbd7266327a4185979fba664ca84fa742c7e2a6b6a2d85c1279664556d7e534de7aae5b567e6d6742fcfca8df59930a5182f77375a303f0bfbf6ca99efbe20af3ae9a81cbacff88cebda98cedaeaaac19e746c4c46ef73604e79c56bf3ae5f7b674e99d29b271f7b72d7d6a72587cc9a94ee554fe791951b3363cefe69a8b41db5ffb4ac5e7a5f9e5e319069b38ab6c28bb8fef163d2567967976c7ac66c554f96acaa9cdcb6a69d9c8bdfff969cb1e32fd60e4d79fdf81c3eb63f777e797d2dec1c95099393feb65139fe551372d2a6e9ac3139fcd47139a8f670e1be8ebef48d6ac941a74fce057fb4777ee7f75bd3bca42b0f16e73bb531631a86336adf719bb7af4cc79f3a3a4756f6b37bbfea9563de3e9031af9e92dff8c0e49c74fa98cc9cda90ced5cf8e435e3194eeb5fdc9b8d179d9f95373e127f6c907dede94eebbbbf2e82eadaf78594b6635f767e9f7fbb2726c730e29bad5beac2dfb37f7e5c9eff565d5b8e61cb8a9abedacc68ccf40963c565bae796afe40f5bdd9e1f399abefdb60963dbaf53375abdbed2613a714df990dd97f8bafcb49af1a9bc34f1c5bf91e7e8e9ec6d31a5274101ffbb22db79b90634e1c9d634e69ab7caf020000bcf40880010080729a71440e9bdc9b79d75d9779d5a18efbb3f6b1eb72cda3bd9972e811993952b51d0d39e2e4c332a1fd81fcc77f5c9fdb1f9a9707efbc3e5f2f9ec95baba8d61cb16f1a97dd936fdfb13cddc5a8bc3dcb73dbf7eec9d2c67d73e4e1b55e9a6347a7351d59beb83ffdfd9b875b7edeaaa1e9ba2c7a6c43f51caac7ba6e5ed68facad7afabaffcc17bffce3dc531bd6b97fc52379725dd236765c757967eb0b130e9f93296be6e5819553b2ff61230f8e6d3d689f4c59bb304f744ecb81476c7a98ec2e5efff6cc3e26474eeecb63375c97c73b8aabe9cf8a3b7e943b568cacded2e05337e44b977d23573fb5f99ddf658d63f2ca0b4665f0fe0df9c9c34568da9813cf6b4dfd9debf395efd78675eeebcdc3972fcf3ffce6f2dc5ee4cf1bd7e5ebbfbd34977fbd7364fd405f1ebfb52f5d0d0d9930b5b23c7a7c4e3ab12ef3bfb83c373f3550fd5af4adecc8f7ffbf25f9fbbf5af76cd03c6e62d2f5746fd6f70da6ef05679c238175e7a35d59561dc178306bee5e9d9fde375c5d5bf5d8ea7ce17796e59bd7d48675eeebcebdf7540e38a161a4e7eaced6578dcbe1c726f3afaa9cfd316dd9afda3626071d3e94f977f6a7edb8b6144f7dae9a333647cc1ecc4397adccc32babdf8995735a991fdd3098a9678fcdde23553fabfabed567e97fafcccd8b8aed86b2febe95b9eaa617f075dd81fdce6bcbd4651bf25f5fec4875c4e781813cf3fd15f9e70f2ccdf7b609acb772c8b81c337b2077fecda66b1a4af7536bf3f58f2cc9a55fdace1f25000000bc04347cfc8ffef4cf6bf30000503a2dcdbbf28c495e923a17e5de87db33f188a3b2ffe687f36ea135b3f79f94ae27efcf2db7de955befb82f739fecccf8235e950bcf9c9991416157e5913b9e4ef63b212fdba2fb62fdb87d73e49ca6ac7a62411e7b727116ad6fc971af3f2cfd0f2e7eb6b67ef27ed9bf65651eb8fd8efcf48ebb73fb3d8f6669dd3e39fbc2d7e4c831b5bfb59d302da3963f903b6fbf2bb73fda97fd8edd376347d66cb6d3eba8183f2d13373c913befb82bb715c7baefa90c1f7148c62e5e91badaf94c98333d434f3e90dbaad77a77ee78684586f63e296f7ddd21195d399d9dadaf6a69cc9a47e665d99843f29ae3f74e35ee2ddaee7f28cf8cdda2ad6257aebf73e1837970fdf81cb9d575175f97b159fdd0bd956bb9a732dd978737ee9f330ee8cac2f6ad6b3b1eabec77617b9a661c9923663cd7bfe5fe2cf8f1c6acdd7b744e3a6af300e0cd073664e3cd9d7970de500e7b755bc6ecd5960327f5e4de6fb4e786ff5e9f9bbfd399c75737e6d80f4fcdd9b31a9251ad3960efdedcf75f1d23ebbfbd218f2d6fcc911f99965715eb5397a9c737a7f5a9cedcf8d5f6dcfcadf5b9f5aaee6c98313a6ffcf0e4ccacbe39f5d96bd6401ebe72436efc564796ce1897a3f6ad2b566c61fbe7bbb5facc3c68384fff68436ef866e55c2afbba6f71538e3f72284f57cef998734767dc94d6ecddd0953bffa33d375e515ccfc62c1968ced97f3a2d478dad1c7367eb6b26f575e796bb86b2df85d372f85e9bdb6ebc6570abb622449f7362e53dbda772fd95f7f0a6ca39dd7dd760269e3329bff2f6d169aed6f4e4c16ff524274ca85c77b5a1a278df9a32745f676efd66b15d7bee79a02167bdb9210b1e4a0e7acbd8edff41c6facab95f379049af1a9f0327d4da9eb5cd71c6b4e5e003faf3f8772a5fbbe2fdfa7647ee7facf2cff592a979e3098dd5bf7edff06047e62eadbd77d57d14b6bda6f6dc765d5fea8e9e9077be7fdce67f1b944e6fef0bfeeb0c0000f8a557b7bebd7b8b3f1f06008072193f6e535cc59e6cb067433a7a9296b163d3fa1c9d53b73438389886862d8b1fc9373f7753f2cadfccdb8eac3555f567e3faaef435b565e2e81d8479fd3de9ae6fd9e563ef507f57d66deccfa8d1e3b3a3438d5cebd00e6b76b6fef9db85ebdf81fe8dede91c6cceb8cabfd317fbd63c3f23432377578e3a7e52e3768e3d98ce5503e9ab7cfdb7bfbe626020edeb0653bc89e3dbb69712568ed1359cd6b6177b653b3bd78adab90c363766d2b8ed54ec6cfd0b30d8d597f68d49ebc451697d1e7f6733b25d5dc64c6daafd11c6eed7d7d19bcedefae77f8cbefeac6daffcdb18df9c313faf93e397467b71530000809212000300506a02605e880df77f3f5fbebd3fc7bde9f539757a116af667d1b5dfcc7f3f549fe3ffd73b72e6a4913a005e9a04c00000949900180080521300f3820caec91ddff97e6e5bdc5d7dce6b55c398ec7fc6ebf28663266fbf1726002f1902600000ca4c000c0040a909807931360d979c3465cc84b6ca7ff965f4c98b16d6e660f7fb93afcda9cd512602600000ca4c000c0040a9098001806d0980010028b3fada2b000000000000002f710260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0040a90d0d0dd7e600007c360000a0fc04c0000094dac0e0606d0e00c067030000ca4f000c0040a9f5f6f6d7e600007c360000a0fc04c00000945a5757afa11e0180aae23341f1d9000000ca4c000c0040a93534346463574f6d0900d893159f098acf0600005066026000004aad1a006fec4e4f8fe11e01604f567c16283e1308800100283b01300000a5565f5f9f8686c6ac6fdf200406803d54f119a0f82c507c26283e1b00004099f9c40b0040e9353535a5aef2bfe217bf1b3abb3d131800f610c53dbfb8f7179f018acf02c56702000028bbbaf5eddd7efb050040e90d0d0da5afb737c395ff15468f6e4d7373531a1b1a525f5f576d03005efa8ad077607030bdbd23433e178af0775473b3debf0000ec1104c00000ec31aa21705f5f8687876a2d0040d9d5d5d567d4a851c25f0000f61802600000f638030303d549100c00e55504bf8d8d8dd5090000f6240260000000000000809230f60d00000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000000000008092a83bfbecb3876bf30000bfb46eb8e186da1c000000b0bb9c7df6d9b53900ca420f60000000000000805248fe7f80fed2bbcafaa0f60000000049454e44ae426082	2024-12-01	\N	1	1
\.


--
-- TOC entry 4984 (class 0 OID 17217)
-- Dependencies: 231
-- Data for Name: complaint_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint_assignment (complaint_id, worker_id, date_assigned, remarks) FROM stdin;
1	1	2025-01-09 16:47:26	
2	2	2025-01-09 15:02:50	
4	1	2025-01-09 15:37:29	
5	2	2025-01-09 15:35:47	
8	1	2025-01-21 16:29:09.655137	
7	2	2025-01-21 16:29:47.228267	
3	5	2025-01-21 16:43:51.558407	
\.


--
-- TOC entry 4986 (class 0 OID 17230)
-- Dependencies: 233
-- Data for Name: complaint_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint_status (status_id, complaint_status, description, date_update_status, complaint_id) FROM stdin;
6	Assigned	Complaint has been assigned to a worker	2025-01-09 15:24:10	2
7	Assigned	Complaint has been assigned to a worker	2025-01-09 15:36:39	5
8	Assigned	Complaint has been assigned to a worker	2025-01-09 15:37:29	4
9	Assigned	Complaint has been assigned to a worker	2025-01-09 16:47:26	1
1	Assigned	Complaint has been assigned to a worker	2025-01-21 16:29:09.663788	8
2	Assigned	Complaint has been assigned to a worker	2025-01-21 16:29:47.256682	7
3	Assigned	Complaint has been assigned to a worker	2025-01-21 16:43:51.562019	3
\.


--
-- TOC entry 4977 (class 0 OID 17160)
-- Dependencies: 224
-- Data for Name: floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.floor (floor_id, floor_no, block_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	1	2
11	2	2
12	3	2
13	4	2
14	5	2
15	6	2
16	7	2
17	8	2
18	9	2
\.


--
-- TOC entry 4981 (class 0 OID 17174)
-- Dependencies: 228
-- Data for Name: hostel_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hostel_staff (staff_id, staff_no, name, email, password, phone_no) FROM stdin;
2	S02	Hee Siew Chan	hee@utem.edu.my	hee	0123456689
1	S01	Mohd Anuar Bin Haris	anuar@utem.edu.my	anuar123	0123456789
3	S03	Nadia Abdullah	nadia@utem.edu.my	nadia	0123456798
4	S04	Ravi Kumar	ravi.kumar@utem.edu.my	ravi	0123456897
5	S05	Nur Aina Binti Zainal	aina@utem.edu.my	aina123	0123456996
\.


--
-- TOC entry 4975 (class 0 OID 17150)
-- Dependencies: 222
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.house (house_id, house_no, floor_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	11	1
12	12	1
13	1	2
14	2	2
15	3	2
16	4	2
17	5	2
18	6	2
19	7	2
20	8	2
21	9	2
22	10	2
23	11	2
24	12	2
25	1	3
26	2	3
27	3	3
28	4	3
29	5	3
30	6	3
31	7	3
32	8	3
33	9	3
34	10	3
35	11	3
36	12	3
37	1	4
38	2	4
39	3	4
40	4	4
41	5	4
42	6	4
43	7	4
44	8	4
45	9	4
46	10	4
47	11	4
48	12	4
49	1	5
50	2	5
51	3	5
52	4	5
53	5	5
54	6	5
55	7	5
56	8	5
57	9	5
58	10	5
59	11	5
60	12	5
61	1	6
62	2	6
63	3	6
64	4	6
65	5	6
66	6	6
67	7	6
68	8	6
69	9	6
70	10	6
71	11	6
72	12	6
73	1	7
74	2	7
75	3	7
76	4	7
77	5	7
78	6	7
79	7	7
80	8	7
81	9	7
82	10	7
83	11	7
84	12	7
85	1	8
86	2	8
87	3	8
88	4	8
89	5	8
90	6	8
91	7	8
92	8	8
93	9	8
94	10	8
95	11	8
96	12	8
97	1	9
98	2	9
99	3	9
100	4	9
101	5	9
102	6	9
103	7	9
104	8	9
105	9	9
106	10	9
107	11	9
108	12	9
109	1	10
110	2	10
111	3	10
112	4	10
113	5	10
114	6	10
115	7	10
116	8	10
117	9	10
118	10	10
119	11	10
120	12	10
121	1	11
122	2	11
123	3	11
124	4	11
125	5	11
126	6	11
127	7	11
128	8	11
129	9	11
130	10	11
131	11	11
132	12	11
133	1	12
134	2	12
135	3	12
136	4	12
137	5	12
138	6	12
139	7	12
140	8	12
141	9	12
142	10	12
143	11	12
144	12	12
145	1	13
146	2	13
147	3	13
148	4	13
149	5	13
150	6	13
151	7	13
152	8	13
153	9	13
154	10	13
155	11	13
156	12	13
157	1	14
158	2	14
159	3	14
160	4	14
161	5	14
162	6	14
163	7	14
164	8	14
165	9	14
166	10	14
167	11	14
168	12	14
169	1	15
170	2	15
171	3	15
172	4	15
173	5	15
174	6	15
175	7	15
176	8	15
177	9	15
178	10	15
179	11	15
180	12	15
181	1	16
182	2	16
183	3	16
184	4	16
185	5	16
186	6	16
187	7	16
188	8	16
189	9	16
190	10	16
191	11	16
192	12	16
193	1	17
194	2	17
195	3	17
196	4	17
197	5	17
198	6	17
199	7	17
200	8	17
201	9	17
202	10	17
203	11	17
204	12	17
205	1	18
206	2	18
207	3	18
208	4	18
209	5	18
210	6	18
211	7	18
212	8	18
213	9	18
214	10	18
215	11	18
216	12	18
\.


--
-- TOC entry 4990 (class 0 OID 17268)
-- Dependencies: 237
-- Data for Name: maintenance_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_company (company_id, company_name, company_office_no, company_email) FROM stdin;
1	ProFix Services	0123456789	info@profixservices.com
2	HandySolutions Co.	9876543210	support@handysolutions.com
3	Elite Maintainers	1231231234	contact@elitemaintainers.com
\.


--
-- TOC entry 4988 (class 0 OID 17257)
-- Dependencies: 235
-- Data for Name: maintenance_worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_worker (worker_id, worker_no, name, email, password, phone_no, specialization, company_id) FROM stdin;
1	W001	Ali Ahmad	ali.ahmad@profixservices.com	ali	0112345678	Plumbing	1
2	W002	Sara Tan	sara.tan@handysolutions.com	sara	0123456789	Electrical	2
3	W003	John Lim	john.lim@elitemaintainers.com	john	0139876543	HVAC Systems	3
4	W004	Nina Yusof	nina.yusof@profixservices.com	nina	0198765432	Carpentry	1
5	W005	Peter Wong	peter.wong@handysolutions.com	peter	0167890123	General Maintenance	2
\.


--
-- TOC entry 4973 (class 0 OID 17140)
-- Dependencies: 220
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (room_id, room_no, hostel_block, capacity, current_occupants, house_id) FROM stdin;
1	SQ-1-1-A	Lekiu	2	1	1
2	SQ-1-1-B	Lekiu	2	2	1
3	SQ-1-1-C	Lekiu	2	2	1
4	SQ-1-1-D	Lekiu	2	2	1
5	SQ-1-1-E	Lekiu	2	1	1
6	SQ-1-2-A	Lekiu	2	2	2
7	SQ-1-2-B	Lekiu	2	2	2
8	SQ-1-2-C	Lekiu	2	1	2
9	SQ-1-2-D	Lekiu	2	2	2
10	SQ-1-2-E	Lekiu	2	2	2
11	SQ-1-3-A	Lekiu	2	2	3
12	SQ-1-3-B	Lekiu	2	1	3
13	SQ-1-3-C	Lekiu	2	2	3
14	SQ-1-3-D	Lekiu	2	2	3
15	SQ-1-3-E	Lekiu	2	2	3
\.


--
-- TOC entry 4992 (class 0 OID 17685)
-- Dependencies: 239
-- Data for Name: staff_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_log (log_id, staff_id, login_time, logout_time) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 17125)
-- Dependencies: 218
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, matric_no, name, email, password, phone_no, gender, course, faculty, year_of_study, room_id) FROM stdin;
1	B032210139	Nur Fathehah Binti Mohd Aris	B032210139@student.utem.edu.my	fathehah	0199590828	Female	Bachelor of Computer Science (Database Management) with Honours	Fakulti Teknologi Maklumat dan Komunikasi	3	1
2	B032210137	Afifah Syaza Huda Binti Ahmad	B032210137@student.utem.edu.my	afifah	0186670909	Female	Bachelor of Computer Science (Database Management) with Honours	Fakulti Teknologi Maklumat dan Komunikasi	3	3
3	B032210135	Amiera Badriesya Binti Kamal	B032210135@student.utem.edu.my	amiera	0178863773	Female	Bachelor of Computer Science (Database Management) with Honours	Fakulti Teknologi Maklumat dan Komunikasi	3	3
4	B032210267	Nurin Hannah Binti Zamberi	B032210267@student.utem.edu.my	nurin	0162235567	Female	Bachelor of Computer Science (Database Management) with Honours	Fakulti Teknologi Maklumat dan Komunikasi	3	4
5	B032210166	Nur Aqila Nadzira Binti Shahlan	B032210166@student.utem.edu.my	aqila	0175685078	Female	Bachelor of Computer Science (Database Management) with Honours	Fakulti Teknologi Maklumat dan Komunikasi	3	4
\.


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 225
-- Name: block_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_block_id_seq', 5, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 229
-- Name: complaint_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_complaint_id_seq', 8, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 232
-- Name: complaint_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_status_status_id_seq', 3, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 223
-- Name: floor_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.floor_floor_id_seq', 45, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 227
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hostel_staff_staff_id_seq', 5, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 221
-- Name: house_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_house_id_seq', 216, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 236
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_company_company_id_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 234
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_worker_worker_id_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 219
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_room_id_seq', 15, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 238
-- Name: staff_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_log_log_id_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 217
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 5, true);


--
-- TOC entry 4785 (class 2606 OID 17172)
-- Name: block block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_pkey PRIMARY KEY (block_id);


--
-- TOC entry 4797 (class 2606 OID 17223)
-- Name: complaint_assignment complaint_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT complaint_assignment_pkey PRIMARY KEY (complaint_id, worker_id);


--
-- TOC entry 4795 (class 2606 OID 17194)
-- Name: complaint complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (complaint_id);


--
-- TOC entry 4799 (class 2606 OID 17239)
-- Name: complaint_status complaint_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT complaint_status_pkey PRIMARY KEY (status_id);


--
-- TOC entry 4783 (class 2606 OID 17165)
-- Name: floor floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT floor_pkey PRIMARY KEY (floor_id);


--
-- TOC entry 4787 (class 2606 OID 17183)
-- Name: hostel_staff hostel_staff_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_email_key UNIQUE (email);


--
-- TOC entry 4789 (class 2606 OID 17185)
-- Name: hostel_staff hostel_staff_phone_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_phone_no_key UNIQUE (phone_no);


--
-- TOC entry 4791 (class 2606 OID 17179)
-- Name: hostel_staff hostel_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 4793 (class 2606 OID 17181)
-- Name: hostel_staff hostel_staff_staff_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_staff_no_key UNIQUE (staff_no);


--
-- TOC entry 4781 (class 2606 OID 17155)
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (house_id);


--
-- TOC entry 4807 (class 2606 OID 17275)
-- Name: maintenance_company maintenance_company_company_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company
    ADD CONSTRAINT maintenance_company_company_email_key UNIQUE (company_email);


--
-- TOC entry 4809 (class 2606 OID 17273)
-- Name: maintenance_company maintenance_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company
    ADD CONSTRAINT maintenance_company_pkey PRIMARY KEY (company_id);


--
-- TOC entry 4801 (class 2606 OID 17266)
-- Name: maintenance_worker maintenance_worker_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_email_key UNIQUE (email);


--
-- TOC entry 4803 (class 2606 OID 17262)
-- Name: maintenance_worker maintenance_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_pkey PRIMARY KEY (worker_id);


--
-- TOC entry 4805 (class 2606 OID 17264)
-- Name: maintenance_worker maintenance_worker_worker_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_worker_no_key UNIQUE (worker_no);


--
-- TOC entry 4777 (class 2606 OID 17146)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- TOC entry 4779 (class 2606 OID 17148)
-- Name: room room_room_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_no_key UNIQUE (room_no);


--
-- TOC entry 4811 (class 2606 OID 17690)
-- Name: staff_log staff_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_log
    ADD CONSTRAINT staff_log_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4769 (class 2606 OID 17136)
-- Name: student student_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_email_key UNIQUE (email);


--
-- TOC entry 4771 (class 2606 OID 17134)
-- Name: student student_matric_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_matric_no_key UNIQUE (matric_no);


--
-- TOC entry 4773 (class 2606 OID 17138)
-- Name: student student_phone_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_phone_no_key UNIQUE (phone_no);


--
-- TOC entry 4775 (class 2606 OID 17132)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4817 (class 2606 OID 17224)
-- Name: complaint_assignment complaint_assignment_complaint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT complaint_assignment_complaint_id_fkey FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4821 (class 2606 OID 17240)
-- Name: complaint_status complaint_status_complaint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT complaint_status_complaint_id_fkey FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id);


--
-- TOC entry 4815 (class 2606 OID 17301)
-- Name: floor fk_block; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT fk_block FOREIGN KEY (block_id) REFERENCES public.block(block_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 17336)
-- Name: maintenance_worker fk_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES public.maintenance_company(company_id);


--
-- TOC entry 4824 (class 2606 OID 17281)
-- Name: maintenance_worker fk_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT fk_company_id FOREIGN KEY (company_id) REFERENCES public.maintenance_company(company_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 17321)
-- Name: complaint_assignment fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_complaint FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 17331)
-- Name: complaint_status fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT fk_complaint FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id);


--
-- TOC entry 4814 (class 2606 OID 17296)
-- Name: house fk_floor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT fk_floor FOREIGN KEY (floor_id) REFERENCES public.floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 17291)
-- Name: room fk_house; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_house FOREIGN KEY (house_id) REFERENCES public.house(house_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 17286)
-- Name: student fk_room; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_room FOREIGN KEY (room_id) REFERENCES public.room(room_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 17306)
-- Name: block fk_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT fk_staff FOREIGN KEY (staff_id) REFERENCES public.hostel_staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 17326)
-- Name: complaint_assignment fk_worker; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_worker FOREIGN KEY (worker_id) REFERENCES public.maintenance_worker(worker_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4820 (class 2606 OID 17276)
-- Name: complaint_assignment fk_worker_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_worker_id FOREIGN KEY (worker_id) REFERENCES public.maintenance_worker(worker_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE complaint; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint TO fathehah WITH GRANT OPTION;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE complaint_assignment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_assignment TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO fathehah WITH GRANT OPTION;


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE complaint_status; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_status TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_status TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_status TO fathehah WITH GRANT OPTION;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE hostel_staff; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.hostel_staff TO paan WITH GRANT OPTION;


--
-- TOC entry 2098 (class 826 OID 17691)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO fathehah WITH GRANT OPTION;


-- Completed on 2025-01-22 01:17:30

--
-- PostgreSQL database dump complete
--

