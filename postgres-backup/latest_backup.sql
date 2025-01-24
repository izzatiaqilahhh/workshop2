--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-01-23 11:25:38

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
-- TOC entry 4999 (class 0 OID 0)
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
-- TOC entry 5002 (class 0 OID 0)
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
-- TOC entry 5004 (class 0 OID 0)
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
-- TOC entry 5006 (class 0 OID 0)
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
-- TOC entry 5008 (class 0 OID 0)
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
-- TOC entry 5010 (class 0 OID 0)
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
-- TOC entry 5012 (class 0 OID 0)
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
-- TOC entry 5014 (class 0 OID 0)
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
-- TOC entry 5016 (class 0 OID 0)
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
-- TOC entry 5017 (class 0 OID 0)
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
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 217
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- TOC entry 4754 (class 2604 OID 17781)
-- Name: block block_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block ALTER COLUMN block_id SET DEFAULT nextval('public.block_block_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 17782)
-- Name: complaint complaint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint ALTER COLUMN complaint_id SET DEFAULT nextval('public.complaint_complaint_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 17783)
-- Name: complaint_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status ALTER COLUMN status_id SET DEFAULT nextval('public.complaint_status_status_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 17784)
-- Name: floor floor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor ALTER COLUMN floor_id SET DEFAULT nextval('public.floor_floor_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 17785)
-- Name: hostel_staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff ALTER COLUMN staff_id SET DEFAULT nextval('public.hostel_staff_staff_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 17786)
-- Name: house house_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house ALTER COLUMN house_id SET DEFAULT nextval('public.house_house_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 17787)
-- Name: maintenance_company company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company ALTER COLUMN company_id SET DEFAULT nextval('public.maintenance_company_company_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 17788)
-- Name: maintenance_worker worker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker ALTER COLUMN worker_id SET DEFAULT nextval('public.maintenance_worker_worker_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17789)
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 17790)
-- Name: staff_log log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_log ALTER COLUMN log_id SET DEFAULT nextval('public.staff_log_log_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 17791)
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
4	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink.	\N	2024-12-04	\N	3	3
5	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2024-12-01	\N	4	4
6	Plumbing	No hot water in the shower	The water heater seems to be broken.	\N	2024-12-05	\N	5	4
7	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2025-02-06	\N	3	3
8	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink	\N	2025-01-08	\N	3	3
16	Maintenance	Leaking Pipe	Pipe in room is leaking causing water damage.	\N	2025-01-23	\N	101	1
2	facility	electrical	The power keeps tripping and we have no lights.	\\x89504e470d0a1a0a0000000d4948445200000780000004380806000000e8d3c143000000017352474200aece1ce90000000467414d410000b18f0bfc61050000d2d649444154785eecdd078015d5dd37e0ffeed27bef28cd062a88155b2c51d38cc99bfa46d36d696a7a37d5f4a22631d1f437f54b4c31312696d81bf68a88280888f45e77d9e5bbe7ee5cb85c1758da02c3f324e39d397366eed4cbeefeee39533568e0b0b59133471d7564dc7beff86caa296b636deef61ad8d1aaaa8aff2d8e030000000000ec8aaab3d73d440a7e9b0a7f5381c160303435ac973e3bd2674865390000000000c0aea2a64b97ee5fccc67363d0a0413163c60bd954a3c6d0a6646d637cb3ae4898036c4655a9edeffa16c0558d4d8201000000000076197b4400bc3efc2db5fe2d0f8085bfc0a6bcf433a2bc2b6821300000000000b02bc9fd33802bc3df62f45b18299666f31acb8aa300eb55a5ff67016f5536567c2dfcaf7122fd47080c0000000000ec32f69000380b7f8bc1efdae8ddab6ff4eb37303a75ee2cb801362b7d762c5bba3466cd7a21e6ce9b9d05c0eb43e0f2301800000000006067aace5e73ad18fe66ff1b3a6444ecb3ef01d1b94b17e12fd02ce9b3227d66a4cf8ef41952fa3c297ebfa4a0f40a0000000000b0b3ed010170630be094d0a496bffd070c6a2c06d80ae933247d9634a6bea52129bd020000000000ec3cb90f801b5bff360ea9db67806d953e4b4a9f2b5aff020000000000bb923da20be8524a939ef90bb0ad8a9f25a56f976404c10000000000c0ae60cf0880b394c6337f81ed61fd6789d4170000000000d8b5ec21cf004eff15d400dbcffacf149f2d0000000000c0ae630f69015c20a301b6a70d3e537cc0000000000000bb863d270006000000000000c8390130000000000000404e0880010000000000007242000c00000000000090130260000000000000809ca81a3470d8da6c7c9b0d1a34b0300ccaa6366dc68c1985e1856c6afb3aeaa823e3de7bc717c71b1aea63eddab585d78638e6d8938a65dba25dbb76317060bfe8dbb77b1c70c08898f8d484e8dcb953ac5eb52ae62f581a0d6bdbc5934f4e2cbc6743f17dabaaaab225813cb9ebce9ba3bababa788f37dee7a5570000000000809d67bb04c02904b9ecb2efc76b4e7f7556d23c7ffdebdfe2631ffd443128dd9e765400bccf3e23624dedc2e8d3b74f2caf6d174b57b78b798b56458fee3d22ea9747bf1e55d12a96c47efbed1f8f3ff15c3cf8c0c34260c82901300000000000b02bda2e01f06bcf38bd18003ff5d4c4b8e1fa1bb2d24d7bc52b5f11fbedb76f9c77defb0acbdc98956e1f3b22003ef5d413e32d6f7e4d7cffc77f8affdeb73496acea128b96ae8aaaeaea58b3664db4aaa98ece1ddb46ff1e6be263e79d10b3a73d10d75f7f67ac5add10850dc8d602e4850018000000000028e9d4b9532c5bba2c9bdabc2dadbf25b64b003c70e080183c78704c99323566cf9e9d956e5abf7e7d63c89021317dfaf478e1859959e9f6b1bd02e014e6a465478f1919a3460e8d7b9ea88dffdcb33c962e5d11ad6a1a8aa16f56b158afbebe216aeb5237d1ade3a8916be2c0bd56c5b4697363d6ac058df580dc688900b85bb76ef1c52f5d1c5fbbe41b3167ce9cac140000000000766f53a64ecec6366ee89011d9d8aeafa6a6266eb9e5a6b8e28a9fc41ffff8ffb2d28d7beb5bdf12ef7ffff971e2892f8ffafafaac74fbc912cc6d9302dc14b83637fc4d66cd9a5d5c667b87bfdb530a75870d1f1203fb778d3f5d3739fef09fd9b172c5b268d7b6f14436ac8d6848f5b246bea9ac43fb9a585bbf26ee7eb26d3c3ba77b1c7ffc6171d041a31a5708ec50fdfaf589b1630fcea69a3676ece862bdddc1fefbef17679cf1da1873c8e8ac040000000000f22105bc1b1b763729c4bdecb2cbe392af7d25def086d767a54d4bf353bd547f4784bfc93605c00306f48f9ffdfcaa787ad2846252bf35435af6a73ffd49f4eddb375bebaea35dfb76d1bb4787983865593c36ad6b74685b1d3535d5d19052df82626bbfb55585ffaf7fce6f43c3daa82ed4a96a581d373f581bd366af8d5ebdda46878e1d8af337e63def3933fef2975fbf64d86fbf7db21a4d4bcb7df6b31fcda63694cad3fc9d6573ef9fe657eeefc6f66557d2d4b9da156ce9f92e1dffedadf2bcb6e439edddbb577cea5317c5b8718767251b3afae8230af32f2cdc933db31200000000807c4b3db2befd1d6fcfa69aefacb79f55ec0116689ebffce56ff1898f7f32bef5ed6f6e34044ee5697eaa97eaef28db14007fffd2efc6c9279f146ddab4c94ab65c5af6e5a7bc3cbef9adaf6725bb8e7e7dfb44fb8eede2f1a9ed62f9f2d5515d385aa9d56f0a7b53ebe034143b7e2d94ad9b4e9970e1b5a65555acae5d13b73db422d6d4af89eeddbb34ae74131e7ae8b1c2897fe706c3d34f3f93cdddb94e39e584f8d18fbe954d6d3f95fb9c5a6feeccd07a73d23178f5ab4fdd609b7ff2935f168fcfeee6924bbe5bdcfee66ace35509a5f7e7c5e7c7156b16c6ba52f41a463de1c8f3f3e21befbdd1fc545179d1f471e796856da284d5f70c179c5f94f3cf154560a00000000906f279c70427cf9cb5f280ecd95ea7ee52b5f2c2e0bdb4b7903d1cae9f2f2ddd9a642e0960a7f936d0a800f39e49058bc78718c197d6893cdb39b331c32e6b0e23ac68d3b2a5bebaea357cf0ef1c2ece5316d4e43b4699d5af7a6a77c364a2170b1d56f4a7fd34b693a7b0ee8dab555d1b6b0ccf4c2b22beb3a44cfeeed1b176493fef5af1be2d04377cdee6e4bc17465687ae38db716873d5d0a6ad337c9aebefa1f5949a35ffce277d958cb183ffec1f8def7ae888f7ce4fdeb42e0f4fae10fbf3fbefdedcb8bf30100000000f6147ffdebdf8a8fe44cad80bffad52f65a51b97eaa4ba69993ffff9eaac14b68fa6b2c2d290174d85c02d19fe26db1400b76edd3a962e5d560c70b7d6a2458b8aebd89656c43b4aab9a88e5759d63e5eac281aa4e296ff1ffeb5afb36b6f86d1355d56d0b330a95ab5a6d30d4d4b489c5cbea63f1ca0ed1b66da16c1750d97d7165f7bca99567f9fc14eaa53ae79fffee62b857b94ce5fa36d7657573cc9cb9e1b3a437b7cdc9e6eaa4e95427b5502dd549fb9ab6b77cb94d49ad50fffef7ebb2a98ddb11db525aa67cdd9b6b8d5bb9becafaa57596a4f9a556bea5654ae733d5ddd83550526aadbed75e038baf95d23295cb958e4372f2c92f8b9ffffcf2b8ecb2afc7d7bef6b9183468409c71c62be3d8638f8cce9d3bc66b5e735a1c7cf0fae76977efde2d7af4e85eb8b75efad99142de4b2ffd497cf4a31f88f3ce7b57310c4ea1f0830f3e9ad50000000000d833d4d6d6c63bdff1eeb8f38e3be3ccb3ce8ccf5ffcd96cce4ba579a94eaa9b9649cbd2329a6a0dbba9815d5b0a793ffb99cfc7b7bff3adb8ecb2ef175fd3744b84bfc93605c079b7b6f0bf14e0a6e7fa6605e9ff45c5c6bfd5ada26df5a2e8503d3fdad6ac2e0c2ba24df5faa15dab555153bf28dab56d1faf7ed52bb225779e14b655765f3c6040df75a15c0afb52c8f799cf7cb5382f756d9ca4ae82d3f8ac59b38be5693a49eb4bad754beb4a755270b7b5d2fba7ed2b6f41bab96d4e9a532749752ebffca7c5f9a9a571dad70b2e3867dd3269ff2a972949c168b2b996be3b725bd23249a94eb2b1ed4d8e39e68875e7b239f593b41da5ed4add73a76d4a36760d542aed4b3a0e95eebbefc1e2b12897ae9f14aaa7737fce39ef88af7ffdfb71e1859f5e17b45f73cdbfe3ce3bc7c7d2a5cbe3da6baf8fc71e7bb258deb76fef68dfbe5d2c58b03056af6efa07907beeb93f6ebbedee38f5d413e3f6dbef29beffee66f8f0e18dafc31a5f0100000000b6460a72dffdeeb38bc1ee7bdef3ee2643e05496e6a53aa9aef0b76535d522765303bbbe3ffef1ffc56f7ff3db78ed19a7175fd3744bd96101f045175df0926f23a4b2dd497d7d7db46fdf3e1ad63664256552ebdfea36d1a5cdd2e8db616ef468bf387ab45d183ddb2f280ebdda2f8cee85e9c13d96c61d773f169ff9fae613fdf4fcdb52cbcb346cae856749e572a52195974b01620a04cba5b0afb25ea925670a3b37f50ce252885992eaa780b014963647f9b69702d0f2f76cce363777bf52a0595a77a95be2f216bd69bc32a0dc523b725bd232e5dd2997d65b6aa55b29d52d3f96cdd9bf14e0969649417c6af1bb25d27ba6fd4fc7219dd3f220385d1f697da5ed4daf69ba3c549f3c794af1f5befb1e8a19336616c79bd2a3478f983f7f4136d5b4d4edf3f1c78f8b1b6eb8a5f87ac4111b3e137857f297bffef9259f9769f8ea255f2eceffc4273fd6e4fc1b6fbabe381f000000006073d6ac59b341089cfeee58520a7f6fbef996629d5417d8366f7deb5be2acb79f55ec863dbda6e996a205f0261c7cf0e838e2b05151bfa62e7bbe6f14bb802e76035df86fc39a95317755df585adfb5d84ab8a1aaa630b429cc6b1d0dd1aa30d4447db48bb56beb63c58acd7f5326057ca5d69a69f8c0073e91cd494dc5370c77cb552e571a52794929942d0f0493d2740ae3d2780a70d3fa3717e296e6a716bfe5dbb5a58161f9b6a765cbdfb739dbdc9c3a252fbe382b1b5b6fdab417b2b16db7a3b7a57299caf7694a0a604be726b5ccdd9ce9d35fba0de5dbdd1c69bbd2f94c2d8653105cdeea389defd4323949afa56b342d337bf6ec6217d0471fdd387f637af7ee557ceddbb7cf46bb804ee16fa9dbe72baffcd5ba6702efaacf97beeaca9fc665975efe92211d9364dab4e94dcebfecb2cb8bf301000000009aa31402a7a0f77def3b3f2eb8f043c520b814fe9e77eef9c25fd80ed2337f2ff9da57e2e31ffb447cf4231f2fbea6e9d2338177b41d16005f7ae9e52f698e9eca7627ab6b1ba2579786e8d8be75d4d7a7c8b7b10be85237d0495561aaa630231dc8345e1df5515dd550180ae385c2d655cba36a6d6d5415cab64529242d0d3b4a0a9d530bce1416a6d070732ab72b0d9beb2679635260d89c9072672885b35b1a86ee4ce9fc5576d1dd92d27590aea5f256caa91be652089b5ecbbb65bef0c2cf14bb807ecb5b5edfacaec4a74d9bd16417d0e5e16f7a1670925ebffffd2be2e31fbf60970c81afbffe86e2e763e5f0c94f7cba38ffdbdffa4e93f3affde7bf8af301000000009a2b05bc29e84d81ef873f7c6131085e1ffed667b560e728f580b93b4b21efb7befdcdf8c4c73f19a567fea6d7349dca5b2204d60278136eb9e5ee58b6604a1cbc5fb762185cd5c4d15a5b4c84b304b81811a718b8f05aa85c5355f8a0ac2a4ca796c151932aec341b0b304bd3e5ad494b2d38536be0a69ee59aec8840b4d48574e93d9bb3cd5bb25fdb22ad276ddb1bdff8daace4a576f4b6f4efdf2f1b6bb4b116c749e93dcb5b910f1e3c301b6b39a56ddb6bafc6f72e75039db6bdb2fbe72475019d9e013c7ffec275fb5769e5ca95c5d7a65afe8e1ab5ff4bc2df92347df9e557c6273e71411c70c0be59e9ae6df5ead5c5d7da3acfda0000000000b69f14f4a6c0f7f7bfff43fcee77bf17feb2cb286f58ba3b6a2afc2d69c9105800bc09335f9c138b172f8ba346d644eb56110d8d79ee860ad36b1a1a624dfddac28763e1b5f001b9a66e6d34ac591df56b6a0bcb34644379bbe1969782b8d4dd6e65cbcaf4dcddf4dcd724056e95a15b7997c0e5dd3b6f6c7de5ddfd6e8df49cdad46d700a309bb3cdcda9b3bda43035b566ad7c3673e9b8ede86d49ef5d7e7e526be9cdadb71404a7d7745cb7d5a6baf84eef5179fe4b617e79d09b8ed1eb5ef7aae26b49daaf934f7e5936d568debcf9d95844e7ce1db3b18865cb96c7f2e5cb8b5d40575ab870717ce31b97be24fc2db9fbeefbe29bdfbc2c162d5a9c950000000000ec99529ef1d9cf7c3e3ef7d98b85bfb01d6c2afc2d69a9105800bc296bd7c6a4675e88aada17e2e4c3db465d434df159bfd5d51ba6c035352920ae8e36ad5b155e5b47bb360dd1b6754361bcaa6cc82a6f420af84acf6b2d0d9581ecb6b8e492ef1603c3f2f53ff8e0a3f18b5ffcae383fb5602d75fd5c9a570aee4aad73537929e44beb4b215ea97e1a9a7ab6ed9628bd4f0a4d93cd6d73d29c3adb4b6a199d94bf570a334bc769476e4b5a6f7aafd27ad3b1dfd87a53189deaa7303ad54dc7735bbb806eea1a2897deb3f21a4ea173e998955c7df53f8a41727a2d49d7de39e7bca3f80ce0cb2efb7a4c9cf84c3cfcf0e3c57969bd4b972e8fd7bce6b438f8e051c5b2d4fdf3ca95ab5ef20ce099335f5cb7dcc6a4e3f6e28b8dcfd60500000000005a4ea98be7a686dd59ca0a2fbcf082e2972a3616fe96a4f9a95eaa9f96db11aa060d1cb6d54d53d3c99831e38538eed80d5bee6da93beebc2d060d1ab8dd9a731f75d49171efbde38be30d0df5b176eddac26b431c73ec49c5b2e64a072645bdfbec33247af6ec10135f681fb73fb23656d7d647eb566b0b27a53a5a5547f468377fdd337e5b573744eb9abac27bae0f894bad863b55cf6d1c812d9402d714aeef8850bba5a52f35a420bbbc7beaddd15d77de1cd5d5d585fbbbaa38a44f8bc6d7ed277d96fde18fbf8bf3ce7b5fdc70fd8d59290000000000b0abe9d4b9532c5bba2c9bdabc2dadbf25b6a905707a5078870e1db2a9ad930293b48ebababaac64d7518a729e79666acc9db73c0edc6b75bcedd43671d03eeda37dbbb651575f138b96d6c69a86ea42dd56d1aaba2adab4ae8aaaea36515dd3ba3034be4655abc25078058ae16f6a15cde62d5fdef8c1bf74c9d2e22b0000000000b06bdad230774785bfc936b500fefd1f7e1be3c61d154f3d3531962cd9ba676a76edda2df6df7fbfb8e3f63be21def787756ba6db6570be04a0307f58f11c3074455d5da98316b45d455758f4eddfac5bdf73c1a7575aba27d9b866828b6fc2d3fa4a5f1aae818dbd63d327bae3cb4004efb90ba884e5d30a7aeb277772dd10238193a74484c9932359b020000000000d8b46d0a80070ce81f5ffbfa2571f4d1e3a275ebad6be15a5b5b1bb7dd7a7b7cfef35f88d9b3b7cf73397754009cb46edd26faf5ef1dddbab48d5e3dbbc661471c1ddff8e17f63f1922551959e0d9c1dcdf49e957ab49e998d01bbbb960a80010000000000b6c43605c0bbaa1d19000324026000000000006057b44dcf000600000000000060d7210006000000000000c8090130000000000000404e0880010000000000007262cf0980abb25780ed6183cf141f300000000000c0ae610f08801b83992a010db01dadff4cf1d9020000000000ec3af69016c08d01cddab56b8baf00db62fd6789f0170000000000d8b5ec190170ca68aaaa62d9d2a58dd300dba0f85952f84c29cf7fd3240000000000c0ce96fb00b894d1a461d6ac178a6500db227d96943e5704bf0000000000c0ae640f79067061a8aa8ab9f366c78b33673416036c85f419923e4b1a93dfd290945e010000000000769e3da20be8c656c08dff9b3275723c33e9a958ba6489670203cd923e2bd26746faec489f21a5cf9352eb5fad800100000000805d45d5a081c37297821e75d49171efbde38be3eb43deb585f1e27f5361fa6ff1359b93fe03b0a1eccb238de3d958f1b514fe36ceab9200030000000000bb88dc07c04965089c45be59e89bbbdd07b6bbaad2ff8be3c25f00000000006057b54704c0c986dd3d9707c0891018d8982ce02dbc64916ff1bf89f0170000000000d8d5ec310170a3520be04a026060635e1af296b700060000000000d8955467af7b88d4756ba9fbd672a9c06030189a1ad64b9f1d8dad7e372c070000000000d855548d1a79a8e6af0000000000000039b087b50006000000000000c82f0130000000000000404e0880010000000000007242000c000000000000901355a3461eba361b07d869ead6d4455dedeaa86fa88ff0a904000000007ba6aa889aea9a68dda66db46ed53a2b04604b68010cec74ab57af8a552b57447dbdf01700000000f6686ba3f877c2f4f7c2f4774300b69c0018d8a952cbdfdadad5d9140000000040a3f477c3f4f74300b68c0018d8a952b7cf00000000004df1f743802d27000676aae2337f01000000009ae0ef87005b4e000cec5c9ef90b000000006c8cbf1f026c310130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003bbbd1e3dbac797be74714c7cfac9e2f0b9cf7f263a77e99ccd05000000005ad221630f8931878cc9a600b6cda85123e3fffde977f1e043f7c6ef7effeb38e9e413b3396c4cd5a89187aecdc6c98156ad5ac511471c1e871f71680c193224d63634c473cf4d892953a6c6bdf78e8ff9f317643523860d1b1a03070e883beeb82b2b8196b774e9e26c6ccb75ecd821ce3bef9c78efd9ef8d76eddac533cf4c2e96efb3cf8858b870517cff7b97c61ffff8c7a8af6f2896ef0823471d10ef7ce73b62f0e0c1594985b56be3f1279e882baffc692c28bbff00000000208f3e7ff167e25def7a5771fca73ffd697ce3ebdf2e8e6f8bce9dbb6663c0b6183274ef18376e5c8c18312cfaf7ef170b172c8c29539f8ff1f7de174f3e39211a1a76dcdfd2b756f7eedde29ffffc5b2c5fb122fef6b7bf1733b0b1630f89b3df7b7e3cf0c083592d2ab57800dcba75eba8ababcba6763fbbeaf6d7d4d4c4596f3fb3f00febdb8b3743ba499f7b6e6a2c5eb4287af6ec59bca957afae8d5ffdead771e5953f8b11c387c795575d11cf3cf34c9c7bcefbb3b540cbdb9a00b84d9b36f18e77bc3dce7fdf79c5eb3d05bfdffbdef7e386eb6f2cce3ff5b453e2a31ffd48e11fb1e1f1ecb3cfc517bff8a5b8fbae7b8af3b6a7a1c386c4bffef5cf58b162654c9a34292bddd0c89107147e40ed1c73e6cc89ff7deb9931b5f08f2900000000e451bf7e7de3f63b6e8d7ffef3dae2f4e9a7bf268e3df6f898337b6e717a6b0980d9d9faf6ed13279d7c5274edba653d4f2e5ebc34fefbdf9b0bf7c09cac64e738fae871f1bef79f1b071d7460717ae9d2a5f1fcf3d3a24fefded1a7b06fc90b3366c62f7ef1abf8eb5fff1e6bd7ee3a6d475ff7fad7c617bff8f978cfbbcf8d871e7a383a75ee1437de785d5c77dd7fe22b5ffe5a568b4a2d1a00efb5d7e038e8e083e2e6ffde122b57aecc4a771f1d3a7488134f3a211e7fecf198366d7a56baf3f5ead533be7fe9778a376e0ac07efdebdfc6d34f4f8a356bd66435220e39644c9c79d6ffc6cb5f7e523cf2c8a3317cf8b06228f5e0030fc57bdf7b5e560b5ade9606c06f78c3ebe3231ffd48f187c9992fcc8cef7dffd2b8e6efd74443c3861f65d5d55571c6ebce888f7cf8a218506ce97e677cf5ab97c4e4679ecd6a6cbbb3cf7e6f7cfa339f2cfc207b464c78f2a9ac7443bfffc36fe3c8238f288ecf9b372fdef4c6b7ec529f1f00000000b0bd5c78d187e2820b3e142f3ff994e2f44dffbd312ebdf4f2f8c1e53f2c4e6f2d01303bd3c1a30f8e9ffef4c7d1b66d9bac64cbac58b122ce7eef793161c2c4aca465bdfbddef2cdc9b1f2c06be3ffcc115f1f0c38fc4bc79f3b3b98d3d6d8e1c3932ce3defbd71f8e187c5b5ffbc2ebef0852f477d7d7d5663e74abd80a6f0fab8634f2a06d7c99ffefcfb58bc78719c73f6fb8ad33b53754d751c7cd041c51e7ab7446ac8f9c8a38f46c30eeac1b4c502e014fea60ba7f096f1e0830fc4d4a9d31a67ec46f61eb2771c76e8a185b1b571fffd0fec12214e0aa57ff5eb9fc5800103e2f39ffb42dc72cb6dd99ca6a59b3cddec25026076b62d09803ff2910be3031ffc40b12be5cb7ff0a362f7ce75b59b6e91dfba4deb38f3ccb7c5073ef0fee8daa54b9c77fefbe2969b6fcde66e9bd20fb4871c72682c59dcf80f4fa5f2003879f1c559f1d6b7fe6fcc98fe42560200000000bbbfd420e3ee7bee2cf680f7d6b7bcad58f6a73fff21f6da6baf387adcb12f69c0b12504c0ec4cdffaf6d7e3e4934f8c0f5ff4f1b8fdf63bb2d2e639fef8e3e2fb977e3bfef3efebe3b39ffd4256da72def086ff89cf5ffce9c2fbdf109ffbdc17366838d894f7bef7ddf1c10fbd2ffefca7abe36b5ffb5656ba739dffbe73e2fcf3370c80d3f380972d5db64be45b679c717a7ce9cb1767535be60b177f39aeb9e69fd9d4f6d52201f0c08103e3c8230f8faaaaea78f4b1c76272f69cceddd1887d46c4e8830f8eb56b1b8acfd49d39f3c56ccecef1c94f7e34fef76d6f8d8f7df49371d34d3767a54d3be080fde217bffc69b46fdf3e2b1100b3f33537004edd3e4f78eaf16297ceaf3be3f5b172e5aa6c4ef3b46fdf2eaef9c7dfa37bb76e85cfa371dbf40367c9d604c0c98c1933e2d5af7e6df11fa8ad75cd3ffe5a7c3de3b5ff537c6d4995effde94f7f22ce3ee7ec183e6cdfe234bb870b2efc503c3b7972fceb5fffce4aa874ecb1c7c4d843c7c6e597fd202bd9b82da9bb33ed4adb997a51e8d0b143ac58be227ef6b39f17cb4adb973cf4e04371e79d7715c7772769bf5e7c71e666efad0346ee1fa79c724adc78e38df1d40efa06f05bfff7cdd1a963e775c777474bef97fcf10f7f2abe0200007b96534f7d79fcf82757c4473ffaf1f8fbdfae2996a5defcbef5ed6fc639e79c57ec19746b0980d9997efef32b8bdd0ebfe5cd6766255b66678595e939bfffef4fbf8fbbeeba3b2ef8d047b2d2c6aeda3ffbb94fc7a1871e1253a74e8def7ef7b2625654925adba656b7175df8d1b8f5d6dbb3d296d1b65ddbf8f2972e8e979d707cb46bd72e2b6d74ccd12f8be5cb5714c7fff0c7df1633af92d49af6c1071f2a2c7b494c9f3e232b6d19a905f098d1a3a3baba3a2b699e14c63ff6f8e33bac05f0966dcd561830a07f6ec2df246d7fda8fb43f478d3bb2b87f3b4befdebde2cd6f7953dc71c75d9b0d7f7bf4e8113fb9f28a0dc25fd8dd545555c59d77deb1c5e16f929649cb76efd13d6ab6b02b866db17af5ea6c6cbd418306c5ab5ffdaa6c8a2d9502e85208bd312958490167f990ca9a92c29af27a4d49a146799da6d655f99ea52064635efdea5716eb3547dac6547f779142bce6eedbeeacb49f1bbbb676a45de19ad896f35cdaf6144497879329fc4dc16f2adf1dc3dfe648c76c77ba9f0100002a75e8d03ece3bffdcf8e3fffb7dfcfb3fff8a3befba3d1e7bece162f8bb68d1e2b8aeec0bb1d75efbaf58b26449fcf4a75716eba4ba6999b4ec39e79ebdd55deac2ce3474e89062b7c91b93e60d19ba7736b5f3a49037dd939ff9f4e7b392d450aa7dfcf4673f89e38e3ba6d8c36ceafaf9273ff961ecbffffac63d57fee467f1e49313e2539ffe44b161564b4a7f3339ed15a7163e2f1e2f6cd755eb866f7ffbfbebc2dfe4173fffe506f36fbce1a6622fc4a905734b4b016e7a36f1030f3cb845437a5ceb8e0a7f931d1a00f7eddbb71892e625fc2d591702170e5fdabfb49f3bc3f1c71f1f353535f1f39ffd322bd9b8f48f6caa577e43a4e18f7fd44283dd436d6d6d4c796e4aecb7dffa6ff56ca9fdf6ddafb88ecd751bbd3d7dfef317c7e597ff60dd70e5955715cbd3b7acd871860d1d5a6c559742a434a496aea9a55d65509742b465cb97aeab3767ceec6259b9520bbaca75954beb4d65a5e02a0d7dfaf4dd64c8d3bfff80e2bad87d0d1a3cb078cdeca8d69b7996aeffd44ab65c0a9493bc06bf49691f5baae57d6a89db52ad7f0100803dc7c73efe91f8f0872f8c356beae2f9e79f8ff1e3c7c7dfafb9a6f877aff7bcfbbdc5bfe395ac5e5d1bef7ed77b8bf3529d54372d9396fdd8473f121ff9c845594dd87d5c79d515f1e31fffe0252d54935496e65d79e51559c9ce9182dd430e19133fbee2ca58b66c79561af1b2138e8bc1830765538d5ab76e1d6f7cd31bb2a9c6d6b4dfffdee5c5bf61bffce52765a52da34f9fdec5d74f7df273f1931fff74ddf0bbdffebe585e72e38dffdd60fe273ff9d9e2a3672bf76d4fb6c302e074928e3ee6a862489aa7f0b7a43c044efb59ba285bd2983107c7c2858b8adf12d89cd494fcfffeefb71bdc1069483709ec2e263efd748c1a352a9bda72a30e1c555c474b4acffabdecd21fac1b7ef2932bb339ec48295c290fe5d274ea663605c325298849ddcf9677559ac6535929a449c16e0a72efba7b7d20555a5779b83b7af4c1c520b03cb84a61f0f01123b2a90da5f5a6f769a910881d235d1b8f3efa5836059b97be34e08b1f0000c0ee6ed8b0e1b170e1c278cfbbcf89f3cf7b7f7cf4231f8f8b3fffc5f8d637bfd3e4efc9e9efd7695eaa93eaa665d2b28b172f8e61c38767b560f771f59fff1a078f3e38aef8f1e51b84c0693c95a5797fb9fa6f59e9cef1b2138e2db62ebde1869bb29246fbedd7f463fc2acb5377caf3e72f88e38e3f362b6959071e38aaf837d72de92560f5ea2def39747b2876013d66741c76d8a15b348c1d7b4871d91d65873c03b857af9ec58ba2baaa26962e5bba55fd6daf5cb1bc98d6b7942143f68af61d3a6653cd97be4dd0b953e768585b1f77dc7e67cc9b373f9bb3e3fdf0479715bba0fe9fd76fba9b51d89535f719c0c9073ff481e2b70b8f3ffe847861c6862dc73667afbd06c72db7fe37bef7bd4be3473fdc3edfbe6ace33802b75e9da391e7ef8c1626be014086fad8d3d0338951f78e081d954c4134f3cd1e473822bebdd70fd0df1bef77db038beb97554be77f933809f7d6e52b12cd9d87b97d7497ef6d39fc5d7bffead6caa51659d4f7cfc93c5d7f4cc987273e7ce8da38e3ca6d84a378571a9e5edc6a46e57cb9f29bab16755965a05a7f214f2a6968a952de84aad824be595eb4eca5b0557b6686ceabd2bbbd24d2d987bf6e8b9ee79a82529684ecba5edac7cce68e93d2b9f299a02edf2f5a46d4ad395cf002e2d5f5239bfb4dde98b0d95eb2bed63daae146e97dbdc334ecbb73bfd6097ce6549e539addcc6a47cfde5eb3ae6e8c6903f297fce6cb9f2edadac533a6e4d5d5795d74679ddf273593a5f952acf7753d7c9965e13255bbb4f4d29dd5b25a56b6253e7391d9bf22f3f946f4353e72f6d7f52fe3e49f9796d4ae97a4c7f5cd8d4759b6cee7897eea7a47cdb9bda86a6eea7a6d655b90de5d7665a67e574c9e6aef192cae3dcd47d5df959b3a5d76949699f162f5eb2c97d6fce6744d2dcf5010000bba657157e1ff9ee77bf1d93263d13e79ff7bec2cff7b3b239cdd3bf7fbff8c9953f8e7df7dd272ebce0a29704544df10c6076a62baffa51f4e8d133def4c6b76625517c46eefbde7f6e3cfcf02385fbe003c5b29f5cf9a362abdb2b7e74655c75d5cf8a65c95ffff6a798356b56bcff7d1764253bde37be71498c1e7370bcf215a767258d52cbe0dfffe1d7d9d47adffbdee5f17fbffe4d36d5e8073fbcb49841bde17fde9295ec78ef7ef73be3c28b1aff4e9da41e057efeb35fc59557fe342bd9b89df5ace533ce383dbef4e58bb3a92df3858bbf1cd75cf3cf6c6afbda21d1f2d0a1438be16f92c2d191071cb0c5c3de7bb76cffe8e9fd9ada8ecd0d69ff92b4bf43860c298eb794fafa35d16a1b9e659a3e003ef2d10bb329d8f53d35e1a9e2eb98d1638aaf5be2e0830f2abe3ef554e33af2a8149aa620b634a420b714d896dc3bfeae62d7f5e5f54adef086d7175fcbe7a575fcf8c73f2c966f4a7affd23229d44dcba570b8248da73a695e79bd141e97d74bdb9702e9529d349efce52f7f2b4ea760390d693c85bfcd914289144295070b29c05dbae4a5c17d0a7fd3bca47397cec5e94a69b952f895c29a64fe820dbf00540a6bba76ed527c2d57d97234852129b449a14c1ad27892b6374da76d2fcddf5448d3941412a580250548a5f5efbfff4b9f599b82a1143aa500a6542f854b69f97269db532bc6529d141c95073829e84beb484a752a83ab8d49816d0a8ecad75d19dca580b87c5fd271a90ccb9254965a6ea73aa97e3a5f95fb92d65dde05781a4fe7a23952f83b71e24bf72badb3b4be741cd2f14ac7b6248da73ae5c7398da763585e6f6baf896dd9a74ae97895777f9e8e63c9a6ce733a36a5b23424a56030d5496595db9f86adb96ed2f6a5eba6b44cdac6caeb368d3775bc4bf76e49294c2dd54bdb98d65d2eadabfc7e4aaf95e76e63520f04e99aded47ea5f59742e1d27694aef1f2ed4df5d2f696d76beabede98cd5da74d49e7b5fcde2f1dc7cae536f71951d2dcf5010000bb9ef48cdf37bef1cdd1bb77eff8e7b5ff88318734ff6f75e9199d6999b46c5a4773c25fd8d9162c5818ddbb77cba61aa540f2d24b7f500c7cbff7fd6f17c3d234fefdefff6083f037e9d3a74fcc9d3b2f9b6a19a9215279d7cf2513264c78c9f6dd7bcff8f8c3efff984dad377bd6ac6200dc92fef6b7bfc7d9ef3d7fddf0a73f5d5d0cda4f38e1f8acc6aee79fd7fe2bdef3ee7337d8eee60cef7ae7d9c56577941d12003ff1c493ebfe60be6cf9b2b8e3ce3be3f6dbefd8a2a1a5bb544cefd7d4766c6a48fb95f62f49fb9b1e8add92e6ce995b0c71d27380b754ead3fd94534f2ebec2eee2befbef8fb56bd7c6b1c76d79b713c7bfecf8a8afaf8ffbef7f202bc99752405bd9e236b59c4d416c29d84df5d20fd895c169a9f56f0a592bd79102d843c61e924d6d5c0a734b528bde14d21e35eea8aca4b06daf3ba35856deda378da7f5a77949daceb47d37ddb4be7bfab46d69bb362585472940289742af1472a421858ae5ad2037a5a950b8526ab5d61c2940aa94829b545e0a8152a893c2c9e7a64c294e27a9f55e73c2afe64821510a56cad757dea575490a8f5250531e92a7e54aa158b9f2c0b1f4eff5f6086d528bc0f2f72fbd4f3a6625a9ac7c5f4a2d1d2bdf3f8566a57ae935ed5b0a9c4a4aeb2cdf97349ecec5e6f625cd4ff5cab7b5241db392343fbd6f0ab94a9a3ace693c6d6f29c0dbda6b625bf6a929e978955ac526e9fd2b5bb536a5f25e4b41790a057784b46fe5ef97b6311dcbf2eb366d73e5f14ef7607997f0492a2bdfbfb4dd69fde5c16b5a6fe5b5557eee36252d9b3e8b36a572fd49daa674cda42f3f94a47acdb9af37a6f23a4dfb5e7e9d6e4cf9b595964bdbd5d4be575e834953d76073d7070000ec7a9e7c6242bcee75af8fe9d3a7c59ffef48778f39bdf98cdd9b8b7bcf5cdf1fb3ffc36a64d9b16af7ded19c575c0eee0d9679f2bf67c3b70e0fabf2d25bffae5ffc537befeed38e698a3e388230e2f8efffa57ff97cd6d94ba56eed4a9634c7872d37fd7d9de56ad5c155dba343672a9945a28bfed7fdf5e0c215370f9fe0f5c10757575d9dcf53a76ea547c8e774b5ab468713cf0c083eb86ef7ee7d26257d4a7bff6d5598d5d4fea6afba1871ede60bb9b33a4eef1d3b23bca0e098057ae5c19b7de7a7b2c5fb12c3a75ec1423860f2b9ca0f9c5ae3a9b3ba493dc92d2fb35b51d1b1bd2fea4fd4afb97f633ed6fdaef96f4f0238f15fb3f3feaa823b392e63be69871c5e0f889c79fcc4a60d79782b9071f7c305ef18a53a35dbbb659e9e6b56fdf2e5e71da69f1c0fd0f342bdcdb1da5803685ab954ac1e9cb5f7e72f17540e18794a6ea554aad86536bdd349c7adaa959e9a6a56e7f2aa52fa924a560f7de7bee2d4e974b3ff4a779a94edadef4195bd9d5f3d648a150a965590a365210bc3521d8f6d654a896c297a65ab16eabd2fe6eac7572492970ac0ca74acb95076029a029575a57532d9db75453c17a7abfd412bb5cda9e52b89f86a69487a74979abed249d87ca7d49d2b9d8dcbea4eba9a96593ca639d945a946fec382769df4b61e3d65e13dbb24f4d49d7690a1ab7e6be496174e9fc34d5fa737b49fb56a974eecbafdba4fc9a29bf164acaefcba4742e53b7db49e938545e5ba573b729a565cb83e84a1b5b7f92aedf5288dedcfb7a532ab7237d91b1749d6e4ce9cb9de5d2b55cb9ef4d9d93a4f21a6ceefa0000805dd79cd973e3cd6ffedf983cf9d9c2ef5a9befdaf6c2429da7274e8ab7bce57f63dedc97fefe0cbbaa1bae6fec15ed0d6f6c6c6453ee8f7ffc537cf2939f8d4f7cfcd3c5f14aaf7865e3df566fbffdf6e26b4b9933776ef4eedd2b3a66bf67a700fb2d6f79739cffbe738ac3f12f3b2e0e3b7c6c1c71e46171eeb9ef2d96bdebddef8861c3d67f617ef8f061317b76d37f036b291d3ab48fb66dda444bb7a0ce831df674e1d5ab56c72db7dc560c47d31f248f3aea88a8aede710f336e49693fd2fea4fd4acf384efb99f6b7a5dd79c79dc5fecfdff39e776625cdf7f6779c59f8077a8e2e36d8edfceca7bf882e5dbac4eb5fffd27f6c37e60d6f784374ecd4317edacc16a0bbab992f34fd5ce414a896a4407663f5925237cd496517cc9bb3b956ba4953217165596a9d9cb6b91440975a2f6f8bd4ca2c0563cd6959d67923dd3e974b41c6c6428e7229c8280f35537093ca2a5b51a6b03aadaf144e550657dbaab9c1500aeaca43b2ed1d4a97af3b0da56e814b9a0a4f2ba596dd955de46ead14a8556ed3e6c2a7746ed2721beba9a439c7baa9fdac2cdbda6b624bf7295d9395f54b0163ba4e536bd4d27551de127b63d276a6bae967a4d2f9296f6dbaa5ca5bf2a7a1b23bebcdddab49baced2b2693b4adbd49cfb7763d2f557be4dcd09b8d3674f3a96cdd1d435d4d49723b624f0dd1e9afb05aae69c9324af5fc80200803d4d5d6d5df4ebd737264d6afc7bd2a63cfdf4d3316060ffe232b03b99366d7af1ef24679df5b61834e8a53d685dff9f1b9acc5a52dd33cffcdff8f7bfaf8f2d7d56f6b67af081878a59d6f1c71f579cfec2173f1f9ffeccc7e3fcf3cfdde870d1451f8a9ffeec27c5d078e0a001c5e774a746552d2985d6a5903a0d3fbae2f2e8d4b953fce5ea0d1f73b82ba9aea98e316346c761871dba45c3d8b1871497dd517668225b0a8153489a9710b832fcbdedd69d13fe26e98f81e91b25871e3636defef633b3d2cdfb9f37bc2e0e3d746cfce8473f69b2593fecca6ebcf1a678e081070aff587daaf803e3e6a43a9ff8e4c763fcf8fbe2969b6fcd4af329b5ee6d4a6a5ddb5ca92be66297cc15dd406f2fe987864a4d95a510b8f4bcdfd41ab8fc19c15babb205680a2952d8db945230915e37d62aae1472944298522bc14ae5c1dea65a8e965a2ca7f929602a85702da93c542d1fb657d054b9def2ee5f37261dffd2f92805e8db6b9b522057b94d69a80ce8cba56e835378b82defdfd4b5d254d9d65c135bba4fa9256865ddf2d6a169b95496c2d3d41ab832b4af94ba294edb9bb67d7b281d83d2d09cf5968e653a47a5c03e5ddb9b6a7dbb25cab7a77cd898b40de9ba6daa656f539a0afbb7470bfb1da1b95f8669aeedbd3e000060c7db6fbf7d0a3fcb778d7bef1d9f956cdcf87bef2bd61db1cff0ac04761f975df6c358b1626531906c2a04ae94ba8b4e7557af5e1d975dbaf50d18b6d6dd77df13cb0bbf639f7bded9c590f1e28bbf144f3fbde92f6a2c59b2242ebaf0a3c5e5defffef38b65fff94f63ebe796f2bad79fb12e903ef7dcb3a363878ef1e18b3e16cf3cf36c5663d773fa6b5e1dbffaf5cfe2673fffc9160dbff8e555c56577941d9ec6a6703485a4e521705555553677f7d264f8dbc2fd9f57faf11557156fda8f7eeca278f35bde94956edc3bdff58ec28dfed9b8e79e7be31fffb8362b85ddcb073ef0a1c23f42cbe2473ffac1ba2e2c9a92c2bd2baef8512c5bb62c2eb8e0c2ac349f1e7ee8e175dd2d972bb59e2d3d5337d56bcef37ccb6d69fda694ba76de6bafbdb292f552599ad7540be214446f6cb92d95ae87f26021858aa52e55cba5b2526bbbf49a829bca40a6f8ef40164a2669bd95cfcf2c8575a5a0b014446dee19f729144debdb5ce0d354805d192296c2e7cae0b0727fd236a6f7ac7c266a4bab7cff5270d654ebc792ad0dca5377bfe93c6ea91482a667c36e8dd2716eeadc9682afa682e5e65e135bbb4fcd91c2d3142e6fae9be0a634e7d9b25baba97b38bd5f3a5e1b53baaeb6542940ded26bae148a37756ecb95d6dfd49701d2bd5efaf24873efebedada96b2b9535b7c56fa5edbd3e000060e738f2a8a38aaff7dc7d4ff1351930a07f7cffd2ef1687345e72eff8c690f888c38f28bec2ee24f5a8fabef77da8d83be59faffe439c79d6db9a6cf098f2afd4d5f29ffefc87e8debd5bbcff7d17c4ac592ddf8d720a71afbaeae73174e890f8c0fbcf8b850b16c63bdef19ee2338a53cfb2956ebae9e678cb9bcf8cc71f7f228e3bfed8624f70a955739a6e4935598bd8e38e3d29c61e7264bce94dff5b6c68ba2bfbe7b5ff2a3e4b393d53794b8677bdf3ece2b23b4a8b34c74d21690a4b972c595cfcc34eea377c77347cf8d0e2f62f5ebc6897087f93f4dce10fbcff8278e28927e3339ff944fcfaff7e1e679c717ab46fdf3eab919e7fda3e0e3ffcb0f8e6372f890f7ff843c56f7e7cfc639f8ab56bd7663560f7929e1172ce39e7c53efbec13fff79b5f478f1eddb339ebf5e9db3b7e5398376cd8b038fbec7376c87345962d5d5e7c1d38b0f9e1c6a041838aaf4b972c2bbe6e2fef7bdf078b2d7dd3b37bcba5d6b3a9456f295cdd58bd1ffff887c5d7f44c87f2c037956f490be24db9e6efd7149f275cde9a378da7b26f7feb3bc5e9145897b62549d3e9fdd373824b5217d6956177a98bd792ca568a29284941d15d776fd8b23129af9bc653c8520a62d26b0a928e397a7dd052ea06b7bc45650a04d3facb0399d42d6c79d7b71b6b399a429bf2ae759b0a3d9b0a7bd3b332d37b96873e955dd1a6f74afb5359de54d7ce691f2a9ff79ad6bdb9169f4d2905545b1a48a5f72f5f261df774cc4ae7a3a9e0ab39ddef36259dbf749c2bf7afb28be172a5f72d6dcfd668ea38a7f15456ba3ed331d89a6b626bf669532ad75319ce35759e2bbf5891f6ada990767b2adfced2fb9542fad2fd56fee582f2fb794b95bac42edfe7f49e9bea1e3b6d4f53cf7d6e4a53eb4feb4eeb28b598df92fb7a6ba5cfd3caf39faeadf2fd4ce3a96c735f6ad998edbd3e000060e738f2c8238a41d3840913a2759bd6f1810fbe3ffe7bf38d71f24927158734fefef7bfaf38ef89c71f2fb6863cf2280130bba7a7263c156f7ae35b8ba1e8c73ffee1f8cff5d7161be795ba2bfec8472f2c96a5ae9627177ec77fe31bffb7c503d472bffdcdef8abf67bff7ecf7147b864d0d36bffffd1fc4ab5ef9dae2738b2fbbf487f1858bbf1caf7fdd9be2631ffd64b19bea238e38bc9825cd993337befeb56f666b62531aea1be2a1871e8e071e78708b86471e79b4b8ec8e52356ae4a12d9602b669d326868f181e139f9ab85b868fe99b1b071cb07ff1a1f64d7d4362676addba75b11be877bdfbedc56fa0a48be6d9679f8b9a5635eb1eda3d75eab4c20d7df92eff6d09f62c4b972ecec6b6dc91471d193ffbd955b172c58af8ca57be1ad766df9649dd187fe10b9f8f9aea9a78f77bde5b7cdec18e3074e8def19ffffc3b962c5d1acf3cf3d267db3665df7df78df6eddbc52b5ff1eae2b323b65629c0adecaaf9def1776d10d8feeca73f8baf7ffd5bd9d47a9baa577a067092ba604e816b0a8553b7cc49e57ba710f7ec73ce2e76d95c2ed54b416d69b92405ba29942e57be5c53f39bda87d236a6d6c169fd29a8480149a91bd61478a520a1dcc6ba682d0f8e53a8d254b7c4e5eb4b816453ddd0a610a83c9049e16f795098d69142a9caf030053d95c14de5b2e575cab7b1b4df25a99bdb542fbd9607cd1bab97c2a6f220bb721f92f2759502a1ca63948e61e5bacadfb3727b2a95f6afb45d254d9d8f1412a5b0b4a4b44ce99895afabfc3d4bcb555e07e5e73f29df8fd2f1282d93f629059ce5fb595259b7242d935acd965f334d9df3f2e59a9adfdc6b22d9927dda94cafba8a9f3d1d479aebc5fd2755ff99ea94e6ab1dcd4f5d79c6d4b4ad7633a2795d744f9b9afbcaed3b14ccfe42d7fffa6b6a7748c2b8f7de535986c6cdfd27ba7f76aea33a3b4fecd6defc63e73ca8f7d92b6a1f25e2c1da3d279dbd831aebc4ed37acacf77699fd2970e2adfb35ce5fb95546e5773d7070000ecfafef0c7df157eaeef13dff9ce77e3a31ff9700c1d36b4f0b3ff75f1d5af5e529cffb9cf7db6f07bd4ab62ca7353e23bdffd5e7cea539f8c1766cc8833cf7c47717e7375eedc351b835d430a545ffbdad7147bfe2af57a9b72afd458ef5fd7fe3bfef4a7aba3a161c7857bcdd5b76f9ff8f92fae2a765bfdd7bffc3d7ef0831fc5c2858bb2b9eba58684679ffdae78f77bde154b962c8d0f7df0a29d125e17c3f4f3cf8d934f3a2de6cf5f909536cfdfff7e756199f9f1def79e9795ecd9aa5a320066c74b41f051e38e8c43c71e1243860e2996a587ebdf75d7bdf1f8638f6bf5cb2e675b02e0243d33e4aaabae8cbdf7de2b9e7bf6b9e23fb6e907cdf40588f3ce3d2fa64c793eabb9631c78d0a878d7bbde19030634afdbd514fafeea97bf8c891337fdbc05f2654b83ad3dcdc682b05dc9eeb08d7b9a8d858dbb92a682e51d2905ad9581f5f6b0bdf7a3a58f0b0000b0e3fccfffbc2ebefd9dc62feea7bf7b5dfcf92fc41d77dc599c2e39fef8e3e2ab977c795d2f7a175e70515c7bed75c5f1e61200b3ab6adbb64decbdf7dec5ae8b9f9b32b5d8ca7657d3ae5dbbf8f8273e526c7c931a37de79c75d31a9ac4153bf7efde2b4d34e2986c077dc7e677cf18b5fd9e2f0757b79ddeb5e1b5ffcd2e7e3b1c71e2ff666db5c43870c89d35e716afcfdefff882f7ee12b59e99e4d000cec54db1a0027a97781f450fa73cf3ba7f8adaa2baffc69fce42757465d6d5d5603762e61c7a6ed0ee1eaee1036ee6976f573d2d25ffc28bddf8eb88f04c00000c0a68c3a7064b1d7bb6bff796dd4d5adc94a37d4ba75ab38fdf4d7c4d39326c5934f4cc84a9b4f000cdbee9043c6c4dbce7c6b8c3beac8e8d4b953561ac5d0fafe071e8c6bfefe8fb8f1c6ff66a53b47fa5bff57bef28538e1c4138ae17a73a55ce0fefb1f884bbefa8d6dea79334f04c0c04eb53d026060f7a6752d5b634f0ee5d3bea767f894ee97d23d54d915fbf6220006000076360130c096a9ce5e010080dd407aee710a7c5397cf6948e3a9eb67812a000000008916c0c04ea5053000000000b0295a00036c192d80010000000000007242000c0000000000009013026060e7aaca5e01000000002af9fb21c0161300033b554d754d360600000000b0217f3f04d872026060a76adda66d360600000000b0217f3f04d872026060a76addaa75b4f1431c000000005021fddd30fdfd10802d23000676bab66ddb45bbf61da2a6a6c6333d00000000604f5615c5bf13a6bf17a6bf1b02b0e5aa468d3c746d360e000000000000c06e4c0b60000000000000809c100003000000000000e4840018000000000000202704c0000000000000003951d5a953e7b5d93800000000000000bbb1aa458b570a8001000000000000724017d00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e48400180000000000002027aa162d5eb9361b0700803d469bd635d1aa5575d4d45447757555560a00ecee1a1ad6467d7d43ac59d310b575f559290000ec3904c00000ec5152f0dbb66d2ba12f00ec015218bc7af51a413000007b145d400300b0c768dfae75b46fdf5af80b007b88f46f7efab73ffd0c0000007b0a013000007b84f487df366d6ab22900604f927e0610020300b0a710000300907ba9db67e12f00ecd9d2cf02e967020000c83b01300000b9979ef90b00e067020000f60402600000722db5f4f1cc5f0020493f1368050c0040de09800100c8b556adfcc80b00ace767030000f2ce4fbc0000e45a4d8d1f790180f5fc6c000040def9891700805cd3fd330050cecf060000e49d0018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809ca85ab478e5da6c1c000072a76b9776d918d0f2ea62e99c79b1acbe71aa5df7fed17d37be25572d7c3116ae6a1cafe9d42bfa746edd3801ec76162fc96e660000c82101300000b92600869d69525cf6dab3e237331ba78ef9d27d71d9ab1bc77747ffbaf088f8c25d8de303defedbf8c785fb364e00bb1d0130000079a60b68000000000000809c100003000000000000e4840018000000000000202704c0000000ecc256c5e47f5f1e179ffde638e594d38ac36bcefa507ce3b7f7c70b9b798467dd9c47e2b7dff8509cf59ac6e5de78f637e3b78f2d2cce7be4d71f8f8f7dac71f8d6f5b38a655b6f565cffadd2fabe13c5d5d5cd89877ffbcd38fb8d8def7dca1bcf2d6cf32331a7ae7109000000d85104c0000000b4882993276563cd5337e7c6b8f8f493e3ad9fff6d5cf7c8d458b87061719835717c5c7de907e28c13df12dfbcb731d0adb4e0e6cfc519af39372ebd7a7c4c9cd5b8dcd447fe1297bee70d71ee9fa7c70b0fdd16b7deda38dc397149b654f335d4d76763c992987867697d77c6c4054fc58fce7c7d9c73e95fe291a98defbd70ea23856d3e37ce38f38a98200406000060071200030000b0eb5972437cf2cd9f8deb5e2ca5a5d5d1ae4bf7e8debd4bb42bfd265b3725fe7cc139715945a25a37e1f238fb5337c49c86ac60ddb21da3752c8b87befde1f8f9946cd6569af5fcc657f0dc959f8e5f3e57d8a6ea76d1a563ebacb451dd73bf8a4f5db16541380000006c090130000000bb98bab8fd1bdf88db9765939d0e88737f716bdc79f3f571e38d37c59dfff941bc7eafecd7d98669f19b2ffe2aa6374e152c8d6b2efd7d4c2b85bf1b2c7b4bdc7edd25716aaf19316d66367fbb9b1977ddb524c65ef4fbb8f3bedbe3e6dbee8a7bd27bf659ffebf7cc7f5e1d0f66e3000000b0bd0980010000d8b5d4dd187fb9a994fe56c7e8f32f8d730f6e974d17f438323efb8db7c5806c329efb73fc5f29519d7575fcf5a152fafbd2655bf73925bef495d746cf6c7a47687ff2e7e347678d88d2bb16dff3632746fb6c3a164d8967b6bcd76900000068160130000000bb967bee8e75196e1c1eaf7d43f76cbcccbe6f8ed7ed9b8dc7a278f0deac4be6c79e8cc98d63054d2fdbfad0d7c769fdb2891de0e0a38f8d0d3b7e2ebce7616362dde6c6dc983d2b1b05000080ed4c000c0000c0ae65e9f258998dc6807de280ca34b5a85ff4ed9d8d16cc78f699c691bafa58971d6f74d90362bfe1d9e80ed0aa55136fdaa57374ca4601000060471200030000b0db6ba85f938d010000c09e4d000c0000c0ae6be19c68bab7e4ba585396f976ebd3371b2b336b5a4ccd46373425a64ecf46010000206704c0000000ec5a0ed827f6ca4663e58371cfa3d978b9ba3be3eec7b2f182bd87674fd82d5fb6e1fef8efcd75d94499e937c56dd3b271000000c8190130000000bb9661a7c72b8665e3313faebdea1fb1209b6a541713aef851dc527a5070f5d878e5ab3a378e6fb0eccaf8ef973f11d7cc290b81573d16dfbbf0e7f15c3609000000792300060000a045ccfaf3fbe394534edbe8f0ae5f4cc96a0e8e777ff0d4e8944dad1cffd5f89f377d31aefadbed71fbed7f8fab3ef1c678ef6fa64543716e75ecf5ce8fc41bbb14270a365c3696dd155f79d509f1b2ec3d5e76e2d9f1fb193da34fcf6c3e000000e48c001800008016d1b06a492c5cb870a3c382a5eb5beab63efe0b71c5bb8746eb6c7ad994ebe2aa4b3e161ff9c8d7e2aa9b5f8c52cd4ec75c1c3ffb40d6fd73262dfbeb8f1d115dd7fdc65b17cbb3f7585ed7298ef9c26fe303fb67b3000000206704c0000000ec825ac7c80ffc36aeb9ecac38a44729065eafbadde038e933bf8fff5cf6aae89195add73af67eeb0fe33fd75e1517bdf1c8d8bf5ff7e8debd7b0c19f386b8e8177f89cb5edd3dab07000000f953b568f1cab5d9380000e44ed72eedb2316077b66ae18bb170553651d3297af5e9bcae75f096ab8b6b3e704c7c657ce3d45eeffe7ff1d70f0c6d9c00f6088b97943e500000207fb4000600006097d7ae7bffe8df3f1b361bfeae8a858fff272efbf837e35f0bb2a2727577c6dd8f65e3d13ef63f48f80b0000407e0880010000c89179f1a7734e8e53de7d71fce696bfc497cefa58fcf5f185d1d8d6af3118fec2999f8bffae2c1644743a2e5e312e1b070000801cd005340000b9a60b68d8f3d44db822ce7cefafe2b9baac6063aa7bc7a9dff86d7ced24cf04863d8d2ea00100c8332d80010000c895d623df1fbfbbe6fbf1f6437a6ca4abe8ea6837f8c4f8ccefff22fc0500002077b400060020d7b400863ddcaa85f1e2338fc7bd931b1f06dc61e0c171c80183a34fe74d3f4518c8372d800100c83301300000b9260006002a09800100c8335d4003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c0000b09bab5fbd3c56d76713bb8086da95b1a2b6219b62c76a88da852fc6b3cf4d8d190beb0a5399fae531ebf9a9f1ecf37362e92e746d000000b0e3552d5abc726d360e0000b9d3b54bbb6c8c5dc9b407fe1b4fcccf2632356dbb45bfa123e2c0bdbb464d56b6e8a9bbe3ee691de2c0d3c6c45e59d92e6ffa2371dd8415b1f75147c7a8ae59d98eb4f8a9b8e1f6a9b1b2eb3ef1f2e34744c7ac78e79911f75cfb78ccaee91747bcf290189095b223d4c6f3e3ef8847e6d446fac5becdc0c3e255637b472c9c1837dd352596157fdbef16234f1b17fbb649e3bba096be5f5a5271df62f7fafcda832c5eb22a1b030080fcd1021800006871f575b5515bdf2a3a77eb1addb3a1e3da4531f5b17be3bf8f2f58d78ab1614d5dd4d6d6c56ed580b1be719bd7b45403d8ce7d63effebd63d05efd7681f037e955d896de3170c8a0c2189b372deefae7bfe386c71765d35ba076464c9d531bedf73a325e7bfa2b1bc3df8259535e8865d53de2a0535e19af3b7d170e7f9396be5f5a52b66f1a600300002d4d000c0000ec1c6d7ac7a8230f8b71d970ec8927c691035bc78aa91362e2f2ac0e9b57dd23f63becb0387448a7ac60676b17830f3e2c0e3fa077eccab9632e2c5f15ab0b2f1dbbf6d8e097fb95ab6b0bf757e7e8ae03040000803d922ea00100c8355d40ef9aa6dcf3ef7874f9de71fccb47468facac68fe1371fdddd3a3d341af8c6386442c78fcb6b87d6a87187dfae13134abb272d6d3f1e053d363feb2ba585bd53a3af5d83b461fb94ff42ef51b9dd42f8ec90f3c164fcf5f1175f50d51d5aa53f4d9f7e03862f8faeea5a37e7e4c1c3f21262f58166bd656474ddb2eb1d7c187c4e87e65d74cc3d278f6a14763d29cc667ecd6b4ed18030e38340e19dc7ee3dfa69d7a7ffcfdf11531f4d897c5e8ee59d906ebd9c8f61434ac98158f3f3821a62d5e1df585391dfb1d18c7f69d13b76cb21bd917e2feeb27c6f2bd0e8f130ee852367d70ecb766723cfcfca2a82dec5fab4e7d62f4b84362f0466f89caf564163f1db7de3b3f7a9775d15b3ff799b8e789e7b37350136dbb0e8a31878f8cfec5752f89276fbf3f9eefb07fbceab08165d3fbc5b13d66c5f889f36379f1587689e1871e19237b961dc9ecbc4d9cdb784eda741b1a471cb8369eb86fc3f72fb7f2d9fbe296c9f531ec9871b17f7906def0623cf0df09b164c0a171d2a86ea920963cf7683c30796e2c2d9ccce2b5d37b781c76d8d0e8563a091be98eb8d815f9dc9e71f4f1fb455a53a96bf27d46b789998f4e8f85b5ed363cdfe51a56c6b4471f8c275f2c3bf7fb8d892387758eeae2fbcd8bbadabac201691dad6baaa2f7c893e3f0c18dcbbdf0e423f1c48c25b1724d61b99ab6d16df0c8387c54bfe8509d1dd315f55157573898adda44ebc261ecddbb67cc9d3b3f1aea6a634de1fa69ddba26aada0f5ab7dd1b6ae679d9c26332eab00e31f58129856352d8e6f6fd62ecb18744af790fc79d8fcd29ac3fed47e7183cf6b0185bbacf4af7cbd10745eb090fc7338b6ab37333228e387c487429bfd156cd8e271f9a1453b27bb655a7ee31e2c04363ff75377f760d0f3e20062f7d2626cc5d11f53d47c5ebc6357de7d42f9a12f73dfc6ccc5b5e17f5c5f5f58cfd0f392446acbb209a7f2f35ac78211ebeefe998b9acecdeedf5425cff786cf0f9c5ae4317d00000e4d946ff66010000d0e2d6d4477de1d794ea8dfca6d230fbf1b8ed81a9b1accd801875c41171d4c8bed16ac97371f7ad1362deba7ea317c4a3b7de1b4f2c88e83de4e038f6b8436354ff9a983fe1deb8ebd9daacd2b29870c7033171714d0c38e88878f97187c43e5d57c5d407c6c7630bb32ab12a9eb9fbee787ceedae899d633eee018d6754dcc78e4aeb867ea960407ab62caf8f1f1f8ac35d16dc8c8386cec81b17fb63de5dd5da7ee7cc7dff6704c5dde2e06ee3b260e3b6478f45cf154dc3169f166ba91ad2fccaf8dda757de8364eaf98f6443cb6a46b0c3fe8c01833bc67b45a3e2b1eba77522ccd6abd54e57a320da9bcac8bde6593e2b6f19363514ddf183deef838e1f061d16de5f4b8efaea7a270c80b1a624d5a4f0a26cba7e74f8afb9e2f1cef512363cc7e03a253fda29874df23f1c2bab75b148fa5f336b73e7a0e3bb0709c46c6de6d5e88fb1e9a152b36d14570fbc1bda353dda298316d5956d2a861da8c7861555574ebdb187dae9cfa60dcfee49ca8ebba778c1e3b26c6ecdb376a164c8cdbcaaf9d8d7447dcd815797d45d7e4f3e2e947e744cd801171d0a81131b8c9feb71be28507ef8a875ea88b6e230e89134e3a2246a773ffe4f8183fad702d761b10fbed53d8fe42cdd6dd0615c687c7e0e2e6a66be6aeb8fff955d161d07e71d47147c4a143bac4cae71f8edb1e4b0fcf6e17fd870e8ffd0a955b17a63af5298ca765fba7f50d8f7e695b5a778bbd0be3fb0ded131dd22a5fa299e7658b8ec98278eac925d1ebc0c3e2d8b17b47f7ba59f1e87df7c63d4fac8c9ea30e8b138ed827fab45a1ed31e78249e29dd8a456b62f6230fc7f436831acfcdb06e513ff7a9b8e5f6b2ebb5616e3c74c7233179599b183cf2d038f688fd6240cdd2787afc9df1e8fc751b5bd886da58f6fc53f1f48a2e316ce40171d0d00dbe62b24ec3fc09f1df3b27c6fce819c30e39a2b06d697d8be2893bef2fdbb666de4bc57bf7b198b1aae2de7d764556010000a06509800100805dc4aa98f2dcdca8adea1abdfa65451b58164f4d98116b7aec172f3b66648ce8db33fa0d3b284e387648745c313d264c29a5369d63f0fe23e290238e892346f68f5eddfac48831636258e786583067565667412c5cda109df73e38c6eedd333a15eaec7fe4e171e44107c4908e8d6152c38c09f1f4c27631a4b49e5efd63d491c7c7d8be6b63eed3cfc4dc62adcd4beb79725e44ffb1c7c7b8918363d0c0c1b1df98a3e2b0d4ddf5f393a294492f78fad9985ddf2d0e38e1e818bb6fff42bde131f6f843a3efdaad0b916adb0c88a30bc769bfbd07c7909187c5cbf6ed1a6b97ce89e9dbdabdf6bcc5b1646da7187ac84131a457c7e8d677448c1b77488c3e707074aa08093750d8b7fd5e76488c4adbb3ef41f1b243fa479b35f36346764a1aa63e135356b48e4187af3f4ea38e3c260ee8501b1b648595da0c8cfeddaa63d9cc6959009dd4c6b33316c4da4e03639ff420e28699f1e884c249e877709c72e47e316460ffc66d183b20da6c70ed6c89aae83bfaf838f6a0e1317cd8c0e8d1647fd74b0a87ab2eaafbec17e3f6ed13dd3af68c21630e8ba3c78c8a7dfad6142ed53e8565bb476a48daaa73bfc2f890e8d7392dd73a7a0d1b11071e362e8e3ba850d6ad670c2a9cc383fab68ad5f36617f6b34df4183c24860fe814ad0ab5dbf52c8ca765fba7f50d899e6985359d6240617cf8e0ee9bee8a7b33e7654bf5296ce7a8813da3d7c09171ec7e3d62cde2a5d1e1c0a38af759f15a397460b45fbb38e66db0fec239ee7cc0fa735358c72963fa46cdd2e7e3c9198d17d5d28913635a5db738f0f82363f4b03ed1abef90c2fd71648ce8b822a63ef5fc06d7c89a8e7bc7892716f629ed7fbf8d748dde79408c2cecef5169df0bdbdb2dadefd0bda2cbda853167665627b3b97ba9c97bf7d843a2cf56debb000000db4a000c0000ec1cb573e3c9f10fc43dc5e1beb8f9fadbe2d179f5d169c8be31bca9c4aa764ecc5b16d1a557efa85fbe3c969586aaaed1bd5d432c9c37a7b15e75ebe8317078ec9dbab0ad5f5dac33ef85a9316f65e3ec461da37de13d96cd981813672f2e76ef1cd129faeddd27bab469fc3569ce9c85b1a65df7e8d36ee5faf75abe32ba77eb5cd89605f1e2e262b5cd2aaea74defd87b40f9af5fd5d16f68bfe8b02e085b11b3e6af88e8da378694752b1bd12df6eed774fbcdcde9d0ab6f14b3c44cfb9e5da27dd447ddd6649de53ab58bb685ed9d3e6172cc5a94babb2de8dc2786f4ed14d9a16b5af75e31b86c7e759f6ed125d6c49a6c7b5e9cbb28d6b6e91983fa96afa44d0c1dd83daab2a9a6b589e1437a47ab95b362eabcaca87646cc5cd810dd070f6d3c0673e7c682fa36d16faffe1bfc125cdd77ef18d0beecdad9225da257bf4ded70d2213ab4ab8e86f953e3a1e7e7c78ada1466a6f0b67ff46a5bdef977a59ae8dc77488c48dd2437d4c58ac2b5b768f6d498b1645309fb56dacc79d9329dd3ead6a92e36e56f13ed3b96bf4175e17c3644c306bbd22a7a0f1ab0e1b919d43f7ad7ac89c5f31715a66ae3c5f9c59b3ffad697ddfbcbab0af763fb58bb687ebcd8b8585187c246b4cfc637a6ba4db718b4efa0e85578d3fad5695df363c6730b0a57f64b6dfa5edac8bd5bdd2306f5dedc56000000ec18e5bf5f010000b49c86d5b164d1e258988625b5d1a6e7e01873ec4971d2813d9afe4565f9aa585d7859f0f4ed71d3cde5c3c3317d55c4da7589527ad6eb0371d3bfaf8fbf5f777361fe9d71cfe3f363e5062bed1963c61d107d6a16c4d3f7dd1dffbeeefaf8e70d77c67dcf2e6e0c340b56aeae8d58f542dcb7c17b1586a71bfb885edbcc2caeb89e9ad62f6d85d9bd53742c6cebaa95a93be9daa85b537869d5ea25f5ba75daba00f8258ac1db76d06b541c33aa67d4cc7f36eebde3e6f8e7b537c4bf6f7d38262fda7827d54daad89eda358503d0d471eadc61f361dea0c1d1afcdea983d23758f5cb8549e9d190babbac780bdb2b5ad4cad885b45eb97acbc5b74e9583897ab57c506df0fd86edac43e878d89a19d56c6f4c7ee8b1baebf3eaef9f71d71e78459b16233d7cfca5913e2b61b6e886bfe7553dc50b8ee6e7b684a2ca96f815fe1b7d775b245da44bb979ce4f6d1ae70be56ae485d7baf28dc478597859336bc170bc37d330a676eedda755d51375b7a2ef7f83be2da6bff5db8f70bebbae5c17874deaa0d9ec9bd511b1ca38ddfbbbdba36d92f380000c00e2700060000768e768362dc6927c7abd270cab171ec61236348f7d61bff25a5ba3172e97dd02be375a737318cdbab383f5e7c346e7f727e34f41a19c7befce5f1dad34f8bd35f715cecdba571764975972131eee453e38c579d547cfee75e1debe2c5b2e704175b2fb6df3b8e6feabd4e7f598cee5eacb659c5f5ac6d7869409505da6ddaa666836da275eacb77cd9a0dbab24d162d6ba96e64ab4b877843e9f9afd968a3eae832ecb038e55585e37aead171d4c841d1a9764ec5b353b75c9b568503909e379b4dafb3744533c2d9deb177dfb6b17af68c9815cb62eaaca5d1aacf5eeb5b921776ac2ad63611da67c162eb368d2173b1de4bd51613beadd4ae6f8c3eeee438e3d52f8f53c78d8911bd0be7f4d9d2b37c3762f9e4b8f781e7636987bde3c8e34e8ad30bd7dc19af3c310eedff92047bc7db11c7e425d634d132bd2ed263a4dbb44d67a63aaad246f41ad5c4bd9886c363687199e69bf9d0f8787c6e43e1f3e48838f5b4d3e275af39355e7de2b0a8f89868866cdb9ab8c75beede050000d89000180000d83d74ed13bdda442c9c33b3226859157367cfcfba718e58306f49ac891eb1cfe183a357fb52a03c37e62f298e34aa5f1df35e782116a4d0a9a66df1f99fa38f1919035aa5ee801b9feedbbf57d7a85a393f5e4c0d10cb342c9917b396d635bbc561713dabe6c70b8d0d87d759f9c2bc5892bacced9da63a44ef6e6d2316cf8cc9e5efd7b020a6ce6aa910a953746857d8ae654b36d8b7a58503579ecdd5af9e1f33a62f2c96d5b4ed1afd868d8ce30eee1bad5377d6b31beb6c8dde3d3a4755eddc787e66f9bbaf8a67672c8cb5d9d4a6f41e31303ad5ce8b195367c6ec65ada2d7807eeb7fe1edd733ba57ad8c39335377c26556cd8c394b23ba74cbfa2d2eb6365e15cb16976fc3b298bff825e964f334d4c592d9d30bd74b61bcba757448cf913eecf018d13562f582b985f3bf117317c6e2b51d62f0a8fda25fe1ba686c955a1bf316ed8440717b1f9326d5c6dc17370cc41b66cf8cb9b5d5d1b547cfc25497e8dfb3707f2c9c17d32b6ebc95f3e6c4bcd2cddf6c8b62eea2ba889e43e3c8bd7b468752dfe5b30bc7bd716c0b74893edd0b1f4c8b0ad7ee06876455cc5a2000060000760e01300000b09be819070cef16f5b327c46d8fcf8c45abeba37ef5e298fed0f8b8fbbe87e391d98dc9508f5e5da2552c8a694f3786c229b09c3cfec978a1ae38bbd1aae9f1f8c38f15969bdc181ea54078d29498bda63abaf72a26b2d166e8f018d866594cbefb81983c6f65d4d6d7c58a7993e3cebbee8ff10f4e89e5c55a9bd766e8beb177fb1531f5fec6f5ac5ebd3216cd7834ee98b4385af5191223b25e627b8fdc37fad62c8d4977dc11f74d981acf4e9a1077defc40cc6fd5a9b1c20ed72d7a776b1d6be74d8a3b27cd2f3e6375deb30fc4dd850357deee74d5d4a7e3c1471e8c7b0b754ac777e2e4795157d5357af5cd2a6d8536c3f78fa11deae3c5876e8b3b1e7f369e7deee9b8ef96bbe299daf62fe95ab7499d0646ff4eb531f7e919b1a44dbf183ea8ecd7dd367bc7c8c11d62c5f30fc73dcfce8f15ab57c78a4533e381bb9e8d45ad7ac7f0e15937dbdd7b46b7560d31f7a9fb62e2bcc6e7c24e1eff404cafddca96b7d50b62e2434fc4f8fb1e8de9e94b0329109ef1744c5b12d1b647efacb569eb68551351bb74412c5a5eb8ced265dcbb7b74ad5a11b39f9b194b0a050db5cb62fae385eb67f14ef8157e7b1f9326b58afa598faf3f37e93e7b6866ac4ee771afc67deebdff90e8de303b1ebd73424c4fcf9e2edcb3c5fbe8dec2b5f8d89c667f21a351e3b51e0b5f88a7e6a5e758d7c7ea7953e29ec76745f9c74473f5db7770746998174fdedbb86dabb3cfa5e79617de03000060271000030000bb8df6238e8c130fe8122b9f7f346ebde186f8e70d77c78333d7469f5147c6e103b25f6ffa1f10870e6e1b8b26dd17ffbe2e3ddff38178b666dfd82f35242ce938228e1ad32fda2e7936ee2cac273d2bf8ce49cba3d390317178a9dfe0eade71d8cbc6c6e0360be2c97b6e8debaebb296eb8e7d958d671ef38e2a87da37363adcdabee11638e1d1dfd6b1ad7f3ef1b6e8d5b1f9e156b7b1f10c71f3e687db8d966508c3bf188d8bf77552c9cfe6c3c3d657ec4e043e38421a98be8963160ecd8d8b76be1fd9fbeaff87cd5bba6d4c4c883fa45ea9dbaa4e37e63636cffd6b178ddf1bd2f9e5ed621861e3626f6d9a64cb05b1c7ce2d171c8de1d63f5cca9f1f433336359b7fde3f8837a6cf0fe1bd729f6d9ab7bd4d6ae8eb67d0744638c5f521dbd461f1987f6ab8e794fdd1737dc7073dc70c7a3f1c2da9e71d0316363ef75dbdd370e3b627874ab5a1c13ef49cf986dbc76460f68de16bc54b6be35b3e2c15b6f8a7ffceba6b8393bf7c71c5cba20fbc7c1237b47f582a7e3d69b6f8d7b9eab2d1ce46171e8fe3d62cd8b8fc6cdd75f1fffb8feae787c61afd86f70cb5d0beb6def63d294363178ccb088671e683c37f73c130b5bf78bb1c71d148553d6a8ddb038eef8fda2dbcae9f1607af674e19e5d771f1dda7f8bffb831e0c08362af764be2e97b0aebfae70df1ef7b9f8f9afd8747d6167ccb74da37c61d3628da2f6bdcb67f173e971e5dd63f8ed8af6b56010000a065552d5abcb239bd690100c06ea96b979d1198b0e3d5c7eae5aba22e5a45fb8ea52e722bd4af8e65abd64475ebf6ebbb787d8986a85d995a5d6e623d050db52b63455dc366d6b579a5f5b46ed731da6eeccd2ad44ebe27ae7baa558cde8ae79c6eb586baa85ddb3ada6c6a1b0b7556acac8d8656eda2537377666bcc7e34aebb6f510c3c76f3cf5d6e987a7ffcf3f15531e2c4e362d4c61a4e3773bb1b6aeb626d9bd61bbd26b654fdeae5b1724d75b469df3e9abe840ad762edda68537ed05bea1837d3f63e262f95ddd79bd9dfc663195b741f6dcce6cfcb9668def6b36b58bc645536060000f9b3cdbfde000000b4bc9a68dbb16374da44689b9eeddba95067d3816d0a7e36b39e82ea36ed9bb1aecd2bada7a96c68cdbc8971ebf5b7c72373cb9e675a3f3f263cbf24a2b08d2dda96b07a33e16f929e699bcec1f60aba56cc88f137fd37ee7a6ee5faee7c1b56c6b3cfcd8ddaaa0ed1657307a061413cfeec8288ee83629f4df59addccedaedece41674ddb749d6d2a642c5c8b95077d7b1fe36db4bd8fc94b65f7f566f6b7f1586e7bf89b6cfebc6c89e66d3f0000c08ea605300000b9a60530bb8d8605f1d8adf7c773cb235ab56955fcb66e435d6dac898e316cdcb17170cfed9250edc256c594f177c5637352abed56515315b1b67e4dd435b48abe071e13e336da1576434cb9e7c678745e43e137dc3de55801db4a0b600000f24c000c0040ae0980d9bd3444edc2d9317de18a58b3a6265a75ec1c83faf5dc2e2d1d7717f5cbe6c4f4392b62f59afa68d5b673f4eedf2bba6cb27966432c79715accaded107d06f589ce1a5f02cd2000060020cf04c00000e49a001800a82400060020cff48b0500000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c0000002d61fa2371ddf58fc4b46c1200000076040130000000b484fabaa8adad8bfa6c1200000076040130000000000000404e542d5abc726d360e0000b9d3b54bbb6c0c68098b9eba3bee9ed6210e7c599f9875d713f1e28afa889ab6d16df0a838e2a0bed13eab17d1102b664e8cfb9f9c198b56d5c5daaa9a68db75501c7ce8fe31b0c3faef2ad7cf7d26ee79e2f998bf6c7d9d31878f8cfea55bbb61654c7bf4c178f2c5e5b1babe21aa5a758a3efb8d892387758eea58144fdcfa604cebb85fbce2f041d937a06be3b9f177c4c445dd63d4296363efecad6aa73c10374daa8ba1478f8b033a170a1a96c6b30f3d1a93e694ad77df83e388e15da3a6719175fbbacfe83631f3d1e9b1b0b65d0c3df66531ba7b61f1152fc4c3f73d1d3397ad8efac2121dfb1d18c7f67a21ae7f3c62f4e987c7d06c1dc0ceb178c9aa6c0c0000f2470b60000000b69b8635a99be3c531f1eea76245cfe171e8d831b1ff8076b1fcf987e2bff7bf180d59bd95531f8c9b1f9c1e2b3b0c8851471c1dc71eb277745b393deebfe3c9989bd5896593e2b6f19363514ddf183deef838e1f061c53af7ddf5542c28566888171ebc2b1e7aa12eba8d38244e38e98818ddbf26e63f393ec64fab2dccef16037ab68adab973e2c562fd647ecc9d5f5bd8c6f9316b565694d6336b7ed4d6748dbe29fc8d553165fcf8787cd69ae83664641c36f6c0d83fad77c2bdf1dfc717acdb87c67d9d174f3f3a276a068c8883468d88c11d0b336a67c4f8db1e8b19abdac5c07dc7c461870c8f9e2b9e8a3b9e5dd1b820000000ec400260000000b6b31551ddefc83861ccf01834b07fec37e6e8386e58a758336b723cb5acb1469b5e7bc7fea3c6c4cb8e191923fa768d5e03f78b7107f68e56b50b62e6c2c63a316f712c59db29861e72500ce9d531baf51d11e3c61d12a30f1c1c9d8a29ec924295baa8ee535876df3ed1ad63cf1832e6b0387acca8d8a76f633bdd1e7dba459bfa85f1e2ece264c4ec3931bfa157f4edd510f36795a2e6d931676143b4edd5377a14a61a664c8827e745f41f7b7c8c1b39b8b00f830bfb70541c36b075ac787e523c9bb2e575aaa2efe8e3e3d88386c7f06103a3479b88054f3f1bb3ebbbc501271c1d63f7ed5f587e788c3df690e8b356000c0000c08e2700060000603beb1c03f6ee948d37eabc77dfe812cb62e19cc6f6b3359dfac48861a94be886a85db93c962d9a13935f581af5c5b9994eeda26dac88e91326c7ac45a92be582ce7d6248df4ed1a6f8db6c87e8d0ae3a1ae64f8d879e9f1f2b6ad3badb448fc1fda357dbaca3e6be03a24f9bda583067517132bdd676ed19fb75eb18b50be636b6244ea1707d9be8ddbf67b1ce9c390b634d9bdeb1f780f25f99aba3dfd07ed161ede298b7aee570d2257af52bafb72266cd5f11d1b56f0c29ef81beba470ceabdbe036c000000d85104c00000006c676da37dea0ab95cc714e646ac58bea4717ad5ec78f48e9be39fd75e1fd7dd747bdc74e763f1ec928675cfd72dea352a8e19d5336ae63f1bf716ebde10ffbef5e198bca81413b7897d0e1b13433bad8ce98fdd17375c7f7d5cf3ef3be2ce09b36245a99fe6e81dfd7bb48a15f3e7c4f22c9cedd2ab5ff4e8d7233aac5c10b39667a1704df7e8dfb7718995ab6b236a5a17d65ea17ba7e8180db16ae5a69e1d5a1b756b0a2fad5abd64f95e5d2b0f0a0000006c7f0260000000b6b33551b74137c905b56b0aa5116ddb7728fc77454cbcef9198b2ac430c3bfce878e5ab5e19af7bcdcbe3b4b17d2b42d3eae832ecb038e555a7c5e9a71e1d478d1c149d6ae7c41377de1fcf94d6dfae6f8c3eeee438e3d52f8f53c78d8911bd23163dfb70dcf6d8fcac4244fffe3da3d5d2f9f1c2d25931776987e8d9afb00ddd7b478f364b63c1ec55316fd18a68d5bb7f0cccea5757177e555edbb0ee59bfeb2c5f15ab0b2f6dda9637edad541d5555859726965fb44c17d0000000ec780260000000b6b325316bfa8609f0ca69b3635174886e3d53c43b2fe62f6e880e83f68f517dbb46a9b7e6daf98ba33c22ad5f3d3f664c5f18694d356dbb46bf6123e3b883fb46ebd40d737aa66f435d2c993d3d662d2d8c57b78e0ebdfac7a8c30e8f115d23562f985bd88a46d5037a45f7aa65b170f2a258daa65bf4ed9e4a7bc7a0de6d62d1fca70adbd22a7a959aff16f4efd535aa56cd8f174acf22ceac7c615e619d9d5376bc095da24ff7c23e2e9a1bcf6f700856c5ac050260000000763c0130000000db594d2c99f2403c3a6371ac5ebd3a16cd7834ee98b828a2dbe0d8b718bef68a9e5dab63c5eca9317d695d34a42077c684b86bf292488d674b564d7d3a1e7ce4c1b877d2fc585ddf18084f9c3c2feaaaba46af94d7562f88890f3d11e3ef7bb46c3d4fc7b425116d7bf48e2e8dab29d4eb177dba35c48b336647f4e813fdb2e27efd0a1b337b4ecc896ed1b7ec79bf6d86ee1b7bb75f1153ef7f2026cf5b59d887958dfb306971b4ea3324466ca627e77efb0e8e2e0df3e2c97b27c4f445ab0bcb2f8ee90f8d8fe796b7ce6a645e7c34ae4b5d603f94d26c000000d83eaa162d5eb9361b070080dce9da65535db502dbdb82c76f8bdba77688838eee1453ee991acb8abf7156479bae43e2f063f68bde596bdf8625cfc55d773f13f3eb1a3b4aae6add35f6d9b74bcc78727ef43df66531ba1814af8ae90f8c8f4766ad88faec37d7546fc898b131ba5fe3bddd307f52dcf1c09458585bea70b93adaf7d92fc61d3e24ba947de5b976f23d71dd534ba2f741a7c43143b2190dd3e2aeeb9e8c79ddf68f571e3b74c3eea757cd8cfbee7a225e5c511f8d6ffdd2f596f675f4e987c7d0c6a27556ce7a3cee7e68662cad6fdcae565d87c7518316c79d4fc6fafa2f3e1cd73e302ba2ffd878cd61eb5b20033bdee2259b7a96370000ecde04c00000e49a00185ad606a168435dac58591bd1ba7d7468d35407540d51bb7265d436b48af61ddb46960dbf54b69e8656eda253a9bfe80af5ab97c7ca35d5d1a67dfb68f2adb65243edca5851d710addb755cd75575f3d5c7eae5aba26e13dbdd505f1f5153a37b2e686102600000f2ccef98000000ec18e9b9bc1d3b6e24fc4d5260db313a6d2afc4db2f56c2c444d6adaa6f56cdff037a96ed3beb0dead097f939a68bb99edae16fe020000b09df93d13000000000000202704c00000006c379d068e888346ed1dbdb269000000a0657906300000b9e619c0004025cf00060020cfb40006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c00000000000090130260000000000000809c100003000000000000e4840018000000000000202704c00000000000000039210006000000000000c8090130000000000000404e0880010000000000007242000c000000000000901302600000601bac8a852fbe182fce591a755949d1aa85f162a17cced20d4a01000000d8c1aa162d5eb9361b070080dce9daa55d36b687593539fe7de555f1bb1b1f8dd9ab23daf61d1da79c796e9cf7ca11b1bd8e48dd845fc6b91fba321e5fdc5098ea16afbff286f8eca17531e117e7c5877ef2443416bf2eaebce93371687189f5665dff9df8ce8db30b6323e3ad5f7f771cd6bab1bcd1acb8fe5bdf8d1be7441c74d6b7e39d63b2e21d68ddf61c74667ca725de10809d6af19255d9180000e48f16c0000090337513ae88379ff8b6f8fc6f6e8d89b316c6c2850b63d6c45be3379f7f5bbce2c2eb6241562f9efb65bceb94d3e29453be10ffcd8a9a6f56fce6ab3f2e86bf9d861e19279cf0bf71dac1a9f8b7f1d52b52f8db29861ef5b238e16da7452aaeb464e29d71ebadb715861fc767bff5e086ad8763494cbc33cdbb2d1e7a212bdac1d66dcf4333b31200000080dd93001800007265695c73e9ffc57375119d8ef9545c73e77df1c00377c52dbfbd30c6768a5876d737e39b376771eb9aa5b160610a8897c496b7835a124b97a5d701f1fa4b7e10dff94ed68a77c9d2682c7e5d5cf2c36fc777de73686cd0b8b709f3fff6b9f8d683ba8a06000000d81e04c00000902bf7c4dd8fa4be9707c4eb3ff03f31b0d8df73ebe8bcff99f1f98ffd4f9c70c211d1b36e7ec47fbf10a79c7f75cc4ab3e3bef8566a097cf1fa76c0ab26ff35be71f69be394620be1d7c6591fff69dc35a731a47dee17ef2994bd3ffe5c5c7856fcf9fc54e7a3f1d977155e4beb9c75759c5fb1cea60c183b367ac6fcf8db977e1813369101fff7e2f41ea7c5bb7e31252b49fe1b176fd082b96c7ac1f8b8ec9cd7169779cd39bf2caebbeef97fc4c56735969df2c64fc635cf37fd860beebd3cce794d5a4f61bf2ffe6b4cae4cc7ebe6c45d577d22ce2ad629acffac2fc66f1f5b98cd4cd66fc70d736e8c6f14df736b5a59030000006c3901300000e4cac171e088f43a33fef69ddfc5c4a5eb43cec1aff9547ce73bdf8e4f9cd62f2b69da827f7d385ef1d66fc4d58fbc10b5a9a07e514cbae5a771e19b3f1d372c2956d96e56ecfdd6b8e098f685cdfd7ff1b9ab2665a52fb56a716357d60bcaf62762752cdea0057369fae9f8f9072f8c3f4e5a112b0bcbcd7af8c7f1e12f7d2f3ef9ceafc68dd31bcb164ebd25bef2ce2fc5ed9519f0945fc4d917fcbf98b4babe506f564cbcee1bf1b6377c2bd637509e14579ef9fab8f0aa5b63d2a2fac2747d2c9a745d5cfa9e37c485ff2a85c0ebb7e357177d3eae9e386b2b5b59030000006c3901300000e44abf78fbe7ce8abd0a3fe92f7be8b238ebc4e3e2d857be233ef88ddfc57d2f944590277f296efcc91b0bb59323e213375e1f377ef9e4c2f88a983ebf4b1cb8fffef1a61ffe376e4be5375f13178c2acc5a767bfcbfeb96c6b0f7fc226ebcf18a785371e17ef1a69f14eadcf8ddb8e45785d7d23afbbd317eb26e9d1bb768ce8a78f5c7de15fb5637c4b45f7f397e313d9bb14da6c6aa237f19b7df7653dcf99fcfc591ed23e6ffe78f31f9b5bf6e2cbbfd927859a12c96dd147fbfa571897566ae89a37e96f63bd5fb41bca66744c3ecabe39bbf6cdcb025577f2f7efe5c5db43ff25371ed2d3715f6fba6b8e557e9782f8bbbbef1ad28f5aedde8b998d9e943f1c76237dcdf8f5767a5000000003b920018000072a6f5c80be2ff5d7b555cf4c63131a4634dac9a3b31eebdfab278ff1927c4ab3e734b2cc8ea35ad438c7ec797e287bffdbff8e45135b174ce8bf1e273936366961dcf9dfd62e3c8f634f8acf8dc5b0744344c8a9f7cf1ff6d66fb9aa35fbcec9507343e7bb8c7feb16ff73432204e7e4d56d6ee9438696c1a6988faca16c0a3ff37ce3fb8d86f76a1de9171fe5bf62d8e3ef7e8c35157f8df2db73c5458aa4d8c3d795cd4cf2b1c9b175f8c79dd4f8b5353b5954fc623cf14ab67fac56b2f3a334664ab03000000680902600000c8a1d67dc6c4599fba2aaebeedaeb8e796abe38a8b4e8cfead1b62ce0d9f8e8bfeaff1c9bf1bd3f8acdc57c4b8c38e89135f75469cfee60fc4d55376e4af0ead63e4873e1faf4fad6d1fbd22bef4afa55979cbeb3c784874c9c6937e7d7b378e4c9f1a530aff9b5a6c085c1b777dad705c4e2f0d6f8f9f4d4ce5b3e2f9f24714177eddaa69958d02000000b41001300000e4c9ac07e31f7ffb7bfceda689517a5c6febce7bc511677d33be9b5ad946434c78f0a1c6194d7a34be77ee57e3ba894ba3d749e7c4f77e794d5c77cb5df1db3337fddce06dd6fad0f8c4674f8d4eb132eebafcfa5836382b6f614b17cecfc61ad5ad59d338d2a9737489fed19807778e532eb926fef9cf970e5fdc748fd7000000003b9c0018000072e5b1f8e3255f8b4b3ef3b9f8e584f2fe8d17c653931616c7da77ec5c7c6dda0b313365a0bd5e17977ceb9c38fea0fed1a7f3b2b8efa1998db377a0d6c77f323e737ca788f9d7c77f1ecb0a33fb0c4be175612f264d5cd74574dd838f44b1e1edf6f4d0bfe39a757d502f8cbffce3fee258cfd163a35f748e03f6ed59985a1a0f3d30337af5ef1ffd8b43bb78fe9e5be2b1e975d1aaa6581d00000060a711000300409ef47b63bc2b85a80dd3e237ef3a395e7ff6c7e3631f3b37def8b2d7c457c6af2cfc06b057bcf55dc735d6dd77ff1851fc8de0d1f8d5073f1e17ff795261bc7b742d2c1ef3fe1ddff9e6efe36f7ffb7b5cf591b3e2474fb5c4af0e9de3d42f7e2a8eefb432561636b5dcbe878f89b4592bc77f2d5efbfa73e36367bf214efce87dd1b65be3fceda57d87c9f1fd37bd2d3ef8b18fc707dffae6f8dea30d8563b66fbce56da38bf3479ff3a1382665d47fbb20fee782cbe3777ffb7d5cf6feb3e282af5d1a9ffdeadfe3c5e2438601000000761e01300000e44ae738f59b7f8ccbde3e267ad4ac8ae98fdc16b7defa484c5d5e1fed068f8b0b7ff6dbf8c0be59d538353ef28923a26bf5b29872ef6d71dddfee8a59312e2efac61b6358eb6531e1cf97c625977c23fe6fd6abe3536fddc15d40977439353ef7e123a37d36b9ced19f8d2bde7f60615b1b62d5f447e2f689ede2f46f7c3a4eee90cddf4ebabfea8b71f131cbe3c15b6f8b7b272f8e68b74fbce9f21fc47b4a5d52f778557ce7d79f8b9306d7c4ecbb7f1bdfbfe4d2f8cd7df3a3cde057c5b77e7541ac3bb4000000003b49d5a2c52bd766e30000903b5dbbb4cbc6f64475b174ceff6fef4ee0ecaaebbbf17f66cb2cd9f7044808fb22fbbe09b882202eb85485a756aab6dad6da6aad5dfeb5edf368aded53abed432bb6d2bab6958abb82ecc8be853540028484eceb4c26b32fff7beedc90c5840488554ede6f5f877bceef7ccf7667e2b9339ff9fdceea740e262d136766e20edf8a4addba9e4acdd86ceec0da9375cbd6a5a7656266ee78c35f80cab96e18ccd8b13fdf73eadfb02aabbb5b3265da96efc9d6aa359d033b796f01f865d4ded1539b030080f211000300506a7b76000c006c8f001800803233043400000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a024ead6b7770fd7e60100a074c68f6ba9cded79060606d3d33794debec10c0ef9d80f40d2505f97e6510d6919559fc6c6865aeb9ea7bda3a736070000e523000600a0d4f6d400b8abbb3f9ddd03696b694c4b73431aeaeb5357575b09c01e697838191c1a4a4fef60ba7a0632a6b5316dad4db5b57b16013000006566086800002891e1e1e16af8dbdd3b9849e39b33a6ad298d0dc25f0052bd1714f784e2de50dc238a7b4571cf28ee1d0000407908800100a044060787aa3d7fc78f1d55fd253f006c4f718f28ee15c53da3b877000000e5e1374200005012450faea2375731ecb3f017809d29ee15c53da3b877e8050c0000e5e1b74200005012c52feffbfa87aacffc05805d51dc338a7b8700180000ca43000c00002550fce2be98068786d350ef633e00bba6b86714f78e4df7110000e0a5cf6f860000a064eaea6a3300b013ee190000503e0260000028093db70078a1dc430000a03c04c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030000cfe984134eaacd01000000f0cb4e000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c00000c02f97c1be747575a76fb0b65c3594feeeee7475f757e600000000d891baf5edddc3b5790000289df1e35a6a73e5363c3c9cc1c1c1acede8cfb449adb5d6dde384134ecadd77df990c7664f1238f64fe9235e91e4c468d9d917d0e3e3c87cc68dd4d7f593a94758fdd9c5b1f599bdee2a7942947e5f5671e9051bd4b73f7f57765515711fd3667cecbcfcb7153ab1b6ca12b8bef7f304bba9389079c9843a66e73465d8b73ff034bd33de9c09c72f0e45ae3cfd39a3c7efb82acfd1f3b1ec00bb7726d77268d6b4a434343eaeaea6aade5d6ded1539b030080f2d103180000d8b9de45b9f587d7e6aef9cbd33930d2d4b37651e6dd7a557e74c733e91b694a3a1ecb0d3ff8416e78aca3d6f03c74cdcf7d0faf4d6ff38c1c76dcb139f9a8591955695e76ffdd59d4559709738ec871c715e1ee48f9d6fab37ef9d22c5dba340fdf757f566ddb4db8bf3dcb2beb96aede586bf879db98d5ffa3c703000000182100060000766ad13df766797f53661c774e5efffaf373fef9e7e7820bceca816392de250fe69135b5c2e1fef4f6f6a5b7ef050c34d4df9ffecacbe85987e7b03973b2f78422fead340f1463414fcd81c71d943973a66674b57507eaea52d7b330f73eb4ce50d1000000c01ea9e1e37ff4a77f5e9b070080d269696eaccd955f310c7477ef5046b736d55a768fcb2efb62ce3de38caced9f96434fdd2f136aeda96fcdd46913d3366142268d9f90c1a76ecc35f72d4fcfe070fa3b96e4c905cb323c634ea634576a87bab3fcd17b72e73df7e791c7e6e7c967d6a6bf7572268f694a5d3af2d80dd7e48e056bb7d8767e96ae5891871f7a28cb370c6668b82bab9e7c220be66fc8e883f7cab89133d8426f563ef154d636cdc941933764f9e255199cb15fa6b7d68632ed5d99279eaa1c73cc5e396cd6f84ac392dcfd839b735fc7e81cbcd7e6bd753c56b9863b1e4ec7e883536d5e724f7e70f37d95e57dd3f8f4adb9f9ee87f2d893cb333c7956a68c5a97f9b7df92db1f9897f94f2e4957cb8c4c1b575c4fa13d8be72d4b67e578078f5e95db7f7a5b1e78747e9e5e5df9fa4c9994314d5b0cb1bacd7bf3f4f2aed44f9c9a89cd9bfe5eb7f6fe2c1ccec4b6e5b9e7e6bbf2d033c39931674a8ab716e0c5dad83d90d6e686d4d7d7ef314340f7f6d686b300008012d203180000d8a9d1d520754d9e98b73afd5b74adad1f3b3d73e6ccc9b4d14963db844c1edf9a864a7b43cbf84c9e3c216dd5fcbd3d0f5f73556e9db7223da32a3595f6a6eee59977ebb5b9e39962f0e8c6b44d9cb2cdb6533271c2c8ebe86a47e051195d999f3c796c9efba9ce4d997df4219990ce2cb86b5ee5c83b3298be6a4fe5a277f166c37d3dd51ecccf360f566a2acb6b1efe69ee58964c18db94c1ee3579f8b63b72db8d37675ee7a84caeb6adcf9377de900736f584de64c363b9f6a647d2d95c39f7b18dd9b87c5e6ebde68e2ceaadad4f6f16dd7eed16efcdd80caf5f98fbaebdaaf6de148647ce75e393b9eb9627d2bef529030000006c45000c0000ecd4fe271f9799cd035937efe67cefbbdfcf4f6eba270f3eb52a1bb70823db661d9d538e9a59ed95da3cf3c89c72cad199d55659e8ea4fd3b4a9d9eb6567e6dc579e5e693f3daf7acd919992fe2c7b7a6986d29659479fbccdb627e7e8238faabe1e58ed723c210756e64f39e5e04c2e167764e386b48f3e28c71ed096e1cef9b9e7b1ddf30cdeded107e4b5af3d33a79cf9da9c73c4a4a4677956351f9d736a6daf3f79ef34a6272b966e13396f1cc894d35f9fd79e5939f733cfc9eb8e9b96c6fee5997bffb2eaeaa1a5f767eef2818c3968d37b73665e7bce3199ded09b250f3fbe7580dd3b9809c79f9b0bce3f3fe79f7dc8767a410300000008800100805dd13c3ba7beee9c9c75ec41d96b5c43bad72ccafcfb7e9aabbefbc3fcf4890dcffdbcddb62939f898d373ca21132b3f800ca6afab3b1dabd7a7bb58d7d9990dd5a2dda93e138f382e735a86b3fe917bf2c4b3bd6d5fb829b3e63c3bdc72f3b4c9d5e710378f9bf86c5bfde8b6ed0fc73c66760e9cbaf9c7aee63907679f4ae1c0dad55957595efaf4d20c647cf699d5929ecafbd2554c83d3b3d7948664e3ca2cef1ad9aeaa6ddf1c367bbb4701000000789600180000d835f5ad99bcdf1139e595afcb1bdef8fabcf68cc3326d545f56deffd39f1dfa782b83e978ea8efce47bdfc9b7bef5dd7cffc73fce35773e331200ffbcd44fcd31c7ee93a6e13579f8ee85d90d19f00b3366ec363d7547a5a91816bbab08be07d2d73f5c59589f47affb717e5c795f364df72d2fba56f757d617dbd4d4d5f9010e000000d829bf3f00000076aabbe899bae5f372eb9b3266daa139e3c8e99585ed0c7dbc85a1a5f7e486fb96a667ccbe39f1ec7373eeebdf900bdf746ca6d5d6ffbcd4cf3c3ac7ce6ccac08a8772fff22268fd0518e8cfa627f98e18ca70712a8d8d694a63f1523135479e5b795f7e663a33878e2dd603000000ec3a01300000b05377153d53af7f24ebb619eb79e3c691318a9b4635555fb767c39a7519485be61c774c664d6a4ddba886a4b76f9b60f4e76154f639eea8cc68eacf334f2f4f5dad75447dd1a13659bf369b3b2f0f6563f76eee2bbc6649166fb9cbf625595679cbea264ca93ecb78f2c4a27ff0daac5bdf9cb6b6ca7b539d9a33b861753a071a52ef2736000000e079f2eb04000060a7f69fd9946c5c901bafbe350fce5f98850be7e7c15bafca4fe675244d3373f07e6d23857575d5a0b56bd9fccc5fb824ebfb92d6d16d95b6ae2cbc7f41d6163d89d73e93bb6e7c38ebb64e647f3e9a67e7f823a7a5b1b3339db5a611d3327d72e5047a16e6f61be656ce7561e6ddf1933cb87ac741f60bd2d89147afbb3df3162fcee2f97373fd4df3b3314dd9fba07d33aab27af401876466d3609eb9f327b963feaa7474adcbb2876ecb4db7de9d5bee7e2a3d237b01000000d8650260000060a7f639f9553969ff0919d5b322f31fbc2ff7defb50e62fef4efd98bd72dcd927659f22cd2c8c3b28c71e382e759d8bf3e0bd77e681c57d19b5ff493979765b06573f981b8a9ec4373e908dfb1e9d036a99f1cf5bf39c13f2b229dba6cda3b2ffc92765f698faf4ad7daa72ae73f364f79c9c74f884dafadd64f211396df6c63c76d7ddb9ebc1a7b26eb039338e3e2b27ccacfd28366a9f9c7cf6b1d9bbad374b1ffc69aef9f10db9edf1d5a99b7c504e3ffd908c1ea902000000d86575ebdbbb7f410fc30200809fbff1e35a6a73e5363c3c9cc1c1c1acede8cfb449adb5d6dde384134ecadd77df595b1a4c5f575f062a738dcdad294673debec1f4f7d7a5a9698bbf391dec4b57efe04eb6fb0518ec4f7f5d53b63cd5ddae7aed4973dba8ece8d287fabbd3d3bfb3f71560f75bb9b63b93c635a5a1a12175d5f1f1cbafbdc3180b000094971ec00000c0f3d09051b567d53e7748d9b075f85b6818b50bdbfd0234fc9cc3df42f5da771cfe16ea9b76e57d05000000786e0260000000000000809210000300000000000094840018000000000000a02404c0000000000000002521000600009ed3dd77df599b03000000e0979d0018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030040c90c0fd766006027dc330000a07c04c0000050220df575191c1aaa2d01c0732bee19c5bd030000280f0130000094445d5d5d9a1aebd2d33b586b0180e756dc338a7b47710f010000ca41000c00002532aa31e9ea19c8c0a05ec0003cb7e25e51dc338a7b070000501e026000002881a2e756313534d4a775545dda37f4098101d8a1e21e51dc2b8a7b4671efd8741f0100005efa04c000005012c52feeebebeb33aaa9aeda9b6b6d7b6f3abbfaabbfe41f1eae1501b0c72aee05c53da1b83714f788e25e51dc338a7b87f0170000caa36e7d7bb75f050100505ae3c7b5d4e6f60cc3c3c3191c1cac4e030395d7e186f40f54da867cec072069a81f795e7c43dd601a1b1bd2d03032ed6901707b474f6d0e0000ca47000c0040a9ed690170616868e8672600d8a4e8f1bbedb4a7110003005066026000004a6d4f0c800b454fe022f82d5e374d00b0e959bf9b1e1bb0a70efd2c000600a0cc04c0000094da9e1a00173685bec25f00b6b429f4dd53c3df82001800803213000300506a7b7200bc2d4130c09e6d4f0e7cb725000600a0cc04c00000949a001800d8960018008032abafbd02000000000000f0122700060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501275ebdbbb876bf30000503ae3c7b5d4e6f614cb73d567fe6f7eb2b2b6b849dbac9cf6e677e48263a7a5a9d6b4475a7e553ef3b7d764658eccc57ffbab39a6d60cc09ea5bda3a736070000e523000600a0d4f6bc00f8f17cee0d17e72b4b6b8b5ba9cfb4d7fe55befaa9576452ad658ff3f8e7f386777d354b737afee2eecfe6fc5a33007b160130000065660868000028a9137eef3bf9def746a6cbfff8cc4cab1fcacaabff3c7f7d5d7fad0200000080b2110003004049354f9899993347a6232ffcab7cf415ad95d6eedc73db032305153d0bbe954fbff7ed79cd6bcea94c6fc8c57ff0c5dcb272eb8078e735fd5979cb17f30717bfa156f3f6bcf7d3dfca825ae7aa3b3f7361b5fd6d7f7fff4843e1d64fe7f545ed07be9ee5b5a62cff7a3e50b49dfbc7b9aaabd6d6b320dffaf4fbf3d6ea7ecfc95bdffbd7f9d6a61d575d9b3fabaefb44ae5ef9937cba7a0e9fa8b41646ceeb436fad6dfbb1efe6e981ea0a00000080d212000300c01ea12933a68fafce75ac59537d5dfb83dfcbb9eff874ae98bb247d45c3e0fa3c7efd17f3bb6fffa35cdd512d491ebf34ef7a57ad66fcbed977fc863c51adf9587eb076a4a4e3ea3fcadb7ff78bb9fef1f5699cbe6fa6372ecf03577cbab2dde7f3487f72d22987a767ddba3c75e7bdcf86bdf75c7f5d9657dad6dd7357eea965c91d375c9fbb8ab6bd8fcea96d45c3d5f9d8f917e75357cccda2eec1caf97567d1dcffcea7de715e7ef707eb46364a6fda8b6dd63d967ffbf0ff972b1e5d5e99ef481111afbde277f2c6ca79ddba705d3a2b17b8eae6ff9377ffe94dd9942d03000000949100180000f604fdf3f2e31b46e2d7038f38aaf2dfae2c5e332e471c7a68def68fd7e6c69f5c959f5cf79d7ce86595559d37e53f7fb8a15afbf88faecea2a164c6bbfe25375e7159fee58aabf3afef3935c79c3023dd6b46a2d49b7f70533a2baf27ffc9b5f9d1572fcb577ff49d7ce2bc6372d2118d595b84c4a79e96e38a9f3c1ebf35375483e5c7f3d33bd6577e1aa94ffdd0bdb9e5b6a22d99fbc0e3d5d7834f3f2be32aaff7ffd367735dfb505a4ffe78be7ffd3595f3bb293ffe8bd333a672b45b3efd996c3d92f593593ae677f21f3fbd337717cff6edbf3e7ffdb97bd35ff991e7e80f7f3f37dd78556ebce9fbf9d0cc55a91c19000000a0b404c0000050528f7ee30ff2d18f56a6dffed5bcee15efc9d797561ac79c995f7beb8cca4c5b8efed5bfc83f7ef5cbf9c3531ab261e5b22c7b724196d646575eb56259f575dcd831d5d795d7fc6b2ebbe9a12c5b3798c37feb73f997bffdc3bcf5a0a29b6e32767431b474f2f07f7f36dfbaf3c9acdc3026e7ffe565f9c7bffc60ce985e59d1f49abcf6d46a029c07e6565e3aeecb039573d9eb8d6fc891e9ce43f715c1ef3db9f9ceeecaebc179f579c5f9cdcbb537173d9527e4dc4b2eccb4a6ca6cc5a4f33f9037ef5599e9be35d7d482e31133f2860f5f94035b6a8bf3e7e6e16277adafcebb2f9e96eae64dd372e125e754f608000000505e0260000028a9358fde981b6ea84cb73f9a557da332f5d88bf3b9fffaabbcb6e85e5bd1fff477f367179f9b534f383daf38ef8db9e0edbf952b9edafa478419ffeb4ff2c123c7272b6fca65bf7f492e78cd9939e98cf3f3becfdd91da08d039f3a37f9ef36636a5f3912bf2a90fbe23e7bde2f49c7ad6dbf3b1ef3c9d914eba4d79f9a947565ebb73e7cdf7a4ffe6dbf3605a73c4cbdf9aa3f64a96de714b962f7f200f175d73f73a296714f96f9ecad3d50ecb6d1933b678dde4e01cb85ff1da9d8d239d946bead3d0589b2d3cb56864b8e989d352dddd26fbed9bbd6bb300000000652400060080923afd2f8ae1906bd39d37e5475ffc504edfd49536f7e7efdeff7ff2c3473764ca2bdf97bfbbfc3bf9e1f5b7e4ab176d1597264d87e592cb7f929b7ef21fb9f493efcb5b4f393063fb56e5beaffc6e7efb4b8b476a26bd227ff9bd1b72fd0fbf94bffbbd8b73de3133938d0b73ddff7e4f3e71d348043ceeecd37270e575fdc30fe4eab90f67a8feb89c7eeac139e3e409c9820772c7adf7a6e8073cf9f4b3aa75c9f44cab76d51dcae040b5a1667956acaacd3e97b1a353ed973c3498ad365fbd269b9e1e0c000000504602600000d8232dc9d26284e5296fca273ff3be9c79e4cc4c1bdb993bef2dc689de6443e65df3ed5cf6e94fe79acefd73d239efcbc7fff1ebf987771421f1501ebfffc1caeb33b9f3caafe7737ff6d53c36f1889c79d187f297ff72453e7e72b17d671ebaefa9622699f1babcba487617fc38ff7ecffae4c853f2f2a6e4f8979f94d6a187f3f5ff7cacb27242ce7cf5d1d5f2e4a81cf3b2e2c795e5b9e1c7f36a3d892bd6de985b16143307e7e8e3ab2ddb77ccb139acbaf9d5b9f29e4d5bf7e791ef5f972daf10000000a06c04c00000b0479a98f1c5e37d57ff287ffbd75fcf95577e3b97fdfec5f97ff3b6fc11616cfaeef9422ebbe25bf9cbdff8ad7cee6bdfce955ffb4c3efddd6270e5fa1cf7f297575ec767d18f3e9faffcf09ff2d177fd792eabece7cacbfe285fb8abd87e724e3f7ba43f6ff18cde334ede2b197a2a4f2e4a0e3efdac5447a23ef5b41c57bf3e4f3cb13e693d292f7f36d46dca6b7fe35d995d399da55fffadbceb0f3e9faf5df6e779c7db3e9bfb879231affd8dfcaf6d3a2b6f65dc1b72f1ab8b0b5c932b7ffbad796ff12ce4f7be35bf7e556fe5ac00000000ca4b000c00007ba453f3e14fbf35fb3775e6916ffe7d3ef9c94fe7cbcbcfcfc7abbd7b373bfaf7ff3d9f3a6f5646adbe2b5ff9eca7f2c9cf5e91477a27e5d8f75f96cfbfb57838efd8bcf5f397e5fdc74e4aef533fcc659facd45c7653568f9a95f33ef5eff9fd4d1d7a2b0e3efbb45af8ba574e1e79d06fd2f4f2541f0f5cd17adaab2a67b559d3e11fcabf7cfee21c3ba9374f5dffd57cf6b21f66c186519975de27f35f7ff1f26c1acc7afb9a72e65f5c9e8f9e36294dfdcb32f7861b73d35393f3becf7e2087d62a00000000caa86e7d7bf7706d1e00004a67fcb896da1cdbd79375cbd6a5a76562664e7caef7aa56d7302653a68ddd7ef8dabf212b57776670a7fb7afe7ad62dcbba9e964c9c3931cf7bcf3deb5239f517b62d00a5d4ded1539b030080f211000300506a026000605b02600000cacc10d000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000000000008092a85bdfde3d5c9b070080d2193faea536b7e7191c1c4a77ef607afb063338e4633fc0eed2d6fad2fd7bfae26ed0505f97518d8d696cd873fb05b477f4d4e60000a07c04c0000094da9e1a0077f70c6443577fda5a1ad3d2dc9086fafad4d5d55602f0a27476f7d6e65e5a8a5f006d792b2802e096514db5a53d8b00180080323304340000944c11fe7655a649e39b33a6ada9fa0b7ee12f00dbde0afa0787d2d3d75f5b020000ca42000c000025520cfb5cf4fc1d3f76d41e3db427003b5704c20395fb4631010000e5e1374200005022c5337f8b619f85bf00ecaabe8181da1c000050067e2b04000025d2db37587de62f00ecaac1a1e2e9c00000405908800100a0448a5fe237d4fb980fc0ae29a25f8f8907008072f19b21000028993abfc9076017b965000040f90880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000e017a2270fffc3ffcaaf5dfa68fa6b2d0000002f56ddfaf6eee1da3c000094cef8712db5b93dc3cab5dd9936a9b5b6b4fbac79fc8ecc5f5b5bd8a47174f63ef090ec3da1690ffecbd23579fcf605593be9c09c72f0e45a1b50769dddbdb5b917ab3f8f5efaee7cf01b4bb2d73bbf90cb3f78689a56de962f7eee5f73cd032b327294e64c3bea95b9e0ed6fcbb9474f4d53b56df71bd3da5c9bdb33b477f4d4e60000a07cf400060000766ae3eaa559ba747956ad599d35c5b46a79962e9a9fbbaefb41ae79705d866a757b9e8d59bdb4f2deacde585b06783e9a72e807ff3d97be73ef2cfdc66fe43d454fe06927e4e5fb4ec8b4238fcc11d5697a7aeeb922fff7b72fcc796ffb3fb96e95bec20000c073d30318008052d30378f75874eb95b97bf98c9c70e1a9995d6b1bea5e9efb6eba2d4f6f6cc9fe67bd2ec7ec911d6017e5d66fdd93e5338ecf85a76d7a6780b2db7d3d8047f43f7a793ef0a12f6541777df6d9d413b8b66e447f56ddfec57ce27fff671e193c38effdfb4b73f1a1bbb72fb01ec00000501e0d1fffa33ffdf3da3c0000944e4b73636d6ecfb0b17b20a35b77ff00a1ed8b1fcdd2ce31d9ebb059195f6bab6b1a932975abf2f88a0de96fd93b074c1b090f063b16e6813beece3d0fcdcbfcf98bb2bcab3e13a74e48f316e30ff5ae5d90b9b7dd95fb1e79ac5ab37ab02d53268f49535dad20bd593b7f6e6ebbebbe3cf2d8fccc7f7a7506474fc9e4314da9cbaadc7ff50db9e7e9c14cdf6f6a4622feae2cb8f9eadcf6d0da8c9ab34f2634541bb3e6c16b72fddd0bd23de180cc185db46cbddf279fe9c8f0b88999d856ec7744c76337e69a3b9ecef0c4b62cbbe7a7b9fba125199e3127539a87d2bdfcb1dc75db1d79e0d1cab6cbfb326e4673657fcbd23966af1c366bd33b03945ddfc0606d6e37e8bf259f7cf7dfe4bec917e437cfeaca0dfffdf55cd7736a2e38714ad6de7469fee68aa5997ddce1d967ce8939ffbc23b2fafa6fe43fae7c2607ffcad99955fbffbadd6154d39e75bfeced1da8cd010040f918021a000078c146358d84cdc34323030bf53d737b7e78cd7d796afd50c64e9e92c96307b3f6c9fb72edb50fa7bd5a910c2dbb2b57dff0601677376642ad66e5bcdb72cd1dcfa46fa422cbeefc496e78f09974374dc8e44acdd8c1559977ebb5b9e399a26272268ee94feffa6559de55dda072e06559baaa2fbdbdcbb374f9a601a9dbb374e986f40e4eccb469c5726f16dd3ab2dfcefab195fd8e4d7de73379f0c66b73fba2cdbdf986fb7a2afbd99827eeba354fb46f0e087a17dd916b6e9d97e51bebd23aa1724efd8b72eb8d8f65436d3dc00bb1e08b9fcb75dd07e592cf7c2cbff2b17fcfa56f9f9e676ac3414f38f37d7947eb7fe6bd6ffa58ae5a57299e78623efa995fcf81ddd7e4f35f9c3fb2030000806d088001008017a8370b17afaabc3664e294a2f7eb407a86c664e6f4fd72fc39afcd99a79c9c53ce3c27a7cf69ce70e73379ba082f2a962e5c92feb4e580d35e95d3ab35afc95947cdceac09cd95f66a45162ea9ccb51d90d35e757a4ea9d49cf9da3373d4ec7d32615451519f19d327555edbb37a652dec5db92a6bd2929696e1ac5ebe62a4ad6b79566d4ceaa64ccff4ca62dfa27b3377797f9af63929e757f677ca2967e6b5e79f967d5bfab37ceebd5934923ed7f46670c27179dd05e7e7fcf3cfca21e3d664de43cbd35f373947bfeebcbcf2f49373faabcecd593386e2e9bfc00b775fbefdc3656939f3ddf9957d8ae5a60cf4177f9032540b819fc801c53382dff04cfef5f2078b82649f77e657cf6ccdf26f7f3db78eb40000006c45000c0000eca2f55970fb1db9bd3add92eb7ef8e3dcbb6230f5130fcbcb6616eb1b336ef61139e1f46332bb3919eaef4e57d7baaceb2c7ad176a5b3d655b6b5fa9cc9ee2c7974415676f4a5b2874c3cf0f81c73d8d45447694e6b464a96e4d1f9abd2d13758f9c965620e3ce1981c366da462d4acbd33a5f2ba66e548d8bb6ae5da0c8f9e954366346760dd9a6a6fe3be652b2a675c97e9fbec53fdc167e5921519485be61cb2579e1d35b5615a0e9cd5960cacc89295b5b6aab6ec7bd8ec3cfb44cc8ee559d993d44d9f93fd9e6dac9cf7a10756cf03e00559705beeaefc1fd631a79ff5ec337f972c5b9b1cf7e17cee9d7b67e91621f01fbfa25650a93cb3f2ffb3e97e380f2ca8350100006c41000c0000eca29eac5fba344babd3ea6c1c1e9d19879d9a73ce3aa816dc2643ddcbf3e04d3fca77afbc32dffede8ff3e31fdf9847d66e1a9279c4e4a34ec9cb268d4acfb207f3d36b7e90ef5cf9ddfcf0babbb370c3a6bac939ead4c33369544f963df8d35cf3fdefe6caeffe28d7ddbd30cf968c9a99e913928155cbb32aed59beaa378d132767bf291353b771657568e8356bd6570a2765fa8ce2c79e81f4f517c3548fcbf86d1ed53b7efcb8ca7f87d3bd71d378d223eab6fc69a9bfbfb287a46decf8ad7f881ad5943deba999c06e75e0d139bc35997bcb8db5111092bd674eaa345c9b47dff6a55cba4508fcb2638fac55f4e7a65be626ad2fcb5107d69a000000b6200006000076d18c9c70e19b7361757a632e38ffd539edb019697df6a78a8d79ec96db327f4d5da61e71465e7deeb9b9e04d6fca2b0e68adadafa99f9843ce3e2f6fbce0dc9c7dea113968e6e80cb72fcebdd7dff1ec30ccf5130fc9d9e7bf2117bceeec9c7ae44199397a38ed8beecbf5b72faa3d27b82dfbcc1c97f4aececa35abb36e634366cc9a99fa19d332b93a34f4ca2c5b35984cd93bb34615f58d69ac26b5fde9df6aa8e7a4af7f247669696dabbe6e5765e3a2d7706ff7d62171868632f2f4638017e2f4bceb4d33d373d317f26fb5debc47bce78339a5f5c1fcd3afbc291fff517b46d56f1a0efad19190f8996fe4cb377567c69bde95d3aa5b0000006c4d000c0000ec266bb2aea3f232fdf09c7ad0d48c6b6b4d53fd507a8b219c9f3594ee358b33ffe95519686acda49907e5c8535e9513673725031d69ef2e4abab366f1fc3cbd6a204dad1333f3a02372caab4e48b56443478a92c2e8bda667743ab3feb19559533735338a07fd8e9a95bda754ce64d16359df9b4c983e33d5fcb762f2c4a2a7efda2c595c3c5f7393de2c5eb2b6f23a2e13278fb46cd7d871195b5739feeae559b54587e6be679655ae1ae0853bf07dbf9b57b62ece37feec33b9ab7856fac473f2e96fff5b3e72fe7139e2c8a373c21b3e9a3f79fba69ec08fa67f9f77e6a3bffebe7ce87d078dec000000601b026000006037199db696cacb8ac772efd20de9eada9095f36ec95d9bbaf5560d64d563f7e5c17beec82d739fc9daaeeeac5d3c370f2fed4f9a2665cad8a264551ebbefa1dc73fbad99bb785df539c28be73e926ac9c4c9294aaac64fcfd4e6cae1962fcff0e469a98ef49c5199397d7c06d614cf011e9799fb6ceed53bfa804332b36938ab1fb83eb7cd5b96b56b9765de6dd7e781d5c3699a79480ed8348ef5f6d4ef9383f6ad5c5ccfc2dc7ee3dccc5fbc388be7dd91eb1e5c552b0078819a4ecf1ffdfdfb72f0daefe50f2ffe8dfcf3edabd2df72402ef8c8a7f27f3e55993ef2c6bce677be94bf7ce5e85a4fe02772c0affe6a4edbf4d0600000806dd4ad6fef3662190000a5357e5c9148ee3956aeedceb449db0cb9bc1b2cbaf5cadcbdbc1802fad4ccaeb56dcfd0bac772d3adf3b2b677e4c78cfab65939e980fedcfee0f2cc38e1cd39add878706de6dd727b1e5bdd9b4d9d69eb5b26e7b053cfc8211347fe467570eda3b9e5f6c7b2bae7d98ab44c3934a79e71486a2555abeefd616e5ed89b092f3b27af3ca416f6b63f94abae9d9f8da30fcaabce39225b3ef277a8fb99dc7bf3bd59dc39383274735d43c6ec75544e3d714ec6d6f6dbfee055a96c9e835e754e8edc7ae33c73ef4db97b51d7c879d7b765f64907a4eff607b37cc6f1b9b07a71c09ea0b37bcb9104768ffe55d7e66f3ef8c95cbdbc3f4da3f7cda1c7cdaefdff577b16dd3b2f8b3656da5b5a32d8d397bddef9855cfec143b33b33e031adcdb5b93d437b474f6d0e0000ca47000c0040a909807f1186d2dfdd9bfe34a6a5b569c7c30e0df6a5ab7730754dcd696dda7ed5605f777a0792a6966238e95ae36e30d4df9d9ea247f10bd96fedbc77f739012f1d3f8f0078447f56ddffa3fcf77f7d37d73fb022234769ceb4a35e990bdefeb69c7bf4843c71e9bbf3c16f2cd9ed21b000180000ca43000c0040a9098001d8dd7e7e01f0aee8cfa3975e924f0ffe61fef9778ec8eebacb09800100a03c04c00000949a001880dded171b00ff7c08800100a03c0c580600000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0000000000005012026000000000000080921000030000000000009484001800004a6678b83603003be196010000e523000600801269a8afcbe0d0506d09009e5b5d651202030040b908800100a0449a4735a4a777b0b604003b57fcf1100000501e026000002891d6e68674f50c6460502f600076cda8c6c6da1c000050060260000028918686fa8c6d6b4afb863e213000cfa918fab9b172df28260000a03c7cc207008092696d694c5b655adbde9bceaefe6a103cec018f007bbc6d6f054d0df56919d5545b020000caa26e7d7bb75f050100505ae3c7b5d4e6f63c838343e9ee1d4c6fdf6006877cec07d85dda5a5fba7f4f5fdc0d8a67fe16c33eefc93d7fdb3b7a6a730000503e026000004a6d4f0e800180ed1300030050668680060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004aa26e7d7bf7706d1e00004a67fcb896dadc9eedfe9b3af3f87d5d59fa645f3ad60d647828d9f20781e1babadadc36edb5d7c270ad6467eb0b3baa298cd48d14bf987deda8a6b0e3bacd0b9b6a5eccb1765e33d2b87bf6b5fd9aadd76fde7057f651d83de753b7c39ac2f3d9d7ae9dcfe6a21dd7d4662ab66c2fec4addd635bb7ebc9dad2feca8a6b075dd0e8ebb0bfbda514d61c7753f7bbc1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9fc62ff7d345416f71e5b9fe36736e6f50735e5dd47358facdcc3b577f4d4e60000a07c04c0000094da9e1e0017c1ef8dffbd3eed6b06aacbbb1a186cb2754ded75e4a56a7beb0b3baa298cd48d14bf987deda8a6b0e3bacd0b9b6a5eccb1765e33d2b87bf6b5fd9aadd76fde7057f651d83de72300deb49f9dad2feca8a6b075dd0e8ebb0bfbda514d61c7753f7bbc1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9fc72fdfb983dae3e7f7e66eb1e1f040b80010028334340030040495df5ef6bf3bd2fac7e36fc0580451d4379cf0f36e6435777d55a000080b211000300400915e1ef5d5777d49600606bff784f8f101800004a4a000c000025f3c04d9dc25f0076aa0881ffed81deda12000050160260000028991baf585f9b0380e7f6899bbb6b730000405908800100a0448adebf1d9ef90bc02e2a9e09ac17300000948b001800004a64febd9ee708c0f3f3bd05fdb5390000a00c04c0000050224b9fecabcd01c0aeb97b9991230000a04c04c0000050221bd6f9253e00cfcf920d43b5390000a00c04c000005022c37e870fc0f334385c9b0100004a41000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000007e718e9f987ffeeb19f9afbf9e9c8b6b4dbf348e9b90af7c727a7ef87f26e5d76b4d000000f0cb4e000c0000c02f4e435d46b7d657a7e65ad32f8dcab98da99cd798d6ba5fbe73030000801d100003000000000000948400180000809796e92d79cbebc7e503ef189fdfbb706cde727453a6d656fdacc69c76f6d8fcd6af8ccf47de3c26e7ce6a4866b7e592378fcb6fbfae2d87d6aa76d9acd6bcf74de3f2bbe7b6e6b0cae2be2f1b9ddf7cd3f87cfc6de3f29e139b327da40a0000007e61ead6b7770fd7e60100a074c68f6ba9cded193e79d1c2eaeb961ff287eb6a33155bb5d75e0bc3759b8b765c537b1d79a9dadefac28e6a0a237523c52f665f3baa29ecb86ef3c2a69a1773ac9dd78c34ee9e7d6dbf66ebf59b37dc957d1476cff9d4edb0a6f09cfb3a6952be72714b26a63fdffad0aafccb4e8e75e4eb26e78f5fd39c890db5869aae15ddf9e77f5a9f1fad1f59ae1ee780b1f9bbf78cc951a347daaa8606f3d39bfb73f8592d99b4a1279ffec4ba5c555bf533c73b7162ae7c67a5ae726efff19135b9b4683f7142bef38e62dbdefcd7938db9f0e8863416b535eb1774e623ffdc997995f9adf6b7d3f770c4d6759b179eefbe765453d871ddcf1eefc51c6be735238dbb675fdbafd97afde60d77651f85dd733e2fe2df47cda6f95d3b9fcd453baea9cd543cbbef3f9a549bdb33b477f4d4e60000a07cf400060000e02561eaa993f2f1d716e1ef70963cd299cf5fb6369ffe76571edd98b44d6fcd07df333687d46a9396fce13b47c2dfa18dfdf9d177d6e74fbed2911f2daacb29a737674cadea056b1d9537540ef6c0bd9df99b2b3a73f5d34319a8344f38b02def3d7da4040000007e1104c0000000bc0434e5ed67b56472e5a7d80d8f6ec81f5eb6213f78a437d7ddd09e0f7da92b4f0f252dfbb6e557cfa895bf7674ce9a5c791de8cf9597afcedfded09ddbefdd98bffddcea7c6d71326aa4ea856b1cce0357adcd87bed699efdcd699bff887f5f9fe8a62457d0e3ea8b55a02000000bf0802600000005e025a7350f501bb4379e0de8d59556dab79a233772e2966ea336bdfe66ad36bf769ac86bc7d4ff7e4d227aa4d3583f9f747fbd3575b7ae106f3c44d83b5f9425f1e5a35549b070000805f1c0130000000bffc8e6fc8d4ea4fb083597667b5650b8359b86e247c6d6e1ef93177ce8491d7ceae2d43da9a4a6d676d16000000ca46000c0000c02fbfeee1e7d56b774dd770f5b5beaeaefa0a0000007b0a0130000000bffc1e19cceafe62a621fb9d556dd942530e9f36f2e3ed86ce81eaebe28e911ec113f61e95d3ab739b1d32a731936af3000000503602600000005e02ba72efa2a2576f7d8e3c695c8e1c69ac9af5cab139734665666820f7df5e4d8973e74f7bb3b0c88027b6e403ef6ecbec6a6b32fbf8f1f9d8098db525000000281f0130000000bf041a73de5fcfc8373fbd79baa23a4dcb478f2fd60fe61b3fd898f97dc9a8bd47e7d3ff7b6afefec353f2b98f4ecb3fbcbe39632b15ab1fe8cc3f2c2a6a2b16b5e7f337f6a727759979ccf85cfeb733f29dbf9e99cb2f6e4bcb92feacaf9501000040d90880010000f825509796d6fa8cdeced4da502b79a2237ff9af1db965c570eac736e6b0394d396c9f86b40c0ee6911bd7e543ffd65d2b1cf1c07757e78fbfd995b9ab87d2d9379cf40d66eecdebf347b70d66648068000000289fbaf5edddc5185a0000504ae3c7b5d4e6f60c9fbc6861f575cb0ff9c375b5998aadda6baf85e1bacd453baea9bd8ebc546d6f7d6147358591ba91e217b3af1dd514765cb7796153cd8b39d6ce6b461a77cfbeb65fb3f5facd1beeca3e0abbe77cea765853783efbdab5f3a9cbd459cdd9afe8f63b3894271febcfaaa2bdba76c4739ecf891373c5bb5a3269434f3efd8975b96a537bedb5b0edf136d9714ded75e4a56a7beb0b3baa296c5db783e3eec2be9ef3fa6baf859d1defc51c6be735238dbb675fdbafd97afde60d77651f85dd733efff3ff3e36d9714d6da6e2d97dffd19ef564ecf68e9eda1c0000948f1ec0000000bce4ac5adc9b3b1fe9cd1db5f0f7674c68ce3bffd794fce79f4ecc1ba6d5daaa1a72fe51a352445d439d43797aa4110000004a43000c000040f9acafcf7efb3565f2e496fceec7a6e74b1f9e927fa84c5ffaf3a9f9bd232a3f0a0f0de6d69b3af368ad1c000000ca42000c0000400975e7539f5f9b7f7d70201dc3f5d977dfa61c5e99f61d9b74aeeecb955f5f9b3fbb7db0560b000000e5e119c00000949a67006fff598f85ad6b76fd99913b5b5fd8514d61a46ea4f8c5ec6b4735851dd76d5ed854f3628eb5f39a91c6ddb3afedd76cbd7ef386bbb28fc2ee399f97c6334e37d995baad6b76fd783b5b5fd8514d61ebba1d1c7717f6b5a39ac28eeb7ef6782fe6583baf1969dc3dfbda7ecdd6eb376fb82bfb28ec9ef3f10ce05f469e010c004099e9010c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c00000000000000025210006008012a9f3091f80e7a9a1ae3603000094825f0f010040898c9dd8589b03805db3f758bf1e02008032f1091f00004a64affd47d5e60060d79c30d31f0f0100409908800100a0440e3aaead360700bbe682039b6a730000401908800100a0448e3a734cc64dd6930b805d337b5c7d7eeda8e6da1200005006026000002899b3de3aa1360700cfed2f5ede5a9b030000ca42000c00002553f4023ef1b5e36a4b00b07dbf7d7c8bdebf000050420260000028a173de3d49080cc00e15e1efe75febb9f1000050460260000028a92204bee037a664bc67020350533cf3f7f2f3470b7f0100a0c4ead6b7770fd7e60100a074c68f6ba9cdedd9eebfa9338fdfd795a54ff6a563dd408687922d7f1018aeababcd6dd35e7b2d0cd74a76b6beb0a39ac248dd48f18bd9d78e6a0a3baedbbcb0a9e6c51c6be735238dbb675fdbafd97afde60d77651f85dd733e753bac293c9f7deddaf96c2eda714d6da662cbf6c2aed46d5db3ebc7dbd9fac28e6a0a5bd7ede0b8bbb0af1dd514765cf7b3c77b31c7da79cd48e3eed9d7f66bb65ebf79c35dd94761f79ccf2ff6df47436571efb1f5397e66635e7f5053de6dc8e7aaf68e9eda1c0000948f001800805213000300db1200030050668680060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002889baf5edddc3b5790000289df1e35a6a7394cef29bf3c5ff7c381db5c52d8d3beacd79df2ba6d7967e81fabbb26e633266425b9a6a4d3f63dbeba86f4c4bf3e84c3dfce49c73eafe19df506b2fb965d77f2d5f7f6a76de75c9cb33b3b2dcf9c4cdf9ee75f3b2ac6ba8b2549fb65927e6ad6f3c3653b7fb7e74e5c71f5e997b56d5162b9ac6d4a7754a734ef9ada93971afffc9bf7d1e4af7dafef4b534657cdb8e8ebbfdf31dbbdfe89cfdbe89396cf21ef2b7da372fcb27ff3979ddd766e6b85ad35616aeca3ffe494f0efce4ac9c3ba7d6f6acf5f9da45eb93df9c938b5e5e6b82e7a1bda3a736070000e5a307300000f012d69259c79d96b3cfdc7a3aed90f1b5f5bf608f5e9b2ffdfbb579a4b6b8635b5cc71927e594c327a47deed5f9f2771e4967ad628fd27d7fbef7c387d33ef994bcfdddefcc256f393e1356dc91fff8d1820cd64ab6a7ed883179cd2513aad3d96f1f9dbdfb7b73f5c797e7d6f65ac1ff889edcf897cbf2952b771e2e6d7bbe939675e65b1f5f917bff47cf17000080b211000300002f614d997cd05139fed8ada797edb565cfeffe6c5cdf9e7595a9a367dbf87064ddc6fe64b0676d9e7ce8c9acdaa2a47fe3c876eb8a820ca6bb63a4764b833d1b466ad67755f6b659b5bdbbd85965bb67f7b123db5cc719afcb25afde37c38be7e6ae95b592c2604f3aaac7dadeb58c78f69c3b7ab61b966e777d6dbf5b9d62b56d43aa97b049d1a3799bb61d5d7fa1baae7a9ccafbfccc823cb878636d4dc5b3d7b2cd310a0b57645df37e39e38d4765d684f199b8cff139fbd0b1e95bba288b6a25dbd334bb2d27bd6a426d9a9c0b3f35210735f665ee8fba6b152306bbfab276556f65ea4f5fad6d2b030369afaeef4de7760b8a5ebe23ebd7766c79f283e9ac7c03f50d25c3958b5abbaa2fdd03b555dbb1edf9fecaff9d9883067b73fb36e7dbd7513bd68eceb7afbfb67e07c7dbc1faea7ed70e6cf57d526ddbea9a6ad7fa33d759ecaf37edd51eda5b1a5957bc6f835d3d997fcb86ac7cf6989bb7dbfefbba1b3cc77b51fdba57afb7721ef33b32f7f1adbee19fe39a0000005e5a0c010d0040a91902bac4aa43272fcafebf72515e35a3d6b6adcec7f3bdffba218f6f481a1a92c1c164dc4167e79de71d9c31d58247f2cdcfdd94be7df7cdfac54fa767686c8ea9ee6f63e6fdf0ca5c35bf33c38d8da91b18caf8634ecd3e4fdc92f527fe66de7664b1ed609eb9f5dbf9ce3dabd253579f86c1a10cb74ccd89af7f53ced8bb616448e3072a07de64d699f9c88587d716b6b0a3eba80d0d3de19523c7eb7cf427f9c6354fa423a3d2da3090eebe64d23117e457cf9a99eaa8c883cbf2d36ffe3877ade84f636b53867b7b3334fec8bcf5a2d3b34f51f09ceb17e43b975e93f5c7bc33ef3e6da4f774f75ddfcaa5b7aecc8cd37e2d179d38f2efa87a4df367e6c2f7bf32fbede4fa9fad7f6a5cf66f5c9627d70d3dfb1e0c2eb933dff8fedcace8499a1a2ba7d6b8778e9abd3e73976d1e027a6b8359f0a3afe43b2b0ecac5bf767a7e7670ef912195179c382dbf7d515badad501b6a79af09f9938f4da82c0f65f1b797e79bdfea4bdfa8fad4f70d65b0b539677d627a4eab0d13bde1ce15f9b74bbbd359b9a69686e174f5d565fff7cdcc3b5f5e1bc47ba02b37fcefd5b96dc1709a2adf44fd9dc3697ed9f85cfcb18999d638322cf1c291ca8a861cbfdde18b77f17c9f3dd6501ac654ceafbb38df969cf3991939aefa65dafa7a9a2a5f839ee1c69cf4ffed95d71c505ccf73af5ff7ed25b9f4bb8d79f397a667e43bb333dff9c0ea3c94b6fcca3f4dcb8145d340e59a2e599fbe77ed93f79c5bf962b577e45b7fb62ef3560fa7a1f2960cf6d765dc1913f36b1f1897b1d57d8cbc077dc7b564ddfd3de91eacbd0713376fd734aa2efdc30d39e9950db9f3aadd3704f4965fbba6e1a1f4a63147fdfef45c70d4c8d76ec9d716e7dfee6acc81a3fab260c9707274ed7dde744deb929651494f7732f9559372d125636bd7441919021a008032d30318000028a915b9fe8a1bb2a0fed0bced83efcf877ffbfdf9d08587a6fe891bf29f37aea8d58c58b9be39af79f7fbf291df1d0961bbefbd3a3f9e5f9703cfbb281ffaadf756b67d4b0e5f71771edaa2036bf7c33fce9577b567dacb2faaeefbc3bf7d51ce9ada9e3bbefbe33cd89dcc7cc545f9c82bf7ae54ee9d57ffee6f6e3ffc7d0e83eb3bd39d719952a49dbdf372ed0d4fa7fea0d7e6bd1fb8241ffcc0fbf31b67cdc886b937e7b6f523f5ddf7df9ebb568dcf29eff9f5fccefbdf930fbde7ccecddfb58ee7ca87717d6ef9783673566f5e2272bc72c0ce6f1c5ab336ad4a8acacb48df4fd6ccf134b36a469afd995ea9d5fffb336ac4acf216fce879e7d0f9ec94f7e786fd64e38361757be2e1ffaad5fcf25af6ccdc2055b84e55be9cf8a3bbe9b1f3dde9769871ebe9df0f739b4f76555473271767375b1ebd695f9cf6f0de5808fee9d8fffcbec7cec4b7be5d507f4e7fa4faece53d58a8db9e1dfbb3378cae47ce4f2d9f9bd7f99955f3da73e4bbedb9ea7abeb0732f773ab735b674b2ebc74df7cf40bfbe6639f9f90e94fb5e7eb5f2ebe3926e4a2af4dcbf15393f1e74dcb9f7c6d7bc1e573181848c716e7bbe4ca75b9737963cef8ab59f9d8178af39d96a35b7b72cd976b4f8cded89e6bbfd597896fdf2b7f50b99e8f5cbe775e77f850eeff4e47aad1d64ed64f3ca525937b7b33ffe1a2b862617716f7d6a779636f166c4ab1efefcd92c1a6ec77426365a12b3ff9cbb579acb12d175d3e271fffb739f9834fb4a5e1b6b5f9ca7f748dd4d72c5f5a9fd77d7676ed3d18c8ed9f5f9b797595f7edf395ebb87cdffcc15fb665c9cd23df9b3bd3b76ea467eed6d350e5abb18585abf3957feccdd877cca8ec7f763efa6fb372d12b9387fe76556edfe2df6d56f5a7fbcc69f983afcda9fd51c0c8353d39655cdef7a57df3917fa99c5be59a866e5893fffec9f6ba53030000fcf213000300002f611b32f73fff39fff7735b4edfcbfdc5aa850f675efbe81c75ee99995debbcd934ebcc9c77c4e8ac7fece15ae03762af63cecac1e3467aad16cf707d60fe8a64d6b179dd4163477ad7364ccec9af3e2c139e1d19b652f3d0e20ccc3a25171eb3a9666c8e7be329993db0b8b2eef9f62c1b4a5f676d68e6cab4e2a9db73c58d8b3338f9c01c35adb2baf9b0bcf137df9b5f3f67ff8caf9de69823f7cbf4accf8a2523cbbd3dfd196a68cca891c54ac1e179dbfb2ec985478f8489cfbdbe2107cf999efa95cfe4f16adafb54162e6fcda1c7cd49f3f2c5995f34753f99a7d73466df838b7ea1cfe3fac71c98979f3c35b52f41e5ebf2789eec1a9b979d7562a6571b1b32fea0b372c2dedbfbf17463eeffd657f2d5bb3666ceabdf99779d32b1d6be7dfd8bba72e7b5ebabd3755f5a962f7c6c7d1635b4e4b40b5a2b6b0732f7273d69386d7c5e5feb119ac65139f1574767f2facaf55443d0c1f476579a9b379d4b7d665db44f3efa3753b26fb1b87143eebb3739f4dd53b2e931d30d9327e49c731ab3b1728e0b469a76d9c830d1b540737167aefbccfa3c31d094c3cf2ece37d9fb6d7be7635fd82b2f9f5dfba237b6e5c8e31ad2bfb02fcb8be5eecaf7cd605d1a9f1de8a029c77d6c763efafb13526ddad9fa19ad993375288be78e84b7ebe6f6a5fdc03139f980c12c9a3b12ce2eb8b737fdb35b72f494cac2c39d796879438efd9da99953fb461a75f0d4bcf19c86acbbb173abebdfe7f55372d8e4dafb5879dfe63d9acc79cbd467db46cd9e94d79c5dbbaee7349807ff7659fee9c3db4e1d79a6565158f093aeacdb774cde726ecbc8f763e5bf73de352e0734f665decd5b04b9935bf3aad7b76efe7750bda6a69cfca1a207f748d3a88327e7cce3ebb2e4d60dd93ad6060000786910000300002f61a373f8f9efcc25efde727ad5c870b61b368ef4a0dd6678e89953c625dd1b53eb4359555f8c0ffdacf6746e4cc64c9c5c0b926a268dab0d1b5dd8414dc3e44c1a9d7475b6d71a76d5c63cf2836fe44bff3e327df5fb0f65c394e3f2965f3929936b15833dcbf3c0f557e7bfbef6d55c7ad9e5f9fca5b7e4990c65a8164a4f38f6b81cd6b23c375cfeaff9872f7f2bdfbbfe813cb96ef3334e77b6bee1c0d999911559f8446561e1a22cc9b4cc3a6146a60eaece92e595e32f78262beba767ce0145f5f3b8febabaad6bb6fb7569c8b489950db7b5fee1cc5d3c94035efdce5cf0b25ad0fc1c7a1eefca2d577454a7bb6fe8cdea71a3f3eeff3723c75477dd978e75959a3bd6e5f31f5894cf6e9afe6263d657dec7ceb545cdb89cfae651e9bb7e55feef7b16e78b7fb532d7ddddb5f959b2ab062a5fa9a1ccff7fcf6cdebe327de5c78349c7e056df53bba2e3fa359b03cd8fafceddab9b72c69fcec8d9cfbe378359f3d0da7cefef96e69f8a63bdf7e97cf9aacab10687477a654f199f33ceaacf92cb97e66fdefb4cfeedd255b9e3a1decdcf09ded9fab4e590a31ad2fe5077d66520f3eeefcfd4c34767ff031bb2e6f1eeca31bab2e0e1a18c3fa235d5e87d6dd1d29869dbf46ade7b76e3cf5c7f7de316bf6ea8be6f0d993c6beb5f4154b7dba96208e939f993a2c7ee56d3846c791a1dc510e38b3bf32f5b7c5d3efb3bebb3b0f2b5dbb8668b070e574e61abb3a85ed340eef8f816db7de0995c357738593750795f0000005e7a04c00000c04b587d468d199f8913b69cda36f7367dc9289e3dfc9bf948314c7231fdce7bf3deb79cf06ccfe5743f9a6f5ffeed5cf7546f261f74545e79de85f9b5f79d9ed9b5d555ad07e6bc4bde93df7ccb2b73e2ac31d9f0f49df9ce57bf9a2b1faef5c6dde9fa43b2ffb4812c796a51963db52cbd3366e5a086fd337bda863cf3647be63fbd22d9fb801cb1b3147677ea1b4e43ebc44c99b46b071dfbea29f9bd7f9a5d9d2eb9b029f52bfab2a01aec6ed672705b4e7febb8ada6575e3221271d3cb27eef0bf6caeffef38cbcf5bd6d9991fe3cf08f2bf3b93f5e935a47eb8afaecf5eaadb73ffd9de3f39a4bc66efdf5d80523c3446f0e353ff67733f3f283375feb92ff5896cb3ed399a5adcd39fee24979c75fed958bcedbf2bd68cce1ef9f95dfffa7a9b9e0cdcd19b7aa37377e6659fef1b3edb59eab3b5b9fec777273da16f5665e7b679e7aa221b38f69cede95a9e5d1de3cb6ba3b8b5635e4c0d3b77c4ef12fb1e92d5b7f5d2ad3d9ef9e90334f7db6bfef0e54ae719bed5e7ef184bce61da347826f000080971801300000504e5327645cd666d9a2da72cdd3cbd7266327a4185979fba664ca84fa742c7e2a6b6a2d85c1279664556d7e534de7aae5b567e6d6742fcfca8df59930a5182f77375a303f0bfbf6ca99efbe20af3ae9a81cbacff88cebda98cedaeaaac19e746c4c46ef73604e79c56bf3ae5f7b674e99d29b271f7b72d7d6a72587cc9a94ee554fe791951b3363cefe69a8b41db5ffb4ac5e7a5f9e5e319069b38ab6c28bb8fef163d2567967976c7ac66c554f96acaa9cdcb6a69d9c8bdfff969cb1e32fd60e4d79fdf81c3eb63f777e797d2dec1c95099393feb65139fe551372d2a6e9ac3139fcd47139a8f670e1be8ebef48d6ac941a74fce057fb4777ee7f75bd3bca42b0f16e73bb531631a86336adf719bb7af4cc79f3a3a4756f6b37bbfea9563de3e9031af9e92dff8c0e49c74fa98cc9cda90ced5cf8e435e3194eeb5fdc9b8d179d9f95373e127f6c907dede94eebbbbf2e82eadaf78594b6635f767e9f7fbb2726c730e29bad5beac2dfb37f7e5c9eff565d5b8e61cb8a9abedacc68ccf40963c565bae796afe40f5bdd9e1f399abefdb60963dbaf53375abdbed2613a714df990dd97f8bafcb49af1a9bc34f1c5bf91e7e8e9ec6d31a5274101ffbb22db79b90634e1c9d634e69ab7caf020000bcf40880010080729a71440e9bdc9b79d75d9779d5a18efbb3f6b1eb72cda3bd9972e811993952b51d0d39e2e4c332a1fd81fcc77f5c9fdb1f9a9707efbc3e5f2f9ec95baba8d61cb16f1a97dd936fdfb13cddc5a8bc3dcb73dbf7eec9d2c67d73e4e1b55e9a6347a7351d59beb83ffdfd9b875b7edeaaa1e9ba2c7a6c43f51caac7ba6e5ed68facad7afabaffcc17bffce3dc531bd6b97fc52379725dd236765c757967eb0b130e9f93296be6e5819553b2ff61230f8e6d3d689f4c59bb304f744ecb81476c7a98ec2e5efff6cc3e26474eeecb63375c97c73b8aabe9cf8a3b7e943b568cacded2e05337e44b977d23573fb5f99ddf658d63f2ca0b4665f0fe0df9c9c34568da9813cf6b4dfd9debf395efd78675eeebcdc3972fcf3ffce6f2dc5ee4cf1bd7e5ebbfbd34977fbd7364fd405f1ebfb52f5d0d0d9930b5b23c7a7c4e3ab12ef3bfb83c373f3550fd5af4adecc8f7ffbf25f9fbbf5af76cd03c6e62d2f5746fd6f70da6ef05679c238175e7a35d59561dc178306bee5e9d9fde375c5d5bf5d8ea7ce17796e59bd7d48675eeebcebdf7540e38a161a4e7eaced6578dcbe1c726f3afaa9cfd316dd9afda3626071d3e94f977f6a7edb8b6144f7dae9a333647cc1ecc4397adccc32babdf8995735a991fdd3098a9678fcdde23553fabfabed567e97fafcccd8b8aed86b2febe95b9eaa617f075dd81fdce6bcbd4651bf25f5fec4875c4e781813cf3fd15f9e70f2ccdf7b609acb772c8b81c337b2077fecda66b1a4af7536bf3f58f2cc9a55fdace1f25000000bc04347cfc8ffef4cf6bf30000503a2dcdbbf28c495e923a17e5de87db33f188a3b2ffe687f36ea135b3f79f94ae27efcf2db7de955befb82f739fecccf8235e950bcf9c9991416157e5913b9e4ef63b212fdba2fb62fdb87d73e49ca6ac7a62411e7b727116ad6fc971af3f2cfd0f2e7eb6b67ef27ed9bf65651eb8fd8efcf48ebb73fb3d8f6669dd3e39fbc2d7e4c831b5bfb59d302da3963f903b6fbf2bb73fda97fd8edd376347d66cb6d3eba8183f2d13373c913befb82bb715c7baefa90c1f7148c62e5e91badaf94c98333d434f3e90dbaad77a77ee78684586f63e296f7ddd21195d399d9dadaf6a69cc9a47e665d99843f29ae3f74e35ee2ddaee7f28cf8cdda2ad6257aebf73e1837970fdf81cb9d575175f97b159fdd0bd956bb9a732dd978737ee9f330ee8cac2f6ad6b3b1eabec77617b9a661c9923663cd7bfe5fe2cf8f1c6acdd7b744e3a6af300e0cd073664e3cd9d7970de500e7b755bc6ecd5960327f5e4de6fb4e786ff5e9f9bbfd399c75737e6d80f4fcdd9b31a9251ad3960efdedcf75f1d23ebbfbd218f2d6fcc911f99965715eb5397a9c737a7f5a9cedcf8d5f6dcfcadf5b9f5aaee6c98313a6ffcf0e4ccacbe39f5d96bd6401ebe72436efc564796ce1897a3f6ad2b566c61fbe7bbb5facc3c68384fff68436ef866e55c2afbba6f71538e3f72284f57cef998734767dc94d6ecddd0953bffa33d375e515ccfc62c1968ced97f3a2d478dad1c7367eb6b26f575e796bb86b2df85d372f85e9bdb6ebc6570abb622449f7362e53dbda772fd95f7f0a6ca39dd7dd760269e3329bff2f6d169aed6f4e4c16ff524274ca85c77b5a1a278df9a32745f676efd66b15d7bee79a02167bdb9210b1e4a0e7acbd8edff41c6facab95f379049af1a9f0327d4da9eb5cd71c6b4e5e003faf3f8772a5fbbe2fdfa7647ee7facf2cff592a979e3098dd5bf7edff06047e62eadbd77d57d14b6bda6f6dc765d5fea8e9e9077be7fdce67f1b944e6fef0bfeeb0c0000f8a557b7bebd7b8b3f1f06008072193f6e535cc59e6cb067433a7a9296b163d3fa1c9d53b73438389886862d8b1fc9373f7753f2cadfccdb8eac3555f567e3faaef435b565e2e81d8479fd3de9ae6fd9e563ef507f57d66deccfa8d1e3b3a3438d5cebd00e6b76b6fef9db85ebdf81fe8dede91c6cceb8cabfd317fbd63c3f23432377578e3a7e52e3768e3d98ce5503e9ab7cfdb7bfbe626020edeb0653bc89e3dbb69712568ed1359cd6b6177b653b3bd78adab90c363766d2b8ed54ec6cfd0b30d8d597f68d49ebc451697d1e7f6733b25d5dc64c6daafd11c6eed7d7d19bcedefae77f8cbefeac6daffcdb18df9c313faf93e397467b71530000809212000300506a02605e880df77f3f5fbebd3fc7bde9f539757a116af667d1b5dfcc7f3f549fe3ffd73b72e6a4913a005e9a04c00000949900180080521300f3820caec91ddff97e6e5bdc5d7dce6b55c398ec7fc6ebf28663266fbf1726002f1902600000ca4c000c0040a909807931360d979c3465cc84b6ca7ff965f4c98b16d6e660f7fb93afcda9cd512602600000ca4c000c0040a9098001806d0980010028b3fada2b000000000000002f710260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c0040a90d0d0dd7e600007c360000a0fc04c0000094dac0e0606d0e00c067030000ca4f000c0040a9f5f6f6d7e600007c360000a0fc04c00000945a5757afa11e0180aae23341f1d9000000ca4c000c0040a93534346463574f6d0900d893159f098acf0600005066026000004aad1a006fec4e4f8fe11e01604f567c16283e1308800100283b01300000a5565f5f9f8686c6ac6fdf200406803d54f119a0f82c507c26283e1b00004099f9c40b0040e9353535a5aef2bfe217bf1b3abb3d131800f610c53dbfb8f7179f018acf02c56702000028bbbaf5eddd7efb050040e90d0d0da5afb737c395ff15468f6e4d7373531a1b1a525f5f576d03005efa8ad077607030bdbd23433e178af0775473b3debf0000ec1104c00000ec31aa21705f5f8687876a2d0040d9d5d5d567d4a851c25f0000f61802600000f638030303d549100c00e55504bf8d8d8dd5090000f6240260000000000000809230f60d00000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c00000000000050120260000000000000809210000300000000000094840018000000000000a02404c000000000000000252100060000000000002809013000000000000040490880010000000000004a42000c000000000000501202600000000000008092a83bfbecb3876bf30000bfb46eb8e186da1c000000b0bb9c7df6d9b53900ca420f60000000000000805248fe7f80fed2bbcafaa0f60000000049454e44ae426082	2024-12-01	\N	1	1
3	facility	broken-doors/windows	The door lock is broken, and it feels unsafe. HEHE	\\xffd8ffe000104a46494600010101006000600000ffdb0084000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f1718161418121415140103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc200110800eb012c03012200021101031101ffc400370000020301010101010000000000000000040503060708020100090100020203010100000000000000000000030402050001060708ffda000c03010002100310000000ccdc65366f39ef6a69ac15cf6cf3db8422b1ab7ea515e64ae772cf5b59e99f0745d20d633e38b1f5335a9678fd9f4811d752f3efab9f9eaf9e8f4ecd58f95f69d11b6e6766a3718d8d421ec3965bcc36eabd45ce6bfd23e2fecbeaa9bf9cfab676273b7bb2bbc3c8897a0a3c4fd6b72f3fedd7fbce73162761add6da55513ab4721d1d1d85b0704d5321fc09a9fe1b1ee25b186158cfe6aebd54ec1e545aacc599e52f513adc81ed80fddf29e96b22212ef10732b2f0bd25aa09df9439ce7bd061b01c1f4ad16bd668f2a11ace26587ea8c779b24f12edabdecdd3f3fcd49f79e42ed78f3125fc5b0adc448908f98be8f096b65441fc1fe0ad8b44cfe12893d594d7400e994abe658e631afcd99627d496e22b251b312543072b6200d0ae7b83cd6d9927249f23a5dbb178735d1ff79dec521ea04d2ed520aeca37342c02c9d07ca0afa8a1e99e30e86aefabf96e40d2decfafe678f3e7a17e49faa7d8720cc06244d15b22b42daef8621686017d169cb780845937d292f7b9250ac519deedd9a1da5b4ba7a9d3c32ca00ebfaa1b7cc6c5a2849d1a7fb14664fd1278e4fefd3b695faebed48ebdb83cd3eeb2f22a48b33eda331aedfd38cb5c24e77a2884f5f5888c249f8a050091e1d1baf321a0c4365ad3f965acd402a67bf159d59e12b8c890f88daf9308d6ac5a562a11c3b655ebf77116b28b6478398d93f4015655fcd748dbf2fadb4417cc36de75741c917ccc8006e24d5b60363bb0f385ed3ee2b8f1296e94142fc635fa3297997acc6c92bebd86cb0fe5a7577d5b3cb973f907e5892ce21f026932d7ad734446d202a3655db9d47897a784c5ad62d6921a6d1260fd51bc730323dadaf3b90bbaff003ebb67131d920986289cc512e45cafd5ec41f4b48c248fcd15bae88b19987b8207afd7dcf18e97c8980304364aaa4d92a9eb019a1516cf11955591b26e45dd96b4d28daab355166c0f70c64213f038239a557dc5481963549fd4e4cbc8d0e69b4c8fce44a7f41b81432a6929f125acea2476f596394a32aac6b96db4e8d754957aceb075ad52ea8e8592a8de4076c6deb6cf33fc91528f36394fc01edb3d39e646d608e5957b012a6dd92caab9d488847e7555d13988e7e69779ab686bbe111ce71fa07ecc65121931957f4ac677fc1e634a068fd152e9bebd446dea5a21f69561f188ee2daa638d961832a9b6c9b7a362130fc2b489d9b68ed453e4b4bdaf5049ee4249d2b9756db53343ae6be60e5ba0214e837a6cf913ed4afe704d4cb61fa067babc4995d5f7ff0092973dfeb80b91a49519b19e77d35cc3d7fa1f30e69e03ef78ad01d32b756d9f431d218d578731545812bdec9da6bac8783ed48ebb67a0bc017c9be226d4652f9f51c9462198898facdf67242a744de3e103ca54ded5474f71c54275451576b9fb72ab56d73848dba0d15c2bb4d3a511bf4f6e1179a3babf9a5fd3872bf2bd26c6674fcd57735da44209fc9226d4eb8a9a6bb596810e4885089ec462a39ed94cc995039ccf3b807eff007945a9598c61c329a99b34b9522df12d3484a9f2234de606d70e81a68d9be51ccbb878f692edb64bd8220cdcff00d1d6a66e23fc6efe86f29de9d07514c91a60631fd3798cccbf6133641a0700ac68e683e22f10d856ecab0fc66498346f56f515367e093d930b0833ff002e2a97f584019144c2ceb312bc1c8b3ae2e381830b8c3301a5a8786fba380abacfa634b496f655ad79b0811ce1b0ba757311fd63706c634e19f65f99a51ca0e59b97dd21ea0fba0e5b1e47d1b1327122432618ea023e14134724f334b426cd132bccbd80c12d61af86a9b7078fbf5f4c56c115387d84bf25141c01df9fcffaab6ee57356b1d9d67a0a704738832048e790fe4b2d0d966b001859096c26a2e96cef28968d82cc62129a53f3baab88c891119d5af32b12d68e26dbf4703c91252e9a702bc792f715ff0065fd2d8644f1b2bad27cfd45cf63cbe21b43c7bd61ce35d67d45e93c769584813c0481708df953c8a670e386f9426b6ad3600dd555e9860fe852605a1fb2cb8915ff00991b14a989012d65aa1dfafb4c6b184c30c9ee096ec3f543a90bd0de533eb3c8fec06179f120c9b471e9670ca818be9999d6daf412b566b0b9fed7ced2aa833d6cb5e239c086791957ed8fffc4002d10000202020202020202020201050000000203010400050612111314210722152331322433081736414244ffda000801010001050159c7957ee1cc13e2cffb2b8b5253b67cadcad96c69ebc2ce0a21116f58c72869da24959dab41c97460a59ef8d73659693e87a24541052385664602dfa3474f540a1d244157d158f87c7b5fb7b76dd5b90b12efcb7b55eccf46c83d822c5adbdffc5611a9fc368e1411bea9a1e195c035dc38716be20ac11e2be2c238b00733de71d5696881796ee428a97b3d5b85766ec956b77579c82d2f640c5982e955f148551d8c8f00cb176db11f2da400c2c51a65714ea3a7f87d3300b856a6d947e2fd7923e0a240a92e2ad9a23f0f67cbae54ae9e1b58c134f754ab51dc4eb72cec75e56f915b38b7ab256af4c3a6b5acb1bc12e37ff8fb7364405e546428298941ccfc4b0c8fe26c3973f8cdf72de9b8be9346ad9e8b43b45a78755a411b533c689b991ad3742a8aeb8572fd056b8034a66056a800f59c2d4b9c1aab839ac2b90aa2b95d613c5d328caab3f599f52517ecf3f0e7d60b77892b647f1de7226ed4123a6f0b7c0b8eed236df882f7aaf6eb7b4d5cabf24eaad69aea784ee65bc0388dc167e12874defc57cdf52c656e668d8e83853b554ac71932c9e2d632fd3f4b22ac1657a0c3c5eb0100253112887b2e0fc7b7e7d83775b63582b18b10bd6b6541fa80bbcbc5d0eaa0d35b45e427f30a238aec296c57b60f56e15fb3188ef3a9ab33c803905983afc9c7c54e4355f8448b90dd4ace0516aa607207f4bba5e33becd9fe1a4bf373c236da4315c2e78dee7669ddf0f54f29d8a35c319ca05d551b4bfb5f97eefe5b5b4f4772e2a9abc1b132d991f2b9eddb69fbe50602ad720e4e3bad76b401f7ba0682ff0021aaba270d5c295f40ab3eb3b0f88722c7b02a58f857763a2a362c8f174f53e1fb25668b516e9eee67f6f6c44f7902adb26aa6bf2ab288a7ca536b11713624a9a264d0e54a76d7131b2a1a8dd86d3f1ad672b866de971ad06a9b57621cf750f7e93fe20d3d2d167c75d76ae14503332539da3c33b0938bbebc0c4a7a4b575d6aea9ab118e997386994c42580d2ae7391dba2e27aa0a72ac4d95b292e4634d5672d2bf8e2ff0018513da7ce56f324c9f1258a26862f7766b856e49194efd6b53668a3a9d7240fc820c16ca1da9fc99b5a43b5ddf17da5a7588b335eaae179dfcc04c63ac91e23fb16b8915e9f731abb366556ae1d7b044163d6aadb331856c56c9ed5dc65560a011faa6bb2234d71746b85cab6b22baca3715a4aedad639064bfd971e4bb040494ce04f88928f033df27ef144432adab979fcd890fcb82c6343c99144b6c2e063b56356ef60a070f82f31867e32cf83c449030ff0056b4e605d667e415b1f4d4dd94894a6093af4bb1bad744d5615652efb5795eec145161b2dd8494e210731c6342bd8d53a2659738dd37859a3eb38ad138c4c44c79f32125811e0601cc9d66aeb9596f1e960ddd75a5e1fb1331b965720db2ec0b1a39b178a94fdd3564d8998f39258cfa29281b5743d26633eb80860d62930b21105ed6832ab5ccc1bac5d6afb38eddabbb3e0812ead57d3aff00cedb51bf938c22a725b028d7f36b95e75fcfe191bfbbaadca95a3412dda3b112dd7312cd4716aecd2bb8fdba20a995af71b276b4b5fb48bd9175f59476ea5bad751e18afb233ed3b19302daf21a352e9c765164978911f663e3c4db8860299fb42e63284f70be920c88ed94a3d524cecb0fdb3dae49a36ecb4f0b3d6bd4d885d00aff5356b4c8d2eb24868e69f6aad742767afb335db0a64ef54cca972b3c5899f5f20a6c27ec6905c5434eb5a8dbb1b9b2b64e729bf2b515860a0ff0049b8d825b2845fb21da50dfac2ff002b8fdda1f513debb0bd7618d902d71c03acfeea32f054d9e56b2eece9d727151fb53d73d355daba970bf8a6016c185a60a9c935ec949d7beb9ae7e98d724e59c7512a0d35c4654d9ecf4a9dcf2db69d956fc86ef0cdc6af773ccb43298d6dd8b6075a17356d7c5a6b18420999bbb7fd4b50ac1671387fe871f70cea4c9ed8d70a57eaf9863fd8bd5ebc7f8922f2961c76a8641897fae5ae9160cf6849414eb76ae5ada24b3acef2ce47b0ab607c7d408c391b9d8521abcf5e8cd7f2f2db16bcc368377b54d5d8ba769d0fc0bbe262f9b336a83d5ed6bdaf965d206f38bae35dd64b5afd95b3a4413548fa9fec46c25e084ba49830ba1ad66d5d669aaad2b95ff008fbfa6912d7a4e3c9524964d5fdad6bac6bf3f6cff002491f24aa8572b24a52349deeb3c92b7c4d89799cff184ec63faab89cfaf497dde363fcf6c62b8cf9ced39db01f2b3dc876d5f11b3eed65dea9d9ccc4e597c57554dbfa513b759634fc644f94be3fb26c0cac14a88e356003637b510ea1b9a12d1db005140c1fb95052490fa65cb2590a0b627a83990a7f5a6b3675c2b5adb9b1a9e8c6c9e4ccf663bc60be262d323e371f391d45b923ba47219edf310792c98882998b1127538136675db1fabcd6e5eb644ff0091da2024f1c882389f39606653a1e33f272a71da09cbfc160db5a997c6d869ea1edf7a5f3b61435966f20a9254b653ac4887f4c47a8b05a611315d93adf4d5b0cba0bb9acb1acb2bb1c15ac4dad05ba44ea2718aa83e6fafc53d2fd6b0c8bdb31e707ef3cfdace33b4494ffd7f8f5c3f239040c135de88acf0baafd873df3187e4c9723557a9e3831315e66169eb83e631cf554451db86ce69e96ac96db8b6c9d4d94ee5161a08c96a20999ea49d93eb6237286e03424be28372bd3180a1b0b3456ae45d85cdd25d27f0a1b41c838e5cd6d0a230ba529fd497387e6224a633d99138993f3f8fdbeadc6fab89eb7996c2229f18bdf0cbf6cf384a913d3e8c2ac08ce0075c85ccc4f85c724df16e1fc5f89c962942a1590c65aa756f06d3f1cd77c5fd16c74f3eb4b17729b127f5114c3decd76a6fec851b6625942ffc8819533175bbe0d4883d8ed2c7f0c82f0a6708559ab7f8deca8492e73e031a4cd3b54a81fd83cc338a8fc7e49b840ff15a42d57cb7e9d07b1e3bd77340f53684b5ba50a00947c785998d90f253e04b394ef66e9f17e2e5301027851e63a7dae4b2267c408905fe0faed945fe1b72a65cd60c4d6d508378e1455d8ff18a78b342d5145dbd532a7245653da8316e3af72bff00f997a59f0bd816aaf6f9f41956064cdac9b0ab4bea55e3a6697b8f2eb0a066ab64df55bd555b7b3d9f32e2c5c56f06bb650b5abc60a7efac1402f3936fbb4f13e2bf233ea24cbf74d5ba377d3253e9c15c4640f8cefd27de5e2c6beaec82dfe3b49cebf8e6c28ee2ff0017a37f2df03704ddd4dba70ed352b18fe36e463ae6d2980de13ad477f04bdade6dbb64d21cd6f668499273ff00988e98ebc14794575fb757ff00a5da5d9669f8c50e3556ed25ec29f1fd3ecb8debc15d6140333ea9edc937455e38ef198b19f42245205491b2af7bedb35fa089c1c4b09e4ba7ee3ae4ac10646293d6243c8aa32270bf5cf60ce5cd06b76716ff001ecce5ee3bb7a18fab4dd3678ca7ca90c95dd33aa8847f1bc6daff009050bec5a3d0337b6790016bb97e90bdfa7a03fd123861030511330106308fd775b02a83c7b8d7cb69571889205c84c348aa8af0170182a92c8aff0051331046c19fecc5ba248165102c9f211da7c74c19f31ea83cfb1903f384719675f52e05ee09a97e726e2a7c6df7aa95ece455c406d27e2338af16b3c89b1a4afadaff00936a8d4e71c0d25b0d0c2629307ee187e327ef0060f375b80d2a74ba89d8317d04643be393e445109241c14ad52b00889c88f3243e70c3ce001ce2e272043c51435332a1399262f17627b8941e7fbc144c675f1851e2098339b9d3a773add7ff00c4da714a353797793f0ad128f5498ad56c555d8cfcdbc4655cdbf16eddf4e871cb336a85af6842a1a53d3014421478e5bdeec85429549ca810e17e3dbfb7aa08455039ed82c3f003ed629906eecbf139585d25dbe9d504b3e2f5c35f889d898e0b06dae86ce95f6acbae4cccae0672623c7a20e7fc472feade61f8eabfc6e3d65216402a0d6594768fcf3eba173f166b97bd570fab09d79aa43097e63c40e2e20b3d41e457d71d2470831983591cd6aebf120182a2c8ae318dadf70b624c1a2c1847eb0127908ea5233e043be36bad8c0aad1cae3d02607223ccfd467989c288389081ce4444ee47c375fe9e31ea2c20cf5c4cf3efc7d539e6bf88f05a7c4b48aaaaa605d5b16d7239b6de4ebad27cab0ed748f6c3f0220cbb74910275942c9023d08bacc8fb6483cf6c0ef11f1d658033190c2095141c7489861104cf5635413e23c443970c2f5b94b93cebe73ae404c09943eeea2003522538725132ced86ec2f139d2233e80da3dc775a38b16d4f8286188032b5c75d6911b298b0080bf55ce44479f1f50641026b2c0ae27250433e23a7ff51ac3e4964032f980623dade9d4488f24e7af62f3de661722104611966c0aab6ad0562c6ab449d24afc0135b1325e0a0a2224e33ec0991db08b0c20a47611af5e8f91c6fa572aec988884040e410ce59d856a640f184beca7afb49f910d9cac3f4b291881832f5484833cc4ac1846b312896cc9a81e5f1e45ec19f0c8f181386b83c90f33c893d745c6d65fcb86c5642c70963ec120286c6760a26c86137b6418cc6cb6a9d58a6d858491879085324455572997af12dfd4accc405b1216d345e2f020962dc735abcce26b7aa147811f4662b816174f3ec85b7c8c0890f431918f31e7ae7799c2f1323f7863382a9edcc2c1238b7034c37925b525640d2cee539d2433df39271867058d58b14808a83ec89c885880c8f6093029682a62c80629f126020bc940118a63b0fb4492ff00a874412d9db0fb930ccc6156e3bc98962bb2f3d82d8f67eedb02513e3a94fd033c60f8c2cfc86d85f13fc75d277f6adae310eec211e0ccbc636c743992c03f649a8063cf8922f32533edac5325e3aca67b9dd8f5020216baa64ccf69467b8fc517994b63e84a65aa9feb594c890c4cff00bc5129823fd22c7f8a6c2eb31fd63387fede224ab9cfb5e530dfc8bffb67f1effde5fb3a27ab48c864e6640e30f15fb95929c2998c12998fffc400431000010302030406090202090403000000010002110321041231224151611332718191a105101423425262b1c172d1e1f015243343638292a2f1065373b22594c2ffda0008010100063f0156b9546a10769a59980de2e27cd446e90b0f57195053c2b1e1cf931235858bad41a1b49cfd86cee5559589a3b40b1f1cbf8f92cbd03de34959d949c2a8e5d64c3d0d4a589a665af0352ba2aaca8d0dfa7ec549a6e136d11d5aedce8596ab5d4dcdbdf6617460c8206d201b10a54c43560ab9d18069d8b0589a8d9c4626ab4dfe01949f1555e6f9eab8fe3f08548b557b9d131d21dddc1a02a8f359c29b7aad66cb7c11cf3572b98dfaa5c6d07f9d17a0e930b5d2da95fa51f10d903f2b155a006e1c3f6b8927f8054c4c51350585a6ebd278d1b2713571555bfea2c6ff00ea1639d8fab89a7e8aa4416f4076df9b402785fc15d9e95a93c7103f08450f4aff00f68ab60f1eff00d55908c0e2db3fe2acc70f8c68e4e6958ba38018ef6c70cace95acc9cfca5526e15b9f10e7b5a00eaf1ba67f48e0ab61e764d4610e693d8b333d2349a383c105001f3dad0a5fd1d303e2a9654725406a53a99b331bb31041fba68e91a55171eb6501d6dea4b4143481a21a7aad03b82d078050fc3b5dcd4bb0ad3dc110fc03b311121c8f5e9f74ac45538871653a45ec14fe68dea3201c04275101b90ba632c5d370447b9b1854aab695373a89cac0418bd9034f175b0f57e2c8e812b0b87a2fc2e3b0d87043584e57111bcff04ef6ef4354a79cc170db601dc27c957146afb9a8f6bb29b1b7275f7aa341e49185c3e500da0b9ce71fbac6547536d5f697168e94c2755761865a348d6a7959944c68bd1b87a64b2ad6c3d01c0cb8879fcae8b118b736e1f05daee0503edaf6cdff00b6215ab5578ffca7f743df551daf2865ad51bfa6a9594e27125dbaf2b3fa431c70985e8a22735573af1b1bbbe13dbfd7318f7997549652eed1cba3ab43174c0d33d46d48ee86ae8f078ec2b68cc815e9b83bec7eea28d36d16f175dcb3547baa9fa8a3f0b78959dad93c5c9cd8d1c7ceff009525d1dc9db7a7d2a43ae39217828411e28b735c7350ecd9788ff9476b7c42b112a042a948e951b956f109996d744483fac2f4550c83df63a8b0c1fa95dadeeb2f755239391eb3bb2e8b71983a55469a41534df5b0755c22f709830388a5e90a14dd99b4c1bf82ab87c77a318cccd2ce91a088e6bd1fe8ec57a2998ac33183ddb8b6ab6c2058a731fe8e6fa3c3be3631c1cdec83654e9e1bfea1ab275f68a82078c2ff00e37d2d4ab1e21c47ee9c70f87a98ba3b8d2c431de46eb0f81381af43135ea7474855c3c663da44267b4d518bf4865f7958361a0f068fca30d522948e488cb1ea6e7d86f3d5678e8ed32fd7c113458446b52a7e1536b9f00ea5c8d316116fe7c144f55507572586bb3386701cff009de9c7a5a79b7e6108bfa381a4f14ee36fbff145c6cdd1025c4596bac390bd8291e5d8ab616be1db4f12199a9624b8f7c89858ca236832b3c0246b74d44cefe2bd0f2272631957fd32efc23241e6a1cd5d7e8cf02ae19546b6d5034de5877028412ee6d2ba3c4359886fc9886e647da7d1cec2553f1e18dbc0a2ef44fa4a9d7e14ab6cbbcd16e27035001bda256aea6ef02bd1f459e91c53693f10c6b9a6a9ca5b99637fea2abb541af7617d1e38531d67f6b8f92bb538d266809b2e929fa4ab508036298913bd74ce83598e2d71e2374a2fa140d464c483bd7497278959a490864da29dcceaa856e36f11fc131d599d252610e2ce2a832ad26b2b51901eddea9b2a3fa2a4e76db86e1c5330edae31581af71c5a98ea751af159b9b283364d1b9fa845a389466ecb48e2a699259c516cef4c735c58d32d9e46c555ab51f89c3d47ba64325bf65eebd2949c7e5a9b2b35314eb0fa1cb0f5711877b453a755d0e16bd37375ff003285add6a864a87c500e39c0f9943c745d86cb69cc7cf3bad9390a2e63b37615973cb3434ea5c7815fd67014d8fdefa56f2553fa3f1afa44d8098217a3fd118aa3570a30b4c53e9a3331c78db442a61eb53aecf998e9588a941998b0662d6eb0ab8ab48bb10e8c953359bc6cabd5208a6f80de688639cd1c969aa31e088f15ca37a69f904f819563a8840e5b0d782139a77e54ee92cd65e78a2776802a7bc44950d378dfbc21d855c2cc35910874875bdd6606d27eea1cc69ed0b668e43c596fb2b57aae35299a795ef2e80483bff4ae3b95c4705bcaeac7ab6534e6200e686d661ceea2ab6dc42fed019dc56ccb3b34432bb38f350e240e0574d837d4c2e207c745d950a78dc333d22cd33b0e47fec8d66fa39985c49d5b55b964fd900c80cdd0b55d8a149d51cc002aa377348fb28dec395173a936b527f598e6cd956750cd4a967960e4810f350eeda4e63b0afa753feee724782873438442692d21c37a195d039a2d09d0382dbba14ea9333ac28155a7b0a10e0adb4031b7e72eb28a94dcced0807dc20d3b3da8658074b2ba087aed6519c9ed4055194f10b65e1e3815a16fe952c769747a6a5d2188ef41d4310ea1f4932d594d1a757eb6ba2576aba078211c3294f68d4b7cf54ffa84ff003e498e1b8c20e6b4305a40ed4321707690e12a1ec0eec2836b53346a4070ccde370a5aff00032ace696f827d3ab879744b5fb8782934cb9bc4e8839c1a0c446f5349f349adbf326c8755dfa9a8dba30342d7108d7ad59fd274a62e0d840b8ee2be0a8d2342aa3aae13a33132c11f64e6c6cca0e0eccdbe9db0b674e68ce888b93ba15b7a8653039bbf64e18fc53a9ececc9313d8d0bfaa625b59bdcffb5d657d3ce47c8575cd33c1f650fbc2dc1497c2cc1b99d369d1006a45b416467ac0cfa8ae483b7075fb134ee060f7aa8ddda851c442a6ed0ef4e91a19421e45958827c16d670fcdda215c35cae21666ce54da94712c05f3eec5f4e29adad86150f219651a6dc3163ceb9d36881eedae2e003a209ff94074b508e15066406270c1df5523f854a96168e4c5978a85c0642c0d20cf3bc0ef45a6a1a4e973843645cc9f344300a83e951518e613687082b0588e8c7b4d31d2678bef37f24e7d5c3bc5306338123c539a05f826e5a21f3bdfa04dd9e8aa9dc0a1d2d573dae061afda2de7056d37de46d5addc9cce3761fc2002bea10ce3768aa53ae2a17fd1b9537ee3b251e5ea70e1a231a112bf504d9e307f288ded2aa377833ddfccab85cc2cda9e29c08bea887094d7d2a845fb51a9893d724b8d201a67b11ac4ba9b5ba9dde4b62ad3ae3e66195787b781422964b6a11c8f9e12255db9bf494e18aa55438d83a10c988687707d930b8b437e626c8b7158591f3322a37f7f242950aa29e6b64060f82731eeced2839b4486b7473427f4a5dcb922c7c53aac3ab7ee14d5797b88893bd7474ea3c536ea018bada7976268bf65df4f35d201ff002a78239aefd1622bc901f50e5ecdc9c340891beeb8269ddea69e12d4f66feb7ee98e1f15a55dce71708e5c53664c6f562887591b58d91ba9ddea6620b4f44f6d9f3adffe50756c2d37bfe76d9de3629830d8ec4506930195bde37c4dfcd53a9d2d3c5e6d5ac069bc77191e6bdfe6c3bbfc46ff00fa16f359a8d76d4a677b087042980c2d049902e7b5455a0ded032fd97baaf5680d60dc2f77886d41fae3ee9cdab41b5696aee95923c566c338e1a9ba9b1dd10bb6e27443da30ed7f36182838d57612ac6525d4e414cad86af4ebd56dd8ea6751f2941edb3b42d3e613c8fef0ceba2c4d06b65f548c87e54d60ecf51c862a3c656a6b436c040f57e93ea013725e6506376af24f34f735a6cc316df6b784a73778baab51f4fdf0db671b231a6ef55896f620d10e773b27671949bf25c472402a580a95c52c3cff0079a0df28df3378b4ca6076e33b5a5aff00845870d971234735d6f05b25661b353e7658f8a069e35ee1f2561d20fdfcd018ac1b6a0deec3be0ffa4fee856c35b0ee12d63c418e6aae60d63a911394c82b1399e4e185387301d5bbc7827d57ba5ced7d6329da1ca50c4d276cd41ef5a34278f6a740d802d09c06fd135addda9432ef4faaca46a51a3b0238effe79a839da78207abcd7228e53ad97088b94437aa752b5c948759c77aa0da4d0ca746a874797e53c01b3323b13abbe7288a6c3f527b0f5412d859cb36f82d8197926b8b7334c219e45acafe2b34e9b8aa85d4ddd66cb9bb869fb20c6d4d9680035ea9d37e465ccba74b7f14e6978a808065a7d52afb93c91f0af47ce8ea13079aa8e639f49ed74075371691de13a83b1f88ad41e20b2abb3799bf9a378f56a81dcabbc3db1d1b9cd39afa70545cfda317298665bd19227b54cdcdd1ab125ba2632b35ed7c5de14f4a3bfd53c0cab8390deca29ecbb7b51e91e58d1a346a851ab6a35f66783b72a81af76c89683c90b4550e8f1584c053a829ba93335f7b8a74b0b5df1353a66da4eb08bc06e669167297c3fb109a7047729610791b2033df782aa746038bfacc224382f79b2ed131ec2f222e78292eccbbbd51a9553934af4772c3b3ff5550fd4547aafea955c692c21643d6692a8e6d608564ca62e06d1f5484dbcb41596376e54ce844b4a15b1632d33d56e85cb6707488fa9b3f742ae00865e7a379d3b0aa6cad95f532c3e342561e9d26e514586bd6bee1a7d8f92ab5dc09bebb953c94dc1eceaba2c07045952b07d61a358263bd676d5142ac751ceb150ff002ba25ae331683a157198710866616f3563d3e76968a73e72ab659e8cba43e2c557a18aa8c63aa001afe1deba4c1d766229ee8515a939bcc85a2dad9e2abf261fb2c337e5a0c1fed4f31f1144ef47d5b48c689c3915599f0872c3bc6a11a8eb35a24ca3886107a5323b387ab4f5699aabb7215f14d83ab69feeb73c2e1c8a323c13ab5478a6c60cc4958da60f478ac6b80cef2035b4c5e3c9ab2e168fb7d5982f36a6def41d87c4d36386b45a21be29d4f114cb1d7ebfe0a9cf24ee7202ab201e28540d1047821243c7d481a8dc8e1c44845e1cd2c75b64a307ce6ca0343d64a7d41a361457a208f1515a8bf044fc6d1b28d4c062e9d76f6ac4f4d41e0746eda8b68983486347921be547ac881ea2d6dcb9a4792c4b08deba41ab4a760e9be2a3db2e206ee1fcf05ecf55deeea9d89dce5a782d253594c4b8dac856ae33d5ddf4ff001562ae32f62e28976cb45c9365d1539182a66df59e286331ac201fece8f2e27f659400d68b01110a24762c95e936a378382cf81abd0bf5e8df76a22bd13d1fcdd6694016f4445ada2710cccce4ad64d0d7653c535942b53e998d2436b48044e9234f3596b034de2c636878a905b5c7d3aab5971ec59db2c7fccc307c96330cff007b9a83db99fadc220ee1f8549f84c5b73e412c771473e1dce6fccdb850e6c15b211a92dca106e8744096cc6e469685ce713e2aaecf0fe7cd57ad886b0e21eed8e9449685e93f4636ce9f68c13c7dbf9e0a73f478ca3b1558eb5f8a80d2ee7217bcbd53f1fecb28db69d46f590523d1c59f36571202b689d83c23cfb334edbe7afcbb153c6e2a8e668bd3a47ee56a41de16be21660d1dc50bc1e07d50eda077159e9b3d9aa4df269e09c45315d9f3335f04e1569473882a43edc0ac389ab5038384e5d969898d791599c323f796f145f45d246f69872f79b71ff7041f15ef73533cee3c56796d66692d20aaad1f299553713640383811a6e428d5c5bdcc8922a0cd1ca532ad0a746a552eeb4688c7994d05ad645adbd46f94de20a25b71d23bc15502f2d1f70ab82e8cae23cd50c4e070b531670ae0ea8c66f6caa5e99c167f63aa43314d37cb3bd30d3cb89a4f01cca8c7482376e5637ec53107885121c7cd703cc27e030963a56a8dfb26e2f14df742f4e91f8b99407dd59ad21748fc453761cfc11057057bab88ec56bf6ab483c94c82a2be1995277908bf0958d23f254d160670e720a92ea8deae58baf7b432bfe7658acd84c4661f2561f909cdc5611c5bf337682d91d1b8f0b20fc356dbe4729f14e6d6a7d308d5cdfc841af0e63bea098595195591ab0e60abbdc328355c6476c0fb7ab17883d5a6dca3b55c6e598f58e8b3782c3305defc436dc01288fa426622bb6a8754da765a9694ea581c3b6935daef2eed2555c3e2687b9aadcae11a85ec2da8dc5d163dc68b9f62d61d02daf35b36ed525b3d88e0f0e66bb86db87f763f74cc4576fb9176b1df1f3ec464778477b4e8555a98bc4d2a9863d5635b75a3edc1069311c502db844530d154699f7a0712c6b2afc4d69cc158956caee442d0b7f4adcefba1783c1ca0856f25a031c42f7b866871f89820a27058bcb1a36a05ef7026bb3e7a3b48b6b51e8dfbc384145f85acea6e3f134a22dd2d3d93da9d9e93a9bf405c2d2985e25d50c95219037057b945bfd9e1a9f5ea7e07358b19a7a2c4ea7b537f44951b4369da76a21c6791b2cba857f570ec46853738e2de247d23895ed188ccfa539893ad43fb28d00dc8edebcd5c81c5430033be102583b5aa5c27b9481fe92ae01fd4800d6c1408679a870cbfa96c3fb8adb00f35d6ee2b80f25a11fa6eb8f36ad33056b1e055d457a14eb3783d80a9a22ae11ffe13ade6a9e2056f69c3d7391ce882d745a7b47d950a63aada80bb89e1f9585c3113969873da7f9e69c459a4accd96619bd7aa47db9a651a3b349820357a49a223a49b2c197e22953755c3b5c5a4ed0040d554a51d299905a8cb1edef5a1f085d603bd58c4714c6ba1d5ea98a4ce278f604ec457717d373a5efdf54fecb62d1b82d7b9652db22437b958ccaf7810831dab6847d410878239afece7fcc8d9e3cd6ad3da9c038d37724e35abfb4533a597ba70278282d2a5c327e9520cf66abe6edd569fea5171da10ddd8b2c82abe12aba1b55b19be53b8f714cc2e37ddb9950b6a38fc241ff95e95c457a34f134738a6ccc018ecf25447b2d56f48e90d65486f9aa34e851187a0c11d1c442127c1547d2232d7a61fb477a6e1eb02e7f4669cbf74181f64e73ea667b2a39b25486941c72b5bdab546449d401bd55c67a473359d52c36b7c8dfa46f3bca6d36d20d60110db42748244d803757025b74dcac0e1f315d29eb6e0a4c66e4b278a86dcacbd218e41464151aaed753e72b590a1ccb7d483a9987f07dd0f81dc9662dce78b6c57bb22a7d2ed567ca699deaad1a44e7a7aecebd8b29d38ae216c991c0aeac29e0aebd264181d247947e166df52ab9d3e5f840556b5e38382cb4c10370274f57a3b14f639cd2d2c39550c6e22b53c1d073ea309a8e80380958c64d3aec1897e57b6e08809c40701c06d05f0e6f03e0aec33d8b8a9321483995e983f75b01cc7fd4116e405c2f00c26c58ef28075e774225ad02f7940b8493b97542272d941b1e68400b96f95217543b904e8b47c254f51e0c6616401741deee28e66f7ae5aa6c75792da08e52ae2dc95a57a56a6a3daaa0ff72c00206634f31ef33eab294ca188aefc33e91ccca8c131dcbfa31cef6ea798b8baab62fd89adc3b1b4a98d18c1017156dfdeba3343a496e696b82885d595b4cd374dd101ee691b8a0da94fa51c5a83a8d42c1f2adb6e79e081d3b51ba0483df6532e69856736a0e6aec852c399ba232d2b8151e6aed9fe78a20def394a3ae5e05668b6f0837a835d1134580999876850fb2968f545c0588798767aae779ac1b18fcc1949ad3dc15addeae3c945a54478faa011e0a09ba20b6c507649d940e9bacb3eb6f14dab42bb5ad27474e9d810c80b8ef31c959de3747a5a40736a058eb6e056d8850c779adb05c38844cf8a916e6a3adda84cb55b6829b8519a56d36c9a5bb3ccab8ccac00fc20d8ee29b048e4b6c778500cfaaa3c9eab4bbc951a7076ea01e6aa0a0eab91ffddb9f2d0a63c54f47de149cc3b56be50b59421076f1cd690a51ab503b2361a00d0aa81b4dcca6c3a1de16cd8a8d177ef5947d965aef0cdfb498f63c161bf729b84d146ac77ac95181fbacb65d93e92b6c4fd414b4a91650f0ac638ab191c0a9810ae0b48e05073492dde15ee102d3001b85f82ac6145881cd7a42a0396283dd07f49581ff00c81d1de867d543538b5a5f17ca0eab3be8be83be57d8aeb1ff0032bb656b9534d7cd95df106e60136a31c1ec7090e69b10b5f2576b5ed3f0b91e8581ae36803547a4a6e619ebb6ead5246b2e53323884dfca2dacc6d566e0e5d153cb940b3782c8058ef52e0b6091c54100ad83b3c0ab887f25b6279b7441d4e0b78a87985b37ed478212238a3055f44377aa45949b95e92999348b67b6cb0b3b591ae747f953bac0f5941b8e689cb60b3869ee5c02dc654791bacb9641b18bac8dd968dd10bac11369501aeceb5eddeb3b865e241d54e60278a370e61f94aeb1327459e48dd656738282dccdf9828d5cb4e4b8762dada1b88d51ca7333828ea1d14384dbac1170bb54cdd5ae1091d8809365646e808b2e2b1b07ad907fb82ab51d60ca263bf2acc5a1dc8a24d311c90bc85c96419866b4c23785a4225b2dbcea8ed1ef5bbc16bea91f32766bf6ad9d94da8dd979de11cc6613368a3b4aee4d3bd1be889de02077c2ee443802a26d0a458a9df95013ea1eb374d03420fe111b8d66fdd7a44ef0d60401b845a2c0374420c2bfac8378444a373e2aebffc4002510010002020104020301010100000000000100112131415161718191a1b1c1d1f0e1f1ffda0008010100013f10c239370d8202381c3ec83d4ab1836e8c14950458caadfe883479a8a8c2959debf5173e44a68c110e2c3e147ca954473e20aa186341fb95b203340d97f047ebac5de8d55175ac5c56dbc981dd854b066d537c274cfdc29b650a0d6693279828951858defe112553eb40bac1f9a8e142c2cc95f5142e35d9884cd43c852f627bfd76495dc16faf2756c59bc3d315d723d62db267553688e06c60726319ca0d721cefa9488f3aeb1a36dd5b4e3b36635080169a3a6ea9d48b3b1cdcd97d1f2c6dd5c100659eaa0c2186b6bb978820a593c96f5c285947e570f531cd64ee612afbd956fcb1028bcbfb94eda301fcb00a66755f2c2ffc9f2317695aec6ea0f0c51146d36e2eb8978a532606ac243ed5c5cf72a5e609c895a79a42b5e9999565862055c95b172dcd4c5169ee31ea09e5670bed25e0f7a9299c34ab50e0cd85d70856b70c093991446b7745f75170dbdac7ea15b5b69f5646238304f7e2a30551a747dc6bc852284858f92fdca1a00aa547cefd4aa6c3563a190bf5ac1d098f90557253617003757928ca9ce30798415653ad32d1c5db98949072e8a069c3b6d001d04122abc8f84380b1b068e2a01685ec778d2d995120a74503b06f686708526dab5c26032532a18b1549abd03cf3cb9830c0b607bc6a125e52ec8bb06f69129573051c94598f10663db1ff00103f875c6ae8cb6205d283e157ee2a26e30d9e0aa8ec828141b60000a5894aa7570d4ac01ac3cf30b3bad06bad3f313281d70aeec0fe14b5d4f55c7e0fb94ba5b1c03d8307a25c19b0967e20c40200b6b66b102d93a6de10c75d68de9f982835ee1fb80f20a455fe6520a09be6ff00f233445d674df6ed14550b5a274ed15545588479e17e2290da56175290c318e1fa9b738ddc5ed4609d196c532469aaed012b503e3bf98271ecbc97ee50955d811378f130e0e9d9f52f7b5747c727883b82b16adcdd8516d75aa892dacae3d599aabe23eb8e25fb232f3b8380dc1a27275be25863d2745280105f1728c1263037778db83cca1c4a4a0ac141fab8284f6826bd261d32654d76966b15c40bbea0f72e400ca8e213b9c3b9a30506b93114af30d9dbf93f1018e83704b43e22941aebe8a8d1102a6afbf23dfc40140c307c0ffc8caa81b56b96bdc104197ba947e2311d0e462f1cfc40713300ded16bca53ae8e183071a516fc567c11068a806ce8c509c99dc3982056582066db575a94463870de6fd4bc2168a36360fe161a9d05bdff00970cbd4bb75d52f4be84690bcac5d881a8ae78f043a69d6a1bd400f7cf797ad16ca7e9fb8aa04eba72786504856ea679e3ccac5b58c55b19a55340c397a725fa6650db720ff7a89aa1d7f9333099556fd014b3d328c455590f2ecfb815fd907a2a97e966714d78575eb08806d9564fe6238573401116aaa3a0b8a61b47d86fa0389526ccdc4b806382d175f52eda26b86c157ad98e098e7a28bb10e18093366030c65ee4baa04cab67f25d3d4171bd11085737d33184ab77ba63f9060b6ab35c5c9f316741268aa50f6fd4a77cc74735f35f129a0a0b739a675b88c08e016c5a86c4a7be316438c83683ba5e9c3dc479b8087990ec7f20155d2fa4c7d5400110bbc3034f1b73065f4223780f5ce25d005142f358fc31f0088e0287c8fdf68acdcdaebd2921ec9747147bfc5dfd45ba554a3df3539420b10502e92c5aaa7355c3de1a3a8da65ef06111c951882dd903249905c6953aad89ec7112d172aabc5c76555b464b7b3ee1d03e065e5c441ce781d9155bbaa3bcdbc7151dac7cc3d599d9da5ef3a6b5b6e5655c9cee2f9ba11fae6215aa0c81996eded008b972bfa8c5af68ac2edfbaf99792374e8b8828af57e65c73532b925465d5830df69c22e6c2b70759660e57f4254f921f88152bf8e49946141ecb02fb198851b40eae40f3287213840581f52ee10a1c19c40caa61c017ef511ae923f3fb80528363f7f9b854a2903c6e041552c871497aed011da980472cfee579ae5c1fa8b28757bfcd184866dc40932ae1ee164c894cb65ffe4b02c14db18edf71146bb96fccc1b8da6c82b592a9b20c5db3554f305b00b013700a204aaba5d1de3637e5813746e9776f10143617e5fd945e602c3d70f9874f94a52df4367920e8f54ba39daf83cc40a56b0ea50dfcf338f200941daa19bb37b08b584a70bf1117145c8ea086f6f7df10035015ea70c3821451e8d19402d9b3d46afe862572c205194be7291467a498362ced7d78813d149575d29fecdddaa003775711346ecde66de28eb11b4aa21113fc11a884dba563eb52a494c59a697fb2b0a6d07abfe4dcc1bb07355fcb95d12add5a39351eb5f65658d8714ffc941015a361fa046294a36e2eb18bc10d6c2b43f1888c4028ba5798b53c62b5ef318b9cca8f4a3f52b26c727dce079be2e60a43d4b5d91ccab20d0ac4680d2afc440592682583c08d6e96a386facaa97aaf85a7bd4178c7160f4ea06abf247a54a5755bcfc402a9752c501714ebfec40bc6aa3b51fc88553caea3fe2bdc48f833dd30fe3e533962078ea7d32ef6a708ce5ce0cc510211606319376f4e9013b30e04f4cab602a1a0259c223ee02d3e805bf70c973a46edda5621a2e034e2b78db8e46f14c518eb33fd657d811bb6db3158aebcccb58a01c0a0fa5f6116154e806be604dc22136bd2ea642358c410a3af37486808c69a78eb1a902b7d07c215f84a973ce2307a22ebc247a4484b25998201391e4ef1e214d8c965c2162fec79efe06fda4ca61a839ca2c562f2910724015fb53dc61482aef4f2355f31b71ae2cf8de1f512dd88ced89914e6f0dc71b52cce6135a8158f81fd966cd5c20f51c39a771ff11aabae42129abb31fef989bc6b6c79961e8220e5bfa84f66d86eb06bdd4504b1f43fc7ea224d08bc3fe6540a4a0f5e7f70c83404d5e66bac30b6576b88d940ada7f30ca894a43f7aee36ac3b07331dc4d945452543a5d1fc885812d734c1317c625922d58bf2fc460503b35a0c46e2a1e485537ca898ed9de2dcc40d997ecdff00b04d242aa09316c2e8fa4b8038b75aec8993a39d4a50edbcbe9a6077f36a1e920a49cb62e83ab1f49cb1686eea960cc26ca1a28f5eb5f5295bb8d9e0c2469643188bcd73124e6a88132b30e4e370d0c27c76eb937e288eaa344af1cfe0fb975f9347f654f60d3a080b7a56eda696abd1f30680a6b2056a1a8e46875d231da8488465b75c9fef3319345f87fbe25bf4dfb7e6215bc79bc9667ee537a9b5aeb8114c580976a1011c571c5b37f3060dd6657f3f0fd43aae72d3e211d3932ef8fc45a1f93531004a725f3514f1034e1be8dd42bf6c8842d9a6eaf5b96b788e5842f3971797a41c99ac3abe9984da6fadee2a2ba5ae2fd62b58cc245c4ba3f8471b9dddd39f0d3115499503a653eaf514105535efdd7319f871b53bf49b55ca547a6a0ac41c21e5e0e22686ad10ca6bad5635d21f30c821e6b3db309ee2191959cdf9f9cc31833652bb3fb47b7677dafbf3f1198c8b40b36d6f737e62dcdd2f2ea67d2c3d530a9593911b4f999ae7897ad6325d1e3e597dd580e2d7d09896c6e9e1dc38628f09473695a19529cb09e4a8b64d9657dfe6e1247f064fcc2a4b4031bbc53d9f71ead2d6aa4bcfe3e618ea8b76cf2cf0cd72a6957d3fde6060056a9c3e33e6518eb6ce9589ac9d0ea5efea52ca35663b46e3c15111461334d101d8d55868b13ac14ec62b1f189e994ed1c8ea81f0cc4a5508300194b0c95a6e0056e5b81ddb0456865555ecfeca10c35aeac5b82b07766264ed0be684ac277aafd57ee23d5e2587d0fb8881e4b82af23147b95fe8081a70451be2527835cddeb27e258d54105eb566334e1807a9f30ba17c670fbbf096b52610e1fd92d78cd6cde82bc622853bb52ce17be2f70875c7929cfb60e54b07e58c9f1859b5afacbe20b64c94e8c4092d7fda8d1141655f2319145f6388cf38bd3e6ffb00e4ac74acde7ef328696ed381476fe4b8b5b4c8aab2ea8c3b44edb0d3b6cf8fc4619e0dc4175ef36747b4a0e4a947479fc473170dd8cb9b82b2b1b6f1afa96455659a5bded1f82594a76391b1301f1283260cae3fcc5181e78e25486ad75794482d5d7cc352b365525e2bacab9912609c243e826babdfe5f50d401ce788d8ec3626f6149f30e1aa297b16a44001ff008832f563dcc394d82b7cc761609b12cc8f8cdc771054956deb6137ccb15db5d3a0760a03b45c23cfa8c56e6b447347c08b77a61cad75818a741a47b4415d9c38c1bbeedca43541ed165c52a2bb1b7f352b14bb02f132c8505679417783f28bc8db567ea11f82535cbd8e913b6ef3ca7fc9a30646b65ffe43c880a5301918989caf46f2f6bfcc0ae681195850e2ff00b132021bcdb579d3331978ae15c7ac90ad39872f57728cfb8416f1f68bc7ea5684cd7ac6f35351acdd3f90329a9692969c6756b15146036c35c7d4170b2140c3b798c194b2d3f9c44d16850f409b5f0e2501c201a28a3860d346c700a2ebfae620e50bc025cb36354295f3fd82d2b95cdf889416a0af98370752caa0c0e26171a8107da8c08210a19372e781e88a4a88eb2e0b777046a85e61034727e658ef1102891cae0e6696eabebf99922683b5015ee982b4dd6eced8e1a4bc36eebf1f1296685162bfcfd462d9bae982d690d17f88e8c44c95a39cfc41de5987355fd86c80bb32269f2c37425c8f0abeb3fe9f98fbc9ece910bede49c83af1178a055e4415f292e8358a8a8abc6aaefab1160dcf94784391bd91140711ea6aa2ddd559176dd7263ec802363930f91c7d409b8e28b78e9f88dec9acafe461006e36f3d622e820ce67ad96fa85364d52b5a6b6ee124122ab0d8e5ef5f532503b9b8605e136c707215cf68a29675867a7297d4321b297c3fb2f5a8e8f302b62d68e65cb3959aada14a952bcb997167897f41557c22465a003db00f1f6a55fea32a3a7564139b95fd1edfc4481db87700cc0f15285692a9be911a552841032dec0153158881a20fcb1aaa3ee588d2ed36fbb4363e4553fc5d9f9e21d609c8c4cd427adf5a50d32eebe5865c555c59bc1dee383f64a595b3d33bf3a8403ac50bbae3c4477530973a5e734f388147c3ce03b7582c82cb8ac37daafa710b869ad0c14740c33ff004fb8abdf0da61329680cdba25c0b875031939a5fae0959f71a54bba18cde46598eca40be1d7dc7b4a6b493b3a65ade2768e25ad9411e8e38f8e529754fc409bd2283ee648d52a002363cccd17a3504e41e659d55b52a905526f3c4bd16e806dd7ee54950dd1d6ffb0b2d8678aebf040a2af6060f40f958dd6155cf150005cf0cc4017db4769c833037efb4d2bd468eff00c7cc157e8666706075310059434c3bc2f0e788bc112d28ad7ba3ef4f2d42a9059298e597e9c73372ca5aba039ee8798fdf5b81dd0fd622e2b9ce7d32c149571bd7ec80dc2256f8a7ce6021099a67c4ba850993afd7921a31538a9e2ce3b42d0d301d87d74a8dbb1364155f334ae76532f1ceec68274ff5c509bd9f6c09f211037d001f92cfc44b16db965c98880cad3d205b56cac605b5d732db4d1c449b1cb2e8817ca6606edd3040b5b9bca8b4a56f579b63f111d5b92c5fd4745634760bbc582f85d65281c869c95e7f35d66ca0aeaa0c29b3ad1009d7464dbfbb9d3ccf62ff003d7dcbc0b4f0928fcdc3e61c6cbf3a9abed42806ed8532b0384b91d3a1efb15b9baeb2e1efff00528e028d43d4acb5d06e097fea44eb1f3f512cec3b3ee127a6b0f95afdc415a56c9793f7de3a03a6f2c573c92ef055e06275462d510d9ea848c69aab6eebc3337cf26cf50175dd0991445c6c50ada7cc696efbe4f92711119e5f5b8dcc765ef9a1ce2b36d150b4f32ae6079d4349b7e2205c9dfb4aa47fdec6bdcc86f7252b61ce307b893652f3fb311147958095489174dd354d7723815403ac21416e558c0566115a4ac7180bd7380c663a43a6da3971e100ecdf88ad4a29701ab17bae9bb8a827450fcb0a34c7a235db0fb95e0e42672fcc626e440f837922a5ce91c4a81a260c2076b743d1f7e258a90bd0f2174e87be92fab6565cb800d718215b0077e25484abc6df9c5cc5d34e9bb23c3ad4e862bb2da9ff0087c54a3e4503af7dbe2e297cf18a7a3dfc915ddab434fcea58d153946ed9064d52bde545d038ef2b2254e52abd7f6238216be1c7ec661187a519bc3f61333c50aebe9bd110105c67215d1cc4ac5a2614d118e4784a6502ac45add60be39750c062c8b14ddfbadc1620d37cdcea2470556bef6d66508b4d0ea9dfc6a3d563989cbff2514a732d616c4a2ec44e737e209364ceec44b95f2b75c42b39b4c6aef88af012957631cbfd3798e9a15932d5b7d4b25a239c0f5041e88465050390a841b57e821ed1ad71c97f2faeb0c8c2d07a76ba1cf8dd270ce2d504452431699c778ac2cd056f06abfb059aaf00c101923426263d5ae457f52f520f455f50189ad8590a06ff00099fb8d447703dee36bb9337a3d3e60a272c9c8b2e8c6af98428af327ecc31474226eba177e08310ec0afba6a5a9dcdb7a1c47ecf3d87d30dc4ab60c275c62f91896dadab462b659cf583a002883aa479c7dce078f3660574015da08dd81caee3b12cbde2db7ed8605940b3ac5020529d86ae5302e1e5572a08c36c102fdfe6354a601bb76bc4bb67f6966b78759e912ad0bab4790f880f1464ac3e99bf4f8916b9e1bf98f6f55bd532328cf2330344afc250b78fa4f447c6fa40a99a82efd5f6efe37a86cd160201d83b5d3e6711331bf09ff00ac056430b3aed2e850c383e2534690ef2846d44d696459338a332d535d2a383b86aeff00f63858bb08d9d1774ecf88981ea15503a0e810eca4ad7666350d1cc380f4238ddef54bc9503f063762cfe44503ddae5de8cfc928c9348879a9a44e2c57b29fb8db2c2178a3dfe6fa31e69d95a58c3a6304097956edfb58259e55b7ed63839144cf9e1f8bfb17d1ea21af5accd173ea549a4032e7149f3444b82820426fc32ea4159c8f39c4c84d1cf12d445d5d57ea5b69790eb0555b9854ab3e9bc7faabafa8fd6005b5cf96fafcc0c28180d076202503469b9501dd130f6850a325615d2cd4c42b7457d90008385b540ca0dde0af8f886842f42abc4170e0173d498502de4ae22a751e156f685d64bdbfb8fae30ab425009b32cad2ec8c8e628681d703ea07543e8f92556059c99251ac6de0842da5e2c8f998da0ee591e59b22b978bfd54db3f249b5168d097d9d620ab30bc3a1f76f043dcfb812ff004f88e28ba2b55d3d4a7aed6203a75fe107c6e0b6df2bd57982b860d31908ca4a5e1c403578739a6f529ab2f846c2f277181b5466808fdb3028af14b5f58815658e1a7ea3cd6b4d33375b68d86d066acaf8eb2a640be809af1f07615404d05555c54736d95ca2b33bc137511a345a8548146c9ab6fd7104a0b7655903b18d1d7028a1d5dc723aa056bad4745d1da15c33c2ff00d4e5d4e066bea3aa0105d82f3509aa6e82cce3237a89bab9b492cac0e530cbb303ba9f52901d6aa040370af1afca1b48abdff5159cb38b86056aeadaa3181babe9126502991c9f701f5286c580d547b2ccbbdc0d58d2402b6e31c65cb940d5130e75bedbdca5016ecfab7e798bac899be653dc068e84c7a97742d951407800769c08551aa10efb89086315ce7823b2272a8b5e2a04322f9c0cc2a42867b2d80eae8652325d93b42ce8948330c20d00623a545ba79ff90bb06896fc9bbf508ca9b7253c54c3025ab1a3cb026872c865750894878be2521d863b4037638b2cf3ea571b2a79a830515d589f0cb7a4978a7e23cc70ba7e2066334605725f1a88bebad6acfee3e2996351dfbc1e8336d57e970b22322945e8f7989362cc2dd5cc12eab632186ec94361b8168db5b99052e47581401bee44163c15c817dc561a1ddba5411686c1bf13238ed44ec3b768a960b123c536d8d66119d8d9fb9daf3da543c48a21b13791f895cfb4a51e23d6089743f622104a2dcff58f889b82e534e885f537cd798c727560e423ef0da5e2505069afff0061236a70f7cc2254dc94abeb12dbaf88b079cc1b69603b2b8958e2c420e98bbeb3e1c87130d59e79f5329b1796a04d5228a2fe1978c94e033514da3880958de42a3fca8020719cebd472aacd9476244a955d05c35140a8be54e67551d786038ec6aeb51b916b8731e0286ed5310309a398325403d861f888fcb05d2a9fbc42c428e6a63c178a238923c625672afbba2b67c46f845fb2e9954e18cecf5c04a5baa715155cb2014a1d418549401855a74ed30960b57bb7ae25a98ce1711d9c72a43103ebefe465c59b4393bbf1025e4b574870c79b2bb0621aea7806bf92c1c8c57104c2a0d8dbfb00ace52f61f10ded62f6af50bb857b3529156286030c318d30a356613a41300b7845422e4606bea05dda0949dbbc480d755b3ef8954174aebd41b3658bc1a3a9158ad4dc19cf1d6614dd728d4a1414fdc0ab8a5e06006934eea2820a5b4aadbfdc221678ba46f3d622e80abce7f70c509a2edf643c80e8bfd31c726318623b6c2b541ff6246d1e15fc8e39b712ac10aab977784b0be596a69854adf351921a581d794281d56758d8279cf799e714781693d475758647e55986b08de29615aa348536ae489171721004b73cad4a210745493266dc1fc40a00872cb0c650716bae1b25b65956977ee6caa9ce4e911778310088da1c431745c8d245a540c674c522655a7221ae28569c7cfea2ec88396bcc04ada30504a425b74cce59e616cea9d1303a9469dc0b07f6bb577a0e7ed8e842f5850853a5aaf88bd6057f98f321addff08aae27b232d2a50d36245408e0e534de8dea6165c74bfd317a29364574d7146f10594150aea0b57f11984af28e654c17efcc7b154d9465c410b2d1b74264d533b500ed4201810670a364cce81bb41c44158766dbad3fc9500c42bab1bf9d4a5650d9695db312e16f07e23625bcc2c85e96e6043dc25b3b556e2070e506bdcbe3bb49af55b03af1172494d9c75c6a5ad4b286a2bcc80644a8edde2035876bfd8c0a7046f1e3a255c3065b302f565f822325e7e610234e73128a7905b8eed290d239b54c1dae365adb292556f7eb647f33cd61d6a15e25ed191a9c24ece701ba782c3eb52c1c6c4538bff7884028c152fa327e260613221a216a0c132ccc8ecb4537353377841fce8896744642a00078958579691f87e63601776ba7fe4cd2cf558631b9634d38acff00b704cf50ae6ffc89ece139bfc95b4d1d181e26425174ddc3cc261b297bc05453ca626aee8c51dcaba3be663a05756a8f30428cb85b8520d9d1c4b516984444bcca52284b5ccc0c2eeeff00a4093cbbba5fb494115cb39a7a7dc535b8829752e82f2619d4619324f5d22dc6637d238b44162157ec8064f4a69f31d2a3d009d118180550403d128d9ed6e031b7417a7ff204836cab8cf76574a18ca831086c82461d4dfc4be0dc6f47b76f0cd90aa6c47a62feaa3c7262d938aff75882a5cac9cc78114a1bc12986dedf24e514682b514e88c22c145b15120036ce1ea1b2e4b7b5eb5c4a714882daaf33bf03db0136a6b0cbc4c06ae364a3753c4a2e0766f712cf39f2c601679b73ea5aa26dd441ac6b4141ccc05b3bba45ca2e35a6effab957cb32b95fc31a6c82626314dbbe98c6b5ea89786e5744ae0dc03064abd35cba21ae51b2b1645e50c3791f64b901b2927fcf88d454ecdbf33a871fee209658aa846dbbddc01d82d378acf114585c2646ba4114ec69c438f045eb6661a910c3cec8da80b973cd4c85acacd44ca28d10a9948ca6196eabc84c466cb9037dd8b07259f70da9696bb88142165861886ec052dcc9e1350161856b31d612f52b9cf585c4c66236f530a70b5166c30e224948345f88a9520879fe989e8453a9661acca237a1bbfc46ae52b0b19caaa5b04b4cb39af115dafcc26b1c468b4d23848b4d2b2f7f3080202e5e0befaa1368af353fffc4003111000201030301050606030000000000000102000311210412314105132251610632718191d11433a1b1c1e12342f0ffda0008010201013f007d2b2f244f65bb56969f40b4752db4adc0c1e391fbcafede3a546d94462e327fa87dbdd5adcad15fd63fb77ab24934573f1fbc3eded72bb6a5107e7fd4aded71abe1b151e867657b69a3655a75036f18bd87de1f6a69006e860d4eb3f04da3a06caecc4f9907a7de766eba869ea31ab71d062ffb5e52d5e9ebfe5b83f39558d4af5a929cbed41f337fe276a5556d515a6c0ad340a2c71e7f686a3d80fe26f279b7d22d8f97d252d2d434cf749cca9a2af4d7c69e2f4e3f98da9a748f8327cffb9f8caae2d7c794fcccf9c34cae2f1a9886992798c87acd1d33dfa9bf12ad63b4ca4f6005e707101b9895d91af9f97f779a7d4aa5364461e2e7a7dc7ea22d6a94cfe611f1371f5e22ea2b81b8b03f2fb4d182c8af514069a64a95576d21731f4a9569deaf848f3c42d1332912a3e11afc984e2c660e21008806d70cb2aeb6b52a8c80e22769bbdd5bc8f4f4f8ccc2d681f36bc35003988fb4f84da0ace86e0dbe1ff5a697b6ea2802b0bfa8c1fa71fb4f673da5d1a29d3bf24dc66c7e19fe26af5aa6ec47339c888629b132c5b8e66ea8a08b0319d06596d13bba870d68cac389a840efb81e6d29d12c4803368da6a94c4f786e86c60cc4a258804dbe30e9aaaf19803a7bd055ccd3f69eb282eda750dbebfbc5c88b8cc5201065ad09b3ca9c5e1a54dc644ee2dee346465f11116a6cb8b45d46de0ca8e1dae445d3a38c35a36951945ba0962ade2e915b68253063867a60b18d8369d9f492b93de7ba227300bcd9b97117a5c4abefde3005731a911c661066ae9bd144b1f38a7bc505c6635153c4ee8ffa98a5930c61aa7bbc19de1b58ca63782ab8b71f69de36d3bba4b5cda68d569520b7c9cce731462e65151bc03d66a49a754123045a3ae207026e2d093695dd9e8f8ba182c11664cb661045573eb08bc20c41b585e55216b54a6650a26a3811b48b7bab111177f389a6d25806a83e51a9238b159ab2bb45f98b4ea38ba88c2d86e6116c881984352995d8dd600a405be046420f84c1b830b89b85c982d2d984666bacbadf8da68b487ba35baf4f84b4d2e936d99f9f2f2807acab55692ee32953354f7b57e423543c09b12a7be254d00e691faca949a97bc269951ea8561711f6ef3b7020765f58ae01bc44dc0ceeedccb81e736ced20457a6c7a81174c554b536e98fe2574acadb916e0fe9e900956a2d352cf29a1ac7bea981d0477b094cdce60b47c7100ddcc4d2d20e2a0e44ada7a5505dd636816ff00e36fac7d2564cedbcb0e389501620811b0003d25306a3055e676ce9fbb144f5b7da5272f49493d04dc6d6bc26f931291d4387a9eef412b56d86c04f7f168ab61696b4673299b64994ea8223551173c40098692b61c5e6af4e283864183fbcfc09aa378383d251a0b4878799abd326aa9a779d22a0a4a147020cc1e1e256a8ca31cc0ef5078a534da2e210c731ef720994a8eeb1e4414fd23d15bdc40ad7b13894e98c1136e67335e7fc607ac55b53551e53baf584a840ad080702053e50d4205818f5717393026e0371ffbe33319f6c019b31005c099e255b5b329a924de28be26fb6206044d778b60f333389bec6c6120f5884dac60b89b85b314e6d01b7485d4024623542cd28275388c00c9111c5a101e225b99b4012a0db99b85bca6a0deaa5a2d71fed18a30b88e2e2f031b60c47bf26140fc6214643833bd618f29de5d72313c2d8b4dc54404f1786f78a7a8884dec60cf32b017b400012a7e703e422ade5251b7118584517c88ad733fffc4003211000104010301050704020300000000000100020311210412314113223251610506718191c1f01023a1b114d11692f1ffda0008010301013f006cc1de15edad1be4d517c42c1afaa8bdd76bda09979cf0bfe2d01c3a43fc21eecc3c7687f843dd68c1b6495f24cf778b3361c56b7ddd9d96f691b7f3d10f643c9c14e8e03a81a89065ad03e6392b5fa49676011e7f3d549a69a1f1b08518ecb4d1c957b773bedf7b5a78c885bb8517b892a3863c927f9a5d981e1bff00b27073780efaa9b53199476b2557cd47af8647771e2bd7942173c77b03f3a2ff00198dcd6537bb48481d90135f683ab940f92d5b8884d8b4c89b6148cbb28b1d584718704630e140fd54d0173daf7b78f2cffa3fc14e8d8fe1a3effed189974010b552104b1ae34b52f8e375caea086a9f14951641f2cadbd5391176135ad036b420def5daa42c147bcc20a8e063da1dd51d23464798469008c2d70e17604784a7b0d7785aecdae0b51ec86b8dc46be2bde3f76f592b84f19e0104558f8e3afc568f44e600c0781ca6a78fd2aaca1d9bf36420d71f09b477b325a83dbd54760115e68c81841726eaa37f2b6f7a90148a7cad02c6509a3772b6b5de128c6694decdd2ccedcf60bfa7f4b828a3c2bb4cc02100135cf6e1a51909f1041c09a053a3dc6ed3a1ddcb547ba314d251d53da722d3754f638eec8256e05bddea88dd41dc2044721da10e16b647c606d1de29c455a26d6fa34b915699e56adc0a0f1d7081b50c8d99eec7926db4d0e16e289f309cdbc851440c964745d8b465b852628bbe68306e15d7f4d4b8be4bab08273ab014cf218edbc85a121f13803906d34ee368827253682a6f44236b25b6f50980927c9702966935db98014282dc9dde0a3ef318f0a59363495da9af34e76c18cad4eb2fb91fd53657b1d61cb461fb891c274f1b29a4d28cdf05738a4583a2746eddb8204b321365bf105b9a41a29811be15ab34b4d9d30f45aad6344c21e9f742870b53aadd6c671fda3c70a085d33b6852ca226f6317cca6c6392839f1781d4a2f68918947cc28e764bc15ab7bd911730d1099968dc729d18e88b4f0539db4a125a2e3d02bc2d29b85c3d51d4071a7b7affea82689cda73b23f2d38f928a3323835aa47b601d945cf52a365952602ca6679469bc276aa52c2c764150ea258f0d7266bdc3c63e899ad89fd7ec8bc1ca89c1ada4cef124755239b1b6df8017b3a7ed7b5f8a95a048e0075542ee934106827ca34ecd91f8ba95143b85928f7720e139d795ca0d149e01e1491d1ab4d88d27639470848f6e58696927ed985af391fd26eb9b11ecc8cad46a1d2bb270b4d3ba073bb3ea9c4bdc4a228a392a26071cf0b63186c291c49a40b46131cd2db01492edc7057695c1ca64aeea896558c1523f90ad0c2f678fdc27d13dc0c8e77aade9aea76e08b8dd9561dc20c04d909b1d1a184e7169343f3e08a6b2d58184e24e4ac151e53dc00149d8ca2db45a6d683bbbcfa2c656cb16802138057488b3c27b51692b61340a11b5ade54aec5043d139a782812c4f75e422e24a61dc2952d3f7617928c162da9a1cd3450f25b45e784f68070107167aa0f0e1c211b48bf3422ef60e55380b5b438da70032a81194e15dd440ab0b8e1446d1c9510fd823d511b45279ca06cda27a14e14bffd9	2024-12-03	\N	2	3
13	Noise	Loud Music	Loud music disturbing other students in the hall.	\N	2025-01-23	\N	102	2
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
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 225
-- Name: block_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_block_id_seq', 5, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 229
-- Name: complaint_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_complaint_id_seq', 8, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 232
-- Name: complaint_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_status_status_id_seq', 3, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 223
-- Name: floor_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.floor_floor_id_seq', 45, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hostel_staff_staff_id_seq', 5, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: house_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_house_id_seq', 216, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 236
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_company_company_id_seq', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 234
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_worker_worker_id_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 219
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_room_id_seq', 15, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 238
-- Name: staff_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_log_log_id_seq', 1, false);


--
-- TOC entry 5030 (class 0 OID 0)
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
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE block; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.block TO fathehah;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE complaint; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint TO fathehah WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint TO paan WITH GRANT OPTION;


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE complaint_assignment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_assignment TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO fathehah WITH GRANT OPTION;


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE complaint_status; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_status TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_status TO fathehah WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_status TO paan WITH GRANT OPTION;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE floor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.floor TO fathehah;


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE hostel_staff; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.hostel_staff TO paan WITH GRANT OPTION;


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE house; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.house TO fathehah;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE maintenance_company; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.maintenance_company TO aina;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE maintenance_worker; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.maintenance_worker TO aina;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE room; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.room TO fathehah;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE student; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student TO fathehah;


--
-- TOC entry 2098 (class 826 OID 17691)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO fathehah WITH GRANT OPTION;


-- Completed on 2025-01-23 11:25:39

--
-- PostgreSQL database dump complete
--

