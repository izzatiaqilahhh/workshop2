--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: block_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.block_block_id_seq OWNED BY public.block.block_id;


--
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
-- Name: complaint_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaint_complaint_id_seq OWNED BY public.complaint.complaint_id;


--
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
-- Name: complaint_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaint_status_status_id_seq OWNED BY public.complaint_status.status_id;


--
-- Name: floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.floor (
    floor_id integer NOT NULL,
    floor_no integer NOT NULL,
    block_id integer NOT NULL
);


ALTER TABLE public.floor OWNER TO postgres;

--
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
-- Name: floor_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.floor_floor_id_seq OWNED BY public.floor.floor_id;


--
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
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hostel_staff_staff_id_seq OWNED BY public.hostel_staff.staff_id;


--
-- Name: house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house (
    house_id integer NOT NULL,
    house_no integer NOT NULL,
    floor_id integer NOT NULL
);


ALTER TABLE public.house OWNER TO postgres;

--
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
-- Name: house_house_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.house_house_id_seq OWNED BY public.house.house_id;


--
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
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_company_company_id_seq OWNED BY public.maintenance_company.company_id;


--
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
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_worker_worker_id_seq OWNED BY public.maintenance_worker.worker_id;


--
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
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
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
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- Name: block block_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block ALTER COLUMN block_id SET DEFAULT nextval('public.block_block_id_seq'::regclass);


--
-- Name: complaint complaint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint ALTER COLUMN complaint_id SET DEFAULT nextval('public.complaint_complaint_id_seq'::regclass);


--
-- Name: complaint_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status ALTER COLUMN status_id SET DEFAULT nextval('public.complaint_status_status_id_seq'::regclass);


--
-- Name: floor floor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor ALTER COLUMN floor_id SET DEFAULT nextval('public.floor_floor_id_seq'::regclass);


--
-- Name: hostel_staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff ALTER COLUMN staff_id SET DEFAULT nextval('public.hostel_staff_staff_id_seq'::regclass);


--
-- Name: house house_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house ALTER COLUMN house_id SET DEFAULT nextval('public.house_house_id_seq'::regclass);


--
-- Name: maintenance_company company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company ALTER COLUMN company_id SET DEFAULT nextval('public.maintenance_company_company_id_seq'::regclass);


--
-- Name: maintenance_worker worker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker ALTER COLUMN worker_id SET DEFAULT nextval('public.maintenance_worker_worker_id_seq'::regclass);


--
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- Data for Name: block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block (block_id, block_name, block_gender, number_of_floors, staff_id) FROM stdin;
1	Lekiu	Female	9	1
2	Lekir	Female	9	2
\.


--
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint (complaint_id, complaint_type, complaint_issue, description, image, date_created, date_resolved, student_id, room_id) FROM stdin;
1	Plumbing	Leaking tap in the bathroom	Water from sink keep coming out	\N	2024-12-01	\N	3	3
2	Electrical	Power outage in the room	The power keeps tripping and we have no lights.	\N	2024-12-01	\N	1	1
3	Security	Broken lock on main door	The door lock is broken, and it feels unsafe.	\N	2024-12-03	\N	2	3
4	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink.	\N	2024-12-04	\N	3	3
5	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2024-12-01	\N	4	4
6	Plumbing	No hot water in the shower	The water heater seems to be broken.	\N	2024-12-05	\N	5	4
7	Electrical	Flickering lights in the hallway	The hallway lights are not stable.	\N	2025-02-06	\N	3	3
8	Plumbing	Clogged bathroom sink	The water drains very slowly from the sink	\N	2025-01-08	\N	3	3
\.


--
-- Data for Name: complaint_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint_assignment (complaint_id, worker_id, date_assigned, remarks) FROM stdin;
1	1	2025-01-09 16:47:26	
2	2	2025-01-09 15:02:50	
4	1	2025-01-09 15:37:29	
5	2	2025-01-09 15:35:47	
\.


--
-- Data for Name: complaint_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint_status (status_id, complaint_status, description, date_update_status, complaint_id) FROM stdin;
6	Assigned	Complaint has been assigned to a worker	2025-01-09 15:24:10	2
7	Assigned	Complaint has been assigned to a worker	2025-01-09 15:36:39	5
8	Assigned	Complaint has been assigned to a worker	2025-01-09 15:37:29	4
9	Assigned	Complaint has been assigned to a worker	2025-01-09 16:47:26	1
\.


--
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
-- Data for Name: hostel_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hostel_staff (staff_id, staff_no, name, email, password, phone_no) FROM stdin;
2	S02	Hee Siew Chan	hee@utem.edu.my	hee	0123456689
1	S01	Mohd Anuar Bin Haris	anuar@utem.edu.my	anuar123	0123456789
3	S03	Nadia Abdullah	nadia@utem.edu.my	nadia	0123456798
4	S04	Ravi Kumar	ravi.kumar@utem.edu.my	ravi	0123456897
5	S05	Aina Zainal	aina.zainal@utem.edu.my	aina	0123456996
\.


--
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
-- Data for Name: maintenance_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_company (company_id, company_name, company_office_no, company_email) FROM stdin;
1	ProFix Services	0123456789	info@profixservices.com
2	HandySolutions Co.	9876543210	support@handysolutions.com
3	Elite Maintainers	1231231234	contact@elitemaintainers.com
\.


--
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
-- Name: block_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_block_id_seq', 5, true);


--
-- Name: complaint_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_complaint_id_seq', 8, true);


--
-- Name: complaint_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaint_status_status_id_seq', 1, false);


--
-- Name: floor_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.floor_floor_id_seq', 45, true);


--
-- Name: hostel_staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hostel_staff_staff_id_seq', 5, true);


--
-- Name: house_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_house_id_seq', 216, true);


--
-- Name: maintenance_company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_company_company_id_seq', 1, false);


--
-- Name: maintenance_worker_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_worker_worker_id_seq', 1, false);


--
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_room_id_seq', 15, true);


--
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 5, true);


--
-- Name: block block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT block_pkey PRIMARY KEY (block_id);


--
-- Name: complaint_assignment complaint_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT complaint_assignment_pkey PRIMARY KEY (complaint_id, worker_id);


--
-- Name: complaint complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (complaint_id);


--
-- Name: complaint_status complaint_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT complaint_status_pkey PRIMARY KEY (status_id);


--
-- Name: floor floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT floor_pkey PRIMARY KEY (floor_id);


--
-- Name: hostel_staff hostel_staff_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_email_key UNIQUE (email);


--
-- Name: hostel_staff hostel_staff_phone_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_phone_no_key UNIQUE (phone_no);


--
-- Name: hostel_staff hostel_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_pkey PRIMARY KEY (staff_id);


--
-- Name: hostel_staff hostel_staff_staff_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostel_staff
    ADD CONSTRAINT hostel_staff_staff_no_key UNIQUE (staff_no);


--
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (house_id);


--
-- Name: maintenance_company maintenance_company_company_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company
    ADD CONSTRAINT maintenance_company_company_email_key UNIQUE (company_email);


--
-- Name: maintenance_company maintenance_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_company
    ADD CONSTRAINT maintenance_company_pkey PRIMARY KEY (company_id);


--
-- Name: maintenance_worker maintenance_worker_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_email_key UNIQUE (email);


--
-- Name: maintenance_worker maintenance_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_pkey PRIMARY KEY (worker_id);


--
-- Name: maintenance_worker maintenance_worker_worker_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT maintenance_worker_worker_no_key UNIQUE (worker_no);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- Name: room room_room_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_no_key UNIQUE (room_no);


--
-- Name: student student_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_email_key UNIQUE (email);


--
-- Name: student student_matric_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_matric_no_key UNIQUE (matric_no);


--
-- Name: student student_phone_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_phone_no_key UNIQUE (phone_no);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- Name: complaint_assignment complaint_assignment_complaint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT complaint_assignment_complaint_id_fkey FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_status complaint_status_complaint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT complaint_status_complaint_id_fkey FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id);


--
-- Name: floor fk_block; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT fk_block FOREIGN KEY (block_id) REFERENCES public.block(block_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: maintenance_worker fk_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES public.maintenance_company(company_id);


--
-- Name: maintenance_worker fk_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_worker
    ADD CONSTRAINT fk_company_id FOREIGN KEY (company_id) REFERENCES public.maintenance_company(company_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_assignment fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_complaint FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_status fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_status
    ADD CONSTRAINT fk_complaint FOREIGN KEY (complaint_id) REFERENCES public.complaint(complaint_id);


--
-- Name: house fk_floor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT fk_floor FOREIGN KEY (floor_id) REFERENCES public.floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: room fk_house; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_house FOREIGN KEY (house_id) REFERENCES public.house(house_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student fk_room; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_room FOREIGN KEY (room_id) REFERENCES public.room(room_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: block fk_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block
    ADD CONSTRAINT fk_staff FOREIGN KEY (staff_id) REFERENCES public.hostel_staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_assignment fk_worker; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_worker FOREIGN KEY (worker_id) REFERENCES public.maintenance_worker(worker_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_assignment fk_worker_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint_assignment
    ADD CONSTRAINT fk_worker_id FOREIGN KEY (worker_id) REFERENCES public.maintenance_worker(worker_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TABLE complaint; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint TO fathehah WITH GRANT OPTION;


--
-- Name: TABLE complaint_assignment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_assignment TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO aina WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_assignment TO fathehah WITH GRANT OPTION;


--
-- Name: TABLE complaint_status; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.complaint_status TO paan WITH GRANT OPTION;
GRANT ALL ON TABLE public.complaint_status TO fathehah WITH GRANT OPTION;


--
-- Name: TABLE hostel_staff; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.hostel_staff TO paan WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

