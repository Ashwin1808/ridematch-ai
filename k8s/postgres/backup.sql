--
-- PostgreSQL database dump
--

\restrict 58ifOdSbhpcmTOaYlS2T1mPuR1ThoegXYCOlMWB93Ic7QEYLwMQr4jAjgT6fGvR

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comparison_history; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.comparison_history (
    id integer NOT NULL,
    vehicle1 character varying(100),
    vehicle2 character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comparison_history OWNER TO "user";

--
-- Name: comparison_history_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.comparison_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comparison_history_id_seq OWNER TO "user";

--
-- Name: comparison_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.comparison_history_id_seq OWNED BY public.comparison_history.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    vehicle_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.favorites OWNER TO "user";

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO "user";

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: recommendation_history; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.recommendation_history (
    id integer NOT NULL,
    vehicle_type character varying(100),
    budget numeric,
    usage_type character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.recommendation_history OWNER TO "user";

--
-- Name: recommendation_history_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.recommendation_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recommendation_history_id_seq OWNER TO "user";

--
-- Name: recommendation_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.recommendation_history_id_seq OWNED BY public.recommendation_history.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vehicle_reviews; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.vehicle_reviews (
    id integer NOT NULL,
    vehicle_id integer,
    source character varying(100),
    rating numeric,
    review text
);


ALTER TABLE public.vehicle_reviews OWNER TO "user";

--
-- Name: vehicle_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.vehicle_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_reviews_id_seq OWNER TO "user";

--
-- Name: vehicle_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.vehicle_reviews_id_seq OWNED BY public.vehicle_reviews.id;


--
-- Name: vehicle_views; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.vehicle_views (
    id integer NOT NULL,
    vehicle_id integer,
    viewed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vehicle_views OWNER TO "user";

--
-- Name: vehicle_views_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.vehicle_views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_views_id_seq OWNER TO "user";

--
-- Name: vehicle_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.vehicle_views_id_seq OWNED BY public.vehicle_views.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    name character varying(100),
    type character varying(20),
    budget numeric,
    mileage numeric,
    safety numeric,
    usage_type character varying(50),
    image text,
    price character varying(50),
    reason text,
    brand character varying(100),
    fuel_type character varying(50),
    transmission character varying(50),
    seating integer,
    body_type character varying(50),
    engine character varying(50),
    make text,
    variant text,
    displacement integer,
    cylinders integer,
    fuel_tank_capacity double precision,
    height integer,
    length integer,
    width integer,
    seating_capacity integer,
    power double precision,
    torque double precision,
    image_url text
);


ALTER TABLE public.vehicles OWNER TO "user";

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicles_id_seq OWNER TO "user";

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- Name: comparison_history id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.comparison_history ALTER COLUMN id SET DEFAULT nextval('public.comparison_history_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: recommendation_history id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendation_history ALTER COLUMN id SET DEFAULT nextval('public.recommendation_history_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vehicle_reviews id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_reviews ALTER COLUMN id SET DEFAULT nextval('public.vehicle_reviews_id_seq'::regclass);


--
-- Name: vehicle_views id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_views ALTER COLUMN id SET DEFAULT nextval('public.vehicle_views_id_seq'::regclass);


--
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- Data for Name: comparison_history; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.comparison_history (id, vehicle1, vehicle2, created_at) FROM stdin;
2	Xuv500	Innova Crysta	2026-06-16 11:18:48.925518
1	Xuv500	Innova Crysta	2026-06-16 11:18:48.924586
3	Xuv500	Innova Crysta	2026-06-16 11:22:52.496204
4	Xuv500	Innova Crysta	2026-06-16 11:22:52.496467
5	Xuv500	Innova Crysta	2026-06-16 11:23:34.292901
6	Xuv500	Innova Crysta	2026-06-16 11:23:56.943597
7	Xuv500	Innova Crysta	2026-06-16 11:23:56.946152
8	Xuv500	Innova Crysta	2026-06-16 11:24:46.475388
9	Xuv500	Innova Crysta	2026-06-16 11:24:46.47474
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.favorites (id, vehicle_id, created_at) FROM stdin;
18	269	2026-06-22 00:32:07.094891
19	871	2026-06-22 00:32:09.079185
20	870	2026-06-22 00:32:11.565919
\.


--
-- Data for Name: recommendation_history; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.recommendation_history (id, vehicle_type, budget, usage_type, created_at) FROM stdin;
1	Car	10	City	2026-06-16 10:52:25.217636
2	Car	12	Mixed	2026-06-16 10:53:02.787804
3	Car	20	City	2026-06-16 10:54:57.246093
4	Car	20	City	2026-06-16 10:55:01.754468
5	Car	6	City	2026-06-16 11:16:23.206547
6	Car	15	City	2026-06-16 11:17:19.41324
7	Car	20	City	2026-06-16 11:17:51.057289
8	Car	20	City	2026-06-16 12:07:17.504485
9	Car	12	City	2026-06-16 12:56:57.743256
10	Car	20	City	2026-06-17 20:03:10.03887
11	Car	15	City	2026-06-18 00:43:08.473294
12	Car	10	City	2026-06-19 22:01:12.638215
13	Car	20	Mixed	2026-06-21 02:08:07.609662
14	Car	20	\N	2026-06-21 02:15:56.552707
15	Car	20	\N	2026-06-21 02:16:21.330255
16	Car	20	\N	2026-06-21 02:26:19.275848
17	Car	16	\N	2026-06-21 22:55:12.327086
18	Car	20	Mixed	2026-06-22 00:08:48.515588
19	Car	20	Mixed	2026-06-22 00:08:54.696744
20	Car	15	Mixed	2026-06-22 00:09:01.699765
21	Car	15	Mixed	2026-06-22 00:09:08.341607
22	Car	10	City	2026-06-22 00:09:16.966459
23	Car	10	City	2026-06-22 00:09:25.95892
24	Car	10	City	2026-06-22 00:11:45.804465
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, name, email, password, created_at) FROM stdin;
1	Ashwin	ashwin@test.com	$2b$10$F0IKN97cZKFktV1qawCd4uVBQrG1IHA722C05HFzoaxr7lj/NZfja	2026-06-21 13:11:02.384386
2	ashwin	ashwin@gmail.com	$2b$10$F5CUzAfP/yh9ZNZXBsS8p.r/iZWHkga2PBlQ2m23Ykve/JRne9BQK	2026-06-22 00:16:51.401608
\.


--
-- Data for Name: vehicle_reviews; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.vehicle_reviews (id, vehicle_id, source, rating, review) FROM stdin;
1	2	Team-BHP	4.8	Excellent safety and driving confidence.
2	2	CarWale	4.5	Very comfortable for city use.
3	2	CarDekho	4.6	Best compact SUV in this budget.
4	1	Team-BHP	4.2	Excellent mileage and low maintenance.
5	1	CarWale	4.0	Very practical city hatchback.
6	1	CarDekho	4.1	Easy to drive and maintain.
\.


--
-- Data for Name: vehicle_views; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.vehicle_views (id, vehicle_id, viewed_at) FROM stdin;
1	297	2026-06-16 11:24:29.47782
2	297	2026-06-16 11:24:29.493647
3	2	2026-06-16 12:57:10.852253
4	2	2026-06-16 12:57:10.883152
5	269	2026-06-16 23:56:41.549924
6	269	2026-06-16 23:56:41.694903
7	1	2026-06-16 23:57:04.469905
8	1078	2026-06-16 23:57:18.350769
9	1078	2026-06-16 23:57:18.354957
10	416	2026-06-17 09:55:57.357555
11	416	2026-06-17 09:55:57.370624
12	1	2026-06-17 19:48:38.544075
13	1	2026-06-17 19:49:57.138563
14	1	2026-06-17 19:50:26.53406
15	1	2026-06-17 19:55:11.621931
16	1	2026-06-17 19:55:39.288677
17	1	2026-06-17 19:56:55.987981
18	2	2026-06-17 20:09:13.470369
19	2	2026-06-17 20:09:13.489168
20	269	2026-06-17 22:30:53.72001
21	269	2026-06-17 22:30:53.72797
22	269	2026-06-17 22:37:33.328264
23	269	2026-06-17 22:37:33.351661
24	269	2026-06-17 22:41:56.081746
25	269	2026-06-17 22:41:56.093617
26	486	2026-06-17 22:47:59.771046
27	486	2026-06-17 22:47:59.778213
28	269	2026-06-17 23:15:41.41928
29	269	2026-06-17 23:15:41.427791
30	269	2026-06-17 23:16:02.466129
31	269	2026-06-17 23:18:12.130911
32	269	2026-06-18 09:51:30.071645
33	269	2026-06-18 09:51:30.082844
34	269	2026-06-19 23:43:30.825012
35	269	2026-06-19 23:43:30.838899
36	1	2026-06-19 23:43:46.122572
37	1	2026-06-19 23:43:46.125484
38	1	2026-06-19 23:44:25.589379
39	1119	2026-06-19 23:44:32.672914
40	1119	2026-06-19 23:44:32.678386
41	1	2026-06-19 23:45:08.665181
42	1	2026-06-19 23:45:08.678587
43	269	2026-06-20 19:36:32.763085
44	269	2026-06-20 19:36:32.778724
45	1	2026-06-20 19:36:50.575896
46	1	2026-06-20 19:36:50.581729
47	108	2026-06-20 19:37:17.483254
48	108	2026-06-20 19:37:17.501071
49	289	2026-06-20 19:38:27.312544
50	289	2026-06-20 19:38:27.369012
51	4	2026-06-20 19:38:40.196979
52	4	2026-06-20 19:38:40.212116
53	1014	2026-06-20 19:39:03.199829
54	1014	2026-06-20 19:39:03.205279
55	975	2026-06-20 19:46:09.729167
56	975	2026-06-20 19:46:09.736964
57	269	2026-06-20 19:55:58.795171
58	269	2026-06-20 19:55:58.928463
59	978	2026-06-20 19:56:17.449155
60	978	2026-06-20 19:56:17.463092
61	978	2026-06-20 20:15:06.678451
62	978	2026-06-20 20:15:06.690776
63	978	2026-06-20 20:15:08.691218
64	978	2026-06-20 20:15:08.693248
65	978	2026-06-20 20:15:24.728094
66	871	2026-06-20 20:48:24.384655
67	871	2026-06-20 20:48:24.396122
68	1119	2026-06-20 21:09:47.53312
69	1119	2026-06-20 21:09:47.653647
70	490	2026-06-20 21:10:53.50559
71	490	2026-06-20 21:10:53.526609
72	1119	2026-06-21 00:26:56.213803
73	1119	2026-06-21 00:26:56.229974
74	1	2026-06-21 00:36:21.85849
75	1	2026-06-21 00:36:21.868741
76	269	2026-06-21 00:43:04.630356
77	269	2026-06-21 00:43:04.654609
78	269	2026-06-21 00:47:24.276383
79	269	2026-06-21 00:47:24.616136
80	269	2026-06-21 00:47:34.589036
81	269	2026-06-21 01:00:22.618362
82	269	2026-06-21 01:15:33.417356
83	269	2026-06-21 01:18:47.20798
84	269	2026-06-21 01:22:28.932659
85	59	2026-06-21 01:23:49.907374
86	59	2026-06-21 01:23:49.928825
87	157	2026-06-21 01:24:13.647115
88	157	2026-06-21 01:24:13.65224
89	157	2026-06-21 01:25:01.468546
90	269	2026-06-21 01:32:34.732136
91	269	2026-06-21 01:32:34.744099
92	1125	2026-06-21 02:08:46.921699
93	1125	2026-06-21 02:08:46.943739
94	195	2026-06-21 22:51:39.856
95	195	2026-06-21 22:51:40.046407
96	870	2026-06-22 00:12:48.348545
97	870	2026-06-22 00:12:48.412204
98	871	2026-06-22 00:30:06.327875
99	871	2026-06-22 00:30:06.348446
100	870	2026-06-22 00:32:23.340591
101	870	2026-06-22 00:32:23.342424
102	397	2026-06-22 11:29:42.659372
103	397	2026-06-22 11:29:42.679162
104	596	2026-06-22 16:07:51.511019
105	596	2026-06-22 16:07:51.805545
106	269	2026-06-22 22:29:48.230095
107	269	2026-06-22 22:29:48.287805
108	870	2026-06-27 12:08:12.683165
109	870	2026-06-27 12:08:12.687071
110	871	2026-06-27 12:09:04.704893
111	871	2026-06-27 12:09:04.707401
112	828	2026-07-01 10:04:20.080532
113	828	2026-07-01 10:04:20.093521
114	870	2026-07-01 10:04:39.453343
115	870	2026-07-01 10:04:39.459137
116	870	2026-07-02 05:26:08.279253
117	828	2026-07-02 05:26:16.214643
118	49	2026-07-02 16:35:33.97795
119	49	2026-07-02 16:35:33.990895
120	49	2026-07-02 16:37:21.911373
121	49	2026-07-03 16:42:52.232088
122	269	2026-07-03 16:43:30.686313
\.


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.vehicles (id, name, type, budget, mileage, safety, usage_type, image, price, reason, brand, fuel_type, transmission, seating, body_type, engine, make, variant, displacement, cylinders, fuel_tank_capacity, height, length, width, seating_capacity, power, torque, image_url) FROM stdin;
269	Aston Martin Db 11 V12	Car	405	18	4	City	/cars/db-11.jpg	404.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Aston Martin	V12	5198	12	80	1250	4385	1865	2	608	700	https://www.astonmartinwashingtondc.com/wp-content/uploads/aston-martin-dbs-770-ultimate-coupe-1024x728.png
871	Aston Martin Rapide Luxe	Car	389	18	4	City	/cars/rapide.jpg	388.46 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Aston Martin	Luxe	5935	12	90.5	1360	5019	1929	4	560	630	https://platform.cstatic-images.com/in/v2/stock_photos/e89fdde3-00d6-4662-9ebe-7dc4d86cda6b/5c0706f1-aedd-46ab-80b9-460b3cf4bb12.png
870	Aston Martin Vantage Coupe	Car	295	18	4	City	/cars/vantage.jpg	295.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Aston Martin	Coupe	3982	8	73	1273	4465	2153	2	505	685	https://blog.consumerguide.com/wp-content/uploads/sites/2/2020/11/Screen-Shot-2020-11-10-at-4.05.13-PM.png
361	Audi A3 35 Tfsi Premium Plus	Car	30	18	4	City	/cars/a3.jpg	29.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	35 Tfsi Premium Plus	1395	4	50	1416	4456	1796	5	150	250	https://uploads.audi-mediacenter.com/system/production/cars/8/photos/7c22a2763314cfec1a377b419acb094a27de6a4a/web_1440_A3_Sportback.png?1761750925
362	Audi A3 35 Tfsi Technology	Car	32	18	4	City	/cars/a3.jpg	31.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	35 Tfsi Technology	1395	4	50	1416	4456	1796	5	150	250	https://uploads.audi-mediacenter.com/system/production/cars/8/photos/7c22a2763314cfec1a377b419acb094a27de6a4a/web_1440_A3_Sportback.png?1761750925
1078	Audi A3 35 Tdi Premium Plus	Car	31	18	4	City	/cars/a3.jpg	30.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Audi	35 Tdi Premium Plus	1968	4	50	1416	4456	1796	5	143	320	https://uploads.audi-mediacenter.com/system/production/cars/8/photos/7c22a2763314cfec1a377b419acb094a27de6a4a/web_1440_A3_Sportback.png?1761750925
289	Audi A3 Cabriolet 40 Tfsi	Car	51	18	4	City	/cars/a3-cabriolet.jpg	50.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Audi	40 Tfsi	1395	4	50	1409	4421	1793	4	148	250	https://file.kelleybluebookimages.com/kbb/base/evox/CP/9818/2015-Audi-A3-front_9818_032_2400x1800_2YPA.png
50	Audi A4 Technology 35 Tfsi	Car	46	18	4	City	/cars/a4.jpg	45.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	Sedan	\N	Audi	Technology 35 Tfsi	1395	4	54	1427	4726	1842	5	150	250	https://di-uploads-pod3.dealerinspire.com/vindeversautohausofsylvania/uploads/2017/07/2018-Audi-A4-On-White.png
52	Audi A6 Technology 45 Tfsi	Car	60	18	4	City	/cars/a6.jpg	59.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	Technology 45 Tfsi	1984	4	73	1455	4933	1874	5	245	370	https://uploads.audi-mediacenter.com/system/production/cars/1018/photos/f959a8d494e0ca4fd12a890e7dafd22c4560fb76/web_1440_A6_Limousine.png?1744726631
363	Audi Q3 30 Tdi Premium Fwd	Car	37	18	4	Highway	/cars/q3.jpg	36.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Audi	30 Tdi Premium Fwd	1968	4	64	1608	4388	1831	5	148	340	https://media.chromedata.com/MediaGallery/media/MjkzOTU4Xk1lZGlhIEdhbGxlcnk/yWhhamuIqoaUmA6Pnw35laeUvH06I8QJDC2OOgknMwr5MMLIuJg9lf3hJz0aNy-Z2hOf4PlPV63fpvhy5dCARO-Qvysj_NtNgWqpT69D7Xyg5clTEOBGgsoTezZh2BwPMCwDlzvkJI0UUdmJEvnRA-rKsQKH0GwCBakOlDpFr5R5efvuklK7Br3dclXXw4yNj51WGaKgopc/cc_2025AUS051993371_01_640_2D2D.png
366	Audi Q3 30 Tfsi Premium	Car	35	18	4	Highway	/cars/q3.jpg	34.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	30 Tfsi Premium	1395	4	64	1608	4388	1831	5	150	250	https://media.chromedata.com/MediaGallery/media/MjkzOTU4Xk1lZGlhIEdhbGxlcnk/yWhhamuIqoaUmA6Pnw35laeUvH06I8QJDC2OOgknMwr5MMLIuJg9lf3hJz0aNy-Z2hOf4PlPV63fpvhy5dCARO-Qvysj_NtNgWqpT69D7Xyg5clTEOBGgsoTezZh2BwPMCwDlzvkJI0UUdmJEvnRA-rKsQKH0GwCBakOlDpFr5R5efvuklK7Br3dclXXw4yNj51WGaKgopc/cc_2025AUS051993371_01_640_2D2D.png
365	Audi Q3 35 Tdi Quattro Technology	Car	44	18	4	Highway	/cars/q3.jpg	43.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	35 Tdi Quattro Technology	1968	4	64	1608	4388	1831	5	177	380	https://media.chromedata.com/MediaGallery/media/MjkzOTU4Xk1lZGlhIEdhbGxlcnk/yWhhamuIqoaUmA6Pnw35laeUvH06I8QJDC2OOgknMwr5MMLIuJg9lf3hJz0aNy-Z2hOf4PlPV63fpvhy5dCARO-Qvysj_NtNgWqpT69D7Xyg5clTEOBGgsoTezZh2BwPMCwDlzvkJI0UUdmJEvnRA-rKsQKH0GwCBakOlDpFr5R5efvuklK7Br3dclXXw4yNj51WGaKgopc/cc_2025AUS051993371_01_640_2D2D.png
364	Audi Q3 35 Tdi Quattro Premium Plus	Car	40	18	4	Highway	/cars/q3.jpg	39.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	35 Tdi Quattro Premium Plus	1968	4	64	1608	4388	1831	5	177	380	https://media.chromedata.com/MediaGallery/media/MjkzOTU4Xk1lZGlhIEdhbGxlcnk/yWhhamuIqoaUmA6Pnw35laeUvH06I8QJDC2OOgknMwr5MMLIuJg9lf3hJz0aNy-Z2hOf4PlPV63fpvhy5dCARO-Qvysj_NtNgWqpT69D7Xyg5clTEOBGgsoTezZh2BwPMCwDlzvkJI0UUdmJEvnRA-rKsQKH0GwCBakOlDpFr5R5efvuklK7Br3dclXXw4yNj51WGaKgopc/cc_2025AUS051993371_01_640_2D2D.png
517	Audi Q5 45 Tfsi Technology	Car	57	18	4	Highway	/cars/q5.jpg	56.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	45 Tfsi Technology	1984	6	70	1659	4663	1898	5	248	370	https://uploads.audi-mediacenter.com/system/production/cars/608/photos/ec4dfd850dd40c16b7fbf6bfabcd38a0937145f1/web_1440_Q5_SUV.png?1764058307
885	Audi Q7 45 Tdi Premium Plus	Car	73	18	4	Highway	/cars/q7.jpg	72.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	45 Tdi Premium Plus	2967	6	75	1740	5052	1968	7	249	600	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
444	Audi Q7 40 Tfsi Quattro Premium Plus	Car	70	18	4	Highway	/cars/q7.jpg	69.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	40 Tfsi Quattro Premium Plus	1984	6	75	1740	5052	1968	7	252	370	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
886	Audi Q7 45 Tdi Technology Pack	Car	81	18	4	Highway	/cars/q7.jpg	80.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	45 Tdi Technology Pack	2967	6	75	1740	5052	1968	7	249	600	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
431	Audi Rs5 Coupe	Car	112	18	4	City	/cars/rs5.jpg	111.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Audi	Coupe	2894	8	58	0	4649	0	4	450	600	https://images.dealer.com/ddc/vehicles/2024/Audi/RS%205/Coupe/perspective/front-left/2024_24.png
1	Maruti Suzuki Swift	Car	8	24	3	City	/cars/swift.jpg	8 Lakhs	Excellent mileage and low maintenance for city driving.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	Renault Kwid Climber (O) Amt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Renault	Climber (O) Amt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
446	Audi Q7 40 Tfsi Quattro Black Styling	Car	78	18	4	Highway	/cars/q7.jpg	77.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	40 Tfsi Quattro Black Styling	1984	6	75	1740	5052	1968	7	252	370	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
813	Bmw M2 Competition Coupe	Car	82	18	4	City	/cars/m2-competition.jpg	81.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Bmw	Coupe	2979	6	52	1410	4461	1854	4	410	550	\N
629	Bmw X4 Xdrive20D M Sport X	Car	61	18	4	Highway	/cars/x4.jpg	60.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive20D M Sport X	1995	4	60	1621	4752	1918	5	188	400	\N
54	Bmw X5 Xdrive30D Sport	Car	74	18	4	Highway	/cars/x5.jpg	73.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive30D Sport	2993	6	0	1745	4922	2218	5	265	620	\N
56	Bmw X5 Xdrive40I M Sport	Car	83	18	4	Highway	/cars/x5.jpg	82.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bmw	Xdrive40I M Sport	2998	6	0	1745	4922	2218	5	340	450	\N
196	Bmw X7 Xdrive 40I	Car	105	18	4	Highway	/cars/x7.jpg	104.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bmw	Xdrive 40I	2998	6	80	1805	5151	2000	7	335	450	\N
179	Bmw Z4 Roadster M 40I	Car	79	18	4	City	/cars/z4-roadster.jpg	78.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible, Sports	\N	Bmw	M 40I	2998	6	52	1304	4324	1459	2	340	500	\N
178	Bmw Z4 Roadster Sdrive 20I	Car	65	18	4	City	/cars/z4-roadster.jpg	64.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible, Sports	\N	Bmw	Sdrive 20I	1998	4	52	1304	4324	2024	2	197	320	\N
1119	Renault Duster Rxs Petrol	Car	10	18	4	Highway	/cars/duster.jpg	9.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Renault	Rxs Petrol	1498	4	50	1695	4315	1822	5	106	142	\N
1120	Hyundai I20 Active 1.2 Sx Dual Tone	Car	9	18	4	City	/cars/i20-active.jpg	8.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 Sx Dual Tone	1197	4	40	1555	3995	1760	5	83	114	\N
1121	Renault Duster Rxs (Opt) Cvt	Car	10	18	4	Highway	/cars/duster.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	CVT	\N	SUV	\N	Renault	Rxs (Opt) Cvt	1498	4	50	1695	4315	1822	5	106	142	\N
1122	Renault Duster 85 Ps Rxe Mt Diesel	Car	10	18	4	Highway	/cars/duster.jpg	9.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Renault	85 Ps Rxe Mt Diesel	1461	4	50	1695	4315	1822	5	85	200	\N
1123	Renault Duster 85 Ps Rxs Mt Diesel	Car	10	18	4	Highway	/cars/duster.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Renault	85 Ps Rxs Mt Diesel	1461	4	50	1695	4315	1822	5	85	200	\N
1124	Renault Duster 110 Ps Rxs Mt Diesel	Car	12	18	4	Highway	/cars/duster.jpg	11.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Renault	110 Ps Rxs Mt Diesel	1461	4	50	1695	4315	1822	5	110	245	\N
1125	Force Gurkha Xplorer 3 Door	Car	11	18	4	Highway	/cars/gurkha.jpg	10.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xplorer 3 Door	2596	4	63	2055	3992	1790	5	85	230	\N
1126	Renault Duster 110 Ps Rxz Amt Diesel	Car	13	18	4	Highway	/cars/duster.jpg	12.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Renault	110 Ps Rxz Amt Diesel	1461	4	50	1695	4315	1822	5	110	245	\N
1127	Renault Duster 110 Ps Rxs Awd (Opt) Diesel	Car	13	18	4	Highway	/cars/duster.jpg	12.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Renault	110 Ps Rxs Awd (Opt) Diesel	1461	4	50	1695	4315	1822	5	110	245	\N
1128	Renault Duster 110 Ps Rxz Mt Diesel	Car	13	18	4	Highway	/cars/duster.jpg	12.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Renault	110 Ps Rxz Mt Diesel	1461	4	50	1695	4315	1822	5	110	245	\N
1129	Skoda Monte Carlo Monte Carlo 1.5 Tdi At	Car	15	18	4	City	/cars/monte-carlo.jpg	14.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Monte Carlo 1.5 Tdi At	1498	4	55	1466	4413	1699	5	110	250	\N
2	Tata Punch	Car	9	20	5	City	/cars/punch.jpg	9 Lakhs	Best compact SUV with strong safety and comfort.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	Hyundai i20	Car	11	19	4	Highway	/cars/i20.jpg	11 Lakhs	Premium hatchback with comfort and features.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Honda City	Car	15	18	5	Highway	/cars/city.jpg	15 Lakhs	Reliable sedan perfect for long drives.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Hero Splendor	Bike	1	70	3	City	/bikes/splendor.jpg	1 Lakh	Best mileage bike for daily commuting.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	TVS Raider	Bike	1.5	60	4	City	/bikes/raider.jpg	1.5 Lakhs	Sporty commuter bike with modern features.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Royal Enfield Classic 350	Bike	2.5	35	4	Highway	/bikes/classic350.jpg	2.5 Lakhs	Perfect touring bike with road presence.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	KTM Duke 390	Bike	4	28	5	Highway	/bikes/duke390.jpg	4 Lakhs	High performance bike for enthusiasts.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	Bajaj Qute (Re60) Qcar	Car	3	18	4	City	/cars/qute-(re60).jpg	2.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Bajaj	Qcar	216	0	0	1652	2752	1312	4	13	18.9	\N
992	Bentley Bentayga W12	Car	460	18	4	Highway	/cars/bentayga.jpg	459.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bentley	W12	5950	12	85	1742	5141	1998	5	608	900	\N
832	Bentley Mulsanne Sedan	Car	526	18	4	City	/cars/mulsanne.jpg	525.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bentley	Sedan	6752	8	90	1521	5575	2208	4	512	1020	\N
623	Bmw 3-Series 320D Luxury Line	Car	47	18	4	City	/cars/3-series.jpg	46.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	320D Luxury Line	1995	4	40	1429	4633	1811	5	190	400	\N
622	Bmw 3-Series 320D Sport	Car	42	18	4	City	/cars/3-series.jpg	41.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	320D Sport	1995	4	40	1429	4633	1811	5	190	400	\N
1077	Audi A3 35 Tdi Technology	Car	33	18	4	City	/cars/a3.jpg	32.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Audi	35 Tdi Technology	1968	4	50	1416	4456	1796	5	143	320	https://uploads.audi-mediacenter.com/system/production/cars/8/photos/7c22a2763314cfec1a377b419acb094a27de6a4a/web_1440_A3_Sportback.png?1761750925
49	Audi A4 Premium Plus 35 Tfsi	Car	42	18	4	City	/cars/a4.jpg	41.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	Sedan	\N	Audi	Premium Plus 35 Tfsi	1395	4	54	1427	4726	1842	5	150	250	https://di-uploads-pod3.dealerinspire.com/vindeversautohausofsylvania/uploads/2017/07/2018-Audi-A4-On-White.png
195	Audi A5 Cabriolet 2.0 Tdi	Car	70	18	4	City	/cars/a5-cabriolet.jpg	69.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Convertible	\N	Audi	2.0 Tdi	1968	4	58	1386	4733	1843	4	190	400	https://images.dealer.com/ddc/vehicles/2024/Audi/A5/Convertible/perspective/front-left/2024_24.png
142	Audi A5 Sportback	Car	61	18	4	City	/cars/a5.jpg	60.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Audi	Sportback	1968	4	0	1386	4733	1843	5	190	400	https://images.dealer.com/ddc/vehicles/2024/Audi/A5/Hatchback/perspective/front-left/2024_24.png
51	Audi A6 Premium Plus 45 Tfsi	Car	55	18	4	City	/cars/a6.jpg	54.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	Premium Plus 45 Tfsi	1984	4	73	1455	4933	1874	5	245	370	https://uploads.audi-mediacenter.com/system/production/cars/1018/photos/f959a8d494e0ca4fd12a890e7dafd22c4560fb76/web_1440_A6_Limousine.png?1744726631
152	Audi A8 L 55 Tfsi Quattro	Car	156	18	4	City	/cars/a8-l.jpg	156.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	55 Tfsi Quattro	2995	8	82	1485	5302	1945	4	340	500	https://images.dealer.com/ddc/vehicles/2025/Audi/A8/Sedan/perspective/front-left/2025_76.png
376	Audi Q5 35 Tdi Technology	Car	57	18	4	Highway	/cars/q5.jpg	56.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	35 Tdi Technology	1968	4	64	1608	4388	1831	5	190	400	https://uploads.audi-mediacenter.com/system/production/cars/608/photos/ec4dfd850dd40c16b7fbf6bfabcd38a0937145f1/web_1440_Q5_SUV.png?1764058307
516	Audi Q5 45 Tfsi Premium Plus	Car	51	18	4	Highway	/cars/q5.jpg	50.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	45 Tfsi Premium Plus	1984	6	70	1659	4663	1898	5	248	370	https://uploads.audi-mediacenter.com/system/production/cars/608/photos/ec4dfd850dd40c16b7fbf6bfabcd38a0937145f1/web_1440_Q5_SUV.png?1764058307
445	Audi Q7 40 Tfsi Quattro Technology Pack	Car	77	18	4	Highway	/cars/q7.jpg	76.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	40 Tfsi Quattro Technology Pack	1984	6	75	1740	5052	1968	7	252	370	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
887	Audi Q7 45 Tdi Black Styling	Car	82	18	4	Highway	/cars/q7.jpg	81.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	45 Tdi Black Styling	2967	6	75	1740	5052	1968	7	249	600	https://file.kelleybluebookimages.com/kbb/base/evox/CP/54586/2026-Audi-Q7-front_54586_032_2400x1800_W0W0.png
435	Audi Q8 55 Tfsi Quattro Tiptronic	Car	134	18	4	Highway	/cars/q8.jpg	133.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Audi	55 Tfsi Quattro Tiptronic	2995	4	85	1740	5052	1968	7	340	500	https://media.chromedata.com/MediaGallery/media/MjkzOTU4Xk1lZGlhIEdhbGxlcnk/Opm-o5Il9qy3HnYqFARiXLeTXlsvBQ1OiCUelkyt_GMcDBPBQEJGNRGRrZz73vj9Ns0e1vJFKsmXcndvPhp2OneCuYfhsPpDwuJdqUP2PvWJObMjZpceC7m_uGppnUpk5jroXQ2hZmUfGg04aLwQzyO4OABJwfKNfD3oZzjgWjbhM-W98zzerg/cc_2026AUS061997153_01_640_0E0E.png
827	Audi R8 V10 Plus	Car	273	18	4	City	/cars/r8.jpg	272.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Audi	V10 Plus	5204	10	75	1252	4440	2029	2	610	560	https://m.dreamracing.com/assets/R8-1-1.png
850	Audi Rs7 Sportback	Car	171	18	4	City	/cars/rs7.jpg	170.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe, Sedan	\N	Audi	Sportback	3993	8	75	1419	5012	1911	4	560	700	https://platform.cstatic-images.com/xxlarge/in/v2/stock_photos/f4624ba1-92c5-4a95-8201-0e3a4713df90/738e72ba-8efb-4114-a1aa-2bf110bc1138.png
53	Audi S5 Sportback	Car	73	18	4	City	/cars/s5.jpg	72.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Audi	Sportback	2995	6	58	1384	4718	1843	5	333	500	https://content-images.carmax.com/stockimages/2020/audi/s5-sportback/st2400-089-evoxwebmedium.png
624	Bmw 3-Series 330I M Sport	Car	48	18	4	City	/cars/3-series.jpg	47.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bmw	330I M Sport	1998	4	59	1429	4633	1811	5	258	400	\N
1202	Bmw 5-Series 520D Luxury Line	Car	60	18	4	City	/cars/5-series.jpg	59.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	520D Luxury Line	1995	4	70	1464	4907	1860	5	190	400	\N
1016	Bmw 5-Series 530D M Sport	Car	67	18	4	City	/cars/5-series.jpg	66.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	530D M Sport	2993	6	70	1464	4907	1860	5	258	560	\N
459	Bmw 6-Series 630D Gt M Sport	Car	75	18	4	City	/cars/6-series.jpg	74.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	630D Gt M Sport	2993	6	88	1481	5219	2142	4	265	620	\N
872	Bmw 6-Series 630I Gt Luxury Line	Car	65	18	4	City	/cars/6-series.jpg	64.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Bmw	630I Gt Luxury Line	4395	8	70	1369	4894	1894	4	450	0	\N
816	Bmw 7-Series 730Ld Design Pure Excellence	Car	123	18	4	City	/cars/7-series.jpg	122.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	730Ld Design Pure Excellence	2993	6	78	1479	5120	2169	4	265	620	\N
818	Bmw 7-Series 730Ld M Sport	Car	136	18	4	City	/cars/7-series.jpg	135.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	730Ld M Sport	2993	6	78	1479	5120	2169	4	265	620	\N
432	Bmw 7-Series 740Li Design Pure Excellence Signature	Car	136	18	4	City	/cars/7-series.jpg	135.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bmw	740Li Design Pure Excellence Signature	2998	6	78	1479	5120	2169	4	340	450	\N
434	Bmw 7-Series M760Li Xdrive	Car	243	18	4	City	/cars/7-series.jpg	242.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bmw	M760Li Xdrive	6592	12	78	1481	5219	2142	4	609	850	\N
867	Bmw M4 Coupe	Car	136	18	4	City	/cars/m4.jpg	135.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Bmw	Coupe	2979	6	60	1383	4671	1870	4	431	550	\N
1266	Bmw X1 Sdrive20D Expedition	Car	36	18	4	Highway	/cars/x1.jpg	35.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Crossover, SUV	\N	Bmw	Sdrive20D Expedition	1995	4	51	1612	4439	2060	5	190	400	\N
1263	Bmw X1 Sdrive20D Xline	Car	40	18	4	Highway	/cars/x1.jpg	39.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Crossover, SUV	\N	Bmw	Sdrive20D Xline	1995	4	51	1612	4439	2058	5	190	400	\N
1096	Bmw X3 Xdrive 20D Luxury Line	Car	60	18	4	Highway	/cars/x3.jpg	59.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive 20D Luxury Line	1995	4	67	1678	4657	1881	5	190	400	\N
1094	Bmw X3 Xdrive 30I Luxury Line	Car	59	18	4	Highway	/cars/x3.jpg	58.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bmw	Xdrive 30I Luxury Line	1998	4	67	1678	4657	1881	5	248	350	\N
1097	Bmw X3 Xdrive20D Xline	Car	56	18	4	Highway	/cars/x3.jpg	56.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive20D Xline	1995	4	67	1678	4657	1881	5	190	400	\N
21	Hyundai Aura Sx 1.2 Petrol	Car	8	18	4	City	/cars/aura.jpg	7.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx 1.2 Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
22	Hyundai Aura Sx Plus 1.2 Amt Petrol	Car	9	18	4	City	/cars/aura.jpg	8.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Hyundai	Sx Plus 1.2 Amt Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
23	Hyundai Aura Sx (O) 1.2 Petrol	Car	8	18	4	City	/cars/aura.jpg	7.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx (O) 1.2 Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
24	Hyundai Aura Sx Plus 1.0 Petrol	Car	9	18	4	City	/cars/aura.jpg	8.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx Plus 1.0 Petrol	998	0	37	1520	3995	1680	5	100	172	\N
25	Hyundai Aura S 1.2 Diesel	Car	8	18	4	City	/cars/aura.jpg	7.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	S 1.2 Diesel	1186	0	37	1520	3995	1680	5	75	190	\N
26	Hyundai Aura S 1.2 Amt Diesel	Car	9	18	4	City	/cars/aura.jpg	8.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Hyundai	S 1.2 Amt Diesel	1186	0	37	1520	3995	1680	5	75	190	\N
27	Hyundai Aura Sx Plus 1.2 Amt Diesel	Car	10	18	4	City	/cars/aura.jpg	9.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Hyundai	Sx Plus 1.2 Amt Diesel	1186	0	37	1520	3995	1680	5	75	190	\N
28	Hyundai Aura Sx (O) 1.2 Diesel	Car	10	18	4	City	/cars/aura.jpg	9.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	Sx (O) 1.2 Diesel	1186	0	37	1520	3995	1680	5	75	190	\N
31	Ford Aspire 1.2 Ti-Vct Trend	Car	7	18	4	City	/cars/aspire.jpg	6.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Trend	1194	4	42	1525	3995	1704	5	96	120	\N
32	Ford Aspire 1.5 Tdci Ambiente	Car	7	18	4	City	/cars/aspire.jpg	6.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Ambiente	1498	4	40	1525	3995	1704	5	100	215	\N
33	Ford Aspire 1.5 Tdci Trend	Car	8	18	4	City	/cars/aspire.jpg	7.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Trend	1498	4	40	1525	3995	1704	5	100	215	\N
34	Ford Aspire 1.5 Tdci Trend Plus	Car	8	18	4	City	/cars/aspire.jpg	7.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Trend Plus	1498	4	40	1525	3995	1705	5	100	215	\N
35	Ford Aspire 1.5 Tdci Titanium	Car	9	18	4	City	/cars/aspire.jpg	8.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Titanium	1498	4	40	1525	3995	1704	5	100	215	\N
36	Ford Aspire 1.5 Tdci Titanium Plus	Car	9	18	4	City	/cars/aspire.jpg	8.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Titanium Plus	1498	4	40	1525	3995	1704	5	100	215	\N
37	Ford Aspire 1.2 Ti-Vct Titanium Plus	Car	8	18	4	City	/cars/aspire.jpg	7.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Titanium Plus	1194	4	42	1525	3995	1704	5	96	120	\N
38	Ford Aspire 1.2 Ti-Vct Titanium	Car	8	18	4	City	/cars/aspire.jpg	7.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Titanium	1194	4	42	1525	3995	1704	5	96	120	\N
39	Ford Aspire 1.2 Trend Plus Cng	Car	8	18	4	City	/cars/aspire.jpg	7.58 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Sedan	\N	Ford	1.2 Trend Plus Cng	1194	4	42	1525	3995	1704	5	96	120	\N
40	Ford Aspire 1.2 Ti-Vct Blu	Car	8	18	4	City	/cars/aspire.jpg	7.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Blu	1194	4	42	1525	3995	1704	5	96	120	\N
41	Ford Aspire 1.5 Tdci Blu	Car	9	18	4	City	/cars/aspire.jpg	8.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Ford	1.5 Tdci Blu	1498	4	40	1525	3995	1704	5	100	215	\N
42	Toyota Glanza G Hybrid	Car	8	18	4	City	/cars/glanza.jpg	7.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	G Hybrid	1197	4	37	1540	3995	1745	5	89	113	\N
43	Toyota Glanza V	Car	8	18	4	City	/cars/glanza.jpg	7.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	V	1197	4	37	1540	3995	1745	5	82	113	\N
44	Toyota Glanza G Cvt	Car	9	18	4	City	/cars/glanza.jpg	8.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	CVT	\N	Hatchback	\N	Toyota	G Cvt	1197	4	37	1540	3995	1745	5	82	113	\N
45	Toyota Glanza V Cvt	Car	9	18	4	City	/cars/glanza.jpg	8.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	CVT	\N	Hatchback	\N	Toyota	V Cvt	1197	4	37	1540	3995	1745	5	82	113	\N
46	Toyota Glanza G Mt	Car	7	18	4	City	/cars/glanza.jpg	6.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	G Mt	1197	4	37	1540	3995	1745	5	82	113	\N
47	Jeep Compass Trailhawk 2.0 Trailhawk 4X4 At	Car	27	18	4	Highway	/cars/compass-trailhawk.jpg	26.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	2.0 Trailhawk 4X4 At	1956	4	60	1657	4398	1818	5	173	350	\N
48	Jeep Compass Trailhawk 2.0 Trailhawk (O) 4X4 At	Car	28	18	4	Highway	/cars/compass-trailhawk.jpg	27.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	2.0 Trailhawk (O) 4X4 At	1956	4	60	1657	4398	1818	5	173	350	\N
57	Jeep Grand Cherokee Summit Petrol	Car	76	18	4	Highway	/cars/grand-cherokee.jpg	75.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	Summit Petrol	3604	6	93.5	1802	4828	1943	5	286	347	\N
58	Lamborghini Urus V8	Car	300	18	4	Highway	/cars/urus.jpg	300.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Lamborghini	V8	3996	8	75	1638	5112	2181	5	650	850	\N
60	Mercedes-Benz Rolls-Royce Cullinan Suv	Car	695	18	4	Highway	/cars/rolls-royce-cullinan.jpg	695.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	Suv	6750	12	0	1835	5341	2000	5	563	850	\N
59	Bentley Bentayga V8	Car	376	18	4	Highway	/cars/bentayga.jpg	375.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bentley	V8	3996	12	85	1742	5140	1998	5	550	770	\N
55	Bmw X5 Xdrive30D Xline	Car	83	18	4	Highway	/cars/x5.jpg	82.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive30D Xline	2993	6	0	1745	4922	2218	5	265	620	\N
61	Maruti Suzuki S-Presso Std	Car	4	18	4	City	/cars/s-presso.jpg	3.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Std	998	3	27	1549	3565	1520	5	67	90	\N
62	Maruti Suzuki S-Presso Std (O)	Car	4	18	4	City	/cars/s-presso.jpg	3.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Std (O)	998	3	27	1549	3565	1520	5	67	90	\N
63	Maruti Suzuki S-Presso Lxi	Car	5	18	4	City	/cars/s-presso.jpg	4.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi	998	3	27	1549	3565	1520	5	67	90	\N
64	Maruti Suzuki S-Presso Lxi (O)	Car	5	18	4	City	/cars/s-presso.jpg	4.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi (O)	998	3	27	1549	3565	1520	5	67	90	\N
65	Maruti Suzuki S-Presso Vxi	Car	5	18	4	City	/cars/s-presso.jpg	4.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	998	3	27	1549	3565	1520	5	67	90	\N
66	Maruti Suzuki S-Presso Vxi (O)	Car	5	18	4	City	/cars/s-presso.jpg	4.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi (O)	998	3	27	1549	3565	1520	5	67	90	\N
67	Maruti Suzuki S-Presso Vxi Ags	Car	5	18	4	City	/cars/s-presso.jpg	4.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Vxi Ags	998	3	27	1549	3565	1520	5	67	90	\N
68	Maruti Suzuki S-Presso Vxi+	Car	5	18	4	City	/cars/s-presso.jpg	4.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi+	998	3	27	1549	3565	1520	5	67	90	\N
69	Maruti Suzuki S-Presso Vxi (O) Ags	Car	5	18	4	City	/cars/s-presso.jpg	4.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Vxi (O) Ags	998	3	27	1549	3565	1520	5	67	90	\N
70	Maruti Suzuki S-Presso Vxi+ Ags	Car	5	18	4	City	/cars/s-presso.jpg	4.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Vxi+ Ags	998	3	27	1549	3565	1520	5	67	90	\N
71	Force Gurkha Xtreme	Car	13	18	4	Highway	/cars/gurkha.jpg	12.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xtreme	2149	4	63	2075	3992	1820	5	140	321	\N
72	Force Gurkha Xtreme Abs	Car	14	18	4	Highway	/cars/gurkha.jpg	13.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xtreme Abs	2149	4	63	2075	3992	1820	5	140	321	\N
73	Jeep Compass 1.4 Limited At	Car	20	18	4	Highway	/cars/compass.jpg	19.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	1.4 Limited At	1368	6	60	1640	4395	1818	5	162	250	\N
74	Jeep Compass 1.4 Sport	Car	16	18	4	Highway	/cars/compass.jpg	15.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Jeep	1.4 Sport	1368	6	60	1640	4395	1818	5	162	250	\N
75	Jeep Compass 1.4 Limited (O) At	Car	21	18	4	Highway	/cars/compass.jpg	20.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	1.4 Limited (O) At	1368	6	60	1640	4395	1818	5	162	250	\N
76	Jeep Compass 2.0 Sport	Car	17	18	4	Highway	/cars/compass.jpg	16.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Sport	1956	6	60	1640	4395	1818	5	173	350	\N
77	Jeep Compass 2.0 Longitude	Car	19	18	4	Highway	/cars/compass.jpg	18.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Longitude	1956	6	60	1640	4395	1818	5	173	350	\N
78	Jeep Compass 2.0 Longitude (O)	Car	19	18	4	Highway	/cars/compass.jpg	18.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Longitude (O)	1956	6	60	1640	4395	1818	5	173	350	\N
79	Jeep Compass 2.0 Limited	Car	20	18	4	Highway	/cars/compass.jpg	19.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited	1956	6	60	1640	4395	1818	5	173	350	\N
80	Jeep Compass 2.0 Limited (O)	Car	21	18	4	Highway	/cars/compass.jpg	20.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited (O)	1956	6	60	1640	4395	1818	5	173	350	\N
81	Jeep Compass 2.0 Limited 4X4	Car	22	18	4	Highway	/cars/compass.jpg	21.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited 4X4	1956	6	60	1640	4395	1818	5	173	350	\N
82	Jeep Compass 2.0 Limited (O) 4X4	Car	22	18	4	Highway	/cars/compass.jpg	21.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited (O) 4X4	1956	6	60	1640	4395	1818	5	173	350	\N
83	Jeep Compass 1.4 Limited Plus At Petrol	Car	22	18	4	Highway	/cars/compass.jpg	21.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	1.4 Limited Plus At Petrol	1368	6	60	1640	4395	1818	5	162	250	\N
84	Jeep Compass 2.0 Limited Plus 4X2 Diesel	Car	22	18	4	Highway	/cars/compass.jpg	21.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited Plus 4X2 Diesel	1956	6	60	1640	4395	1818	5	173	350	\N
85	Jeep Compass 2.0 Limited Plus 4X4 Diesel	Car	24	18	4	Highway	/cars/compass.jpg	23.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited Plus 4X4 Diesel	1956	6	60	1640	4395	1818	5	173	350	\N
86	Jeep Compass 2.0 Sport Plus	Car	17	18	4	Highway	/cars/compass.jpg	16.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Sport Plus	1956	6	60	1640	4395	1818	5	173	350	\N
87	Jeep Compass 1.4 Sport Plus	Car	16	18	4	Highway	/cars/compass.jpg	15.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Jeep	1.4 Sport Plus	1368	6	60	1640	4395	1818	5	162	250	\N
88	Jeep Compass 1.4 Longitude (O) At	Car	19	18	4	Highway	/cars/compass.jpg	19.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	1.4 Longitude (O) At	1368	6	60	1640	4395	1818	5	163	250	\N
89	Jeep Compass 1.4 Limited (O) At Petrol Black Pack	Car	21	18	4	Highway	/cars/compass.jpg	20.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	1.4 Limited (O) At Petrol Black Pack	1368	6	60	1640	4395	1818	5	162	250	\N
90	Jeep Compass 2.0 Limited (O) Black Pack	Car	21	18	4	Highway	/cars/compass.jpg	20.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited (O) Black Pack	1956	6	60	1640	4395	1818	5	173	350	\N
91	Jeep Compass 2.0 Limited (O) 4X4 Black Pack	Car	23	18	4	Highway	/cars/compass.jpg	22.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Jeep	2.0 Limited (O) 4X4 Black Pack	1956	6	60	1640	4395	1818	5	173	350	\N
92	Jeep Compass 2.0 Limited Plus 4X4 At	Car	25	18	4	Highway	/cars/compass.jpg	24.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	2.0 Limited Plus 4X4 At	1956	6	60	1640	4395	1818	5	173	350	\N
93	Jeep Compass 2.0 Longitude 4X4 At	Car	22	18	4	Highway	/cars/compass.jpg	21.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	2.0 Longitude 4X4 At	1956	6	60	1640	4395	1818	5	173	350	\N
94	Honda Civic 1.8 V Cvt	Car	18	18	4	City	/cars/civic.jpg	17.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	1.8 V Cvt	1799	4	47	1433	4656	1799	5	141	174	\N
95	Honda Civic 1.8 Vx Cvt	Car	20	18	4	City	/cars/civic.jpg	19.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	1.8 Vx Cvt	1799	4	47	1433	4656	1799	5	141	174	\N
96	Honda Civic 1.8 Zx Cvt	Car	22	18	4	City	/cars/civic.jpg	21.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	1.8 Zx Cvt	1799	4	47	1433	4656	1799	5	141	174	\N
97	Honda Civic 1.6 Vx Mt	Car	21	18	4	City	/cars/civic.jpg	20.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	1.6 Vx Mt	1597	4	47	1433	4656	1799	5	120	300	\N
98	Honda Civic 1.6 Zx Mt	Car	23	18	4	City	/cars/civic.jpg	22.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	1.6 Zx Mt	1597	4	47	1433	4656	1799	5	120	300	\N
99	Mg Zs Ev Excite	Car	21	18	4	Highway	/cars/zs-ev.jpg	20.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Mg	Excite	0	0	0	1644	4314	1809	5	142.76	353	\N
100	Mg Zs Ev Exclusive	Car	24	18	4	Highway	/cars/zs-ev.jpg	23.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Mg	Exclusive	0	0	0	1644	4314	1809	5	142.76	353	\N
101	Mini Cooper 3 Door Cooper S	Car	35	18	4	City	/cars/cooper-3-door.jpg	34.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mini	Cooper S	1998	4	44	1414	3850	1727	5	192	280	\N
102	Land Rover Rover Range Sport 5.0L V8 Svr Petrol	Car	206	18	4	Highway	/cars/range-sport.jpg	205.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	5.0L V8 Svr Petrol	4999	8	0	1803	4882	2220	5	567	700	\N
103	Land Rover Rover Range Sport 5.0L V8 Autobiography Dynamic Petrol	Car	180	18	4	Highway	/cars/range-sport.jpg	179.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	5.0L V8 Autobiography Dynamic Petrol	4999	8	0	1803	4879	2220	5	518	625	\N
104	Maserati Ghibli Diesel	Car	134	18	4	City	/cars/ghibli.jpg	133.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Not Mentioned	\N	Maserati	Diesel	2987	0	70	1461	4971	2100	5	275	570	\N
105	Maserati Ghibli Gransport	Car	139	18	4	City	/cars/ghibli.jpg	138.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Not Mentioned	\N	Maserati	Gransport	2987	0	70	1461	4971	2100	5	275	600	\N
106	Maserati Ghibli Granlusso	Car	143	18	4	City	/cars/ghibli.jpg	142.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Not Mentioned	\N	Maserati	Granlusso	2987	0	70	1461	4971	2100	5	275	600	\N
107	Ford Figo Ambiente 1.2 Ti-Vct	Car	6	18	4	City	/cars/figo.jpg	5.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	Ambiente 1.2 Ti-Vct	1194	4	42	1525	3941	1704	5	96	120	\N
108	Ford Figo Titanium 1.2 Ti-Vct	Car	6	18	4	City	/cars/figo.jpg	6.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	Titanium 1.2 Ti-Vct	1196	4	42	1525	3941	1704	5	96	120	\N
109	Ford Figo Titanium1.5 Tdci	Car	7	18	4	City	/cars/figo.jpg	7.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Ford	Titanium1.5 Tdci	1498	4	40	1525	3941	1704	5	100	215	\N
110	Ford Figo Titanium Blu 1.2 Ti-Vct	Car	7	18	4	City	/cars/figo.jpg	6.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	Titanium Blu 1.2 Ti-Vct	1194	4	42	1525	3941	1704	5	96	120	\N
111	Ford Figo Titanium Blu 1.5 Tdci	Car	8	18	4	City	/cars/figo.jpg	7.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Ford	Titanium Blu 1.5 Tdci	1498	4	40	1525	3941	1704	5	100	215	\N
112	Volkswagen Passat 2.0 Tdi Comfortline	Car	31	18	4	City	/cars/passat.jpg	30.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	2.0 Tdi Comfortline	1968	4	55	1456	4767	1832	5	180	350	\N
113	Volkswagen Passat 2.0 Tdi Highline	Car	34	18	4	City	/cars/passat.jpg	33.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	2.0 Tdi Highline	1968	4	66	1456	4767	1832	5	180	350	\N
114	Volkswagen Passat 2.0 Tdi Comfortline Connect	Car	26	18	4	City	/cars/passat.jpg	25.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	2.0 Tdi Comfortline Connect	1968	4	55	1456	4767	1832	5	180	350	\N
115	Volkswagen Passat 2.0 Tdi Highline Connect	Car	29	18	4	City	/cars/passat.jpg	28.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	2.0 Tdi Highline Connect	1968	4	66	1456	4767	1832	5	180	350	\N
116	Mini Countryman Cooper S	Car	35	18	4	City	/cars/countryman.jpg	34.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mini	Cooper S	1998	4	47	1557	4299	1822	5	192	280	\N
117	Mini Countryman Cooper Sd	Car	38	18	4	City	/cars/countryman.jpg	37.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Mini	Cooper Sd	1998	4	47	1557	4299	1822	5	190	400	\N
118	Mini Countryman Cooper S Jcw Inspired	Car	42	18	4	City	/cars/countryman.jpg	41.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mini	Cooper S Jcw Inspired	1998	4	47	1557	4299	1822	5	192	280	\N
119	Mini Countryman Black Edition	Car	43	18	4	City	/cars/countryman.jpg	42.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mini	Black Edition	1998	4	47	1557	4299	1822	5	192	280	\N
120	Lexus Nx 300H F-Sport	Car	61	18	4	Highway	/cars/nx-300h.jpg	60.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Lexus	F-Sport	2494	6	56	1645	5	1845	5	194	210	\N
121	Lexus Nx 300H Luxury	Car	60	18	4	Highway	/cars/nx-300h.jpg	59.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Lexus	Luxury	2494	6	56	1645	4640	1845	5	194	210	\N
122	Mercedes-Benz Mercedes-Benz Gle 300D 4Matic	Car	74	18	4	Highway	/cars/mercedes-benz-gle.jpg	73.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	300D 4Matic	1950	4	93	1772	4924	2157	5	245	500	\N
124	Mercedes-Benz Mercedes-Benz Cls 300D	Car	85	18	4	City	/cars/mercedes-benz-cls.jpg	84.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	300D	1950	4	0	1435	4988	1890	5	245	500	\N
125	Hyundai Grand I10 Nios Sportz Amt 1.2 Crdi	Car	8	18	4	City	/cars/grand-i10-nios.jpg	7.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Hyundai	Sportz Amt 1.2 Crdi	1186	3	37	1520	3805	1680	5	75	190	\N
126	Hyundai Grand I10 Nios Asta 1.2 Crdi	Car	9	18	4	City	/cars/grand-i10-nios.jpg	8.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Asta 1.2 Crdi	1186	3	37	1520	3805	1680	5	75	190	\N
127	Maruti Suzuki R Wagon Vxi	Car	5	18	4	City	/cars/wagon.jpg	4.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	Vxi	998	3	32	1675	3655	1620	5	68	90	\N
128	Maruti Suzuki R Wagon Vxi Ags	Car	6	18	4	City	/cars/wagon.jpg	5.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki R	Vxi Ags	998	3	32	1675	3655	1620	5	68	90	\N
129	Maruti Suzuki R Wagon 1.2L Zxi	Car	6	18	4	City	/cars/wagon.jpg	5.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	1.2L Zxi	1197	3	32	1620	3655	1675	5	83	1130	\N
130	Maruti Suzuki R Wagon Lxi	Car	5	18	4	City	/cars/wagon.jpg	4.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	Lxi	998	3	32	1675	3655	1620	5	68	90	\N
131	Maruti Suzuki R Wagon 1.2L Vxi	Car	6	18	4	City	/cars/wagon.jpg	5.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	1.2L Vxi	1197	3	32	1675	3655	1620	5	83	113	\N
132	Maruti Suzuki R Wagon 1.2L Vxi Ags	Car	6	18	4	City	/cars/wagon.jpg	5.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki R	1.2L Vxi Ags	1197	3	32	1675	3655	1620	5	83	113	\N
133	Maruti Suzuki R Wagon 1.2L Zxi Ags	Car	6	18	4	City	/cars/wagon.jpg	5.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki R	1.2L Zxi Ags	1197	3	32	1675	3655	1620	5	83	113	\N
134	Maruti Suzuki R Wagon Lxi (O)	Car	5	18	4	City	/cars/wagon.jpg	4.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	Lxi (O)	998	3	32	1675	3655	1620	5	68	90	\N
135	Maruti Suzuki R Wagon Vxi (O)	Car	5	18	4	City	/cars/wagon.jpg	4.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	Vxi (O)	998	3	32	1675	3655	1620	5	68	90	\N
136	Maruti Suzuki R Wagon 1.2L Vxi (O)	Car	6	18	4	City	/cars/wagon.jpg	5.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki R	1.2L Vxi (O)	1197	3	32	1675	3655	1620	5	83	113	\N
137	Maruti Suzuki R Wagon 1.2L Vxi Ags (O)	Car	6	18	4	City	/cars/wagon.jpg	5.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki R	1.2L Vxi Ags (O)	1197	3	32	1675	3655	1620	5	83	113	\N
138	Maruti Suzuki R Wagon Vxi Ags (O)	Car	6	18	4	City	/cars/wagon.jpg	5.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki R	Vxi Ags (O)	998	3	32	1675	3655	1620	5	68	90	\N
139	Maruti Suzuki R Wagon Lxi Cng	Car	5	18	4	City	/cars/wagon.jpg	5.0 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Maruti Suzuki R	Lxi Cng	998	3	32	1675	3655	1620	5	68	90	\N
140	Maruti Suzuki R Wagon Lxi (O) Cng	Car	6	18	4	City	/cars/wagon.jpg	5.08 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Maruti Suzuki R	Lxi (O) Cng	998	3	32	1675	3655	1620	5	68	90	\N
141	Toyota Camry Hybrid	Car	38	18	4	City	/cars/camry.jpg	37.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Sedan	\N	Toyota	Hybrid	2487	4	50	1455	4885	1840	5	178	221	\N
143	Lexus Ls 500H Luxury	Car	183	18	4	Highway	/cars/ls-500h.jpg	182.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Lexus	Luxury	3456	6	82	1450	5235	1900	5	299	350	\N
144	Lexus Ls 500H Ultra Luxury	Car	188	18	4	Highway	/cars/ls-500h.jpg	187.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Lexus	Ultra Luxury	3456	6	82	1450	5235	1900	5	299	350	\N
145	Lexus Ls 500H Distinct	Car	194	18	4	Highway	/cars/ls-500h.jpg	193.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Lexus	Distinct	3456	6	82	1450	5235	1900	5	299	350	\N
146	Mercedes-Benz Mercedes-Benz Glc 200 Progressive	Car	53	18	4	Highway	/cars/mercedes-benz-glc.jpg	52.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	200 Progressive	1991	4	66	1644	4658	1890	5	197	320	\N
147	Mercedes-Benz Mercedes-Benz Glc 220D 4Matic Progressive	Car	58	18	4	Highway	/cars/mercedes-benz-glc.jpg	57.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	220D 4Matic Progressive	1950	4	50	1644	4658	1890	5	194	400	\N
148	Mahindra Alturas G4 2Wd At	Car	28	18	4	City	/cars/alturas-g4.jpg	27.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Not Mentioned	\N	Mahindra	2Wd At	2157	4	70	1845	4850	1960	0	178	420	\N
149	Mahindra Alturas G4 4Wd At	Car	31	18	4	Highway	/cars/alturas-g4.jpg	30.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	4Wd At	2157	4	70	1845	4850	1960	7	178	420	\N
150	Mini Convertible Cooper S	Car	39	18	4	City	/cars/convertible.jpg	38.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Mini	Cooper S	1998	4	44	1415	3850	1727	4	192	280	\N
151	Mini John Cooper Works Hatch	Car	44	18	4	City	/cars/john-cooper-works.jpg	43.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback, Sports	\N	Mini	Hatch	1998	4	44	1414	3874	1727	2	231	320	\N
153	Lexus Lc 500H Coupe	Car	196	18	4	City	/cars/lc-500h.jpg	196.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Coupe	\N	Lexus	Coupe	3456	6	82	1345	4770	1920	4	299	350	\N
160	Maruti Suzuki Xl6 Alpha Mt	Car	11	18	4	City	/cars/xl6.jpg	10.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	Alpha Mt	1462	4	45	1700	4445	1775	6	104	138	\N
161	Maruti Suzuki Xl6 Zeta At	Car	11	18	4	City	/cars/xl6.jpg	10.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MPV	\N	Maruti Suzuki	Zeta At	1462	4	45	1700	4445	1775	6	104	138	\N
162	Maruti Suzuki Xl6 Alpha At	Car	12	18	4	City	/cars/xl6.jpg	11.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MPV	\N	Maruti Suzuki	Alpha At	1462	4	45	1700	4445	1775	6	104	138	\N
163	Mahindra Marazzo M2 7 Str	Car	10	18	4	City	/cars/marazzo.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M2 7 Str	1497	4	45	1774	4585	1866	7	121	300	\N
164	Mahindra Marazzo M4 7 Str	Car	12	18	4	City	/cars/marazzo.jpg	11.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M4 7 Str	1497	4	45	1774	4585	1866	7	121	300	\N
165	Mahindra Marazzo M6 7 Str	Car	14	18	4	City	/cars/marazzo.jpg	13.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M6 7 Str	1497	4	45	1774	4585	1866	7	121	300	\N
166	Mahindra Marazzo M8 7 Str	Car	15	18	4	City	/cars/marazzo.jpg	14.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M8 7 Str	1497	4	45	1774	4585	1866	7	121	300	\N
167	Mahindra Marazzo M2 8 Str	Car	10	18	4	City	/cars/marazzo.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M2 8 Str	1497	4	45	1774	4585	1866	8	121	300	\N
168	Mahindra Marazzo M4 8 Str	Car	12	18	4	City	/cars/marazzo.jpg	11.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M4 8 Str	1497	4	45	1774	4585	1866	8	121	300	\N
169	Mahindra Marazzo M6 8 Str	Car	14	18	4	City	/cars/marazzo.jpg	13.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M6 8 Str	1497	4	45	1774	4585	1866	8	121	300	\N
170	Mahindra Marazzo M8 8 Str	Car	15	18	4	City	/cars/marazzo.jpg	14.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Mahindra	M8 8 Str	1497	4	45	1774	4585	1866	8	121	300	\N
171	Kia Carnival Premium 7 Str	Car	25	18	4	City	/cars/carnival.jpg	24.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Kia	Premium 7 Str	2199	4	0	1755	5115	1985	7	200	440	\N
172	Kia Carnival Premium 8 Str	Car	26	18	4	City	/cars/carnival.jpg	25.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Kia	Premium 8 Str	2199	4	0	1755	5115	1985	7	200	440	\N
173	Kia Carnival Prestige 7 Str	Car	29	18	4	City	/cars/carnival.jpg	28.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Kia	Prestige 7 Str	2199	4	0	1755	5115	1985	7	200	440	\N
174	Kia Carnival Prestige 9 (6+3) Str	Car	30	18	4	City	/cars/carnival.jpg	29.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Kia	Prestige 9 (6+3) Str	2199	4	0	1755	5115	1985	7	200	440	\N
175	Kia Carnival Limousine 7 Str	Car	34	18	4	City	/cars/carnival.jpg	33.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Kia	Limousine 7 Str	2199	4	0	1755	5115	1985	7	200	440	\N
176	Mini Cooper 3 Door Cooper D	Car	30	18	4	City	/cars/cooper-3-door.jpg	29.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Mini	Cooper D	1496	3	44	1414	3821	1727	4	116	270	\N
177	Mercedes-Benz Mercedes-Benz C-Class Cabriolet C300	Car	65	18	4	City	/cars/mercedes-benz-c-class-cabriolet.jpg	64.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Mercedes-Benz	C300	1991	4	60	1409	4686	1810	4	258	370	\N
180	Mercedes-Benz Mercedes-Benz V-Class Expression Elwb	Car	69	18	4	City	/cars/mercedes-benz-v-class.jpg	68.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Mercedes-Benz	Expression Elwb	2143	4	93	1880	5370	1928	7	163	380	\N
181	Mercedes-Benz Mercedes-Benz V-Class Exclusive Lwb	Car	82	18	4	City	/cars/mercedes-benz-v-class.jpg	81.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MUV	\N	Mercedes-Benz	Exclusive Lwb	2143	4	93	1880	5140	1928	6	163	380	\N
182	Mercedes-Benz Mercedes-Benz V-Class Elite	Car	110	18	4	City	/cars/mercedes-benz-v-class.jpg	110.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MPV	\N	Mercedes-Benz	Elite	1950	4	70	1901	5140	1928	6	163	380	\N
183	Mercedes-Benz Mercedes-Benz Amg Gt 4-Door Coupe 63 S 4Matic+	Car	242	18	4	City	/cars/mercedes-benz-amg-gt-4-door-coupe.jpg	242.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	63 S 4Matic+	0	8	65	1447	5054	1953	4	639	700	\N
184	Ferrari Gtc4 Lusso V8 T	Car	420	18	4	City	/cars/gtc4-lusso.jpg	420.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	V8 T	3900	8	91	1383	4922	1980	4	610	760	\N
158	Bajaj Qute (Re60) Qcar Cng	Car	3	18	4	City	/cars/qute-(re60).jpg	2.83 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Bajaj	Qcar Cng	216	0	0	1652	2752	1312	4	12	16.1	\N
156	Bugatti Chiron Sport	Car	2122	18	4	City	/cars/chiron.jpg	2121.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sports	\N	Bugatti	Sport	7993	16	0	1212	4544	2038	2	1600	1479	\N
155	Bugatti Chiron W16	Car	1922	18	4	City	/cars/chiron.jpg	1921.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sports	\N	Bugatti	W16	7993	16	0	1212	4544	2038	2	1479	1600	\N
186	Maruti Suzuki Ertiga Zxi	Car	10	18	4	City	/cars/ertiga.jpg	9.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	Zxi	1462	4	45	1685	4265	1695	7	104	138	\N
187	Maruti Suzuki Ertiga Vxi At	Car	10	18	4	City	/cars/ertiga.jpg	9.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MUV	\N	Maruti Suzuki	Vxi At	1462	4	45	1690	4395	1735	7	103	130	\N
188	Maruti Suzuki Ertiga Zxi Plus	Car	10	18	4	City	/cars/ertiga.jpg	9.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Maruti Suzuki	Zxi Plus	1462	4	45	1690	4395	1735	7	103	130	\N
189	Maruti Suzuki Ertiga Vxi	Car	9	18	4	City	/cars/ertiga.jpg	8.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Maruti Suzuki	Vxi	1462	4	45	1685	4265	1695	7	103	180	\N
190	Maruti Suzuki Ertiga Zxi At	Car	11	18	4	City	/cars/ertiga.jpg	10.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MPV	\N	Maruti Suzuki	Zxi At	1462	4	45	1685	4265	1695	7	104	138	\N
191	Maruti Suzuki Ertiga 1.5L Vdi	Car	10	18	4	City	/cars/ertiga.jpg	9.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Maruti Suzuki	1.5L Vdi	1498	4	45	1690	4395	1735	7	95	225	\N
192	Maruti Suzuki Ertiga 1.5L Zdi	Car	11	18	4	City	/cars/ertiga.jpg	10.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Maruti Suzuki	1.5L Zdi	1498	4	45	1690	4395	1735	7	95	225	\N
193	Maruti Suzuki Ertiga 1.5L Zdi Plus	Car	12	18	4	City	/cars/ertiga.jpg	11.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MPV	\N	Maruti Suzuki	1.5L Zdi Plus	1498	4	45	1690	4395	1735	7	95	225	\N
194	Maruti Suzuki Ertiga Vxi Cng (Cng +	Car	9	18	4	City	/cars/ertiga.jpg	8.88 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	MUV	\N	Maruti Suzuki	Vxi Cng (Cng +	1462	4	45	1685	4265	1695	7	103	180	\N
198	Ferrari 812 Superfast Superfast	Car	520	18	4	City	/cars/812-superfast.jpg	520.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	Superfast	6496	12	92	1276	4657	1971	2	789	718	\N
199	Jaguar F-Type Svr Coupe	Car	266	18	4	City	/cars/f-type.jpg	265.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Jaguar	Svr Coupe	5000	8	70	1311	4475	2042	2	567	700	\N
200	Jaguar F-Type Svr Convertible	Car	281	18	4	City	/cars/f-type.jpg	280.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Jaguar	Svr Convertible	5000	8	70	1311	4475	2042	2	567	700	\N
201	Jaguar F-Type 2.0L Coupe	Car	91	18	4	City	/cars/f-type.jpg	90.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Jaguar	2.0L Coupe	1997	6	63	1311	4482	1923	2	297	400	\N
203	Land Rover Discovery 3.0 Hse Diesel	Car	103	18	4	Highway	/cars/discovery.jpg	102.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	3.0 Hse Diesel	2993	6	85	1846	4988	2200	7	258	600	\N
204	Land Rover Discovery 3.0 Se Diesel	Car	97	18	4	Highway	/cars/discovery.jpg	96.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	3.0 Se Diesel	2993	6	85	1846	4988	2200	7	258	600	\N
205	Land Rover Discovery 3.0 Hse Petrol	Car	85	18	4	Highway	/cars/discovery.jpg	84.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover	3.0 Hse Petrol	2995	6	89	1846	4988	2200	7	394	450	\N
206	Land Rover Discovery 3.0 Se Petrol	Car	81	18	4	Highway	/cars/discovery.jpg	80.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover	3.0 Se Petrol	2995	6	89	1846	4988	2200	7	394	450	\N
207	Land Rover Discovery 3.0 S Diesel	Car	89	18	4	Highway	/cars/discovery.jpg	88.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	3.0 S Diesel	2993	6	85	1846	4988	2200	7	258	600	\N
208	Land Rover Discovery 3.0 S Petrol	Car	77	18	4	Highway	/cars/discovery.jpg	76.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover	3.0 S Petrol	2995	6	89	1846	4988	2200	7	394	450	\N
209	Land Rover Discovery 3.0 Hse Luxury Diesel	Car	109	18	4	Highway	/cars/discovery.jpg	108.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	3.0 Hse Luxury Diesel	2993	6	85	1846	4988	2200	7	258	600	\N
210	Land Rover Discovery 3.0 Hse Luxury Petrol	Car	90	18	4	Highway	/cars/discovery.jpg	89.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover	3.0 Hse Luxury Petrol	2995	6	89	1846	4988	2200	7	394	450	\N
211	Porsche Cayenne Coupe Base	Car	132	18	4	City	/cars/cayenne-coupe.jpg	131.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Not Mentioned	\N	Porsche	Base	2995	6	75	1676	4931	2194	0	340	450	\N
212	Porsche Cayenne Coupe Turbo	Car	198	18	4	City	/cars/cayenne-coupe.jpg	197.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Not Mentioned	\N	Porsche	Turbo	2995	8	90	1676	4931	2194	0	550	770	\N
213	Fiat Urban Cross 1.3 Multijet Dynamic	Car	8	18	4	City	/cars/urban-cross.jpg	7.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	1.3 Multijet Dynamic	1248	4	45	1542	3989	1706	5	93	209	\N
214	Mini Cooper 5 Door Cooper D	Car	36	18	4	City	/cars/cooper-5-door.jpg	36.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mini	Cooper D	1496	3	44	1425	3982	1727	5	116	270	\N
215	Jeep Grand Cherokee Summit	Car	90	18	4	Highway	/cars/grand-cherokee.jpg	89.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	Summit	2987	6	93.5	1802	4828	1943	5	240	570	\N
202	Bmw M5 Competition	Car	155	18	4	City	/cars/m5.jpg	154.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bmw	Competition	4395	8	68	1473	4956	1903	4	625	750	\N
197	Bmw X7 Xdrive30D Dpe Signature	Car	103	18	4	Highway	/cars/x7.jpg	102.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive30D Dpe Signature	2993	6	80	1805	5151	2000	7	262	620	\N
216	Lexus Rx 450H 450Hl Luxury	Car	99	18	4	Highway	/cars/rx-450h.jpg	99.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Lexus	450Hl Luxury	3456	6	65	1700	5000	1895	5	262	335	\N
217	Lexus Lx 450D V8	Car	233	18	4	Highway	/cars/lx-450d.jpg	232.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Lexus	V8	4461	0	93	1865	5080	1980	7	261	650	\N
218	Mahindra Tuv300 Plus P4	Car	10	18	4	Highway	/cars/tuv300-plus.jpg	9.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	P4	2179	3	60	1812	4400	1835	9	120	280	\N
219	Mahindra Tuv300 Plus P6	Car	11	18	4	Highway	/cars/tuv300-plus.jpg	10.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	P6	2179	3	60	1812	4400	1835	9	120	280	\N
220	Mahindra Tuv300 Plus P8	Car	12	18	4	Highway	/cars/tuv300-plus.jpg	11.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	P8	2179	3	60	1812	4400	1835	9	120	280	\N
221	Mahindra E Verito D4	Car	13	18	4	City	/cars/e-verito.jpg	12.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Mahindra	D4	72	0	0	1540	4247	1740	5	41	91	\N
222	Mahindra E Verito D2	Car	13	18	4	City	/cars/e-verito.jpg	12.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Mahindra	D2	72	0	0	1540	4247	1740	5	41	91	\N
223	Mahindra E Verito D6	Car	14	18	4	City	/cars/e-verito.jpg	13.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Mahindra	D6	72	0	0	1540	4247	1740	5	41	91	\N
224	Land Rover Rover Range Evoque Convertible 2.0 Hse Dynamic	Car	70	18	4	City	/cars/range-evoque-convertible.jpg	69.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Land Rover Rover	2.0 Hse Dynamic	1998	4	0	1609	4370	1900	4	240	340	\N
225	Land Rover Rover Range Velar 2.0 Petrol R-Dynamic S	Car	73	18	4	Highway	/cars/range-velar.jpg	72.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	2.0 Petrol R-Dynamic S	1997	4	65	1665	4797	2145	5	250	365	\N
226	Mercedes-Benz Mercedes-Benz Amg-Gt S	Car	216	18	4	City	/cars/mercedes-benz-amg-gt.jpg	215.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	S	3982	8	75	1288	4546	1939	2	510	650	\N
227	Mercedes-Benz Mercedes-Benz Amg-Gt R	Car	233	18	4	City	/cars/mercedes-benz-amg-gt.jpg	232.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	R	3982	8	75	1284	4551	2007	2	585	700	\N
228	Mercedes-Benz Mercedes-Benz Amg-Gt Roadster	Car	228	18	4	City	/cars/mercedes-benz-amg-gt.jpg	227.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	Roadster	3982	8	75	1259	4544	1939	2	476	630	\N
229	Lamborghini Huracan Evo Spyder	Car	410	18	4	City	/cars/huracan.jpg	410.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Lamborghini	Evo Spyder	5204	10	0	1165	4459	1924	2	631	600	\N
230	Lamborghini Huracan Evo Rwd	Car	322	18	4	City	/cars/huracan.jpg	322.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Evo Rwd	5204	10	90	1165	4520	1933	2	610	560	\N
231	Ford Figo Ambiente 1.5 Tdci	Car	7	18	4	City	/cars/figo.jpg	6.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Ford	Ambiente 1.5 Tdci	1498	4	40	1525	3941	1704	5	100	215	\N
232	Nissan Sunny Xe Petrol	Car	8	18	4	City	/cars/sunny.jpg	7.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Nissan	Xe Petrol	1498	4	41	1515	4455	1695	5	99	134	\N
233	Nissan Sunny Xl Petrol	Car	9	18	4	City	/cars/sunny.jpg	8.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Nissan	Xl Petrol	1498	4	41	1515	4455	1695	5	99	134	\N
234	Nissan Sunny Xl Diesel	Car	10	18	4	City	/cars/sunny.jpg	9.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Nissan	Xl Diesel	1461	4	41	1515	4455	1695	5	86	200	\N
235	Nissan Sunny Xv Diesel	Car	10	18	4	City	/cars/sunny.jpg	9.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Nissan	Xv Diesel	1461	4	41	1515	4455	1695	5	86	200	\N
236	Nissan Sunny Xe Diesel	Car	9	18	4	City	/cars/sunny.jpg	8.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Nissan	Xe Diesel	1461	4	41	1515	4455	1695	5	86	200	\N
237	Nissan Sunny Xv Cvt	Car	10	18	4	City	/cars/sunny.jpg	9.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Nissan	Xv Cvt	1498	4	41	1515	4455	1695	5	101	134	\N
238	Nissan Sunny Special Edition Diesel	Car	9	18	4	City	/cars/sunny.jpg	8.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Nissan	Special Edition Diesel	1461	4	41	1515	4455	1695	5	86	200	\N
239	Lexus Es 300H	Car	57	18	4	City	/cars/es.jpg	56.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Sedan	\N	Lexus	300H	2487	4	0	1445	4975	1865	5	176	221	\N
240	Hyundai Grand I10 Nios Magna 1.2 Crdi	Car	7	18	4	City	/cars/grand-i10-nios.jpg	6.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Magna 1.2 Crdi	1186	3	37	1520	3805	1680	5	75	190	\N
241	Jaguar F-Type 5.0 Convertible R	Car	237	18	4	City	/cars/f-type.jpg	236.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Jaguar	5.0 Convertible R	5000	0	0	1308	4470	1923	0	495	625	\N
242	Lexus Lx 570 V8	Car	233	18	4	Highway	/cars/lx-570.jpg	232.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Lexus	V8	5700	0	93	1865	5080	1980	7	380	546	\N
243	Tata Nano Genx Xt	Car	3	18	4	City	/cars/nano-genx.jpg	2.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xt	624	2	24	1652	3164	1750	4	38	51	\N
244	Tata Nano Genx Xe	Car	3	18	4	City	/cars/nano-genx.jpg	2.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xe	624	2	24	1652	3164	1750	4	38	51	\N
245	Tata Nano Genx Xta	Car	4	18	4	City	/cars/nano-genx.jpg	3.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Tata	Xta	624	2	24	1652	3164	1750	4	38	51	\N
246	Tata Nano Genx Xm	Car	3	18	4	City	/cars/nano-genx.jpg	2.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xm	624	2	24	1652	3164	1750	4	38	51	\N
247	Tata Nano Genx Xma	Car	4	18	4	City	/cars/nano-genx.jpg	3.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Tata	Xma	624	2	24	1652	3164	1750	4	38	51	\N
249	Renault Kwid Std 0.8	Car	3	18	4	City	/cars/kwid.jpg	2.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Std 0.8	799	3	28	1490	3731	1579	5	54	72	\N
250	Renault Kwid Rxl 0.8	Car	4	18	4	City	/cars/kwid.jpg	3.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Rxl 0.8	799	3	28	1490	3731	1579	5	54	72	\N
251	Renault Kwid Rxt 0.8	Car	5	18	4	City	/cars/kwid.jpg	4.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Rxt 0.8	799	3	28	1490	3731	1580	5	54	72	\N
252	Renault Kwid Rxt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Rxt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
253	Renault Kwid Climber 1.0 Mt	Car	5	18	4	City	/cars/kwid.jpg	4.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Climber 1.0 Mt	999	3	28	1490	3731	1579	5	68	91	\N
254	Renault Kwid Rxt Amt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Renault	Rxt Amt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
255	Renault Kwid Climber Amt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.84 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Renault	Climber Amt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
256	Renault Kwid Rxt (O) 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Rxt (O) 1.0	999	3	28	1490	3731	1579	5	68	91	\N
257	Renault Kwid Rxt (O) Amt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Renault	Rxt (O) Amt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
258	Renault Kwid Climber (O) Mt 1.0	Car	5	18	4	City	/cars/kwid.jpg	4.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Climber (O) Mt 1.0	999	3	28	1490	3731	1579	5	68	91	\N
260	Datsun Go T (O)	Car	6	18	4	City	/cars/go.jpg	5.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T (O)	1198	3	35	1507	3788	1636	5	68	104	\N
261	Datsun Go A (O)	Car	5	18	4	City	/cars/go.jpg	5.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	A (O)	1198	3	35	1507	3788	1636	5	68	104	\N
262	Datsun Go A	Car	5	18	4	City	/cars/go.jpg	4.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	A	1198	3	35	1507	3788	1636	5	68	104	\N
263	Datsun Go T (O) Vdc	Car	6	18	4	City	/cars/go.jpg	5.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T (O) Vdc	1198	3	35	1507	3788	1636	5	68	104	\N
264	Datsun Go T (O) Cvt	Car	7	18	4	City	/cars/go.jpg	6.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T (O) Cvt	1198	3	35	1507	3788	1636	5	78	104	\N
265	Maruti Suzuki Celerio Tour H2	Car	5	18	4	City	/cars/celerio-tour.jpg	4.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	H2	998	3	35	1560	3600	1600	5	68	90	\N
266	Nissan Micra Active Xv	Car	6	18	4	City	/cars/micra-active.jpg	6.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Nissan	Xv	1198	3	41	1530	3801	1665	5	68	104	\N
267	Jeep Grand Cherokee Limited	Car	79	18	4	Highway	/cars/grand-cherokee.jpg	78.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jeep	Limited	2987	6	93.5	1802	4828	1943	5	240	570	\N
268	Jeep Grand Cherokee Srt	Car	114	18	4	Highway	/cars/grand-cherokee.jpg	114.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	Srt	6417	8	93.5	1749	4846	1954	5	468	624	\N
270	Maruti Suzuki Celerio Lxi	Car	5	18	4	City	/cars/celerio.jpg	4.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi	998	3	35	1560	3600	1600	5	68	90	\N
271	Maruti Suzuki Celerio Lxi Mt (O)	Car	5	18	4	City	/cars/celerio.jpg	4.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi Mt (O)	998	3	35	1560	3600	1600	5	68	90	\N
272	Mahindra E2O Plus P4	Car	9	18	4	City	/cars/e2o-plus.jpg	8.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Hatchback	\N	Mahindra	P4	0	0	0	1585	3390	1575	4	25.8	70	\N
273	Mahindra E2O Plus P6	Car	10	18	4	City	/cars/e2o-plus.jpg	9.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Hatchback	\N	Mahindra	P6	0	0	0	1585	3390	1575	4	25.8	70	\N
274	Volvo V40 Kinetic	Car	28	18	4	City	/cars/v40.jpg	27.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Volvo	Kinetic	1984	5	60	1420	4369	2041	5	150	350	\N
275	Volvo V40 R Design	Car	32	18	4	City	/cars/v40.jpg	31.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Volvo	R Design	1984	5	60	1420	4369	2041	5	150	350	\N
276	Mercedes-Benz Mercedes-Benz E-Class E350 D	Car	73	18	4	City	/cars/mercedes-benz-e-class.jpg	72.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	E350 D	2987	6	80	1494	5063	1860	5	268.7	620	\N
277	Lamborghini Huracan Lp 610-4	Car	372	18	4	City	/cars/huracan.jpg	371.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Lp 610-4	5204	10	90	1165	4459	1924	2	610	560	\N
278	Lamborghini Huracan Lp 580-2	Car	325	18	4	City	/cars/huracan.jpg	324.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Lp 580-2	5204	10	90	1165	4459	1924	2	580	540	\N
279	Lamborghini Huracan Avio	Car	352	18	4	City	/cars/huracan.jpg	351.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Avio	5204	10	90	1165	4459	1924	2	610	560	\N
280	Lamborghini Huracan Performante	Car	377	18	4	City	/cars/huracan.jpg	376.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Performante	5204	10	90	1165	4459	1924	2	639	600	\N
282	Lamborghini Huracan Lp 610-4 Spyder	Car	408	18	4	City	/cars/huracan.jpg	407.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Lp 610-4 Spyder	5204	10	90	1165	4459	1924	2	602	560	\N
283	Lamborghini Huracan Evo	Car	373	18	4	City	/cars/huracan.jpg	373.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Evo	5204	10	90	1165	4459	1924	2	631	600	\N
284	Honda Wr-V Vx Diesel	Car	11	18	4	Highway	/cars/wr-v.jpg	10.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	Vx Diesel	1498	0	40	1601	3999	1734	5	100	200	\N
285	Honda Wr-V Exclusive Edition Diesel	Car	11	18	4	Highway	/cars/wr-v.jpg	10.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	Exclusive Edition Diesel	1498	0	40	1601	3999	1734	5	100	200	\N
286	Honda Wr-V V Diesel	Car	10	18	4	Highway	/cars/wr-v.jpg	9.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	V Diesel	1498	0	40	1601	3999	1734	5	100	200	\N
287	Nissan Gtr 3.8 V6	Car	213	18	4	City	/cars/gtr.jpg	212.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Nissan	3.8 V6	3799	6	74	1370	4710	1895	4	570	637	\N
290	Renault Lodgy 85 Ps Std	Car	9	18	4	City	/cars/lodgy.jpg	8.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	85 Ps Std	1461	4	50	1697	4498	1751	8	85	200	\N
291	Renault Lodgy 85 Ps Rxe 8 Seater	Car	10	18	4	City	/cars/lodgy.jpg	9.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	85 Ps Rxe 8 Seater	1461	4	50	1697	4498	1751	8	85	200	\N
292	Renault Lodgy Stepway Rxz 110Ps 8-Seater	Car	13	18	4	City	/cars/lodgy.jpg	12.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	Stepway Rxz 110Ps 8-Seater	1461	4	50	1697	4498	1751	0	110	245	\N
293	Renault Lodgy Stepway Rxz 110Ps 7-Seater	Car	13	18	4	City	/cars/lodgy.jpg	12.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	Stepway Rxz 110Ps 7-Seater	1461	4	50	1697	4498	1751	7	110	245	\N
294	Renault Lodgy Stepway Rxl 85Ps 8-Seater	Car	11	18	4	City	/cars/lodgy.jpg	10.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	Stepway Rxl 85Ps 8-Seater	1461	4	50	1697	4498	1751	8	85	200	\N
295	Renault Lodgy Stepway Rxz 85Ps 8-Seater	Car	12	18	4	City	/cars/lodgy.jpg	11.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	Stepway Rxz 85Ps 8-Seater	1461	4	50	1697	4498	1751	8	85	200	\N
296	Renault Lodgy 85 Ps Rxe 7 Seater	Car	10	18	4	City	/cars/lodgy.jpg	9.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Renault	85 Ps Rxe 7 Seater	1461	4	50	1697	4498	1751	7	85	200	\N
297	Mahindra Xuv500 W7 At	Car	16	18	4	Highway	/cars/xuv500.jpg	15.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W7 At	2179	4	70	1785	4585	1890	7	155	330	\N
298	Mahindra Xuv500 W9	Car	16	18	4	Highway	/cars/xuv500.jpg	15.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W9	2179	4	70	1785	4585	1890	7	155	330	\N
299	Mahindra Xuv500 W9 At	Car	18	18	4	Highway	/cars/xuv500.jpg	17.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W9 At	2179	4	70	1785	4585	1890	7	155	330	\N
300	Mahindra Xuv500 W11	Car	18	18	4	Highway	/cars/xuv500.jpg	17.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W11	2179	4	70	1785	4585	1890	7	155	330	\N
301	Mahindra Xuv500 W11 At	Car	19	18	4	Highway	/cars/xuv500.jpg	18.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W11 At	2179	4	70	1785	4585	1890	7	155	330	\N
302	Mahindra Xuv500 W11 (O)	Car	18	18	4	Highway	/cars/xuv500.jpg	17.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W11 (O)	2179	4	70	1785	4585	1890	7	155	330	\N
303	Mahindra Xuv500 W11 (O) At	Car	19	18	4	Highway	/cars/xuv500.jpg	18.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W11 (O) At	2179	4	70	1785	4585	1890	7	155	330	\N
304	Mahindra Xuv500 W7 At	Car	16	18	4	Highway	/cars/xuv500.jpg	15.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W7 At	2179	4	70	1785	4585	1890	7	155	330	\N
305	Mahindra Xuv500 W9	Car	16	18	4	Highway	/cars/xuv500.jpg	15.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W9	2179	4	70	1785	4585	1890	7	155	330	\N
306	Mahindra Xuv500 W9 At	Car	18	18	4	Highway	/cars/xuv500.jpg	17.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W9 At	2179	4	70	1785	4585	1890	7	155	330	\N
307	Mahindra Xuv500 W11	Car	18	18	4	Highway	/cars/xuv500.jpg	17.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W11	2179	4	70	1785	4585	1890	7	155	330	\N
308	Mahindra Xuv500 W11 At	Car	19	18	4	Highway	/cars/xuv500.jpg	18.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W11 At	2179	4	70	1785	4585	1890	7	155	330	\N
309	Mahindra Xuv500 W11 (O)	Car	18	18	4	Highway	/cars/xuv500.jpg	17.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W11 (O)	2179	4	70	1785	4585	1890	7	155	330	\N
310	Mahindra Xuv500 W11 (O) At	Car	19	18	4	Highway	/cars/xuv500.jpg	18.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W11 (O) At	2179	4	70	1785	4585	1890	7	155	330	\N
311	Mahindra Xuv500 W11 (O) Awd	Car	19	18	4	Highway	/cars/xuv500.jpg	18.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W11 (O) Awd	2179	4	70	1785	4585	1890	7	155	330	\N
312	Mahindra Xuv500 W11 (O) Awd At	Car	20	18	4	Highway	/cars/xuv500.jpg	19.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	W11 (O) Awd At	2179	4	70	1785	4585	1890	7	155	330	\N
288	Bmw 5-Series 530I M Sport	Car	60	18	4	City	/cars/5-series.jpg	59.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bmw	530I M Sport	1998	6	70	1464	4907	1860	5	252	350	\N
313	Mahindra Xuv500 W3	Car	13	18	4	Highway	/cars/xuv500.jpg	12.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W3	2179	4	70	1785	4585	1890	7	155	360	\N
314	Toyota Innova Crysta 2.4 Gx 7 Str	Car	17	18	4	City	/cars/innova-crysta.jpg	16.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 Gx 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
315	Toyota Innova Crysta 2.4 Vx 7 Str	Car	20	18	4	City	/cars/innova-crysta.jpg	19.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 Vx 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
316	Toyota Innova Crysta 2.4 Gx 8 Str	Car	17	18	4	City	/cars/innova-crysta.jpg	16.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 Gx 8 Str	2393	4	55	1795	4735	1830	8	150	343	\N
317	Toyota Innova Crysta 2.4 Vx 8 Str	Car	20	18	4	City	/cars/innova-crysta.jpg	19.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 Vx 8 Str	2393	4	55	1795	4735	1830	8	150	343	\N
318	Toyota Innova Crysta 2.4 Zx 7 Str	Car	22	18	4	City	/cars/innova-crysta.jpg	21.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 Zx 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
319	Toyota Innova Crysta 2.7 Gx At 8 Str	Car	17	18	4	City	/cars/innova-crysta.jpg	16.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MUV	\N	Toyota	2.7 Gx At 8 Str	2694	4	55	1795	4735	1830	8	166	245	\N
320	Toyota Innova Crysta 2.7 Gx At 7 Str	Car	17	18	4	City	/cars/innova-crysta.jpg	16.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MUV	\N	Toyota	2.7 Gx At 7 Str	2694	4	55	1795	4735	1830	7	166	245	\N
321	Toyota Innova Crysta 2.7 Zx At 7 Str	Car	22	18	4	City	/cars/innova-crysta.jpg	21.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MUV	\N	Toyota	2.7 Zx At 7 Str	2393	4	55	1795	4735	1830	7	164	245	\N
322	Toyota Innova Crysta 2.7 Vx 7 Str	Car	19	18	4	City	/cars/innova-crysta.jpg	18.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Toyota	2.7 Vx 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
323	Toyota Innova Crysta 2.7 Gx Mt 7 Str	Car	15	18	4	City	/cars/innova-crysta.jpg	14.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Toyota	2.7 Gx Mt 7 Str	2755	4	55	1795	4735	1830	7	174	360	\N
324	Toyota Innova Crysta 2.7 Gx Mt 8 Str	Car	15	18	4	City	/cars/innova-crysta.jpg	14.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Toyota	2.7 Gx Mt 8 Str	2755	4	55	1795	4735	1830	8	174	360	\N
325	Toyota Innova Crysta Touring Sport 2.4 Vx 7 Str	Car	21	18	4	City	/cars/innova-crysta.jpg	20.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	Touring Sport 2.4 Vx 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
326	Toyota Innova Crysta Touring Sport 2.7 Vx 7 Str	Car	19	18	4	City	/cars/innova-crysta.jpg	18.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Toyota	Touring Sport 2.7 Vx 7 Str	2393	4	55	1795	4735	1830	7	166	245	\N
327	Toyota Innova Crysta Touring Sport 2.7 Zx At 7 Str	Car	22	18	4	City	/cars/innova-crysta.jpg	21.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MUV	\N	Toyota	Touring Sport 2.7 Zx At 7 Str	2694	4	55	1795	4735	1830	7	166	245	\N
328	Toyota Innova Crysta 2.4 G Plus 7 Str	Car	16	18	4	City	/cars/innova-crysta.jpg	15.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 G Plus 7 Str	2393	4	55	1795	4735	1830	7	150	343	\N
329	Toyota Innova Crysta 2.4 G Plus 8 Str	Car	16	18	4	City	/cars/innova-crysta.jpg	15.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Toyota	2.4 G Plus 8 Str	2393	4	55	1795	4735	1830	8	150	343	\N
330	Volvo Xc90 D5 Inscription	Car	88	18	4	Highway	/cars/xc90.jpg	87.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D5 Inscription	1969	4	68	1776	4950	2140	7	225	470	\N
331	Volvo Xc90 D5 Momentum	Car	81	18	4	Highway	/cars/xc90.jpg	80.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D5 Momentum	1969	4	68	1776	4950	2140	7	225	470	\N
332	Volvo Xc90 T8 Excellence	Car	132	18	4	Highway	/cars/xc90.jpg	131.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Volvo	T8 Excellence	1969	4	68	1776	4950	2140	4	407	640	\N
333	Volvo Xc90 D5 R-Design	Car	85	18	4	Highway	/cars/xc90.jpg	84.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D5 R-Design	1969	4	68	1776	4950	2140	7	235	480	\N
334	Tata Safari Storme 2.2 Vx 4X4 Varicor 400	Car	17	18	4	Highway	/cars/safari-storme.jpg	16.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	2.2 Vx 4X4 Varicor 400	2179	4	63	1922	4655	1965	7	156	400	\N
335	Maruti Suzuki Ignis Alpha 1.2 Amt	Car	8	18	4	City	/cars/ignis.jpg	7.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Alpha 1.2 Amt	1197	4	32	1595	3700	1690	5	83	113	\N
336	Maruti Suzuki Ignis Alpha 1.2 Mt	Car	7	18	4	City	/cars/ignis.jpg	6.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Alpha 1.2 Mt	1197	4	32	1595	3700	1690	5	83	113	\N
337	Maruti Suzuki Ignis Sigma 1.2 Mt	Car	5	18	4	City	/cars/ignis.jpg	4.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Sigma 1.2 Mt	1197	4	32	1595	3700	1690	5	83	113	\N
338	Maruti Suzuki Ignis Zeta 1.2 Amt	Car	7	18	4	City	/cars/ignis.jpg	6.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Zeta 1.2 Amt	1197	4	32	1595	3700	1690	5	83	113	\N
339	Maruti Suzuki Ignis Zeta 1.2 Mt	Car	6	18	4	City	/cars/ignis.jpg	5.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zeta 1.2 Mt	1197	4	32	1595	3700	1690	5	83	113	\N
340	Tata Bolt Xt Diesel	Car	8	18	4	City	/cars/bolt.jpg	7.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xt Diesel	1248	4	44	1562	3825	1695	5	75	190	\N
341	Tata Bolt Xe Diesel	Car	7	18	4	City	/cars/bolt.jpg	6.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xe Diesel	1248	4	44	1562	3825	1695	5	75	190	\N
342	Tata Bolt Xm Diesel	Car	7	18	4	City	/cars/bolt.jpg	6.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xm Diesel	1248	4	44	1562	3825	1695	5	75	190	\N
343	Tata Bolt Xms Diesel	Car	8	18	4	City	/cars/bolt.jpg	7.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xms Diesel	1248	4	44	1562	3825	1695	5	75	190	\N
345	Tata Bolt Xe Petrol	Car	6	18	4	City	/cars/bolt.jpg	5.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xe Petrol	1193	4	44	1562	3825	1695	5	90	140	\N
346	Tata Bolt Xm Petrol	Car	6	18	4	City	/cars/bolt.jpg	5.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xm Petrol	1193	4	44	1562	3825	1695	5	90	140	\N
347	Tata Bolt Xms Petrol	Car	7	18	4	City	/cars/bolt.jpg	6.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xms Petrol	1193	4	44	1562	3825	1695	5	90	140	\N
348	Toyota Etios Cross G	Car	7	18	4	City	/cars/etios-cross.jpg	6.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	G	1197	4	45	1555	3895	1735	5	80	104	\N
349	Toyota Etios Cross 1.2 X Edition	Car	7	18	4	City	/cars/etios-cross.jpg	6.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	1.2 X Edition	1197	4	45	1555	3895	1735	5	80	104	\N
350	Fiat Urban Cross 1.3 Multijet Active	Car	7	18	4	City	/cars/urban-cross.jpg	6.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	1.3 Multijet Active	1248	4	45	1542	3989	1706	5	93	209	\N
351	Fiat Urban Cross 1.4 T-Jet Emotion	Car	10	18	4	City	/cars/urban-cross.jpg	9.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Crossover	\N	Fiat	1.4 T-Jet Emotion	1368	4	45	1542	3989	1706	5	140	210	\N
352	Fiat Urban Cross 1.3 Multijet Emotion	Car	9	18	4	City	/cars/urban-cross.jpg	8.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	1.3 Multijet Emotion	1248	4	45	1542	3989	1706	5	93	209	\N
353	Fiat Avventura Multijet Active	Car	8	18	4	City	/cars/avventura.jpg	7.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	Multijet Active	1248	4	45	1542	3989	1706	5	93	209	\N
354	Honda Jazz V Petrol	Car	8	18	4	City	/cars/jazz.jpg	7.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Honda	V Petrol	1199	4	40	1544	3955	1694	5	90	110	\N
355	Honda Jazz Vx Cvt	Car	10	18	4	City	/cars/jazz.jpg	9.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Honda	Vx Cvt	1199	4	40	1544	3955	1694	5	90	110	\N
356	Honda Jazz Vx Petrol	Car	8	18	4	City	/cars/jazz.jpg	7.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Honda	Vx Petrol	1199	4	40	1544	3955	1694	5	90	110	\N
357	Honda Jazz V Cvt	Car	9	18	4	City	/cars/jazz.jpg	8.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Honda	V Cvt	1199	4	40	1544	3955	1694	5	90	110	\N
358	Honda Jazz S Diesel	Car	9	18	4	City	/cars/jazz.jpg	8.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Honda	S Diesel	1498	4	40	1544	3955	1694	5	100	200	\N
359	Honda Jazz V Diesel	Car	9	18	4	City	/cars/jazz.jpg	8.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Honda	V Diesel	1498	4	40	1544	3955	1694	5	100	200	\N
360	Honda Jazz Vx Diesel	Car	10	18	4	City	/cars/jazz.jpg	9.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Honda	Vx Diesel	1498	4	40	1544	3955	1694	5	100	200	\N
367	Volvo S90 D4 Inscription	Car	59	18	4	City	/cars/s90.jpg	58.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volvo	D4 Inscription	1969	4	0	1443	4963	1879	5	190	400	\N
368	Volkswagen Vento Trendline 1.6 (P)	Car	9	18	4	City	/cars/vento.jpg	8.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Trendline 1.6 (P)	1598	4	55	1467	4390	1699	5	105	153	\N
369	Fiat Abarth Avventura 1.4 T-Jet	Car	10	18	4	City	/cars/abarth-avventura.jpg	9.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Crossover	\N	Fiat	1.4 T-Jet	1368	4	0	1542	3983	1706	5	143	210	\N
370	Toyota Corolla Altis G Petrol	Car	17	18	4	City	/cars/corolla-altis.jpg	16.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	G Petrol	1798	4	55	1475	4620	1775	5	140	173	\N
371	Toyota Corolla Altis G At Petrol	Car	19	18	4	City	/cars/corolla-altis.jpg	18.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	G At Petrol	1798	4	55	1475	4620	1775	5	140	173	\N
372	Toyota Corolla Altis Gl Petrol	Car	19	18	4	City	/cars/corolla-altis.jpg	18.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	Gl Petrol	1798	4	55	1475	4620	1775	5	140	173	\N
373	Toyota Corolla Altis Vl At Petrol	Car	21	18	4	City	/cars/corolla-altis.jpg	20.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	Vl At Petrol	1798	4	55	1475	4620	1775	5	140	173	\N
374	Bmw X1 Sdrive20I Xline	Car	39	18	4	Highway	/cars/x1.jpg	38.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Crossover, SUV	\N	Bmw	Sdrive20I Xline	1998	4	51	1612	4439	1821	5	192	280	\N
378	Honda Wr-V S Diesel	Car	10	18	4	Highway	/cars/wr-v.jpg	9.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	S Diesel	1498	4	40	1601	3999	1734	5	100	200	\N
379	Honda Wr-V S Petrol	Car	9	18	4	Highway	/cars/wr-v.jpg	8.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	S Petrol	1199	4	40	1601	3999	1734	5	90	110	\N
380	Honda Wr-V Edge Plus Edition Diesel	Car	10	18	4	Highway	/cars/wr-v.jpg	9.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	Edge Plus Edition Diesel	1498	4	40	1601	3999	1734	5	100	200	\N
381	Honda Wr-V Edge Plus Edition Petrol	Car	9	18	4	Highway	/cars/wr-v.jpg	8.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	Edge Plus Edition Petrol	1199	4	40	1601	3999	1734	5	90	110	\N
375	Audi Q5 35 Tdi Premium Plus	Car	51	18	4	Highway	/cars/q5.jpg	50.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Audi	35 Tdi Premium Plus	1968	4	64	1608	4388	1831	5	190	400	https://uploads.audi-mediacenter.com/system/production/cars/608/photos/ec4dfd850dd40c16b7fbf6bfabcd38a0937145f1/web_1440_Q5_SUV.png?1764058307
382	Honda Wr-V Exclusive Edition Petrol	Car	10	18	4	Highway	/cars/wr-v.jpg	9.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	Exclusive Edition Petrol	1199	4	40	1601	3999	1734	5	90	110	\N
383	Maruti Suzuki S-Cross 1.3L Sigma	Car	9	18	4	City	/cars/s-cross.jpg	8.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Maruti Suzuki	1.3L Sigma	1248	4	48	1595	4300	1785	5	90	200	\N
384	Maruti Suzuki S-Cross 1.3L Delta	Car	10	18	4	City	/cars/s-cross.jpg	9.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Maruti Suzuki	1.3L Delta	1248	4	48	1595	4300	1785	5	90	200	\N
385	Maruti Suzuki S-Cross 1.3L Zeta	Car	11	18	4	City	/cars/s-cross.jpg	10.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Maruti Suzuki	1.3L Zeta	1248	4	48	1595	4300	1785	5	90	200	\N
386	Maruti Suzuki S-Cross 1.3L Alpha	Car	12	18	4	City	/cars/s-cross.jpg	11.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Maruti Suzuki	1.3L Alpha	1248	4	48	1595	4300	1785	5	90	200	\N
387	Jaguar F-Pace Prestige	Car	65	18	4	Highway	/cars/f-pace.jpg	64.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Jaguar	Prestige	1999	4	60	1651	4731	2175	5	180	430	\N
388	Volvo V90 Cross Country D5 Inscription	Car	66	18	4	Highway	/cars/v90-cross-country.jpg	65.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D5 Inscription	1969	4	60	1543	4950	2052	5	235	480	\N
389	Maruti Suzuki Ciaz 1.3L Alpha Smart Hybrid	Car	12	18	4	City	/cars/ciaz.jpg	11.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.3L Alpha Smart Hybrid	1248	4	43	1485	4490	1730	5	89	200	\N
390	Maruti Suzuki Ciaz 1.3L Sigma Smart Hybrid	Car	10	18	4	City	/cars/ciaz.jpg	9.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.3L Sigma Smart Hybrid	1248	4	43	1485	4490	1730	5	89	200	\N
391	Maruti Suzuki Ciaz 1.3L Delta Smart Hybrid	Car	10	18	4	City	/cars/ciaz.jpg	9.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.3L Delta Smart Hybrid	1248	4	43	1485	4490	1730	5	89	200	\N
392	Maruti Suzuki Ciaz 1.3L Zeta Smart Hybrid	Car	11	18	4	City	/cars/ciaz.jpg	10.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.3L Zeta Smart Hybrid	1248	4	43	1485	4490	1730	5	89	200	\N
393	Maruti Suzuki Ciaz 1.5L Zeta Smart Hybrid	Car	10	18	4	City	/cars/ciaz.jpg	9.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Zeta Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
394	Maruti Suzuki Ciaz 1.5L Alpha	Car	12	18	4	City	/cars/ciaz.jpg	11.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Alpha	1498	4	43	1485	4490	1730	5	94	225	\N
395	Maruti Suzuki Ciaz 1.5L Delta	Car	10	18	4	City	/cars/ciaz.jpg	9.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Delta	1498	4	43	1485	4490	1730	5	94	225	\N
396	Maruti Suzuki Ciaz 1.5L Zeta	Car	12	18	4	City	/cars/ciaz.jpg	11.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Zeta	1498	4	43	1485	4490	1730	5	94	225	\N
397	Fiat Abarth Punto 1.4 T-Jet	Car	10	18	4	City	/cars/abarth-punto.jpg	9.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Fiat	1.4 T-Jet	1368	4	0	1505	3989	1687	5	145	212	\N
398	Hyundai Creta 1.4 Crdi E Plus	Car	10	18	4	Highway	/cars/creta.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi E Plus	1396	4	55	1630	4270	1780	5	90	220	\N
399	Hyundai Creta 1.6 Vtvt E Plus	Car	10	18	4	Highway	/cars/creta.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.6 Vtvt E Plus	1591	4	55	1630	4270	1780	5	123	151	\N
400	Hyundai Creta 1.6 Vtvt Sx	Car	13	18	4	Highway	/cars/creta.jpg	12.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.6 Vtvt Sx	1591	4	55	1630	4270	1780	5	123	151	\N
401	Hyundai Creta 1.6 Vtvt Sx (O)	Car	14	18	4	Highway	/cars/creta.jpg	13.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.6 Vtvt Sx (O)	1591	4	55	1630	4270	1780	5	123	151	\N
402	Hyundai Creta 1.6 Vtvt Sx At	Car	14	18	4	Highway	/cars/creta.jpg	13.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Hyundai	1.6 Vtvt Sx At	1591	4	55	1630	4270	1780	5	123	151	\N
403	Hyundai Creta 1.6 Vtvt Sx Dual Tone	Car	13	18	4	Highway	/cars/creta.jpg	12.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Hyundai	1.6 Vtvt Sx Dual Tone	1591	4	55	1630	4270	1780	5	123	151	\N
404	Hyundai Creta 1.4 Crdi S	Car	12	18	4	Highway	/cars/creta.jpg	11.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi S	1396	4	55	1630	4270	1780	5	90	220	\N
405	Hyundai Creta 1.6 Crdi Sx	Car	14	18	4	Highway	/cars/creta.jpg	13.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.6 Crdi Sx	1582	4	55	1630	4270	1780	5	128	260	\N
406	Hyundai Creta 1.6 Crdi Sx (O)	Car	16	18	4	Highway	/cars/creta.jpg	15.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.6 Crdi Sx (O)	1582	4	55	1630	4270	1780	5	128	260	\N
409	Hyundai Creta 1.6 Crdi S At	Car	14	18	4	Highway	/cars/creta.jpg	13.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Hyundai	1.6 Crdi S At	1582	4	55	1630	4270	1780	5	128	260	\N
410	Hyundai Creta 1.6 Vtvt Sx (O) Executive	Car	15	18	4	Highway	/cars/creta.jpg	14.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.6 Vtvt Sx (O) Executive	1591	4	55	1630	4270	1780	5	121	151	\N
411	Hyundai Creta 1.6 Crdi Sx (O) Executive	Car	16	18	4	Highway	/cars/creta.jpg	15.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.6 Crdi Sx (O) Executive	1582	4	55	1630	4270	1780	5	126	260	\N
412	Hyundai Creta 1.4 Crdi Ex	Car	12	18	4	Highway	/cars/creta.jpg	11.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Ex	1396	4	55	1630	4270	1780	5	90	220	\N
413	Hyundai Creta 1.6 Vtvt Ex	Car	11	18	4	Highway	/cars/creta.jpg	10.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.6 Vtvt Ex	1591	4	55	1630	4270	1780	5	123	151	\N
414	Hyundai Creta Sports Edition Petrol	Car	13	18	4	Highway	/cars/creta.jpg	12.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	Sports Edition Petrol	1591	4	55	1630	4270	1780	5	123	151	\N
415	Fiat Punto Evo Dynamic 1.2	Car	6	18	4	City	/cars/punto-evo.jpg	5.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Fiat	Dynamic 1.2	1172	4	45	1525	3989	1687	5	68	96	\N
416	Fiat Punto Evo Active Multijet 1.3	Car	7	18	4	City	/cars/punto-evo.jpg	6.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Fiat	Active Multijet 1.3	1172	4	45	1525	3989	1687	5	76	197	\N
417	Fiat Punto Evo Dynamic Multijet 1.3	Car	7	18	4	City	/cars/punto-evo.jpg	6.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Fiat	Dynamic Multijet 1.3	1248	4	45	1525	3989	1687	5	76	197	\N
418	Fiat Punto Evo Emotion Multijet 1.3	Car	8	18	4	City	/cars/punto-evo.jpg	7.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Fiat	Emotion Multijet 1.3	1248	4	45	1525	3989	1687	5	76	197	\N
419	Tata Nano Genx Emax Xm	Car	3	18	4	City	/cars/nano-genx.jpg	2.97 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Tata	Emax Xm	624	2	15	1652	3164	1750	4	38	51	\N
420	Renault Triber Rxe	Car	5	18	4	City	/cars/triber.jpg	4.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Renault	Rxe	999	3	40	1643	3990	1739	7	72	96	\N
421	Renault Triber Rxl	Car	6	18	4	City	/cars/triber.jpg	5.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Renault	Rxl	999	3	40	1643	3990	1739	7	72	96	\N
422	Renault Triber Rxt	Car	7	18	4	City	/cars/triber.jpg	6.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Renault	Rxt	999	3	40	1643	3990	1739	7	72	96	\N
423	Renault Triber Rxz	Car	7	18	4	City	/cars/triber.jpg	6.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MUV	\N	Renault	Rxz	999	3	40	1643	3990	1739	7	72	96	\N
424	Volkswagen Tiguan Highline 2.0L Tdi Amt	Car	32	18	4	Highway	/cars/tiguan.jpg	31.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volkswagen	Highline 2.0L Tdi Amt	1968	4	71	1672	4486	1839	0	141	340	\N
425	Honda Cr-V 2Wd Diesel At	Car	31	18	4	Highway	/cars/cr-v.jpg	30.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Honda	2Wd Diesel At	1597	0	57	1679	4592	1855	7	120	300	\N
426	Honda Cr-V Awd Diesel At	Car	33	18	4	Highway	/cars/cr-v.jpg	32.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Honda	Awd Diesel At	1597	0	57	1689	4592	1855	7	120	300	\N
427	Jaguar Xe S Diesel	Car	45	18	4	City	/cars/xe.jpg	44.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	S Diesel	1999	4	56	1416	4691	1850	4	180	430	\N
428	Jaguar Xe Se Diesel	Car	47	18	4	City	/cars/xe.jpg	46.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	Se Diesel	1999	4	56	1416	4691	1850	4	180	430	\N
429	Land Rover Discovery Sport S	Car	58	18	4	Highway	/cars/discovery-sport.jpg	57.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	S	1999	4	70	1727	4600	2069	7	179	430	\N
430	Land Rover Discovery Sport R-Dynamic Se	Car	61	18	4	Highway	/cars/discovery-sport.jpg	60.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover	R-Dynamic Se	1999	4	70	1727	4600	2069	7	179	430	\N
436	Mercedes-Benz Mercedes-Benz G-Class Amg G 63	Car	219	18	4	Highway	/cars/mercedes-benz-g-class.jpg	218.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	Amg G 63	3982	8	96	1938	4763	1855	7	585	850	\N
437	Mercedes-Benz Mercedes-Benz G-Class G 350D	Car	150	18	4	Highway	/cars/mercedes-benz-g-class.jpg	150.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	G 350D	2925	6	100	1969	4817	1931	7	289	600	\N
433	Bmw 7-Series 745Le Xdrive	Car	165	18	4	City	/cars/7-series.jpg	165.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Sedan	\N	Bmw	745Le Xdrive	2998	6	46	1481	5219	2142	4	286	450	\N
440	Mahindra Thar Crde Abs	Car	10	18	4	Highway	/cars/thar.jpg	9.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Crde Abs	2498	4	60	1930	3920	1726	6	105	247	\N
441	Mahindra Xuv500 G At	Car	17	18	4	Highway	/cars/xuv500.jpg	16.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mahindra	G At	2179	4	70	1785	4585	1890	7	140	320	\N
442	Mahindra Xuv500 G At	Car	17	18	4	Highway	/cars/xuv500.jpg	16.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mahindra	G At	2179	4	70	1785	4585	1890	7	140	320	\N
443	Skoda Kodiaq Scout 2.0 Tdi At	Car	34	18	4	Highway	/cars/kodiaq-scout.jpg	33.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Skoda	2.0 Tdi At	1968	4	63	1665	4697	1882	7	148	340	\N
447	Volvo Xc90 T8 Inscription	Car	97	18	4	Highway	/cars/xc90.jpg	96.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Volvo	T8 Inscription	1969	4	68	1776	4950	2140	7	320	240	\N
448	Land Rover Rover Range Sport 2.0L S Petrol	Car	87	18	4	Highway	/cars/range-sport.jpg	86.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	2.0L S Petrol	1997	8	105	1803	4879	2220	7	296	400	\N
449	Land Rover Rover Range Sport 2.0L Se Petrol	Car	95	18	4	Highway	/cars/range-sport.jpg	94.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	2.0L Se Petrol	1997	8	105	1803	4879	2220	7	296	400	\N
450	Land Rover Rover Range Sport 3.0L V6 Se Petrol	Car	115	18	4	Highway	/cars/range-sport.jpg	114.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	3.0L V6 Se Petrol	2995	6	85	1803	4879	2220	7	335	450	\N
451	Land Rover Rover Range Sport 2.0L Hse Petrol	Car	156	18	4	Highway	/cars/range-sport.jpg	156.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	2.0L Hse Petrol	1997	8	105	1803	4879	2220	7	296	400	\N
452	Land Rover Rover Range Sport 3.0L V6 Hse Petrol	Car	133	18	4	Highway	/cars/range-sport.jpg	132.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	3.0L V6 Hse Petrol	2995	6	85	1803	4879	2220	7	335	450	\N
453	Land Rover Rover Range 3.0L Tdv6 Vogue Lwb Diesel	Car	196	18	4	Highway	/cars/range.jpg	195.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	3.0L Tdv6 Vogue Lwb Diesel	2993	6	0	1868	5200	2073	7	254	600	\N
454	Land Rover Rover Range 4.4L Sdv8 Autobiography Lwb Diesel	Car	252	18	4	Highway	/cars/range.jpg	251.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	4.4L Sdv8 Autobiography Lwb Diesel	4367	8	0	1868	5200	2073	7	335	740	\N
455	Land Rover Rover Range 4.4L Sdv8 Vogue Se Lwb Diesel	Car	237	18	4	Highway	/cars/range.jpg	236.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	4.4L Sdv8 Vogue Se Lwb Diesel	4367	8	0	1868	5200	2073	7	335	740	\N
456	Maruti Suzuki Ertiga Lxi	Car	8	18	4	City	/cars/ertiga.jpg	7.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	Lxi	1462	4	45	1690	4395	1735	7	103	138	\N
457	Mitsubishi Outlander 2.4L Outlander	Car	27	18	4	Highway	/cars/outlander.jpg	26.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mitsubishi	2.4L Outlander	2360	4	60	1710	4695	1810	7	167	222	\N
461	Jaguar F-Type 2.0L Convertible	Car	102	18	4	City	/cars/f-type.jpg	101.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Jaguar	2.0L Convertible	1997	6	63	1308	4482	1923	2	297	400	\N
462	Jaguar F-Type 2.0 Convertible R Dynamic	Car	105	18	4	City	/cars/f-type.jpg	104.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Jaguar	2.0 Convertible R Dynamic	1997	8	63	1308	4482	1923	2	297	400	\N
463	Jaguar F-Type 2.0 Coupe R Dynamic	Car	94	18	4	City	/cars/f-type.jpg	93.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Jaguar	2.0 Coupe R Dynamic	1997	4	63	1311	4482	1923	2	297	400	\N
464	Tata Winger 15S	Car	13	18	4	City	/cars/winger.jpg	12.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	MUV	\N	Tata	15S	2200	4	60	2670	5458	1905	16	0	190	\N
465	Hyundai Kona Electric Premium	Car	24	18	4	Highway	/cars/kona-electric.jpg	23.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Hyundai	Premium	0	0	0	1570	4180	1800	4	136	395	\N
466	Datsun Redi-Go 1.0 S	Car	4	18	4	City	/cars/redi-go.jpg	3.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	1.0 S	999	3	28	1541	3429	1560	5	68	91	\N
467	Datsun Redi-Go 1.0 S Amt	Car	5	18	4	City	/cars/redi-go.jpg	4.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Datsun	1.0 S Amt	999	3	28	1541	3429	1560	5	68	91	\N
460	Bmw 6-Series 620D Gt Luxury Line	Car	65	18	4	City	/cars/6-series.jpg	64.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	620D Gt Luxury Line	1995	4	66	1538	5091	1902	4	188	400	\N
458	Bmw 6-Series 630D Gt Luxury Line	Car	69	18	4	City	/cars/6-series.jpg	68.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	630D Gt Luxury Line	2993	6	88	1481	5219	2142	4	265	620	\N
468	Maruti Suzuki Alto K10 Lxi Cng (O)	Car	5	18	4	City	/cars/alto-k10.jpg	4.4 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi Cng (O)	998	3	35	1475	3545	1490	5	59	78	\N
469	Datsun Go D	Car	4	18	4	City	/cars/go.jpg	3.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	D	1198	3	35	1507	3788	1636	5	68	104	\N
470	Datsun Go T	Car	5	18	4	City	/cars/go.jpg	4.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T	1198	3	35	1507	3788	1636	5	68	104	\N
471	Datsun Go T Vdc	Car	6	18	4	City	/cars/go.jpg	5.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T Vdc	1198	3	35	1507	3788	1636	5	68	104	\N
472	Datsun Go T Cvt	Car	6	18	4	City	/cars/go.jpg	5.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T Cvt	1198	3	35	1507	3788	1636	5	78	104	\N
473	Maruti Suzuki Celerio Tour H2 Cng	Car	5	18	4	City	/cars/celerio-tour.jpg	4.81 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Maruti Suzuki	H2 Cng	998	3	60	1560	3695	1600	5	59	78	\N
474	Nissan Micra Active Xl	Car	6	18	4	City	/cars/micra-active.jpg	5.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Nissan	Xl	1198	3	41	1530	3801	1665	5	68	104	\N
475	Nissan Micra Active Xl (O)	Car	6	18	4	City	/cars/micra-active.jpg	5.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Nissan	Xl (O)	1198	3	41	1530	3801	1665	5	68	104	\N
476	Ford Freestyle 1.2L Ti-Vct Ambiente	Car	6	18	4	City	/cars/freestyle.jpg	5.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	1.2L Ti-Vct Ambiente	1194	3	42	1570	3954	1737	5	96	120	\N
477	Ford Freestyle 1.2L Ti-Vct Titanium	Car	8	18	4	City	/cars/freestyle.jpg	7.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	1.2L Ti-Vct Titanium	1194	3	42	1570	3954	1737	5	96	120	\N
478	Ford Freestyle 1.2L Ti-Vct Titanium Plus	Car	8	18	4	City	/cars/freestyle.jpg	7.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Ford	1.2L Ti-Vct Titanium Plus	1194	3	42	1570	3954	1737	5	96	120	\N
479	Ford Freestyle 1.2L Ti-Vct Trend Plus	Car	7	18	4	City	/cars/freestyle.jpg	6.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Crossover	\N	Ford	1.2L Ti-Vct Trend Plus	1194	3	42	1570	3954	1737	5	96	120	\N
480	Ford Freestyle 1.5L Tdci Trend Plus	Car	8	18	4	City	/cars/freestyle.jpg	7.46 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Ford	1.5L Tdci Trend Plus	1498	3	42	1570	3954	1737	5	100	215	\N
481	Volvo Xc40 D4 Momentum	Car	40	18	4	Highway	/cars/xc40.jpg	39.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D4 Momentum	1969	5	0	1652	4425	1863	5	190	400	\N
482	Volvo Xc40 D4 Inscription	Car	44	18	4	Highway	/cars/xc40.jpg	43.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	D4 Inscription	1969	5	0	1652	4425	1863	5	190	400	\N
483	Volvo Xc40 T4 R-Design	Car	40	18	4	Highway	/cars/xc40.jpg	39.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Volvo	T4 R-Design	1969	5	54	1652	4425	1863	5	190	300	\N
484	Mercedes-Benz Rolls-Royce Ghost Series Ii Ewb	Car	533	18	4	City	/cars/rolls-royce-ghost-series-ii.jpg	532.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	Ewb	6592	12	82.5	1550	5569	1948	5	570	780	\N
485	Maruti Suzuki Alto Std	Car	3	18	4	City	/cars/alto.jpg	2.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Std	796	3	35	1475	3445	1490	5	48	69	\N
486	Maruti Suzuki Alto Std (O)	Car	3	18	4	City	/cars/alto.jpg	3.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Std (O)	796	3	35	1475	3445	1490	5	48	69	\N
487	Maruti Suzuki Alto Lxi	Car	4	18	4	City	/cars/alto.jpg	3.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi	796	3	35	1475	3445	1490	5	47	69	\N
488	Maruti Suzuki Alto Lxi (O)	Car	4	18	4	City	/cars/alto.jpg	3.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi (O)	796	3	35	1475	3445	1490	5	48	69	\N
489	Maruti Suzuki Alto Vxi	Car	4	18	4	City	/cars/alto.jpg	3.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	796	3	35	1475	3445	1490	5	48	69	\N
490	Maruti Suzuki Alto Lxi Cng (Cng +	Car	5	18	4	City	/cars/alto.jpg	4.06 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi Cng (Cng +	796	3	35	1475	3445	1490	5	47	69	\N
491	Maruti Suzuki Alto Lxi (O) Cng (Cng +	Car	5	18	4	City	/cars/alto.jpg	4.09 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi (O) Cng (Cng +	796	3	35	1475	3445	1490	5	48	69	\N
492	Maruti Suzuki Alto Vxi Plus	Car	4	18	4	City	/cars/alto.jpg	3.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi Plus	796	3	35	1475	3445	1490	5	48	69	\N
493	Maruti Suzuki Celerio Vxi Cng Mt	Car	6	18	4	City	/cars/celerio.jpg	5.3 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi Cng Mt	998	3	35	1560	3600	1600	5	59	78	\N
494	Tata Altroz Xe Petrol	Car	6	18	4	City	/cars/altroz.jpg	5.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xe Petrol	1199	3	37	1523	3990	1755	5	86	113	\N
495	Tata Nexon Xe	Car	7	18	4	Highway	/cars/nexon.jpg	6.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xe	1198	3	44	1607	3994	1811	5	110	170	\N
496	Tata Nexon Xm	Car	8	18	4	Highway	/cars/nexon.jpg	7.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xm	1198	3	44	1607	3994	1811	5	110	170	\N
497	Tata Nexon Xz	Car	9	18	4	Highway	/cars/nexon.jpg	8.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xz	1198	3	44	1607	3994	1811	5	110	170	\N
498	Tata Nexon Xz Plus	Car	10	18	4	Highway	/cars/nexon.jpg	9.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xz Plus	1198	3	44	1607	3994	1811	5	110	170	\N
499	Tata Nexon Xz Plus Dual Tone	Car	10	18	4	Highway	/cars/nexon.jpg	9.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xz Plus Dual Tone	1198	3	44	1607	3994	1811	5	110	170	\N
501	Tata Nexon Xz Plus (O) Dual Tone	Car	11	18	4	Highway	/cars/nexon.jpg	10.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xz Plus (O) Dual Tone	1198	3	44	1607	3994	1811	5	110	170	\N
502	Tata Nexon Xma	Car	9	18	4	Highway	/cars/nexon.jpg	8.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xma	1198	3	44	1607	3994	1811	5	110	170	\N
503	Tata Nexon Xza Plus	Car	11	18	4	Highway	/cars/nexon.jpg	10.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xza Plus	1198	3	44	1607	3994	1811	5	110	170	\N
504	Tata Nexon Xza Plus Dual Tone	Car	11	18	4	Highway	/cars/nexon.jpg	10.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xza Plus Dual Tone	1198	3	44	1607	3994	1811	5	110	170	\N
505	Tata Nexon Xza Plus (O)	Car	11	18	4	Highway	/cars/nexon.jpg	11.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xza Plus (O)	1198	3	44	1607	3994	1811	5	110	170	\N
506	Tata Nexon Xza Plus (O) Dual Tone	Car	12	18	4	Highway	/cars/nexon.jpg	11.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Tata	Xza Plus (O) Dual Tone	1198	3	44	1607	3994	1811	5	110	170	\N
507	Ford Ecosport 1.5L Ti-Vct Ambiente	Car	8	18	4	Highway	/cars/ecosport.jpg	7.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Ford	1.5L Ti-Vct Ambiente	1497	3	52	1647	3998	1765	5	123	150	\N
508	Ford Ecosport 1.5L Ti-Vct Trend	Car	9	18	4	Highway	/cars/ecosport.jpg	8.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Ford	1.5L Ti-Vct Trend	1497	3	52	1647	3998	1765	5	123	150	\N
509	Ford Ecosport 1.5L Ti-Vct Titanium	Car	10	18	4	Highway	/cars/ecosport.jpg	9.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Ford	1.5L Ti-Vct Titanium	1497	3	52	1647	3998	1765	5	123	150	\N
510	Ford Ecosport 1.5L Ti-Vct Titanium Plus At	Car	12	18	4	Highway	/cars/ecosport.jpg	11.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Ford	1.5L Ti-Vct Titanium Plus At	1497	3	52	1647	3998	1765	5	123	150	\N
511	Ford Ecosport 1.5L Tdci Titanium S	Car	12	18	4	Highway	/cars/ecosport.jpg	11.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Titanium S	1498	3	52	1647	3998	1765	5	100	205	\N
512	Tata Tigor Ev Xm+	Car	10	18	4	City	/cars/tigor-ev.jpg	9.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Tata	Xm+	0	0	35	1537	3992	1677	5	41.5	105	\N
513	Tata Tigor Ev Xt+	Car	10	18	4	City	/cars/tigor-ev.jpg	9.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Tata	Xt+	0	0	35	1537	3992	1677	5	41.5	105	\N
514	Tata Tigor Ev Xe+	Car	10	18	4	City	/cars/tigor-ev.jpg	9.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	Sedan	\N	Tata	Xe+	0	0	35	1537	3992	1677	5	41.5	105	\N
515	Volvo S60 Momentum	Car	39	18	4	City	/cars/s60.jpg	38.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volvo	Momentum	1984	5	67.5	1484	4635	1865	5	181	400	\N
518	Mercedes-Benz Mercedes-Benz E-Class E220D	Car	60	18	4	City	/cars/mercedes-benz-e-class.jpg	59.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	E220D	2987	6	80	1494	5063	1860	5	268.7	620	\N
519	Mercedes-Benz Mercedes-Benz E-Class E220D Expression	Car	59	18	4	City	/cars/mercedes-benz-e-class.jpg	58.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	E220D Expression	2987	6	80	1494	5063	1860	5	268.7	620	\N
520	Mercedes-Benz Mercedes-Benz E-Class E220D Exclusive	Car	63	18	4	City	/cars/mercedes-benz-e-class.jpg	62.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	E220D Exclusive	2987	6	80	1494	5063	1860	5	268.7	620	\N
523	Mercedes-Benz Mercedes-Benz E-Class All Terrain E 220D	Car	75	18	4	Highway	/cars/mercedes-benz-e-class-all-terrain.jpg	75.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	E 220D	1950	6	80	1475	4933	1852	5	194	400	\N
524	Land Rover Rover Range Sport 3.0L Tdv6 S Diesel	Car	104	18	4	Highway	/cars/range-sport.jpg	103.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	3.0L Tdv6 S Diesel	2993	6	80	1803	4879	2220	5	254	600	\N
525	Land Rover Rover Range Sport 3.0L Tdv6 Se Diesel	Car	120	18	4	Highway	/cars/range-sport.jpg	119.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	3.0L Tdv6 Se Diesel	2993	6	80	1803	4879	2220	5	254	600	\N
526	Porsche Cayenne E-Hybrid	Car	159	18	4	Highway	/cars/cayenne.jpg	158.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	SUV	\N	Porsche	E-Hybrid	2995	6	75	1696	4918	1983	5	340	450	\N
527	Porsche Cayenne Turbo	Car	193	18	4	Highway	/cars/cayenne.jpg	192.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Porsche	Turbo	3996	6	90	1673	4926	1983	5	550	770	\N
528	Porsche Cayenne Base	Car	120	18	4	Highway	/cars/cayenne.jpg	119.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Porsche	Base	2995	6	75	1705	4918	1983	5	335	450	\N
529	Land Rover Rover Range 3.0L Tdv6 Vogue Diesel	Car	182	18	4	Highway	/cars/range.jpg	181.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	3.0L Tdv6 Vogue Diesel	2993	6	0	1868	5200	2120	5	254	600	\N
530	Kia Seltos Htk 1.5	Car	11	18	4	Highway	/cars/seltos.jpg	10.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Htk 1.5	1497	0	60	1645	4315	1800	5	115	144	\N
521	Bmw X4 Xdrive30D M Sport X	Car	66	18	4	Highway	/cars/x4.jpg	65.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Xdrive30D M Sport X	2993	6	68	1621	4752	1918	5	265	620	\N
522	Bmw X4 Xdrive30I M Sport X	Car	64	18	4	Highway	/cars/x4.jpg	63.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Bmw	Xdrive30I M Sport X	1998	6	68	1621	4752	1918	5	248	350	\N
531	Kia Seltos Htk Plus 1.5	Car	12	18	4	Highway	/cars/seltos.jpg	11.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Htk Plus 1.5	1497	0	60	1645	4315	1800	5	115	144	\N
532	Kia Seltos Htx 1.5	Car	14	18	4	Highway	/cars/seltos.jpg	13.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Htx 1.5	1497	0	60	1645	4315	1800	5	115	144	\N
533	Kia Seltos Htx Cvt 1.5	Car	15	18	4	Highway	/cars/seltos.jpg	14.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Kia	Htx Cvt 1.5	1497	0	60	1645	4315	1800	5	115	144	\N
534	Kia Seltos Hte 1.5 Diesel	Car	11	18	4	Highway	/cars/seltos.jpg	10.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Kia	Hte 1.5 Diesel	1493	0	60	1645	4315	1800	5	114	250	\N
535	Kia Seltos Htk 1.5 Diesel	Car	12	18	4	Highway	/cars/seltos.jpg	11.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Kia	Htk 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
536	Kia Seltos Htk Plus 1.5 Diesel	Car	13	18	4	Highway	/cars/seltos.jpg	12.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Kia	Htk Plus 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
537	Kia Seltos Htk Plus At 1.5 Diesel	Car	14	18	4	Highway	/cars/seltos.jpg	13.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Kia	Htk Plus At 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
538	Kia Seltos Htx Plus 1.5 Diesel	Car	16	18	4	Highway	/cars/seltos.jpg	15.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Kia	Htx Plus 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
539	Kia Seltos Htx Plus At 1.5 Diesel	Car	17	18	4	Highway	/cars/seltos.jpg	16.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Kia	Htx Plus At 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
540	Kia Seltos Htx 1.5 Diesel	Car	15	18	4	Highway	/cars/seltos.jpg	14.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Kia	Htx 1.5 Diesel	1493	0	60	1645	4315	1800	5	115	250	\N
541	Tata Nexon Ev Xm	Car	14	18	4	Highway	/cars/nexon-ev.jpg	13.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Tata	Xm	0	0	0	1607	3994	1811	5	129	245	\N
542	Tata Nexon Ev Xz Plus	Car	15	18	4	Highway	/cars/nexon-ev.jpg	14.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Tata	Xz Plus	0	0	0	1607	3994	1811	5	129	245	\N
543	Tata Nexon Ev Xz Plus Lux	Car	16	18	4	Highway	/cars/nexon-ev.jpg	15.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Electric	Automatic	\N	SUV	\N	Tata	Xz Plus Lux	0	0	0	1607	3994	1811	5	129	245	\N
544	Mercedes-Benz Mercedes-Benz C-Class C 43 Amg	Car	75	18	4	City	/cars/mercedes-benz-c-class.jpg	75.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	C 43 Amg	3982	8	66	1426	4756	1839	5	503	700	\N
545	Nissan Micra Xl (O) Cvt	Car	7	18	4	City	/cars/micra.jpg	6.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Nissan	Xl (O) Cvt	1198	3	41	1530	3825	1665	5	77	104	\N
546	Nissan Micra Xv Cvt	Car	8	18	4	City	/cars/micra.jpg	7.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Nissan	Xv Cvt	1198	3	41	1530	3825	1665	5	77	104	\N
547	Tata Harrier Revotorq Xe	Car	14	18	4	Highway	/cars/harrier.jpg	13.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Revotorq Xe	1956	3	50	1706	4598	1894	5	140	350	\N
548	Tata Harrier Revotorq Xm	Car	15	18	4	Highway	/cars/harrier.jpg	14.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Revotorq Xm	1956	3	50	1706	4598	1894	5	140	350	\N
549	Tata Harrier Revotorq Xt	Car	16	18	4	City	/cars/harrier.jpg	15.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Revotorq Xt	1956	3	50	1706	4598	1894	5	140	350	\N
550	Tata Harrier Revotorq Xz	Car	18	18	4	City	/cars/harrier.jpg	17.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Revotorq Xz	1956	3	50	1706	4598	1894	5	140	350	\N
551	Tata Harrier Revotorq Xz Dual Tone	Car	18	18	4	City	/cars/harrier.jpg	17.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Revotorq Xz Dual Tone	1956	3	50	1706	4598	1894	5	140	350	\N
552	Tata Harrier Revotorq Dark Edition	Car	18	18	4	City	/cars/harrier.jpg	17.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Revotorq Dark Edition	1956	3	50	1706	4598	1894	5	140	350	\N
553	Porsche Macan S	Car	86	18	4	Highway	/cars/macan.jpg	85.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Porsche	S	2995	6	65	1624	4696	1923	5	349	480	\N
554	Porsche Macan Base	Car	70	18	4	Highway	/cars/macan.jpg	69.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Porsche	Base	1984	6	65	1624	4696	1923	5	248	370	\N
555	Tata Tiago Nrg 1.2L Revotron	Car	6	18	4	City	/cars/tiago-nrg.jpg	5.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Crossover	\N	Tata	1.2L Revotron	1199	3	35	1587	3793	1665	5	85	114	\N
556	Tata Tiago Nrg 1.05L Revotorq	Car	7	18	4	City	/cars/tiago-nrg.jpg	6.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Tata	1.05L Revotorq	1047	3	35	1587	3793	1665	5	70	140	\N
557	Tata Tiago Nrg 1.2L Revotron Amt	Car	7	18	4	City	/cars/tiago-nrg.jpg	6.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Crossover	\N	Tata	1.2L Revotron Amt	1199	3	35	1587	3793	1665	5	85	114	\N
558	Maruti Suzuki Eeco 5 Str With Ac+Htr Cng	Car	5	18	4	City	/cars/eeco.jpg	4.66 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	MPV	\N	Maruti Suzuki	5 Str With Ac+Htr Cng	1196	4	40	1800	3675	1475	5	62	85	\N
559	Maruti Suzuki Eeco 5 Str With Htr Cng	Car	5	18	4	City	/cars/eeco.jpg	4.25 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	MPV	\N	Maruti Suzuki	5 Str With Htr Cng	1196	4	40	1800	3675	1475	5	62	85	\N
560	Ford Freestyle 1.5L Tdci Ambiente	Car	7	18	4	City	/cars/freestyle.jpg	6.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Ford	1.5L Tdci Ambiente	1498	4	40	1570	3954	1737	5	100	215	\N
561	Ford Freestyle 1.5L Tdci Titanium	Car	8	18	4	City	/cars/freestyle.jpg	7.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Ford	1.5L Tdci Titanium	1498	4	40	1570	3954	1737	5	100	215	\N
562	Ford Freestyle 1.5L Tdci Titanium Plus	Car	9	18	4	City	/cars/freestyle.jpg	8.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Ford	1.5L Tdci Titanium Plus	1498	4	40	1570	3954	1737	5	100	215	\N
563	Honda Jazz Exclusive Edition Cvt	Car	10	18	4	City	/cars/jazz.jpg	9.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Honda	Exclusive Edition Cvt	1199	4	40	1544	3955	1694	5	89	110	\N
564	Volkswagen Tiguan Comfortline 2.0L Tdi Amt	Car	29	18	4	Highway	/cars/tiguan.jpg	28.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volkswagen	Comfortline 2.0L Tdi Amt	1968	4	71	1672	4486	1839	5	141	340	\N
565	Honda Cr-V 2Wd Petrol Cvt	Car	29	18	4	Highway	/cars/cr-v.jpg	28.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Honda	2Wd Petrol Cvt	1997	4	57	1679	4592	1855	5	154	189	\N
566	Jaguar Xe S Petrol	Car	45	18	4	City	/cars/xe.jpg	44.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Jaguar	S Petrol	1997	4	61	1416	4691	1850	5	250	365	\N
567	Jaguar Xe Se Petrol	Car	47	18	4	City	/cars/xe.jpg	46.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Jaguar	Se Petrol	1997	4	61	1416	4691	1850	5	250	365	\N
568	Hyundai Grand I10 Prime Era T+ Cng Vtvt	Car	6	18	4	City	/cars/grand-i10-prime.jpg	5.46 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Hyundai	Era T+ Cng Vtvt	1197	4	43	1520	3765	1660	5	83	114	\N
569	Hyundai Grand I10 Prime Era T Cng Vtvt	Car	6	18	4	City	/cars/grand-i10-prime.jpg	5.29 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Hyundai	Era T Cng Vtvt	1197	4	43	1520	3765	1660	5	83	114	\N
570	Maruti Suzuki Swift Vxi	Car	7	18	4	City	/cars/swift.jpg	6.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	1197	4	37	1530	3840	1735	5	83	113	\N
571	Maruti Suzuki Swift Vxi Amt	Car	7	18	4	City	/cars/swift.jpg	6.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi Amt	1197	4	37	1530	3840	1735	5	83	113	\N
572	Maruti Suzuki Swift Zxi	Car	7	18	4	City	/cars/swift.jpg	6.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi	1197	4	37	1530	3840	1735	5	83	113	\N
573	Maruti Suzuki Swift Zxi Amt	Car	8	18	4	City	/cars/swift.jpg	7.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi Amt	1197	4	37	1530	3840	1735	5	83	113	\N
574	Maruti Suzuki Swift Zxi Plus	Car	8	18	4	City	/cars/swift.jpg	7.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi Plus	1197	4	37	1530	3840	1735	5	83	113	\N
575	Maruti Suzuki Swift Ldi	Car	6	18	4	City	/cars/swift.jpg	5.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	Ldi	1248	4	37	1530	3840	1735	5	75	190	\N
576	Maruti Suzuki Swift Vdi	Car	7	18	4	City	/cars/swift.jpg	6.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	Vdi	1248	4	37	1530	3840	1735	5	75	190	\N
577	Maruti Suzuki Swift Vdi Amt	Car	8	18	4	City	/cars/swift.jpg	7.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vdi Amt	1248	4	37	1530	3840	1735	5	75	190	\N
578	Maruti Suzuki Swift Zdi	Car	8	18	4	City	/cars/swift.jpg	7.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	Zdi	1248	4	37	1530	3840	1735	5	75	190	\N
579	Maruti Suzuki Swift Zdi Amt	Car	9	18	4	City	/cars/swift.jpg	8.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zdi Amt	1248	4	37	1530	3840	1735	5	75	190	\N
580	Maruti Suzuki Swift Zdi Plus	Car	9	18	4	City	/cars/swift.jpg	8.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	Zdi Plus	1248	4	37	1530	3840	1735	5	75	190	\N
581	Maruti Suzuki Swift Zxi Plus Amt	Car	9	18	4	City	/cars/swift.jpg	8.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi Plus Amt	1197	4	37	1530	3840	1735	5	83	113	\N
582	Maruti Suzuki Swift Zdi Plus Amt	Car	9	18	4	City	/cars/swift.jpg	8.84 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zdi Plus Amt	1248	4	37	1530	3840	1735	5	75	190	\N
583	Tata Altroz Xe Diesel	Car	7	18	4	City	/cars/altroz.jpg	6.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xe Diesel	1497	4	37	1523	3990	1755	5	90	200	\N
584	Tata Nexon Xe Diesel	Car	9	18	4	Highway	/cars/nexon.jpg	8.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xe Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
585	Tata Nexon Xm Diesel	Car	10	18	4	Highway	/cars/nexon.jpg	9.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xm Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
586	Tata Nexon Xz Diesel	Car	11	18	4	Highway	/cars/nexon.jpg	10.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xz Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
587	Tata Nexon Xz Plus Diesel	Car	11	18	4	Highway	/cars/nexon.jpg	11.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xz Plus Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
588	Tata Nexon Xz Plus Diesel Dual Tone	Car	12	18	4	Highway	/cars/nexon.jpg	11.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xz Plus Diesel Dual Tone	1497	4	44	1607	3994	1811	5	110	260	\N
589	Tata Nexon Xz Plus (O) Diesel	Car	12	18	4	Highway	/cars/nexon.jpg	11.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xz Plus (O) Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
590	Tata Nexon Xz Plus (O) Diesel Dual Tone	Car	13	18	4	Highway	/cars/nexon.jpg	12.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xz Plus (O) Diesel Dual Tone	1497	4	44	1607	3994	1811	5	110	260	\N
591	Tata Nexon Xma Diesel	Car	10	18	4	Highway	/cars/nexon.jpg	9.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xma Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
592	Tata Nexon Xza Plus Diesel	Car	12	18	4	Highway	/cars/nexon.jpg	11.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xza Plus Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
593	Tata Nexon Xza Plus Diesel Dual Tone	Car	12	18	4	Highway	/cars/nexon.jpg	11.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xza Plus Diesel Dual Tone	1497	4	44	1607	3994	1811	5	110	260	\N
594	Tata Nexon Xza Plus (O) Diesel	Car	13	18	4	Highway	/cars/nexon.jpg	12.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xza Plus (O) Diesel	1497	4	44	1607	3994	1811	5	110	260	\N
597	Ford Ecosport 1.5L Tdci Trend	Car	10	18	4	Highway	/cars/ecosport.jpg	9.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Trend	1498	4	52	1647	3998	1765	5	100	205	\N
598	Ford Ecosport 1.5L Tdci Titanium	Car	10	18	4	Highway	/cars/ecosport.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Titanium	1498	4	52	1647	3998	1765	5	100	205	\N
599	Ford Ecosport 1.5L Tdci Titanium Plus	Car	11	18	4	Highway	/cars/ecosport.jpg	10.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Titanium Plus	1498	4	52	1647	3998	1765	5	100	205	\N
600	Ford Ecosport 1.5L Ti-Vct Titanium Plus	Car	10	18	4	Highway	/cars/ecosport.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Ford	1.5L Ti-Vct Titanium Plus	1497	4	52	1647	3998	1765	5	123	150	\N
601	Ford Ecosport 1.5L Ti-Vct Thunder Edition	Car	10	18	4	Highway	/cars/ecosport.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Ford	1.5L Ti-Vct Thunder Edition	1497	4	52	1647	3998	1765	5	123	150	\N
602	Ford Ecosport 1.5L Tdci Thunder Edition	Car	11	18	4	Highway	/cars/ecosport.jpg	10.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Thunder Edition	1498	4	52	1647	3998	1765	5	100	205	\N
603	Hyundai Verna 1.6 Vtvt Sx	Car	10	18	4	City	/cars/verna.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	1.6 Vtvt Sx	1591	4	45	1445	4440	1729	5	123	151	\N
604	Hyundai Verna 1.6 Vtvt Sx (O)	Car	12	18	4	City	/cars/verna.jpg	11.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	1.6 Vtvt Sx (O)	1591	4	45	1445	4440	1729	5	123	151	\N
605	Hyundai Verna 1.6 Vtvt Sx(O) At	Car	13	18	4	City	/cars/verna.jpg	12.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Hyundai	1.6 Vtvt Sx(O) At	1591	4	45	1445	4440	1729	5	123	155	\N
606	Hyundai Verna 1.4 Vtvt Ex	Car	10	18	4	City	/cars/verna.jpg	9.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	1.4 Vtvt Ex	1396	4	45	1445	4440	1729	5	100	133	\N
607	Hyundai Verna 1.4 Vtvt E	Car	9	18	4	City	/cars/verna.jpg	8.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	1.4 Vtvt E	1396	4	45	1445	4440	1729	5	100	133	\N
608	Hyundai Verna 1.6 Vtvt Sx (O) Anniversary Edition	Car	12	18	4	City	/cars/verna.jpg	11.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	1.6 Vtvt Sx (O) Anniversary Edition	1591	4	45	1445	4440	1729	5	123	151	\N
609	Hyundai Verna 1.6 Vtvt Sx Plus At	Car	12	18	4	City	/cars/verna.jpg	11.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Hyundai	1.6 Vtvt Sx Plus At	1591	4	45	1445	4440	1729	5	123	155	\N
610	Hyundai Verna 1.4 Crdi E	Car	10	18	4	City	/cars/verna.jpg	9.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	1.4 Crdi E	1396	4	45	1445	4440	1729	5	100	133	\N
611	Hyundai Verna 1.4 Crdi Ex	Car	10	18	4	City	/cars/verna.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	1.4 Crdi Ex	1396	4	45	1445	4440	1729	5	100	133	\N
612	Volkswagen Vento Highline 1.6 (P)	Car	10	18	4	City	/cars/vento.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Highline 1.6 (P)	1598	4	55	1467	4390	1699	5	105	153	\N
613	Volkswagen Vento Comfortline 1.6 (P)	Car	10	18	4	City	/cars/vento.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Comfortline 1.6 (P)	1598	4	55	1467	4390	1699	5	105	153	\N
614	Volkswagen Vento Highline 1.2 (P) Dsg	Car	12	18	4	City	/cars/vento.jpg	11.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Volkswagen	Highline 1.2 (P) Dsg	1197	4	55	1467	4390	1699	5	105	175	\N
615	Volkswagen Vento Highline Plus 1.2 (P) Dsg	Car	15	18	4	City	/cars/vento.jpg	14.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Volkswagen	Highline Plus 1.2 (P) Dsg	1197	4	55	1467	4390	1699	5	105	175	\N
616	Volkswagen Vento Trendline 1.5 (D)	Car	10	18	4	City	/cars/vento.jpg	9.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Trendline 1.5 (D)	1498	4	55	1467	4390	1699	5	105	250	\N
617	Volkswagen Vento Comfortline 1.5 (D)	Car	10	18	4	City	/cars/vento.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Comfortline 1.5 (D)	1498	4	55	1467	4390	1699	5	105	250	\N
618	Volkswagen Vento Highline 1.5 (D)	Car	13	18	4	City	/cars/vento.jpg	12.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Highline 1.5 (D)	1498	4	55	1467	4390	1699	5	105	250	\N
619	Volkswagen Vento Highline 1.5 (D) Dsg	Car	14	18	4	City	/cars/vento.jpg	13.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	Highline 1.5 (D) Dsg	1498	4	55	1467	4390	1699	5	105	250	\N
620	Volkswagen Vento Highline Plus 1.5 (D) Dsg	Car	14	18	4	City	/cars/vento.jpg	13.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	Highline Plus 1.5 (D) Dsg	1498	4	55	1467	4390	1699	5	105	250	\N
625	Land Rover Rover Range Evoque S	Car	55	18	4	Highway	/cars/range-evoque.jpg	54.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	S	1999	4	0	1649	4371	1996	5	179	430	\N
621	Bmw X1 Sdrive20D M Sport	Car	43	18	4	Highway	/cars/x1.jpg	42.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Bmw	Sdrive20D M Sport	1995	4	61	1545	4477	2058	5	187	400	\N
627	Land Rover Rover Range Evoque S Petrol	Car	55	18	4	Highway	/cars/range-evoque.jpg	54.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	S Petrol	1997	4	0	1649	4371	1996	5	245	365	\N
628	Land Rover Rover Range Evoque Se R-Dynamic Petrol	Car	60	18	4	Highway	/cars/range-evoque.jpg	59.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	Se R-Dynamic Petrol	1997	4	0	1649	4371	1996	5	245	365	\N
630	Fiat Punto Evo Pure 1.3	Car	6	18	4	City	/cars/punto-evo-pure.jpg	5.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Fiat	1.3	1248	4	45	1525	3989	1687	5	75	197	\N
631	Hyundai Grand I10 1.2 Kappa Vtvt Magna Cng	Car	7	18	4	City	/cars/grand-i10.jpg	6.53 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Magna Cng	1197	4	43	1520	3765	1660	5	82	114	\N
632	Renault Captur Rxe Petrol	Car	10	18	4	Highway	/cars/captur.jpg	9.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Renault	Rxe Petrol	1498	4	50	1619	4329	1813	5	106	142	\N
633	Renault Captur Rxe Diesel	Car	11	18	4	Highway	/cars/captur.jpg	10.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Renault	Rxe Diesel	1461	4	50	1619	4329	1813	5	110	240	\N
634	Renault Captur Platine Diesel Dual Tone	Car	13	18	4	Highway	/cars/captur.jpg	13.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Renault	Platine Diesel Dual Tone	1461	4	50	1619	4329	1813	5	110	240	\N
635	Renault Captur Platine Petrol Dual Tone	Car	12	18	4	Highway	/cars/captur.jpg	12.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Renault	Platine Petrol Dual Tone	1498	4	50	1619	4329	1813	5	106	142	\N
636	Kia Seltos Hte 1.5	Car	10	18	4	Highway	/cars/seltos.jpg	9.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Hte 1.5	1497	4	60	1645	4315	1800	5	115	144	\N
637	Kia Seltos Gtk 1.4	Car	14	18	4	Highway	/cars/seltos.jpg	13.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Gtk 1.4	1353	4	50	1645	4315	1800	5	140	242	\N
638	Kia Seltos Gtx 1.4	Car	16	18	4	Highway	/cars/seltos.jpg	15.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Gtx 1.4	1353	4	50	1645	4315	1800	5	140	242	\N
639	Kia Seltos Gtx At 1.4	Car	17	18	4	Highway	/cars/seltos.jpg	16.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	SUV	\N	Kia	Gtx At 1.4	1353	4	50	1645	4315	1800	5	140	242	\N
640	Kia Seltos Gtx Plus 1.4	Car	17	18	4	Highway	/cars/seltos.jpg	16.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Kia	Gtx Plus 1.4	1353	4	50	1645	4315	1800	5	140	242	\N
641	Mg Hector 1.5L Style	Car	13	18	4	Highway	/cars/hector.jpg	12.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mg	1.5L Style	1500	4	0	1760	4655	1835	5	141	250	\N
642	Mg Hector 2.0L Style	Car	14	18	4	Highway	/cars/hector.jpg	13.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mg	2.0L Style	2000	4	0	1760	4655	1835	5	168	350	\N
643	Mg Hector 2.0L Super	Car	15	18	4	Highway	/cars/hector.jpg	14.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mg	2.0L Super	2000	4	0	1760	4655	1835	5	168	350	\N
644	Mg Hector 2.0L Smart	Car	16	18	4	Highway	/cars/hector.jpg	15.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mg	2.0L Smart	2000	4	0	1760	4655	1835	5	168	350	\N
645	Mg Hector 2.0L Sharp	Car	18	18	4	Highway	/cars/hector.jpg	17.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mg	2.0L Sharp	2000	4	0	1760	4655	1835	5	168	350	\N
646	Mg Hector 1.5L Super	Car	14	18	4	Highway	/cars/hector.jpg	13.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mg	1.5L Super	1500	4	0	1760	4655	1835	5	141	250	\N
647	Mg Hector 1.5L Super Hybrid	Car	14	18	4	Highway	/cars/hector.jpg	13.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Manual	\N	SUV	\N	Mg	1.5L Super Hybrid	1500	4	0	1760	4655	1835	5	141	250	\N
648	Mg Hector 1.5L Sharp Hybrid	Car	17	18	4	Highway	/cars/hector.jpg	16.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Manual	\N	SUV	\N	Mg	1.5L Sharp Hybrid	1500	4	0	1760	4655	1835	5	141	250	\N
649	Mg Hector 1.5L Smart Hybrid	Car	15	18	4	Highway	/cars/hector.jpg	14.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Manual	\N	SUV	\N	Mg	1.5L Smart Hybrid	1500	4	0	1760	4655	1835	5	141	250	\N
650	Mg Hector 1.5L Smart Dct	Car	16	18	4	Highway	/cars/hector.jpg	15.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	SUV	\N	Mg	1.5L Smart Dct	1500	4	0	1760	4655	1835	5	141	250	\N
651	Mg Hector 1.5L Sharp Dct	Car	18	18	4	Highway	/cars/hector.jpg	17.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	SUV	\N	Mg	1.5L Sharp Dct	1500	4	0	1760	4655	1835	5	141	250	\N
652	Mercedes-Benz Mercedes-Benz C-Class C 220D Prime	Car	41	18	4	City	/cars/mercedes-benz-c-class.jpg	40.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	C 220D Prime	1950	4	66	1442	4686	1810	5	192	400	\N
653	Mercedes-Benz Mercedes-Benz C-Class C 220D Progressive	Car	47	18	4	City	/cars/mercedes-benz-c-class.jpg	46.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	C 220D Progressive	1950	4	66	1442	4686	1810	5	192	400	\N
654	Mercedes-Benz Mercedes-Benz C-Class C 300D Amg Line	Car	50	18	4	City	/cars/mercedes-benz-c-class.jpg	49.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	C 300D Amg Line	1950	4	66	1442	4686	1810	5	241	500	\N
655	Mercedes-Benz Mercedes-Benz C-Class C 200 Prime	Car	41	18	4	City	/cars/mercedes-benz-c-class.jpg	40.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	C 200 Prime	1497	4	66	1442	4686	1810	5	181	280	\N
656	Mercedes-Benz Mercedes-Benz C-Class C 200 Progressive	Car	47	18	4	City	/cars/mercedes-benz-c-class.jpg	46.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	C 200 Progressive	1497	4	66	1442	4686	1810	5	181	280	\N
657	Jaguar F-Pace Prestige Petrol	Car	65	18	4	Highway	/cars/f-pace.jpg	64.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jaguar	Prestige Petrol	1997	4	60	1651	4731	2175	5	247	369	\N
658	Hyundai Grand I10 Nios Era 1.2 Vtvt	Car	6	18	4	City	/cars/grand-i10-nios.jpg	5.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Era 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
659	Hyundai Grand I10 Nios Magna 1.2 Vtvt	Car	6	18	4	City	/cars/grand-i10-nios.jpg	5.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Magna 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
660	Hyundai Grand I10 Nios Magna Amt 1.2 Vtvt	Car	7	18	4	City	/cars/grand-i10-nios.jpg	6.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Hyundai	Magna Amt 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
661	Hyundai Grand I10 Nios Sportz 1.2 Vtvt	Car	7	18	4	City	/cars/grand-i10-nios.jpg	6.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
662	Hyundai Grand I10 Nios Sportz Amt 1.2 Vtvt	Car	8	18	4	City	/cars/grand-i10-nios.jpg	7.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Hyundai	Sportz Amt 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
663	Hyundai Grand I10 Nios Sportz Dual Tone 1.2 Vtvt	Car	7	18	4	City	/cars/grand-i10-nios.jpg	6.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz Dual Tone 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
664	Hyundai Grand I10 Nios Asta 1.2 Vtvt	Car	8	18	4	City	/cars/grand-i10-nios.jpg	7.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Asta 1.2 Vtvt	1197	4	37	1520	3805	1680	5	83	114	\N
665	Nissan Micra Xld (O)	Car	8	18	4	City	/cars/micra.jpg	7.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Nissan	Xld (O)	1461	4	41	1525	3825	1665	5	64	160	\N
666	Maruti Suzuki Ciaz 1.5L Sigma Smart Hybrid	Car	9	18	4	City	/cars/ciaz.jpg	8.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Sigma Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
667	Maruti Suzuki Ciaz 1.5L Delta Smart Hybrid	Car	9	18	4	City	/cars/ciaz.jpg	8.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Delta Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
668	Maruti Suzuki Ciaz 1.5L Alpha Smart Hybrid	Car	10	18	4	City	/cars/ciaz.jpg	9.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	1.5L Alpha Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
669	Maruti Suzuki Ciaz 1.5L Delta At Smart Hybrid	Car	10	18	4	City	/cars/ciaz.jpg	9.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	1.5L Delta At Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
670	Maruti Suzuki Ciaz 1.5L Zeta At Smart Hybrid	Car	11	18	4	City	/cars/ciaz.jpg	10.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	1.5L Zeta At Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
671	Maruti Suzuki Ciaz 1.5L Alpha At Smart Hybrid	Car	11	18	4	City	/cars/ciaz.jpg	10.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	1.5L Alpha At Smart Hybrid	1462	4	43	1485	4490	1730	5	103	138	\N
672	Hyundai Creta Sports Edition Diesel	Car	15	18	4	Highway	/cars/creta.jpg	14.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	Sports Edition Diesel	1582	4	55	1665	4270	1780	5	128	260	\N
673	Nissan Kicks Xl Petrol	Car	10	18	4	Highway	/cars/kicks.jpg	9.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Nissan	Xl Petrol	1498	4	50	1651	4384	1813	5	106	142	\N
674	Nissan Kicks Xv Petrol	Car	11	18	4	Highway	/cars/kicks.jpg	10.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Nissan	Xv Petrol	1498	4	50	1651	4384	1813	5	106	142	\N
675	Nissan Kicks Xl Diesel	Car	12	18	4	Highway	/cars/kicks.jpg	11.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xl Diesel	1461	4	50	1651	4384	1813	5	110	240	\N
676	Nissan Kicks Xv Diesel	Car	13	18	4	Highway	/cars/kicks.jpg	12.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xv Diesel	1461	4	50	1651	4384	1813	5	110	240	\N
677	Nissan Kicks Xv Premium	Car	14	18	4	Highway	/cars/kicks.jpg	13.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xv Premium	1461	4	50	1651	4384	1813	5	110	240	\N
678	Nissan Kicks Xv Premium (O)	Car	15	18	4	Highway	/cars/kicks.jpg	14.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xv Premium (O)	1461	4	50	1651	4384	1813	5	110	240	\N
679	Nissan Kicks Xv Premium (O) Dual Tone	Car	15	18	4	Highway	/cars/kicks.jpg	14.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xv Premium (O) Dual Tone	1461	4	50	1651	4384	1813	5	110	240	\N
680	Nissan Kicks Xe Diesel	Car	10	18	4	Highway	/cars/kicks.jpg	9.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xe Diesel	1461	4	50	1651	4384	1813	5	110	240	\N
681	Toyota Yaris J	Car	10	18	4	City	/cars/yaris.jpg	9.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	J	1496	4	42	1495	4425	1730	5	107	140	\N
682	Toyota Yaris G	Car	11	18	4	City	/cars/yaris.jpg	10.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	G	1496	4	42	1495	4425	1730	5	107	140	\N
683	Toyota Yaris V	Car	12	18	4	City	/cars/yaris.jpg	11.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	V	1498	4	42	1495	4425	1730	5	107	140	\N
684	Toyota Yaris Vx Cvt	Car	15	18	4	City	/cars/yaris.jpg	14.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	Vx Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
685	Toyota Yaris G Cvt	Car	12	18	4	City	/cars/yaris.jpg	11.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	G Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
686	Toyota Yaris J Cvt	Car	11	18	4	City	/cars/yaris.jpg	10.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	J Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
687	Toyota Yaris V Cvt	Car	13	18	4	City	/cars/yaris.jpg	12.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	V Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
688	Toyota Yaris Vx	Car	13	18	4	City	/cars/yaris.jpg	12.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	Vx	1496	4	42	1495	4425	1730	5	107	140	\N
689	Toyota Yaris V (O)	Car	12	18	4	City	/cars/yaris.jpg	11.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	V (O)	1498	4	42	1495	4425	1730	5	107	140	\N
690	Toyota Yaris J (O)	Car	9	18	4	City	/cars/yaris.jpg	8.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	J (O)	1496	4	42	1495	4425	1730	5	107	140	\N
691	Toyota Yaris G (O)	Car	10	18	4	City	/cars/yaris.jpg	9.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	G (O)	1496	4	42	1495	4425	1730	5	107	140	\N
692	Toyota Yaris J (O) Cvt	Car	10	18	4	City	/cars/yaris.jpg	9.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	J (O) Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
693	Toyota Yaris G (O) Cvt	Car	11	18	4	City	/cars/yaris.jpg	10.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	G (O) Cvt	1496	4	42	1495	4425	1730	5	107	140	\N
694	Toyota Yaris V (O) Cvt	Car	14	18	4	City	/cars/yaris.jpg	13.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Toyota	V (O) Cvt	1498	4	42	1495	4425	1730	5	107	140	\N
695	Skoda Octavia Ambition 1.4 Tsi	Car	16	18	4	City	/cars/octavia.jpg	16.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Ambition 1.4 Tsi	1395	4	50	1476	4670	1814	5	140	250	\N
696	Skoda Octavia Ambition 2.0 Tdi Cr	Car	18	18	4	City	/cars/octavia.jpg	18.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	Ambition 2.0 Tdi Cr	1968	4	50	1476	4670	1814	5	143	320	\N
697	Skoda Octavia Style 2.0 Tdi Cr	Car	21	18	4	City	/cars/octavia.jpg	20.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	Style 2.0 Tdi Cr	1968	4	50	1476	4670	1814	5	143	320	\N
698	Skoda Octavia Style 2.0 Tdi Cr At	Car	23	18	4	City	/cars/octavia.jpg	23.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Style 2.0 Tdi Cr At	1968	4	50	1476	4670	1814	5	143	320	\N
699	Skoda Octavia L & K 2.0 Tdi Cr At	Car	24	18	4	City	/cars/octavia.jpg	23.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	L & K 2.0 Tdi Cr At	1968	4	50	1476	4670	1814	5	143	320	\N
700	Skoda Octavia Corporate Edition 2.0 Tdi	Car	17	18	4	City	/cars/octavia.jpg	16.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	Corporate Edition 2.0 Tdi	1968	4	50	1476	4670	1814	5	141	320	\N
701	Skoda Octavia Onyx 1.8 Tsi Dsg	Car	20	18	4	City	/cars/octavia.jpg	20.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Onyx 1.8 Tsi Dsg	1798	4	50	1476	4670	1814	5	180	250	\N
702	Skoda Octavia Onyx 2.0 Tdi Dsg	Car	22	18	4	City	/cars/octavia.jpg	22.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Onyx 2.0 Tdi Dsg	1968	4	50	1476	4670	1814	5	143	320	\N
703	Hyundai Xcent Prime Cng T + (Cng +	Car	6	18	4	City	/cars/xcent-prime.jpg	5.56 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	Sedan	\N	Hyundai	Cng T + (Cng +	1197	4	43	1520	3995	1660	5	83	114	\N
704	Hyundai Xcent Prime T	Car	6	18	4	City	/cars/xcent-prime.jpg	5.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	T	1197	4	43	1520	3995	1660	5	83	114	\N
705	Hyundai Xcent Prime Cng T (Cng +	Car	6	18	4	City	/cars/xcent-prime.jpg	5.37 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	Sedan	\N	Hyundai	Cng T (Cng +	1197	4	43	1520	3995	1660	5	81.8	114	\N
706	Hyundai Xcent Prime T+ Crdi	Car	7	18	4	City	/cars/xcent-prime.jpg	6.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	T+ Crdi	1197	4	43	1520	3995	1660	5	70	114	\N
707	Hyundai Xcent Prime T Crdi	Car	7	18	4	City	/cars/xcent-prime.jpg	6.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	T Crdi	1197	4	43	1520	3995	1660	5	71	114	\N
708	Maruti Suzuki Dzire Tour Lxi Cng	Car	6	18	4	City	/cars/dzire-tour.jpg	5.99 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Sedan	\N	Maruti Suzuki	Lxi Cng	1197	4	42	1555	3995	1695	5	69	115	\N
709	Maruti Suzuki Dzire Lxi	Car	6	18	4	City	/cars/dzire.jpg	5.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	Lxi	1197	4	37	1515	3995	1735	5	84.3	115	\N
710	Maruti Suzuki Dzire Vxi	Car	7	18	4	City	/cars/dzire.jpg	6.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	Vxi	1197	4	37	1515	3995	1735	5	84.3	115	\N
711	Maruti Suzuki Dzire Ldi	Car	7	18	4	City	/cars/dzire.jpg	6.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	Ldi	1248	4	37	1515	3995	1735	5	75	190	\N
712	Maruti Suzuki Dzire Zxi	Car	8	18	4	City	/cars/dzire.jpg	7.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	Zxi	1197	4	37	1515	3995	1735	5	84.3	115	\N
713	Maruti Suzuki Dzire Vdi	Car	8	18	4	City	/cars/dzire.jpg	7.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	Vdi	1248	4	37	1515	3995	1735	5	75	190	\N
714	Maruti Suzuki Dzire Vxi Amt	Car	8	18	4	City	/cars/dzire.jpg	7.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	Vxi Amt	1197	4	37	1515	3995	1735	5	84.3	115	\N
715	Maruti Suzuki Dzire Zdi Amt	Car	9	18	4	City	/cars/dzire.jpg	8.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Maruti Suzuki	Zdi Amt	1248	4	37	1515	3995	1735	5	75	190	\N
716	Maruti Suzuki Dzire Zdi	Car	9	18	4	City	/cars/dzire.jpg	8.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	Zdi	1248	4	37	1515	3995	1735	5	75	190	\N
717	Maruti Suzuki Dzire Zxi Plus	Car	9	18	4	City	/cars/dzire.jpg	8.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	Zxi Plus	1197	4	37	1515	3995	1735	5	84.3	115	\N
718	Maruti Suzuki Dzire Zxi At	Car	8	18	4	City	/cars/dzire.jpg	7.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	Zxi At	1197	4	37	1515	3995	1735	5	84.3	115	\N
719	Maruti Suzuki Dzire Zxi Plus Amt	Car	9	18	4	City	/cars/dzire.jpg	8.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Maruti Suzuki	Zxi Plus Amt	1197	4	37	1515	3995	1735	5	84.3	115	\N
720	Maruti Suzuki Dzire Zdi Plus	Car	10	18	4	City	/cars/dzire.jpg	9.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	Zdi Plus	1248	4	37	1515	3995	1735	5	75	190	\N
721	Maruti Suzuki Dzire Vdi Amt	Car	9	18	4	City	/cars/dzire.jpg	8.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Maruti Suzuki	Vdi Amt	1248	4	37	1515	3995	1735	5	75	190	\N
722	Maruti Suzuki Dzire Zdi Plus Amt	Car	10	18	4	City	/cars/dzire.jpg	9.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Maruti Suzuki	Zdi Plus Amt	1248	4	37	1515	3995	1735	5	75	190	\N
723	Volkswagen Ameo Trendline 1.0L	Car	6	18	4	City	/cars/ameo.jpg	5.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Trendline 1.0L	999	3	45	1483	3995	1682	5	76	95	\N
724	Volkswagen Ameo Comfortline 1.0L	Car	7	18	4	City	/cars/ameo.jpg	6.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Comfortline 1.0L	999	3	45	1483	3995	1682	5	76	95	\N
725	Volkswagen Ameo Highline Plus 1.0L	Car	8	18	4	City	/cars/ameo.jpg	8.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Volkswagen	Highline Plus 1.0L	999	3	45	1483	3995	1682	5	76	95	\N
726	Tata Zest Xma Diesel	Car	9	18	4	City	/cars/zest.jpg	8.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	AMT	\N	Sedan	\N	Tata	Xma Diesel	1248	4	44	1570	3995	1706	5	75	190	\N
727	Honda Amaze S Cvt Petrol	Car	8	18	4	City	/cars/amaze.jpg	7.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	S Cvt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
728	Honda Amaze E Mt Diesel	Car	8	18	4	City	/cars/amaze.jpg	7.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	E Mt Diesel	1498	4	35	1498	3995	1695	5	100	200	\N
729	Honda Amaze E Mt Petrol	Car	6	18	4	City	/cars/amaze.jpg	5.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	E Mt Petrol	1199	4	35	1498	3995	1695	5	90	110	\N
730	Honda Amaze S Cvt Diesel	Car	9	18	4	City	/cars/amaze.jpg	8.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Honda	S Cvt Diesel	1498	4	35	1501	3995	1695	5	80	160	\N
731	Honda Amaze V Cvt Petrol	Car	9	18	4	City	/cars/amaze.jpg	8.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	V Cvt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
732	Honda Amaze V Cvt Diesel	Car	10	18	4	City	/cars/amaze.jpg	9.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Honda	V Cvt Diesel	1498	4	35	1501	3995	1695	5	80	160	\N
733	Honda Amaze S Mt Diesel	Car	8	18	4	City	/cars/amaze.jpg	7.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	S Mt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
734	Honda Amaze Vx Mt Diesel	Car	9	18	4	City	/cars/amaze.jpg	8.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Vx Mt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
735	Honda Amaze V Mt Diesel	Car	9	18	4	City	/cars/amaze.jpg	8.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	V Mt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
736	Honda Amaze Vx Mt Petrol	Car	8	18	4	City	/cars/amaze.jpg	7.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	Vx Mt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
737	Honda Amaze V Mt Petrol	Car	8	18	4	City	/cars/amaze.jpg	7.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	V Mt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
738	Honda Amaze S Mt Petrol	Car	7	18	4	City	/cars/amaze.jpg	6.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	S Mt Petrol	1198	4	35	1501	3995	1695	5	90	110	\N
739	Honda Amaze Exclusive Edition Diesel	Car	10	18	4	City	/cars/amaze.jpg	9.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Exclusive Edition Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
740	Honda Amaze Exclusive Edition Petrol	Car	8	18	4	City	/cars/amaze.jpg	7.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	Exclusive Edition Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
741	Honda Amaze Vx Cvt Diesel	Car	10	18	4	City	/cars/amaze.jpg	9.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Honda	Vx Cvt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
742	Honda Amaze Vx Cvt Petrol	Car	9	18	4	City	/cars/amaze.jpg	8.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	Vx Cvt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
743	Honda Amaze Ace Edition Cvt Diesel	Car	10	18	4	City	/cars/amaze.jpg	9.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Honda	Ace Edition Cvt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
744	Honda Amaze Ace Edition Cvt Petrol	Car	9	18	4	City	/cars/amaze.jpg	8.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	Ace Edition Cvt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
745	Honda Amaze Ace Edition Mt Diesel	Car	10	18	4	City	/cars/amaze.jpg	9.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Ace Edition Mt Diesel	1498	4	35	1501	3995	1695	5	100	200	\N
746	Honda Amaze Ace Edition Mt Petrol	Car	8	18	4	City	/cars/amaze.jpg	7.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	Ace Edition Mt Petrol	1199	4	35	1501	3995	1695	5	90	110	\N
747	Hyundai Venue 1.2 Kappa Mt E	Car	7	18	4	Highway	/cars/venue.jpg	6.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.2 Kappa Mt E	1197	4	45	1590	3995	1770	5	82	112.7	\N
748	Hyundai Venue 1.0 Turbo Gdi Mt S	Car	9	18	4	Highway	/cars/venue.jpg	8.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Mt S	998	4	45	1590	3995	1770	5	117	172	\N
749	Hyundai Venue 1.4 Crdi Mt E	Car	8	18	4	Highway	/cars/venue.jpg	7.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Mt E	1397	4	0	1590	3995	1770	5	89	220	\N
750	Hyundai Venue 1.0 Turbo Gdi Mt Sx	Car	10	18	4	Highway	/cars/venue.jpg	9.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Mt Sx	998	4	45	1590	3995	1770	5	117	172	\N
751	Hyundai Venue 1.0 Turbo Gdi Mt Sx Dual Tone	Car	10	18	4	Highway	/cars/venue.jpg	9.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Mt Sx Dual Tone	998	4	45	1590	3995	1770	5	117	172	\N
752	Hyundai Venue 1.0 Turbo Gdi Mt Sx(O)	Car	11	18	4	Highway	/cars/venue.jpg	10.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Mt Sx(O)	998	4	45	1590	3995	1770	5	117	1712	\N
753	Hyundai Venue 1.0 Turbo Gdi Dct S	Car	10	18	4	Highway	/cars/venue.jpg	9.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Dct S	998	4	45	1590	3995	1770	5	118	172	\N
754	Hyundai Venue 1.0 Turbo Gdi Dct Sx Plus	Car	12	18	4	Highway	/cars/venue.jpg	11.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	DCT	\N	SUV	\N	Hyundai	1.0 Turbo Gdi Dct Sx Plus	998	4	45	1590	3995	1770	5	118	172	\N
755	Hyundai Venue 1.2 Kappa Mt S	Car	8	18	4	Highway	/cars/venue.jpg	7.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	1.2 Kappa Mt S	1197	4	45	1590	3995	1770	5	82	115	\N
756	Hyundai Venue 1.4 Crdi Mt S	Car	9	18	4	Highway	/cars/venue.jpg	8.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Mt S	1397	4	0	1590	3995	1770	5	89	220	\N
757	Hyundai Venue 1.4 Crdi Mt Sx	Car	10	18	4	Highway	/cars/venue.jpg	9.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Mt Sx	1397	4	0	1590	3995	1770	5	89	220	\N
758	Hyundai Venue 1.4 Crdi Mt Sx Dual Tone	Car	10	18	4	Highway	/cars/venue.jpg	9.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Mt Sx Dual Tone	1397	4	0	1590	3995	1770	5	89	220	\N
759	Hyundai Venue 1.4 Crdi Mt Sx(O)	Car	11	18	4	Highway	/cars/venue.jpg	10.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.4 Crdi Mt Sx(O)	1397	4	45	1590	3995	1770	5	90	22.4	\N
760	Mahindra Bolero Power Plus Zlx	Car	9	18	4	Highway	/cars/bolero-power-plus.jpg	8.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Zlx	1493	4	60	1880	3995	1745	7	70	195	\N
761	Mahindra Bolero Power Plus Slx	Car	9	18	4	Highway	/cars/bolero-power-plus.jpg	8.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Slx	1493	4	60	1880	3995	1745	7	70	195	\N
762	Mahindra Bolero Power Plus Sle	Car	8	18	4	Highway	/cars/bolero-power-plus.jpg	7.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Sle	1493	4	60	1880	3995	1745	7	70	195	\N
763	Mahindra Bolero Power Plus Lx	Car	8	18	4	Highway	/cars/bolero-power-plus.jpg	7.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Lx	1493	4	60	1880	3995	1745	7	70	195	\N
764	Hyundai I20 Active 1.2 S	Car	8	18	4	City	/cars/i20-active.jpg	7.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 S	1197	4	40	1555	3995	1760	5	83	114	\N
765	Hyundai I20 Active 1.4 Sx	Car	10	18	4	City	/cars/i20-active.jpg	9.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	1.4 Sx	1396	4	40	1555	3995	1760	5	90	220	\N
766	Mahindra Xuv300 1.2 W4	Car	9	18	4	Highway	/cars/xuv300.jpg	8.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mahindra	1.2 W4	1197	0	42	1617	3995	1821	5	109	200	\N
767	Mahindra Xuv300 1.2 W6	Car	10	18	4	Highway	/cars/xuv300.jpg	9.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mahindra	1.2 W6	1197	0	42	1617	3995	1821	5	109	200	\N
768	Mahindra Xuv300 1.2 W8	Car	11	18	4	Highway	/cars/xuv300.jpg	10.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mahindra	1.2 W8	1197	0	42	1617	3995	1821	5	109	200	\N
769	Mahindra Xuv300 1.2 W8(O)	Car	12	18	4	Highway	/cars/xuv300.jpg	11.84 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Mahindra	1.2 W8(O)	1197	0	42	1617	3995	1821	5	109	200	\N
770	Mahindra Xuv300 1.5 W4	Car	9	18	4	Highway	/cars/xuv300.jpg	8.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	1.5 W4	1497	0	42	1617	3995	1821	5	115	300	\N
771	Mahindra Xuv300 1.5 W6	Car	10	18	4	Highway	/cars/xuv300.jpg	9.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	1.5 W6	1497	0	42	1617	3995	1821	5	115	300	\N
772	Mahindra Xuv300 1.5 W8	Car	11	18	4	Highway	/cars/xuv300.jpg	10.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	1.5 W8	1497	0	42	1617	3995	1821	5	115	300	\N
773	Mahindra Xuv300 1.5 W8 (O)	Car	13	18	4	Highway	/cars/xuv300.jpg	12.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	1.5 W8 (O)	1497	0	42	1617	3995	1821	5	115	300	\N
774	Mahindra Xuv300 1.5 W8 Amt	Car	12	18	4	Highway	/cars/xuv300.jpg	11.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	1.5 W8 Amt	1497	0	42	1617	3995	1821	5	115	300	\N
775	Mahindra Xuv300 1.5 W8 (O) Amt	Car	13	18	4	Highway	/cars/xuv300.jpg	12.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	1.5 W8 (O) Amt	1497	0	42	1617	3995	1821	5	115	300	\N
776	Mahindra Xuv300 1.5 W6 Amt	Car	10	18	4	Highway	/cars/xuv300.jpg	9.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	AMT	\N	SUV	\N	Mahindra	1.5 W6 Amt	1497	4	42	1617	3995	1821	5	115	300	\N
777	Mercedes-Benz Go+ Datsun A (O)	Car	6	18	4	City	/cars/go+.jpg	5.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun A (O)	1198	3	35	1507	3995	1635	7	68	104	\N
778	Mercedes-Benz Go+ Datsun A	Car	6	18	4	City	/cars/go+.jpg	5.01 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun A	1198	3	35	1507	3995	1635	7	68	104	\N
779	Maruti Suzuki Baleno 1.3 Delta	Car	8	18	4	City	/cars/baleno.jpg	7.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	1.3 Delta	1248	4	37	1510	3995	1745	5	75	190	\N
780	Maruti Suzuki Baleno 1.3 Alpha	Car	9	18	4	City	/cars/baleno.jpg	8.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	1.3 Alpha	1248	4	37	1500	3995	1745	5	75	190	\N
781	Maruti Suzuki Baleno 1.3 Sigma	Car	7	18	4	City	/cars/baleno.jpg	6.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	1.3 Sigma	1248	4	37	1500	3995	1745	5	75	190	\N
782	Maruti Suzuki Baleno 1.3 Zeta	Car	9	18	4	City	/cars/baleno.jpg	8.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Maruti Suzuki	1.3 Zeta	1248	4	37	1500	3995	1745	5	75	190	\N
783	Maruti Suzuki Baleno 1.2 Alpha	Car	8	18	4	City	/cars/baleno.jpg	7.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Alpha	1197	4	37	1510	3995	1745	5	83	115	\N
785	Maruti Suzuki Baleno 1.2 Delta	Car	7	18	4	City	/cars/baleno.jpg	6.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Delta	1197	4	37	1510	3995	1745	5	83	115	\N
786	Maruti Suzuki Baleno 1.2 Delta Cvt	Car	8	18	4	City	/cars/baleno.jpg	7.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	1.2 Delta Cvt	1197	4	37	1510	3995	1745	5	83	115	\N
787	Maruti Suzuki Baleno 1.2 Sigma	Car	6	18	4	City	/cars/baleno.jpg	5.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Sigma	1197	4	37	1510	3995	1745	5	83	115	\N
788	Maruti Suzuki Baleno 1.2 Zeta	Car	7	18	4	City	/cars/baleno.jpg	6.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Zeta	1197	4	37	1510	3995	1745	5	83	115	\N
789	Maruti Suzuki Baleno 1.2 Delta Dualjet	Car	8	18	4	City	/cars/baleno.jpg	7.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Delta Dualjet	1197	4	37	1510	3995	1745	5	83	115	\N
790	Maruti Suzuki Baleno 1.2 Zeta Dualjet	Car	8	18	4	City	/cars/baleno.jpg	7.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	1.2 Zeta Dualjet	1197	4	37	1510	3995	1745	5	83	115	\N
791	Maruti Suzuki Baleno 1.2 Zeta Cvt	Car	9	18	4	City	/cars/baleno.jpg	8.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	1.2 Zeta Cvt	1197	4	37	1510	3995	1745	5	83	115	\N
792	Maruti Suzuki Baleno Rs Rs 1.0	Car	8	18	4	City	/cars/baleno-rs.jpg	7.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Rs 1.0	998	3	37	1510	3995	1745	5	102	150	\N
793	Mahindra Tuv300 T4 Plus	Car	9	18	4	Highway	/cars/tuv300.jpg	8.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T4 Plus	1493	3	60	1817	3995	1835	7	84	240	\N
794	Mahindra Tuv300 T6 Plus	Car	10	18	4	Highway	/cars/tuv300.jpg	9.14 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T6 Plus	1493	3	60	1817	3995	1835	7	84	240	\N
795	Mahindra Tuv300 T8	Car	10	18	4	Highway	/cars/tuv300.jpg	9.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T8	1493	3	60	1817	3995	1835	7	84	240	\N
796	Mahindra Tuv300 T10	Car	10	18	4	Highway	/cars/tuv300.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T10	1493	3	60	1839	3995	1835	7	100	240	\N
797	Mahindra Tuv300 T10 (O)	Car	11	18	4	Highway	/cars/tuv300.jpg	10.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T10 (O)	1493	3	60	1839	3995	1835	7	100	240	\N
798	Mahindra Tuv300 T10 Dual Tone	Car	11	18	4	Highway	/cars/tuv300.jpg	10.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T10 Dual Tone	1493	3	60	1839	3995	1835	7	100	240	\N
799	Mahindra Tuv300 T10 (O) Dual Tone	Car	11	18	4	Highway	/cars/tuv300.jpg	10.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	T10 (O) Dual Tone	1493	3	60	1839	3995	1835	7	100	240	\N
800	Hyundai Xcent S 1.2	Car	7	18	4	City	/cars/xcent.jpg	6.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	S 1.2	1197	4	43	1520	3995	1660	5	83	114	\N
801	Hyundai Xcent S At 1.2	Car	8	18	4	City	/cars/xcent.jpg	7.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Hyundai	S At 1.2	1197	4	43	1520	3995	1660	5	82	114	\N
802	Hyundai Xcent Sx 1.2	Car	8	18	4	City	/cars/xcent.jpg	7.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx 1.2	1197	4	43	1520	3995	1660	5	82	114	\N
803	Hyundai Xcent Sx 1.2 (O)	Car	8	18	4	City	/cars/xcent.jpg	7.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx 1.2 (O)	1197	4	43	1520	3995	1660	5	82	114	\N
804	Hyundai Xcent S 1.2 Crdi	Car	8	18	4	City	/cars/xcent.jpg	7.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	S 1.2 Crdi	1120	3	43	1520	3995	1660	5	72	180	\N
805	Hyundai Xcent E	Car	6	18	4	City	/cars/xcent.jpg	5.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	E	1197	4	43	1520	3995	1660	5	83	114	\N
806	Hyundai Xcent Sx 1.2 Crdi	Car	8	18	4	City	/cars/xcent.jpg	7.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	Sx 1.2 Crdi	1120	3	43	1520	3995	1660	5	75	190	\N
807	Hyundai Xcent Sx 1.2 Crdi (O)	Car	9	18	4	City	/cars/xcent.jpg	8.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	Sx 1.2 Crdi (O)	1120	3	43	1520	3995	1660	5	72	190	\N
808	Hyundai Xcent E Crdi	Car	7	18	4	City	/cars/xcent.jpg	6.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	E Crdi	1197	4	43	1520	3995	1660	5	75	190	\N
809	Maruti Suzuki Eeco 7 Str	Car	4	18	4	City	/cars/eeco.jpg	3.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	7 Str	1196	4	40	1800	3675	1475	7	74	101	\N
810	Dc Avanti Standard	Car	35	18	4	City	/cars/avanti.jpg	34.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Coupe	\N	Dc	Standard	2000	4	60	1200	4565	2120	2	250	340	\N
811	Ford Mustang Fastback V8	Car	75	18	4	City	/cars/mustang.jpg	74.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe, Sedan	\N	Ford	Fastback V8	4951	8	60.9	1391	4784	2080	4	401	515	\N
812	Mercedes-Benz Mercedes-Benz E-Class Cabriolet E400	Car	78	18	4	City	/cars/mercedes-benz-e-class-cabriolet.jpg	77.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Not Mentioned	\N	Convertible	\N	Mercedes-Benz	E400	2996	6	80	1398	4703	1786	4	334	480	\N
814	Porsche 718 Boxster	Car	90	18	4	City	/cars/718.jpg	89.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Porsche	Boxster	1988	4	54	1281	4379	1801	2	300	380	\N
815	Porsche 718 Cayman	Car	86	18	4	City	/cars/718.jpg	85.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Porsche	Cayman	1988	4	54	1281	4379	1801	2	300	380	\N
821	Maserati Quattroporte Granlusso	Car	179	18	4	City	/cars/quattroporte.jpg	179.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sports	\N	Maserati	Granlusso	2987	6	70	1481	5262	1948	4	275	600	\N
822	Mercedes-Benz Mercedes-Benz Maybach S560	Car	199	18	4	City	/cars/mercedes-benz-maybach.jpg	198.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	S560	4663	8	80	1494	5246	1899	4	453	700	\N
823	Porsche Panamera Turbo	Car	213	18	4	City	/cars/panamera.jpg	212.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Porsche	Turbo	3996	8	90	1427	5049	1937	4	550	770	\N
824	Porsche Panamera Turbo Executive	Car	227	18	4	City	/cars/panamera.jpg	226.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Porsche	Turbo Executive	3996	8	90	1432	5199	1937	4	550	770	\N
825	Porsche Panamera Turbo Sport Turismo	Car	218	18	4	City	/cars/panamera.jpg	217.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Porsche	Turbo Sport Turismo	3996	8	90	1432	5049	1937	4	550	770	\N
826	Mercedes-Benz Mercedes-Benz S-Class Cabriolet S500	Car	235	18	4	City	/cars/mercedes-benz-s-class-cabriolet.jpg	234.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Mercedes-Benz	S500	4663	8	80	1417	5027	1899	4	455	700	\N
829	Ferrari Portofino V8 Convertible	Car	350	18	4	City	/cars/portofino.jpg	350.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Ferrari	V8 Convertible	3855	8	92	1320	4569	1910	2	560	755	\N
830	Ferrari 458 Speciale Coupe	Car	426	18	4	City	/cars/458-speciale.jpg	425.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	Coupe	4497	8	86	1203	4571	1951	2	605	540	\N
831	Mercedes-Benz Rolls-Royce Wraith Coupe	Car	501	18	4	City	/cars/rolls-royce-wraith.jpg	500.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	Coupe	6592	12	83	1507	5269	1947	4	625	800	\N
833	Mercedes-Benz Rolls-Royce Phantom Coupe 6.8 L	Car	774	18	4	City	/cars/rolls-royce-phantom-coupe.jpg	773.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	6.8 L	6749	12	100	1598	5612	1987	4	460	720	\N
834	Mahindra Kuv100 Nxt K2 6Str	Car	5	18	4	City	/cars/kuv100-nxt.jpg	4.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K2 6Str	1198	3	35	1655	3700	1735	6	82	115	\N
835	Mahindra Kuv100 Nxt K2+ 6Str	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K2+ 6Str	1198	3	35	1655	3700	1735	6	82	115	\N
836	Mahindra Kuv100 Nxt K2 D 6Str	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K2 D 6Str	1198	3	35	1655	3700	1735	6	77	190	\N
837	Mahindra Kuv100 Nxt K2+ D 6Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K2+ D 6Str	1198	3	35	1655	3700	1735	6	77	190	\N
838	Mahindra Kuv100 Nxt K4+ D 6Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K4+ D 6Str	1198	3	35	1655	3700	1735	6	77	190	\N
839	Mahindra Kuv100 Nxt K4+ 6Str	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K4+ 6Str	1198	3	35	1655	3700	1735	6	82	115	\N
840	Mahindra Kuv100 Nxt K6+ 6Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K6+ 6Str	1198	3	35	1655	3700	1735	6	82	115	\N
841	Mahindra Kuv100 Nxt K6+ D 6Str	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K6+ D 6Str	1198	3	35	1655	3700	1735	6	77	190	\N
842	Mahindra Kuv100 Nxt K8 6Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K8 6Str	1198	3	35	1655	3700	1735	6	82	115	\N
843	Mahindra Kuv100 Nxt K8 D 6Str	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K8 D 6Str	1198	3	35	1655	3700	1735	6	77	190	\N
844	Mahindra Kuv100 Nxt K8 6 Str Dual Tone	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.01 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K8 6 Str Dual Tone	1198	3	35	1655	3700	1735	6	82	115	\N
845	Mahindra Kuv100 Nxt K8 D 6 Str Dual Tone	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K8 D 6 Str Dual Tone	1198	3	35	1655	3700	1735	6	77	190	\N
828	Bentley Continental Gt Coupe	Car	338	18	4	City	/cars/continental-gt.jpg	337.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Bentley	Coupe	5998	12	90	1401	4807	2226	4	590	720	\N
817	Bmw 7-Series 730Ld Design Pure Excellence Signature	Car	132	18	4	City	/cars/7-series.jpg	132.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Bmw	730Ld Design Pure Excellence Signature	2993	6	78	1479	5120	2169	4	265	620	\N
849	Mercedes-Benz Mercedes-Benz E-Class E 63 S Amg	Car	150	18	4	City	/cars/mercedes-benz-e-class.jpg	150.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	E 63 S Amg	5461	8	80	1474	4879	1854	4	549	720	\N
851	Maserati Grancabrio Standard	Car	199	18	4	City	/cars/grancabrio.jpg	198.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Maserati	Standard	4691	8	75	1353	4881	2056	4	450	510	\N
852	Ferrari 488 Gtb Std	Car	368	18	4	City	/cars/488-gtb.jpg	367.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	Std	3902	8	78	1213	4568	1952	2	670	760	\N
853	Ferrari 488 Gtb Spider	Car	394	18	4	City	/cars/488-gtb.jpg	393.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	Spider	3902	8	78	1213	4568	1952	2	670	760	\N
854	Lamborghini Aventador Lp 700-4	Car	479	18	4	City	/cars/aventador.jpg	478.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Lamborghini	Lp 700-4	6498	12	90	1136	4780	2030	2	700	690	\N
855	Lamborghini Aventador Lp700-4 Roadster	Car	533	18	4	City	/cars/aventador.jpg	532.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Lamborghini	Lp700-4 Roadster	6498	12	90	1136	4780	2030	2	700	690	\N
856	Lamborghini Aventador S	Car	475	18	4	City	/cars/aventador.jpg	474.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	S	6498	12	90	1136	4797	2030	2	740	690	\N
857	Mercedes-Benz Rolls-Royce Dawn Convertible	Car	593	18	4	City	/cars/rolls-royce-dawn.jpg	592.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Mercedes-Benz	Convertible	6598	12	80	1502	5285	1947	4	571	780	\N
858	Mercedes-Benz Rolls-Royce Drophead Coupe Phantom	Car	838	18	4	City	/cars/rolls-royce-drophead-coupe.jpg	837.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Mercedes-Benz	Phantom	6749	12	100	1638	5842	1990	4	453	720	\N
859	Maruti Suzuki Omni E 8 Str Bs-Iv	Car	3	18	4	City	/cars/omni.jpg	2.84 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	E 8 Str Bs-Iv	796	3	36	1640	3370	1410	8	34.7	59	\N
860	Mercedes-Benz Go+ Datsun D	Car	5	18	4	City	/cars/go+.jpg	4.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun D	1198	3	35	1507	3995	1635	7	68	104	\N
861	Mercedes-Benz Go+ Datsun T	Car	6	18	4	City	/cars/go+.jpg	5.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T	1198	3	35	1507	3995	1635	7	68	104	\N
862	Mercedes-Benz Go+ Datsun T (O)	Car	6	18	4	City	/cars/go+.jpg	5.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T (O)	1198	3	35	1507	3995	1635	7	68	104	\N
863	Mercedes-Benz Go+ Datsun T Vdc	Car	6	18	4	City	/cars/go+.jpg	5.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T Vdc	1198	3	35	1507	3995	1635	7	68	104	\N
864	Mercedes-Benz Go+ Datsun T (O) Vdc	Car	7	18	4	City	/cars/go+.jpg	6.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T (O) Vdc	1198	3	35	1507	3995	1635	7	68	104	\N
865	Mercedes-Benz Go+ Datsun T Cvt	Car	7	18	4	City	/cars/go+.jpg	6.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T Cvt	1198	3	35	1507	3995	1635	7	78	104	\N
866	Mercedes-Benz Go+ Datsun T (O) Cvt	Car	7	18	4	City	/cars/go+.jpg	6.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Mercedes-Benz	Datsun T (O) Cvt	1198	3	35	1507	3995	1635	7	78	104	\N
868	Porsche 911 Carrera S	Car	175	18	4	City	/cars/911.jpg	174.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Porsche	Carrera S	2981	6	64	1300	4519	1852	4	450	530	\N
869	Porsche 911 Carrera S Cabriolet	Car	189	18	4	City	/cars/911.jpg	188.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible	\N	Porsche	Carrera S Cabriolet	2981	6	64	1299	4519	1852	4	450	530	\N
873	Jaguar F-Type 5.0 Coupe R	Car	222	18	4	City	/cars/f-type.jpg	221.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Jaguar	5.0 Coupe R	5000	6	72	1308	4470	2042	2	550	680	\N
874	Ferrari 458 Spider V8	Car	434	18	4	City	/cars/458-spider.jpg	433.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Convertible, Coupe	\N	Ferrari	V8	3902	8	86	1211	4568	1952	2	669	760	\N
875	Bentley Flying Spur V8	Car	342	18	4	City	/cars/flying-spur.jpg	341.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bentley	V8	3993	8	90	1488	5299	2207	4	507	660	\N
876	Bentley Flying Spur W12	Car	394	18	4	City	/cars/flying-spur.jpg	393.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Bentley	W12	5998	12	90	1488	5299	2207	4	616	800	\N
878	Mercedes-Benz Mercedes-Benz Gls 400 4Matic	Car	88	18	4	Highway	/cars/mercedes-benz-gls.jpg	87.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	400 4Matic	2996	8	80	1850	5146	1982	7	333	480	\N
879	Mercedes-Benz Mercedes-Benz Gls Grand Edition Petrol	Car	87	18	4	Highway	/cars/mercedes-benz-gls.jpg	86.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	Grand Edition Petrol	2996	8	80	1850	5146	1982	7	333	480	\N
880	Maserati Levante Diesel	Car	146	18	4	Highway	/cars/levante.jpg	145.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maserati	Diesel	2987	6	80	1679	5003	2158	4	275	600	\N
881	Maserati Levante Gransport	Car	149	18	4	Highway	/cars/levante.jpg	148.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maserati	Gransport	2979	6	80	1679	5003	2158	4	350	500	\N
882	Maserati Levante Granlusson	Car	154	18	4	Highway	/cars/levante.jpg	153.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maserati	Granlusson	2979	6	80	1679	5003	2158	4	430	580	\N
883	Tata Hexa Xt 4X4	Car	20	18	4	Highway	/cars/hexa.jpg	19.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xt 4X4	2179	0	60	1791	4788	1903	6	156	320	\N
884	Ford Endeavour 3.2L 4X4 At Titanium Plus	Car	35	18	4	Highway	/cars/endeavour.jpg	34.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Ford	3.2L 4X4 At Titanium Plus	3198	5	80	1837	4903	1869	7	200	470	\N
888	Land Rover Rover Range Sport 4.4L Sdv8 Hse Diesel	Car	150	18	4	Highway	/cars/range-sport.jpg	149.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	4.4L Sdv8 Hse Diesel	4367	8	105	1803	4879	2220	7	335	740	\N
889	Toyota Land Cruiser Vx	Car	147	18	4	Highway	/cars/land-cruiser.jpg	146.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Toyota	Vx	4461	8	93	1910	4950	1980	7	265	650	\N
890	Land Rover Rover Range 5.0L V8 Autobiography Petrol	Car	261	18	4	Highway	/cars/range.jpg	260.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	5.0L V8 Autobiography Petrol	4999	8	105	1877	4999	2034	7	518	625	\N
891	Land Rover Rover Range 3.0L V6 Vogue Lwb Petrol	Car	196	18	4	Highway	/cars/range.jpg	195.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	3.0L V6 Vogue Lwb Petrol	2995	6	85	1840	5199	2220	7	335	450	\N
892	Land Rover Rover Range 4.4L Sdv8 Svautobiography Lwb Diesel	Car	393	18	4	Highway	/cars/range.jpg	392.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	4.4L Sdv8 Svautobiography Lwb Diesel	4367	8	0	1868	5200	2073	4	335	740	\N
893	Land Rover Rover Range 3.0L V6 Vogue Se Lwb Petrol	Car	214	18	4	Highway	/cars/range.jpg	213.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	3.0L V6 Vogue Se Lwb Petrol	2995	6	85	1840	5199	2220	7	335	450	\N
894	Mahindra Nuvosport N4	Car	8	18	4	Highway	/cars/nuvosport.jpg	7.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	N4	1493	3	60	1870	3985	1850	7	100	240	\N
895	Mahindra Nuvosport N6	Car	10	18	4	Highway	/cars/nuvosport.jpg	9.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	N6	1493	3	60	1870	3985	1850	7	100	240	\N
896	Mahindra Nuvosport N8	Car	10	18	4	Highway	/cars/nuvosport.jpg	9.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	N8	1493	3	60	1870	3985	1850	7	100	240	\N
897	Mahindra Nuvosport N4 +	Car	9	18	4	Highway	/cars/nuvosport.jpg	8.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	N4 +	1493	3	0	1870	3985	1850	7	100	240	\N
898	Mahindra Nuvosport N6 Amt	Car	10	18	4	Highway	/cars/nuvosport.jpg	9.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	N6 Amt	1493	3	60	1870	3985	1850	7	100	240	\N
899	Mahindra Nuvosport N8 Amt	Car	11	18	4	Highway	/cars/nuvosport.jpg	10.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mahindra	N8 Amt	1493	3	60	1870	3985	1850	7	100	240	\N
900	Isuzu Mu-X 4X2	Car	28	18	4	Highway	/cars/mu-x.jpg	27.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Isuzu	4X2	2999	4	76	1840	4825	1860	7	177	380	\N
901	Isuzu Mu-X 4X4	Car	30	18	4	Highway	/cars/mu-x.jpg	29.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Isuzu	4X4	2999	4	76	1840	4825	1860	7	177	380	\N
902	Toyota Land Cruiser Prado Vx L	Car	97	18	4	Highway	/cars/land-cruiser-prado.jpg	96.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Toyota	Vx L	2982	4	87	1880	4840	1885	7	173	410	\N
903	Icml Extreme Ld Di Non Ac 9 Seater Bsiii	Car	7	18	4	Highway	/cars/extreme.jpg	6.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Ld Di Non Ac 9 Seater Bsiii	1994	4	50	1885	4440	0	9	101.4	240	\N
904	Icml Extreme Ld Crdfi Non Ac 9 Seater Bsiv	Car	6	18	4	Highway	/cars/extreme.jpg	5.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Ld Crdfi Non Ac 9 Seater Bsiv	1994	4	50	1885	4440	0	9	122	270	\N
905	Icml Extreme Ld Di Ps Ac 9 Seater Bsiii	Car	7	18	4	Highway	/cars/extreme.jpg	6.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Ld Di Ps Ac 9 Seater Bsiii	1994	4	50	1885	4440	0	9	122	270	\N
906	Icml Extreme Ld Crdfi Ps Ac 9 Seater Bsiii	Car	8	18	4	Highway	/cars/extreme.jpg	7.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Ld Crdfi Ps Ac 9 Seater Bsiii	1994	4	50	1885	4440	0	9	122	270	\N
939	Tata Hexa Xt 4X2	Car	18	18	4	Highway	/cars/hexa.jpg	17.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xt 4X2	2179	4	0	1791	4788	1903	6	156	400	\N
907	Icml Extreme Sd Di 9 Seater Bsiii	Car	27	18	4	Highway	/cars/extreme.jpg	26.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Sd Di 9 Seater Bsiii	1994	4	50	1885	4440	0	9	101.4	240	\N
908	Icml Extreme Ld Crdfi Ps Ac 9 Seater Bsiv	Car	7	18	4	Highway	/cars/extreme.jpg	6.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Ld Crdfi Ps Ac 9 Seater Bsiv	1994	4	50	1885	4440	0	9	122	270	\N
909	Icml Extreme Vd Crdfi 7 Seater Bsiii	Car	10	18	4	Highway	/cars/extreme.jpg	9.01 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Vd Crdfi 7 Seater Bsiii	1994	4	50	1885	4440	0	7	122	270	\N
910	Icml Extreme Vd Di 7 Seater Bsiii	Car	15	18	4	Highway	/cars/extreme.jpg	14.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Vd Di 7 Seater Bsiii	1994	4	50	1885	4440	0	7	101.4	240	\N
911	Icml Extreme Sd Crdfi 9 Seater Bsiv	Car	6	18	4	Highway	/cars/extreme.jpg	5.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Sd Crdfi 9 Seater Bsiv	1994	4	50	1885	4440	0	9	122	270	\N
912	Icml Extreme Vd Crdfi 7 Seater Bsiv	Car	10	18	4	Highway	/cars/extreme.jpg	9.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Vd Crdfi 7 Seater Bsiv	1994	4	50	1885	4440	0	7	122	270	\N
913	Icml Extreme Sd Crdfi 9 Seater Bsiii	Car	9	18	4	Highway	/cars/extreme.jpg	8.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Icml	Sd Crdfi 9 Seater Bsiii	1994	4	50	1885	4440	0	9	122	270	\N
914	Maruti Suzuki Gypsy Hard Top	Car	7	18	4	Highway	/cars/gypsy.jpg	6.37 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Maruti Suzuki	Hard Top	1298	4	40	1875	4010	1540	8	80	103	\N
915	Maruti Suzuki Gypsy Soft Top	Car	7	18	4	Highway	/cars/gypsy.jpg	6.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Maruti Suzuki	Soft Top	1298	4	40	1845	4010	1540	8	80	103	\N
916	Mahindra Bolero Power Plus Plus Ac Bs4 Ps	Car	9	18	4	Highway	/cars/bolero-power-plus.jpg	8.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Plus Ac Bs4 Ps	2523	4	60	1977	4494	1745	7	63	0	\N
917	Mahindra Bolero Power Plus Plus Non Ac Bs4 Ps	Car	9	18	4	Highway	/cars/bolero-power-plus.jpg	8.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Plus Non Ac Bs4 Ps	2523	4	60	1977	4440	1660	9	63.9	195	\N
918	Honda Brv E Petrol	Car	10	18	4	Highway	/cars/brv.jpg	9.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	E Petrol	1497	4	42	1666	4453	1735	7	119	145	\N
919	Honda Brv S Petrol	Car	11	18	4	Highway	/cars/brv.jpg	10.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	S Petrol	1497	4	42	1666	4453	1735	7	119	145	\N
920	Honda Brv V Petrol	Car	12	18	4	Highway	/cars/brv.jpg	11.68 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	V Petrol	1497	4	42	1666	4453	1735	7	119	145	\N
921	Honda Brv Vx Petrol	Car	13	18	4	Highway	/cars/brv.jpg	12.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	Vx Petrol	1497	4	42	1666	4456	1735	7	119	145	\N
922	Honda Brv V Cvt Petrol	Car	13	18	4	Highway	/cars/brv.jpg	12.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Honda	V Cvt Petrol	1497	4	42	1666	4456	1735	7	119	145	\N
923	Honda Brv S Diesel	Car	12	18	4	Highway	/cars/brv.jpg	11.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	S Diesel	1498	4	42	1666	4453	1735	7	100	200	\N
924	Honda Brv V Diesel	Car	13	18	4	Highway	/cars/brv.jpg	12.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	V Diesel	1498	4	42	1666	4453	1735	7	100	200	\N
925	Honda Brv Vx Diesel	Car	14	18	4	Highway	/cars/brv.jpg	13.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Honda	Vx Diesel	1498	4	42	1666	4456	1735	7	100	200	\N
926	Force Gurkha Xpedition 5 Door	Car	10	18	4	Highway	/cars/gurkha.jpg	9.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xpedition 5 Door	2596	4	63	2055	4342	1790	7	85	230	\N
927	Force Gurkha Xpedition 3 Door	Car	10	18	4	Highway	/cars/gurkha.jpg	9.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xpedition 3 Door	2596	4	63	2055	4342	1790	7	85	230	\N
928	Mahindra Scorpio S3 2Wd	Car	10	18	4	Highway	/cars/scorpio.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S3 2Wd	2523	4	60	1930	4456	1820	9	75	200	\N
929	Mahindra Scorpio S5 2Wd	Car	13	18	4	Highway	/cars/scorpio.jpg	12.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S5 2Wd	2179	4	60	1995	4456	1820	9	120	280	\N
930	Mahindra Scorpio S7 120 2Wd	Car	14	18	4	Highway	/cars/scorpio.jpg	13.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S7 120 2Wd	2179	4	60	1995	4456	1820	9	120	280	\N
931	Mahindra Scorpio S7 140 2Wd	Car	14	18	4	Highway	/cars/scorpio.jpg	13.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S7 140 2Wd	2179	4	60	1995	4456	1820	9	140	320	\N
932	Mahindra Scorpio S11 2Wd	Car	16	18	4	Highway	/cars/scorpio.jpg	15.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S11 2Wd	2179	4	60	1995	4456	1820	9	140	320	\N
933	Mahindra Scorpio S11 4Wd	Car	17	18	4	Highway	/cars/scorpio.jpg	16.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S11 4Wd	2179	4	60	1995	4456	1820	9	140	320	\N
934	Mahindra Scorpio S9 2Wd	Car	15	18	4	Highway	/cars/scorpio.jpg	14.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	S9 2Wd	2179	4	60	1995	4456	1820	9	140	320	\N
935	Mahindra Xuv500 W7	Car	15	18	4	Highway	/cars/xuv500.jpg	14.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W7	2179	4	70	1785	4585	1890	7	155	330	\N
936	Mahindra Xuv500 W7	Car	15	18	4	Highway	/cars/xuv500.jpg	14.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	W7	2179	4	70	1785	4585	1890	7	155	330	\N
937	Tata Hexa Xm Plus 4X2	Car	17	18	4	Highway	/cars/hexa.jpg	16.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xm Plus 4X2	2179	4	60	1791	4788	1903	7	156	400	\N
938	Tata Hexa Xta 4X2	Car	20	18	4	Highway	/cars/hexa.jpg	19.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xta 4X2	2179	4	60	1791	4788	1903	6	156	400	\N
940	Tata Hexa Xe 4X2	Car	14	18	4	Highway	/cars/hexa.jpg	13.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xe 4X2	2179	4	60	1791	4788	1903	7	150	320	\N
941	Tata Hexa Xm 4X2	Car	16	18	4	Highway	/cars/hexa.jpg	15.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	Xm 4X2	2179	4	60	1791	4788	1903	7	156	400	\N
942	Tata Hexa Xma 4X2	Car	17	18	4	Highway	/cars/hexa.jpg	16.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xma 4X2	2179	4	0	1791	4788	1903	7	156	400	\N
943	Toyota Fortuner 2.8 4X2 At	Car	33	18	4	Highway	/cars/fortuner.jpg	32.05 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Toyota	2.8 4X2 At	2755	4	80	1835	4795	1855	7	177	450	\N
944	Toyota Fortuner 2.8 4X2 Mt	Car	31	18	4	Highway	/cars/fortuner.jpg	30.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Toyota	2.8 4X2 Mt	2755	4	80	1835	4795	1855	7	177	420	\N
945	Toyota Fortuner 2.8 4X4 Mt	Car	33	18	4	Highway	/cars/fortuner.jpg	32.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Toyota	2.8 4X4 Mt	2755	4	80	1835	4795	1855	7	177	420	\N
946	Toyota Fortuner 2.8 4X4 At	Car	34	18	4	Highway	/cars/fortuner.jpg	33.95 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Toyota	2.8 4X4 At	2755	4	80	1835	4795	1855	7	177	450	\N
947	Toyota Fortuner 2.7 4X2 At	Car	30	18	4	Highway	/cars/fortuner.jpg	29.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Toyota	2.7 4X2 At	2694	4	80	1835	4795	1855	7	166	245	\N
948	Toyota Fortuner 2.7 4X2 Mt	Car	29	18	4	Highway	/cars/fortuner.jpg	28.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Toyota	2.7 4X2 Mt	2694	4	80	1835	4795	1855	7	166	245	\N
949	Toyota Fortuner Trd Celebratory Edition	Car	35	18	4	Highway	/cars/fortuner.jpg	34.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Toyota	Trd Celebratory Edition	2755	4	80	1835	4795	1855	7	177	450	\N
950	Ford Endeavour 2.2L 4X2 At Titanium Plus	Car	33	18	4	Highway	/cars/endeavour.jpg	32.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Ford	2.2L 4X2 At Titanium Plus	2198	4	80	1837	4903	1869	7	160	385	\N
951	Ford Endeavour 2.2L 4X2 Mt Titanium	Car	30	18	4	Highway	/cars/endeavour.jpg	29.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	2.2L 4X2 Mt Titanium	2198	4	80	1837	4903	1869	7	160	385	\N
952	Mahindra Xylo D2 Bs-Iv	Car	10	18	4	Highway	/cars/xylo.jpg	9.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	D2 Bs-Iv	2489	4	55	1895	4520	1850	7	95	218	\N
953	Mahindra Xylo D4 Bs-Iv	Car	11	18	4	Highway	/cars/xylo.jpg	10.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	D4 Bs-Iv	2489	4	55	1895	4520	1850	7	95	218	\N
954	Mahindra Xylo H4 Bs-Iv	Car	11	18	4	Highway	/cars/xylo.jpg	10.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	H4 Bs-Iv	2179	4	55	1895	4520	1850	7	120	280	\N
955	Mahindra Xylo H4 Abs Bs-Iv	Car	11	18	4	Highway	/cars/xylo.jpg	10.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	H4 Abs Bs-Iv	2179	4	55	1895	4520	1850	7	120	280	\N
956	Mahindra Xylo H8 Abs Airbags Bs-Iv	Car	13	18	4	Highway	/cars/xylo.jpg	12.28 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	H8 Abs Airbags Bs-Iv	2179	4	55	1895	4520	1850	8	121	280	\N
957	Tata Safari Storme 2.2 Lx 4X2	Car	12	18	4	Highway	/cars/safari-storme.jpg	11.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	2.2 Lx 4X2	2179	4	63	1922	4655	1855	7	150	320	\N
958	Tata Safari Storme 2.2 Ex 4X2	Car	14	18	4	Highway	/cars/safari-storme.jpg	13.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	2.2 Ex 4X2	2179	4	63	1922	4655	1965	7	150	320	\N
959	Tata Safari Storme 2.2 Vx 4X2 Varicor 400	Car	15	18	4	Highway	/cars/safari-storme.jpg	14.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Tata	2.2 Vx 4X2 Varicor 400	2179	4	63	1922	4655	1965	7	156	400	\N
960	Mahindra Bolero Zlx	Car	10	18	4	Highway	/cars/bolero.jpg	9.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Zlx	2523	4	60	1880	4107	1745	7	63	195	\N
961	Mahindra Bolero Slx	Car	10	18	4	Highway	/cars/bolero.jpg	9.17 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Slx	2523	4	60	1880	4107	1745	7	63	195	\N
962	Mahindra Bolero Sle	Car	9	18	4	Highway	/cars/bolero.jpg	8.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Sle	2523	4	60	1880	4107	1745	7	63	195	\N
963	Mahindra Bolero Ex	Car	9	18	4	Highway	/cars/bolero.jpg	8.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Ex	2523	4	60	1910	4221	1745	7	63	195	\N
964	Mahindra Bolero Ex Non Ac	Car	8	18	4	Highway	/cars/bolero.jpg	7.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Ex Non Ac	2523	4	60	1910	4221	1745	7	63	195	\N
965	Mitsubishi Pajero Sport 2.5 Mt	Car	30	18	4	Highway	/cars/pajero-sport.jpg	29.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mitsubishi	2.5 Mt	2477	4	70	1840	4695	1815	7	178	400	\N
966	Mitsubishi Pajero Sport 2.5 At	Car	29	18	4	Highway	/cars/pajero-sport.jpg	28.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mitsubishi	2.5 At	2477	4	70	1840	4695	1815	7	178	350	\N
967	Mitsubishi Pajero Sport Limited Edition	Car	30	18	4	Highway	/cars/pajero-sport.jpg	29.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mitsubishi	Limited Edition	2477	4	70	1840	4695	1815	7	178	400	\N
968	Mitsubishi Pajero Sport Select Plus Mt	Car	30	18	4	Highway	/cars/pajero-sport.jpg	29.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mitsubishi	Select Plus Mt	2477	4	70	1840	4695	1815	7	178	400	\N
969	Mitsubishi Pajero Sport Select Plus At	Car	30	18	4	Highway	/cars/pajero-sport.jpg	29.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mitsubishi	Select Plus At	2477	4	70	1840	4695	1815	7	178	350	\N
970	Mitsubishi Montero 3.2 At	Car	69	18	4	Highway	/cars/montero.jpg	68.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mitsubishi	3.2 At	3200	4	88	1900	4900	1875	7	202	441	\N
971	Datsun Redi-Go D	Car	3	18	4	City	/cars/redi-go.jpg	2.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	D	799	3	28	1541	3429	1560	5	54	72	\N
973	Datsun Redi-Go A	Car	4	18	4	City	/cars/redi-go.jpg	3.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	A	799	3	28	1541	3429	1560	5	54	72	\N
974	Datsun Redi-Go S	Car	4	18	4	City	/cars/redi-go.jpg	3.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	S	799	3	28	1541	3429	1560	5	54	72	\N
975	Maruti Suzuki Alto K10 Lxi	Car	4	18	4	City	/cars/alto-k10.jpg	3.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi	998	3	35	1475	3545	1490	5	68	90	\N
976	Maruti Suzuki Alto K10 Vxi	Car	4	18	4	City	/cars/alto-k10.jpg	3.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	998	3	35	1475	3545	1490	5	68	90	\N
977	Maruti Suzuki Alto K10 Lx	Car	4	18	4	City	/cars/alto-k10.jpg	3.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lx	998	3	35	1475	3545	1490	5	68	90	\N
978	Maruti Suzuki Alto K10 Vxi (O)	Car	5	18	4	City	/cars/alto-k10.jpg	4.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi (O)	998	3	35	1460	3620	1475	5	68	90	\N
979	Maruti Suzuki Alto K10 Vxi Amt (O)	Car	5	18	4	City	/cars/alto-k10.jpg	4.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi Amt (O)	998	3	35	1475	3545	1490	5	68	90	\N
980	Tata Tiago Revotron Xt	Car	6	18	4	City	/cars/tiago.jpg	5.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Revotron Xt	1199	3	35	1535	3746	1647	5	86	114	\N
981	Tata Tiago Revotron Xz	Car	6	18	4	City	/cars/tiago.jpg	5.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Revotron Xz	1199	3	35	1535	3746	1647	5	86	114	\N
982	Tata Tiago Revotron Xz Plus	Car	6	18	4	City	/cars/tiago.jpg	5.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Revotron Xz Plus	1199	3	35	1535	3746	1647	5	86	114	\N
983	Tata Tiago Revotron Xz Plus Dual Tone	Car	7	18	4	City	/cars/tiago.jpg	6.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Revotron Xz Plus Dual Tone	1199	3	35	1535	3746	1647	5	86	114	\N
984	Tata Tiago Revotron Xza	Car	7	18	4	City	/cars/tiago.jpg	6.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Tata	Revotron Xza	1199	3	35	1535	3746	1647	5	86	114	\N
985	Tata Tiago Revotron Xza Plus	Car	7	18	4	City	/cars/tiago.jpg	6.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Tata	Revotron Xza Plus	1199	3	35	1535	3746	1647	5	86	114	\N
986	Tata Tiago Revotron Xza Plus Dual Tone	Car	7	18	4	City	/cars/tiago.jpg	6.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Tata	Revotron Xza Plus Dual Tone	1199	3	35	1535	3746	1647	5	86	114	\N
987	Hyundai Aura S 1.2 Cng Petrol (Cng +	Car	8	18	4	City	/cars/aura.jpg	7.29 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG + Petrol	Manual	\N	Sedan	\N	Hyundai	S 1.2 Cng Petrol (Cng +	1197	0	37	1520	3995	1680	5	69	95	\N
988	Mercedes-Benz Mercedes-Benz Gls 350 Cdi	Car	89	18	4	Highway	/cars/mercedes-benz-gls.jpg	88.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	350 Cdi	2987	6	100	1850	5120	1934	5	258	619	\N
989	Mercedes-Benz Mercedes-Benz Gls Grand Edition Diesel	Car	87	18	4	Highway	/cars/mercedes-benz-gls.jpg	86.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	Grand Edition Diesel	2987	6	100	1850	5120	1934	5	258	619	\N
990	Mercedes-Benz Mercedes-Benz S-Class S 350 D	Car	136	18	4	City	/cars/mercedes-benz-s-class.jpg	135.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	S 350 D	2987	6	90	1494	5116	1899	5	258	620	\N
991	Mercedes-Benz Mercedes-Benz S-Class S 450	Car	140	18	4	City	/cars/mercedes-benz-s-class.jpg	139.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	S 450	2996	6	70	1494	5246	1899	5	333	480	\N
993	Mercedes-Benz Rolls-Royce Ghost Series Ii 6.6	Car	468	18	4	City	/cars/rolls-royce-ghost-series-ii.jpg	467.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	6.6	6593	12	82.5	1550	5399	1948	5	563	780	\N
994	Hyundai Grand I10 Prime Era T Crdi	Car	6	18	4	City	/cars/grand-i10-prime.jpg	5.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Era T Crdi	1120	3	43	1520	3765	1660	5	71	16.3	\N
995	Hyundai Grand I10 Prime Era T+ Crdi	Car	6	18	4	City	/cars/grand-i10-prime.jpg	5.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Era T+ Crdi	1120	3	43	1520	3765	1660	5	71	16.3	\N
996	Mahindra Kuv100 Nxt K4+ 5Str	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K4+ 5Str	1198	3	35	1655	3700	1735	5	82	115	\N
997	Mahindra Kuv100 Nxt K6+ 5Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K6+ 5Str	1198	3	35	1655	3700	1735	5	82	115	\N
998	Mahindra Kuv100 Nxt K8 5Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K8 5Str	1198	3	35	1655	3700	1735	5	82	115	\N
999	Mahindra Kuv100 Nxt K4+ D 5Str	Car	7	18	4	City	/cars/kuv100-nxt.jpg	6.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K4+ D 5Str	1198	3	35	1655	3700	1735	5	77	190	\N
1000	Mahindra Kuv100 Nxt K6+ D 5Str	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K6+ D 5Str	1198	3	35	1655	3700	1735	5	77	190	\N
1001	Mahindra Kuv100 Nxt K8 D 5Str	Car	8	18	4	City	/cars/kuv100-nxt.jpg	7.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K8 D 5Str	1198	3	35	1655	3700	1735	5	77	190	\N
1002	Mahindra Kuv100 Nxt K2 D 5Str Taxi	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K2 D 5Str Taxi	1198	3	35	1655	3700	1735	5	77	190	\N
1004	Tata Tigor Revotron Xz	Car	7	18	4	City	/cars/tigor.jpg	6.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Revotron Xz	1199	3	35	1537	3992	1677	5	86	113	\N
1005	Tata Tigor Revotron Xz Plus	Car	7	18	4	City	/cars/tigor.jpg	6.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Revotron Xz Plus	1199	3	35	1537	3992	1677	5	86	113	\N
1006	Tata Tigor Revotron Xza Plus	Car	8	18	4	City	/cars/tigor.jpg	7.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Sedan	\N	Tata	Revotron Xza Plus	1199	3	35	1537	3992	1677	5	86	113	\N
1007	Volvo Xc60 Inscription D5	Car	60	18	4	Highway	/cars/xc60.jpg	59.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Volvo	Inscription D5	1969	5	70	1658	4688	1902	5	233	480	\N
1008	Jaguar Xj 3.0L	Car	98	18	4	City	/cars/xj.jpg	97.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	3.0L	2993	6	82	1457	5252	1899	5	274	600	\N
1009	Volvo V40 Cross Country D3	Car	33	18	4	City	/cars/v40-cross-country.jpg	32.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Volvo	D3	1984	5	60	1458	4370	1783	5	150	350	\N
1010	Jaguar Xj 50	Car	112	18	4	City	/cars/xj.jpg	111.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	50	2993	6	82	1460	5255	1899	5	302	689	\N
1011	Land Rover Rover Range 5.0L V8 Svautobiography Lwb Petrol	Car	405	18	4	Highway	/cars/range.jpg	405.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	5.0L V8 Svautobiography Lwb Petrol	4999	8	65	1835	4999	2220	5	558	700	\N
1012	Jaguar Xj 3.0L Portfolio	Car	108	18	4	City	/cars/xj.jpg	107.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	3.0L Portfolio	2993	6	83	1457	5252	1899	5	274	600	\N
1013	Land Rover Rover Range 5.0L V8 Svautobiography Dynamic Petrol	Car	326	18	4	Highway	/cars/range.jpg	325.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Land Rover Rover	5.0L V8 Svautobiography Dynamic Petrol	4999	8	105	1827	4999	2220	5	558	700	\N
1014	Maruti Suzuki Alto 800 Tour H1	Car	4	18	4	City	/cars/alto-800-tour.jpg	3.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	H1	796	3	35	1475	3430	1490	5	48	69	\N
1015	Maruti Suzuki Alto 800 Tour H1 (O)	Car	4	18	4	City	/cars/alto-800-tour.jpg	3.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	H1 (O)	796	3	35	1475	3395	1490	5	48	69	\N
1017	Maruti Suzuki Eeco 5 Str	Car	4	18	4	City	/cars/eeco.jpg	3.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	5 Str	1196	4	40	1800	3675	1475	5	73	101	\N
1018	Mercedes-Benz Rolls-Royce Phantom Ewb	Car	754	18	4	City	/cars/rolls-royce-phantom.jpg	754.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	Ewb	6749	12	100	1640	6092	1990	5	460	720	\N
1019	Mercedes-Benz Rolls-Royce Phantom Sedan	Car	950	18	4	City	/cars/rolls-royce-phantom.jpg	950.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	Sedan	6749	12	100	1638	5842	1990	5	460	720	\N
1020	Maruti Suzuki Ignis Delta 1.2 Amt	Car	7	18	4	City	/cars/ignis.jpg	6.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Maruti Suzuki	Delta 1.2 Amt	1197	4	32	1595	3700	1690	5	83	113	\N
1021	Maruti Suzuki Eeco 5 Str With Ac+Htr	Car	4	18	4	City	/cars/eeco.jpg	3.93 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	5 Str With Ac+Htr	1196	4	40	1800	3675	1475	5	73	101	\N
1022	Maruti Suzuki Ignis Delta 1.2 Mt	Car	6	18	4	City	/cars/ignis.jpg	5.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Delta 1.2 Mt	1197	4	32	1595	3700	1690	5	83	113	\N
1023	Premier Rio Gx	Car	6	18	4	Highway	/cars/rio.jpg	5.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Premier	Gx	1173	4	46	1730	3970	1570	5	76.6	103.9	\N
1024	Premier Rio Lx	Car	8	18	4	Highway	/cars/rio.jpg	7.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Premier	Lx	1489	4	46	1730	3970	1570	5	64	152	\N
1025	Premier Rio Dx	Car	7	18	4	Highway	/cars/rio.jpg	6.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Premier	Dx	1489	4	46	1730	3970	1570	5	64	152	\N
1026	Premier Rio Ex	Car	6	18	4	Highway	/cars/rio.jpg	5.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Premier	Ex	1489	4	46	1730	3970	1570	5	64	152	\N
1027	Premier Rio Glx	Car	7	18	4	Highway	/cars/rio.jpg	6.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Premier	Glx	1173	4	46	1730	3970	1570	5	76.6	103.9	\N
1028	Toyota Etios Liva Gd	Car	7	18	4	City	/cars/etios-liva.jpg	6.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Gd	1364	4	45	1510	3884	1695	5	68	170	\N
1029	Toyota Etios Liva V	Car	6	18	4	City	/cars/etios-liva.jpg	5.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	V	1197	4	45	1510	3884	1695	5	80	104	\N
1030	Toyota Etios Liva G	Car	6	18	4	City	/cars/etios-liva.jpg	5.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	G	1197	4	45	1510	3884	1695	5	80	104	\N
1031	Premier Rio Crdi4	Car	8	18	4	Highway	/cars/rio.jpg	7.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Premier	Crdi4	1248	4	46	1730	3970	1570	5	72	183	\N
1032	Toyota Etios Liva Vd	Car	8	18	4	City	/cars/etios-liva.jpg	7.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Vd	1364	4	45	1510	3884	1695	5	68	170	\N
1033	Toyota Etios Liva Vx	Car	7	18	4	City	/cars/etios-liva.jpg	6.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	Vx	1197	4	45	1510	3884	1695	5	80	104	\N
1034	Toyota Etios Liva Vxd	Car	8	18	4	City	/cars/etios-liva.jpg	7.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Vxd	1364	4	45	1510	3884	1695	5	68	170	\N
1035	Toyota Etios Liva Dual Tone Vxd	Car	8	18	4	City	/cars/etios-liva.jpg	7.57 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Dual Tone Vxd	1364	4	45	1510	3884	1695	5	68	170	\N
1036	Toyota Etios Liva Dual Tone Vd	Car	8	18	4	City	/cars/etios-liva.jpg	7.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Dual Tone Vd	1364	4	45	1510	3884	1695	5	68	170	\N
1037	Toyota Etios Liva Dual Tone V	Car	6	18	4	City	/cars/etios-liva.jpg	5.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	Dual Tone V	1197	4	45	1510	3884	1695	5	80	104	\N
1038	Toyota Etios Liva Dual Tone Vx	Car	7	18	4	City	/cars/etios-liva.jpg	6.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	Dual Tone Vx	1197	4	45	1510	3884	1695	5	80	104	\N
1039	Toyota Etios Liva Gxd	Car	7	18	4	City	/cars/etios-liva.jpg	6.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Gxd	1364	4	45	1510	3884	1695	5	68	170	\N
1040	Toyota Etios Liva Vx Dual Tone Limited Edition	Car	7	18	4	City	/cars/etios-liva.jpg	6.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	Vx Dual Tone Limited Edition	1197	4	45	1510	3884	1695	5	80	104	\N
1041	Toyota Etios Liva Gx	Car	6	18	4	City	/cars/etios-liva.jpg	5.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	Gx	1197	4	45	1510	3884	1695	5	80	104	\N
1042	Maruti Suzuki Dzire Tour Lxi	Car	6	18	4	City	/cars/dzire-tour.jpg	5.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Maruti Suzuki	Lxi	1197	4	42	1555	3995	1695	5	83	115	\N
1043	Toyota Etios Liva Vxd Dual Tone Limited Edition	Car	8	18	4	City	/cars/etios-liva.jpg	7.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Vxd Dual Tone Limited Edition	1364	4	45	1510	3884	1695	5	68	170	\N
1044	Maruti Suzuki Dzire Tour Ldi	Car	7	18	4	City	/cars/dzire-tour.jpg	6.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Maruti Suzuki	Ldi	1248	4	42	1555	3995	1695	5	75	190	\N
1045	Hyundai Elite I20 Era 1.4 Crdi	Car	7	18	4	City	/cars/elite-i20.jpg	6.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Era 1.4 Crdi	1396	4	45	1505	3985	1734	5	90	220	\N
1046	Hyundai Elite I20 Sportz Plus	Car	8	18	4	City	/cars/elite-i20.jpg	7.22 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz Plus	1197	4	45	1505	3985	1734	5	84	115	\N
1047	Hyundai Elite I20 Magna Plus	Car	7	18	4	City	/cars/elite-i20.jpg	6.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Magna Plus	1197	4	45	1505	3985	1734	5	84	115	\N
1048	Hyundai Elite I20 Magna Plus Crdi	Car	8	18	4	City	/cars/elite-i20.jpg	7.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Magna Plus Crdi	1396	4	45	1505	3985	1734	5	90	220	\N
1049	Hyundai Elite I20 Asta (O) 1.2	Car	9	18	4	City	/cars/elite-i20.jpg	8.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Asta (O) 1.2	1197	4	45	1505	3995	1734	5	84	114	\N
1050	Hyundai Elite I20 Sportz Plus Crdi Dual Tone	Car	9	18	4	City	/cars/elite-i20.jpg	8.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Sportz Plus Crdi Dual Tone	1396	4	45	1505	3985	1734	5	90	220	\N
1051	Hyundai Elite I20 Asta (O) Crdi	Car	10	18	4	City	/cars/elite-i20.jpg	9.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Asta (O) Crdi	1396	4	45	1505	3985	1734	5	90	220	\N
1052	Hyundai Elite I20 Sportz Plus Cvt	Car	9	18	4	City	/cars/elite-i20.jpg	8.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz Plus Cvt	1197	4	45	1505	3985	1734	5	84	115	\N
1053	Hyundai Elite I20 Sportz Plus Dual Tone	Car	8	18	4	City	/cars/elite-i20.jpg	7.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz Plus Dual Tone	1197	4	45	1505	3985	1734	5	84	115	\N
1054	Hyundai Elite I20 Asta (O) Cvt	Car	10	18	4	City	/cars/elite-i20.jpg	9.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Hyundai	Asta (O) Cvt	1197	4	45	1505	3985	1734	5	83	115	\N
1055	Hyundai Elite I20 Sportz Plus Crdi	Car	9	18	4	City	/cars/elite-i20.jpg	8.46 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Hyundai	Sportz Plus Crdi	1396	4	45	1505	3985	1734	5	90	220	\N
1056	Toyota Platinum Etios Gd	Car	8	18	4	City	/cars/platinum-etios.jpg	7.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Gd	1364	4	45	1510	4369	1695	5	68	170	\N
1057	Toyota Platinum Etios V	Car	8	18	4	City	/cars/platinum-etios.jpg	7.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	V	1496	4	45	1510	4369	1695	5	90	132	\N
1058	Toyota Platinum Etios G	Car	7	18	4	City	/cars/platinum-etios.jpg	6.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	G	1496	4	45	1510	4369	1695	5	90	132	\N
1059	Toyota Platinum Etios Vd	Car	9	18	4	City	/cars/platinum-etios.jpg	8.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Vd	1364	4	45	1510	4369	1695	5	68	170	\N
1060	Toyota Platinum Etios Vx	Car	8	18	4	City	/cars/platinum-etios.jpg	7.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	Vx	1496	4	45	1510	4369	1695	5	90	132	\N
1061	Toyota Platinum Etios Vxd	Car	9	18	4	City	/cars/platinum-etios.jpg	8.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Vxd	1364	4	45	1510	4369	1695	5	68	170	\N
1062	Toyota Platinum Etios Gxd	Car	8	18	4	City	/cars/platinum-etios.jpg	8.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Gxd	1364	4	45	1510	4369	1695	5	68	170	\N
1063	Toyota Platinum Etios Vx Limited Edition	Car	9	18	4	City	/cars/platinum-etios.jpg	8.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	Vx Limited Edition	1496	4	45	1510	4369	1695	5	90	132	\N
1064	Toyota Platinum Etios Vxd Limited Edition	Car	10	18	4	City	/cars/platinum-etios.jpg	9.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Vxd Limited Edition	1364	4	45	1510	4369	1695	5	68	170	\N
1065	Toyota Platinum Etios Gx	Car	7	18	4	City	/cars/platinum-etios.jpg	6.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Toyota	Gx	1496	4	45	1510	4369	1695	5	90	132	\N
1068	Toyota Etios Cross V	Car	9	18	4	City	/cars/etios-cross.jpg	8.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Toyota	V	1496	4	45	1555	3895	1735	5	90	132	\N
1069	Mahindra Verito Vibe D6	Car	8	18	4	City	/cars/verito-vibe.jpg	7.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	D6	1461	4	50	1540	3991	1740	5	65	160	\N
1070	Mahindra Verito Vibe D4	Car	7	18	4	City	/cars/verito-vibe.jpg	6.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	D4	1461	4	50	1540	3991	1740	5	65	160	\N
1071	Mahindra Verito Vibe D2	Car	7	18	4	City	/cars/verito-vibe.jpg	6.58 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	D2	1461	4	50	1540	3991	1740	5	65	160	\N
1072	Toyota Etios Cross 1.4 X Edition	Car	9	18	4	City	/cars/etios-cross.jpg	8.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	1.4 X Edition	1364	4	45	1555	3895	1735	5	68	170	\N
1073	Skoda Superb Sportline Sportline 2.0L Tdi At	Car	32	18	4	City	/cars/superb-sportline.jpg	31.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Sportline 2.0L Tdi At	1968	4	66	1483	4861	1864	5	177	350	\N
1074	Skoda Superb Sportline Sportline 1.8L Tsi At	Car	29	18	4	City	/cars/superb-sportline.jpg	29.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Sportline 1.8L Tsi At	1798	4	66	1483	4861	1864	5	180	250	\N
1075	Fiat Avventura Multijet Dynamic	Car	8	18	4	City	/cars/avventura.jpg	7.96 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	Multijet Dynamic	1248	4	45	1542	3989	1706	5	93	209	\N
1076	Fiat Avventura Multijet Emotion	Car	9	18	4	City	/cars/avventura.jpg	8.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Crossover	\N	Fiat	Multijet Emotion	1248	4	45	1542	3989	1706	5	93	209	\N
1079	Mercedes-Benz Mercedes-Benz B-Class B 180 Sport	Car	30	18	4	City	/cars/mercedes-benz-b-class.jpg	29.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MPV	\N	Mercedes-Benz	B 180 Sport	1595	4	50	1557	4393	1786	5	122	200	\N
1080	Mercedes-Benz Mercedes-Benz B-Class B 180 Night Edition	Car	32	18	4	City	/cars/mercedes-benz-b-class.jpg	31.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	MPV	\N	Mercedes-Benz	B 180 Night Edition	1595	4	50	1557	4393	1786	5	122	200	\N
1081	Mercedes-Benz Mercedes-Benz B-Class B 200 Cdi Night Edition	Car	34	18	4	City	/cars/mercedes-benz-b-class.jpg	33.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MPV	\N	Mercedes-Benz	B 200 Cdi Night Edition	2143	4	50	1557	4393	1786	5	136	300	\N
1082	Mercedes-Benz Mercedes-Benz B-Class B 200 Cdi Sport	Car	31	18	4	City	/cars/mercedes-benz-b-class.jpg	30.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	MPV	\N	Mercedes-Benz	B 200 Cdi Sport	2143	4	50	1557	4393	1786	5	136	300	\N
1083	Mercedes-Benz Mercedes-Benz Cla-Class 200 Sport	Car	36	18	4	City	/cars/mercedes-benz-cla-class.jpg	35.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	200 Sport	1991	4	56	1432	4630	1777	5	183	300	\N
1084	Skoda Kodiaq Style 2.0 Tdi 4X4 At	Car	33	18	4	Highway	/cars/kodiaq.jpg	33.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Skoda	Style 2.0 Tdi 4X4 At	1968	4	66	1483	4861	1864	5	177	350	\N
9	Hyundai Santro Era Mt	Car	5	18	4	City	/cars/santro.jpg	4.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Era Mt	1086	4	35	1560	3610	1645	5	69	99.04	\N
10	Hyundai Santro Magna Mt	Car	6	18	4	City	/cars/santro.jpg	5.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Magna Mt	1086	4	35	1560	3610	1645	5	69	99.04	\N
11	Hyundai Santro Magna Mt Cng	Car	6	18	4	City	/cars/santro.jpg	5.48 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Hyundai	Magna Mt Cng	1086	4	35	1560	3610	1645	5	59	99.04	\N
12	Hyundai Santro Magna Amt	Car	6	18	4	City	/cars/santro.jpg	5.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Hyundai	Magna Amt	1086	4	35	1560	3610	1645	5	69	10.1	\N
13	Hyundai Santro Sportz Mt	Car	6	18	4	City	/cars/santro.jpg	5.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Sportz Mt	1086	4	35	1560	3610	1645	5	69	10.1	\N
14	Hyundai Santro Sportz Mt Cng	Car	6	18	4	City	/cars/santro.jpg	5.79 Lakhs	Imported from Indian Vehicle Dataset	\N	CNG	Manual	\N	Hatchback	\N	Hyundai	Sportz Mt Cng	1086	4	60	1560	3610	1645	5	59	8.3	\N
15	Hyundai Santro Sportz Amt	Car	6	18	4	City	/cars/santro.jpg	5.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Hatchback	\N	Hyundai	Sportz Amt	1086	4	35	1560	3610	1645	5	69	10.1	\N
16	Hyundai Santro Asta Mt	Car	6	18	4	City	/cars/santro.jpg	5.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Asta Mt	1086	4	35	1560	3610	1645	5	69	99.04	\N
17	Tata Tiago Revotron Xe	Car	5	18	4	City	/cars/tiago.jpg	4.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Revotron Xe	1199	3	35	1535	3765	1677	5	86	114	\N
18	Hyundai Aura E 1.2 Petrol	Car	6	18	4	City	/cars/aura.jpg	5.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	E 1.2 Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
19	Hyundai Aura S 1.2 Petrol	Car	7	18	4	City	/cars/aura.jpg	6.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	S 1.2 Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
20	Hyundai Aura S 1.2 Amt Petrol	Car	8	18	4	City	/cars/aura.jpg	7.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Hyundai	S 1.2 Amt Petrol	1197	0	37	1520	3995	1680	5	83	114	\N
29	Ford Aspire 1.2 Ti-Vct Ambiente	Car	6	18	4	City	/cars/aspire.jpg	5.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Ambiente	1194	4	42	1525	3995	1704	5	96	120	\N
30	Ford Aspire 1.2 Ti-Vct Trend Plus	Car	7	18	4	City	/cars/aspire.jpg	6.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Ford	1.2 Ti-Vct Trend Plus	1194	4	42	1525	3995	1704	5	96	120	\N
123	Mercedes-Benz Mercedes-Benz Gle 400D 4Matic Hip Hop Edition	Car	125	18	4	Highway	/cars/mercedes-benz-gle.jpg	125.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	400D 4Matic Hip Hop Edition	2925	6	93	1772	4924	2157	5	330	700	\N
154	Mercedes-Benz Mercedes-Benz Maybach S650	Car	274	18	4	City	/cars/mercedes-benz-maybach.jpg	273.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	S650	5980	12	80	1498	5453	1899	4	630	1000	\N
159	Maruti Suzuki Xl6 Zeta Mt	Car	10	18	4	City	/cars/xl6.jpg	9.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	Zeta Mt	1462	4	45	1700	4445	1775	6	104	138	\N
185	Ferrari Gtc4 Lusso V12	Car	520	18	4	City	/cars/gtc4-lusso.jpg	520.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Ferrari	V12	6262	8	91	1383	4922	1980	4	681	697	\N
248	Renault Kwid Rxe 0.8	Car	4	18	4	City	/cars/kwid.jpg	3.53 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Renault	Rxe 0.8	799	3	28	1490	3731	1579	5	54	72	\N
281	Lamborghini Huracan Lp 580-2 Spyder	Car	356	18	4	City	/cars/huracan.jpg	355.35 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Lamborghini	Lp 580-2 Spyder	5204	10	90	1165	4459	1924	2	571	540	\N
344	Tata Bolt Xt Petrol	Car	7	18	4	City	/cars/bolt.jpg	6.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xt Petrol	1193	4	44	1562	3825	1695	5	90	140	\N
377	Honda Wr-V Vx Petrol	Car	10	18	4	Highway	/cars/wr-v.jpg	9.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Honda	Vx Petrol	1199	4	40	1601	3999	1734	5	90	110	\N
407	Hyundai Creta 1.6 Crdi Sx At	Car	16	18	4	Highway	/cars/creta.jpg	15.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Hyundai	1.6 Crdi Sx At	1582	4	55	1630	4270	1780	5	128	260	\N
408	Hyundai Creta 1.6 Crdi Sx Dual Tone	Car	15	18	4	Highway	/cars/creta.jpg	14.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	1.6 Crdi Sx Dual Tone	1582	4	55	1630	4270	1780	5	128	260	\N
438	Mahindra Thar Crde	Car	10	18	4	Highway	/cars/thar.jpg	9.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	Crde	2498	4	60	1930	3920	1726	6	105	247	\N
439	Mahindra Thar 700 Special Edition	Car	10	18	4	Highway	/cars/thar.jpg	9.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	700 Special Edition	2498	4	60	1930	3920	1726	6	105	247	\N
500	Tata Nexon Xz Plus (O)	Car	11	18	4	Highway	/cars/nexon.jpg	10.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Tata	Xz Plus (O)	1198	3	44	1607	3994	1811	5	110	170	\N
595	Tata Nexon Xza Plus (O) Diesel Dual Tone	Car	13	18	4	Highway	/cars/nexon.jpg	12.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Tata	Xza Plus (O) Diesel Dual Tone	1497	4	44	1607	3994	1811	5	110	260	\N
596	Ford Ecosport 1.5L Tdci Ambiente	Car	9	18	4	Highway	/cars/ecosport.jpg	8.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Ford	1.5L Tdci Ambiente	1498	4	52	1647	3998	1765	5	100	205	\N
626	Land Rover Rover Range Evoque Se R-Dynamic	Car	60	18	4	Highway	/cars/range-evoque.jpg	59.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	Se R-Dynamic	1999	4	0	1649	4371	1996	5	179	430	\N
784	Maruti Suzuki Baleno 1.2 Alpha Cvt	Car	9	18	4	City	/cars/baleno.jpg	8.9 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	1.2 Alpha Cvt	1197	4	37	1510	3995	1745	5	83	115	\N
819	Mercedes-Benz Mercedes-Benz S-Class Amg S 63 Coupe	Car	255	18	4	City	/cars/mercedes-benz-s-class.jpg	255.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Mercedes-Benz	Amg S 63 Coupe	3982	8	80	1411	5027	1899	4	450	900	\N
820	Maserati Granturismo Sport	Car	173	18	4	City	/cars/granturismo.jpg	172.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Coupe	\N	Maserati	Sport	4691	8	86	1353	4881	1915	4	460	520	\N
846	Mahindra Kuv100 Nxt K2 D 6Str Taxi	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Mahindra	K2 D 6Str Taxi	1198	3	35	1655	3700	1735	6	77	190	\N
847	Mahindra Kuv100 Nxt K2 6Str Cng Taxi	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K2 6Str Cng Taxi	1198	3	35	1655	3700	1735	6	82	115	\N
848	Volvo S60 Cross Country D4	Car	45	18	4	City	/cars/s60-cross-country.jpg	44.27 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Crossover, Sedan	\N	Volvo	D4	2400	5	67	1539	4637	2097	4	190	420	\N
877	Mercedes-Benz Mercedes-Benz Gls 63 Amg	Car	192	18	4	Highway	/cars/mercedes-benz-gls.jpg	191.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	63 Amg	5461	8	80	1850	5146	1982	7	557	760	\N
972	Datsun Redi-Go T	Car	4	18	4	City	/cars/redi-go.jpg	3.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Datsun	T	799	3	28	1541	3429	1560	5	54	72	\N
1003	Mahindra Kuv100 Nxt K2 5Str Cng Taxi	Car	6	18	4	City	/cars/kuv100-nxt.jpg	5.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mahindra	K2 5Str Cng Taxi	1198	3	35	1655	3700	1735	5	82	115	\N
1066	Toyota Etios Cross Gd	Car	8	18	4	City	/cars/etios-cross.jpg	7.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Gd	1364	4	45	1555	3895	1735	5	68	170	\N
1067	Toyota Etios Cross Vd	Car	8	18	4	City	/cars/etios-cross.jpg	7.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Toyota	Vd	1364	4	45	1555	3895	1735	5	68	170	\N
1098	Maruti Suzuki Swift Lxi	Car	6	18	4	City	/cars/swift.jpg	5.19 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Lxi	1197	4	37	1530	3840	1735	5	83	113	\N
1099	Tata Zest Xe Petrol	Car	6	18	4	City	/cars/zest.jpg	5.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Xe Petrol	1193	4	44	1570	3995	1706	5	90	140	\N
1100	Tata Zest Xm Petrol	Car	7	18	4	City	/cars/zest.jpg	6.54 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Xm Petrol	1193	4	44	1570	3995	1706	5	90	140	\N
1189	Skoda Rapid Onyx At Diesel	Car	13	18	4	City	/cars/rapid.jpg	12.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Onyx At Diesel	1498	4	55	1466	4413	1699	5	110	250	\N
1250	Tata Tigor Revotron Xe	Car	6	18	4	City	/cars/tigor.jpg	5.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Revotron Xe	1199	3	35	1537	3992	1677	5	86	113	\N
1252	Tata Zest Xm Diesel	Car	8	18	4	City	/cars/zest.jpg	7.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Tata	Xm Diesel	1248	4	44	1570	3995	1706	5	75	190	\N
1085	Mercedes-Benz Mercedes-Benz Cla-Class 200 D Sport	Car	37	18	4	City	/cars/mercedes-benz-cla-class.jpg	36.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	200 D Sport	2143	4	56	1432	4630	1777	5	136	300	\N
1086	Skoda Kodiaq Laurin And Klement	Car	37	18	4	Highway	/cars/kodiaq.jpg	36.79 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Skoda	Laurin And Klement	1968	4	66	1483	4861	1864	5	148	340	\N
1087	Mercedes-Benz Mercedes-Benz Cla-Class 200 Cdi Style	Car	32	18	4	City	/cars/mercedes-benz-cla-class.jpg	31.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Mercedes-Benz	200 Cdi Style	2143	4	56	1432	4630	1777	5	136	300	\N
1088	Mini Clubman Cooper S	Car	42	18	4	City	/cars/clubman.jpg	41.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Mini	Cooper S	1998	4	0	1441	4253	1801	5	192	280	\N
1089	Jaguar Xf 2.0 Prestige	Car	55	18	4	City	/cars/xf.jpg	54.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Jaguar	2.0 Prestige	1999	4	74	1460	4961	2091	5	247	340	\N
1090	Skoda Kodiaq Corporate Edition	Car	33	18	4	Highway	/cars/kodiaq.jpg	33.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Skoda	Corporate Edition	1968	4	66	1483	4861	1864	5	177	350	\N
1091	Jaguar Xf 2.0 Portfolio Diesel	Car	62	18	4	City	/cars/xf.jpg	61.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	2.0 Portfolio Diesel	1999	4	83	1457	5252	1899	5	180	430	\N
1092	Jaguar Xf 2.0 Prestige Diesel	Car	56	18	4	City	/cars/xf.jpg	55.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	2.0 Prestige Diesel	1999	4	66	1457	5067	2091	5	180	430	\N
1093	Jaguar Xf 2.0 Portfolio	Car	61	18	4	City	/cars/xf.jpg	60.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Jaguar	2.0 Portfolio	1999	4	82	1457	5252	1899	5	247	340	\N
1095	Jaguar Xf 2.0 Pure Diesel	Car	50	18	4	City	/cars/xf.jpg	49.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Jaguar	2.0 Pure Diesel	1999	4	66	1457	5067	2091	5	180	430	\N
1101	Tata Zest Xms Petrol	Car	7	18	4	City	/cars/zest.jpg	6.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Xms Petrol	1193	4	44	1570	3995	1706	5	90	140	\N
1102	Fiat Linea Active Multijet	Car	9	18	4	City	/cars/linea.jpg	8.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Fiat	Active Multijet	1248	4	45	1494	4596	1730	5	93	209	\N
1103	Fiat Linea Active Fire	Car	8	18	4	City	/cars/linea.jpg	7.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Fiat	Active Fire	1368	4	45	1487	4596	1730	5	114	207	\N
1104	Tata Zest Xt Petrol	Car	8	18	4	City	/cars/zest.jpg	7.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Xt Petrol	1193	4	44	1570	3995	1706	5	90	140	\N
1105	Maruti Suzuki Vitara Brezza Ldi	Car	8	18	4	Highway	/cars/vitara-brezza.jpg	7.63 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Ldi	1248	4	48	1640	3995	1790	5	90	200	\N
1106	Fiat Linea Dynamic Multijet	Car	10	18	4	City	/cars/linea.jpg	9.32 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Fiat	Dynamic Multijet	1248	4	45	1494	4596	1730	5	93	209	\N
1107	Fiat Linea T-Jet Emotion	Car	10	18	4	City	/cars/linea.jpg	9.98 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Fiat	T-Jet Emotion	1368	4	45	1487	4596	1730	5	114	207	\N
1108	Fiat Linea Emotion Multijet	Car	10	18	4	City	/cars/linea.jpg	9.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Fiat	Emotion Multijet	1248	4	45	1494	4596	1730	5	93	209	\N
1109	Maruti Suzuki Vitara Brezza Zdi+	Car	10	18	4	Highway	/cars/vitara-brezza.jpg	9.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Zdi+	1248	4	48	1640	3995	1790	5	90	200	\N
1110	Maruti Suzuki Vitara Brezza Vdi	Car	9	18	4	Highway	/cars/vitara-brezza.jpg	8.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Vdi	1248	4	48	1640	3995	1790	5	90	200	\N
1111	Maruti Suzuki Vitara Brezza Zdi+ Dual Tone	Car	11	18	4	Highway	/cars/vitara-brezza.jpg	10.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Zdi+ Dual Tone	1248	4	48	1640	3995	1790	5	90	200	\N
1112	Maruti Suzuki Vitara Brezza Zdi	Car	9	18	4	Highway	/cars/vitara-brezza.jpg	8.92 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Zdi	1248	4	48	1640	3995	1790	5	90	200	\N
1113	Maruti Suzuki Vitara Brezza Zdi Ags	Car	10	18	4	Highway	/cars/vitara-brezza.jpg	9.42 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maruti Suzuki	Zdi Ags	1248	4	48	1640	3995	1790	5	90	200	\N
1114	Maruti Suzuki Vitara Brezza Vdi Ags	Car	9	18	4	Highway	/cars/vitara-brezza.jpg	8.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maruti Suzuki	Vdi Ags	1248	4	48	1640	3995	1790	5	90	200	\N
1115	Maruti Suzuki Vitara Brezza Zdi+ Ags	Car	11	18	4	Highway	/cars/vitara-brezza.jpg	10.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Maruti Suzuki	Zdi+ Ags	1248	4	48	1640	3995	1790	5	90	200	\N
1116	Maruti Suzuki Vitara Brezza Zdi+ Dual Tone Ags	Car	11	18	4	Highway	/cars/vitara-brezza.jpg	10.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Maruti Suzuki	Zdi+ Dual Tone Ags	1248	4	48	1640	3995	1790	5	90	200	\N
1117	Hyundai I20 Active 1.2 Sx	Car	9	18	4	City	/cars/i20-active.jpg	8.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 Sx	1197	4	40	1555	3995	1760	5	83	114	\N
1118	Renault Duster Rxe Petrol	Car	8	18	4	Highway	/cars/duster.jpg	8.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Renault	Rxe Petrol	1498	4	50	1695	4315	1822	5	106	142	\N
1130	Force Gurkha Xplorer 5 Door	Car	13	18	4	Highway	/cars/gurkha.jpg	12.25 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Force	Xplorer 5 Door	2596	4	63	2055	3992	1790	5	85	230	\N
1131	Mahindra Scorpio 4Wd Getaway	Car	13	18	4	Highway	/cars/scorpio.jpg	12.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	4Wd Getaway	2179	4	80	1874	5118	1850	5	121	280	\N
1132	Mahindra Scorpio 2Wd Getaway	Car	12	18	4	Highway	/cars/scorpio.jpg	11.23 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Mahindra	2Wd Getaway	2179	4	80	1874	5118	1850	5	121	280	\N
1133	Skoda Monte Carlo Monte Carlo 1.5 Tdi Mt	Car	13	18	4	City	/cars/monte-carlo.jpg	13.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	Monte Carlo 1.5 Tdi Mt	1498	4	55	1466	4413	1699	5	110	250	\N
1134	Skoda Monte Carlo Monte Carlo 1.6 Mpi Mt	Car	12	18	4	City	/cars/monte-carlo.jpg	11.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Monte Carlo 1.6 Mpi Mt	1598	4	55	1466	4413	1699	5	105	153	\N
1135	Skoda Monte Carlo Monte Carlo 1.6 Mpi At	Car	13	18	4	City	/cars/monte-carlo.jpg	12.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Monte Carlo 1.6 Mpi At	1598	4	55	1466	4413	1699	5	105	153	\N
1136	Toyota Corolla Altis Gl Diesel	Car	20	18	4	City	/cars/corolla-altis.jpg	19.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	Gl Diesel	1364	4	43	1475	4620	1775	5	88.4	205	\N
1137	Skoda Superb Style 1.8 Tsi Mt	Car	26	18	4	City	/cars/superb.jpg	26.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Style 1.8 Tsi Mt	1798	4	66	1483	4861	1864	5	180	320	\N
1138	Toyota Corolla Altis G Diesel	Car	18	18	4	City	/cars/corolla-altis.jpg	17.71 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Toyota	G Diesel	1364	4	43	1475	4620	1775	5	88.4	205	\N
1139	Skoda Superb L & K 1.8 Tsi At	Car	31	18	4	City	/cars/superb.jpg	31.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	L & K 1.8 Tsi At	1798	4	66	1483	4861	1864	5	180	250	\N
1140	Skoda Superb Style 2.0 Tdi At	Car	31	18	4	City	/cars/superb.jpg	30.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Style 2.0 Tdi At	1968	4	66	1483	4861	1864	5	177	350	\N
1141	Skoda Superb L & K 2.0 Tdi At	Car	34	18	4	City	/cars/superb.jpg	33.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	L & K 2.0 Tdi At	1968	4	66	1483	4861	1864	5	177	350	\N
1142	Skoda Superb Style 1.8 Tsi At	Car	28	18	4	City	/cars/superb.jpg	27.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Style 1.8 Tsi At	1798	4	66	1483	4861	1864	5	180	250	\N
1143	Volvo S60 Polestar	Car	57	18	4	City	/cars/s60.jpg	56.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Volvo	Polestar	1969	4	67	1484	4635	2097	5	372	470	\N
1144	Mercedes-Benz Mercedes-Benz E-Class E200	Car	59	18	4	City	/cars/mercedes-benz-e-class.jpg	58.61 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	E200	1991	4	80	1494	5063	1860	5	184	300	\N
1145	Skoda Superb Corporate Edition 1.8 Tsi At	Car	26	18	4	City	/cars/superb.jpg	26.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Corporate Edition 1.8 Tsi At	1798	4	66	1483	4861	1864	5	180	250	\N
1146	Skoda Superb Corporate Edition 2.0 Tdi At	Car	29	18	4	City	/cars/superb.jpg	28.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	Corporate Edition 2.0 Tdi At	1968	4	66	1483	4861	1864	5	177	350	\N
1147	Mercedes-Benz Mercedes-Benz E-Class E200 Expression	Car	58	18	4	City	/cars/mercedes-benz-e-class.jpg	57.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	E200 Expression	1991	4	80	1494	5063	1860	5	184	300	\N
1148	Mercedes-Benz Mercedes-Benz E-Class E200 Exclusive	Car	62	18	4	City	/cars/mercedes-benz-e-class.jpg	61.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Mercedes-Benz	E200 Exclusive	1991	4	80	1494	5063	1860	5	184	300	\N
1149	Jeep Wrangler Unlimited	Car	64	18	4	Highway	/cars/wrangler.jpg	63.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Jeep	Unlimited	1999	4	85	1838	4882	1877	5	268	400	\N
1150	Land Rover Rover Range Velar 2.0 Diesel R-Dynamic S	Car	73	18	4	Highway	/cars/range-velar.jpg	72.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Land Rover Rover	2.0 Diesel R-Dynamic S	1999	4	0	1665	4797	2145	5	179	430	\N
1151	Fiat Linea Classic 1.4	Car	7	18	4	City	/cars/linea-classic.jpg	6.46 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Fiat	1.4	1368	4	45	1487	4560	1730	5	90	115	\N
1152	Fiat Punto Evo Pure 1.2L Fire Dynamic	Car	5	18	4	City	/cars/punto-evo-pure.jpg	4.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Fiat	1.2L Fire Dynamic	1172	4	45	1525	3987	1687	5	68	96	\N
1153	Fiat Linea Classic 1.3 Multijet	Car	8	18	4	City	/cars/linea-classic.jpg	7.51 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Fiat	1.3 Multijet	1248	4	45	1487	4560	1730	5	76	197	\N
1154	Nissan Terrano Xl (P)	Car	10	18	4	Highway	/cars/terrano.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Nissan	Xl (P)	1598	4	50	1671	4331	1822	5	104	145	\N
1155	Nissan Terrano Xv D Premium 110 Ps Amt	Car	15	18	4	Highway	/cars/terrano.jpg	14.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Nissan	Xv D Premium 110 Ps Amt	1461	4	50	1671	4331	1822	5	110	248	\N
1156	Nissan Terrano Xe D 85Ps	Car	10	18	4	Highway	/cars/terrano.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xe D 85Ps	1461	4	50	1671	4331	1822	5	85	200	\N
1157	Fiat Linea Classic Plus 1.3 Multijet	Car	9	18	4	City	/cars/linea-classic.jpg	8.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Fiat	Plus 1.3 Multijet	1248	4	45	1487	4560	1730	5	76	197	\N
1158	Nissan Terrano Sport Edition	Car	13	18	4	Highway	/cars/terrano.jpg	12.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Sport Edition	1461	4	50	1671	4331	1822	5	85	200	\N
1159	Nissan Terrano Xl D(O)	Car	13	18	4	Highway	/cars/terrano.jpg	12.36 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xl D(O)	1461	4	50	1671	4331	1822	5	85	200	\N
1193	Isuzu Dmax V-Cross Z Prestige	Car	20	18	4	City	/cars/dmax-v-cross.jpg	19.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Pick-up	\N	Isuzu	Z Prestige	1898	4	0	1855	5295	1860	5	150	350	\N
1160	Nissan Terrano Xv D Premium 110 Ps	Car	15	18	4	Highway	/cars/terrano.jpg	14.2 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Nissan	Xv D Premium 110 Ps	1461	4	50	1671	4331	1822	5	110	248	\N
1161	Hyundai Elantra Sx At	Car	20	18	4	City	/cars/elantra.jpg	19.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Sedan	\N	Hyundai	Sx At	1999	4	50	1465	4620	1800	5	152	196	\N
1162	Hyundai Elantra Sx(O) At	Car	21	18	4	City	/cars/elantra.jpg	20.39 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Sedan	\N	Hyundai	Sx(O) At	1999	4	50	1465	4620	1800	5	152	196	\N
1163	Hyundai Elantra Sx	Car	19	18	4	City	/cars/elantra.jpg	18.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	Sx	1999	4	50	1465	4620	1800	5	152	196	\N
1164	Hyundai Elantra S	Car	16	18	4	City	/cars/elantra.jpg	15.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	S	1999	4	50	1465	4620	1800	5	152	196	\N
1165	Hyundai Tucson 2Wd At Gl Petrol	Car	22	18	4	Highway	/cars/tucson.jpg	21.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Hyundai	2Wd At Gl Petrol	1999	4	62	1660	4475	1850	5	155	192	\N
1166	Hyundai Tucson 2Wd At Gl Diesel	Car	24	18	4	Highway	/cars/tucson.jpg	23.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Hyundai	2Wd At Gl Diesel	1995	4	62	1660	4475	1850	5	185	400	\N
1167	Hyundai Tucson 2Wd Mt Petrol	Car	19	18	4	Highway	/cars/tucson.jpg	18.77 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	SUV	\N	Hyundai	2Wd Mt Petrol	1999	4	62	1660	4475	1850	5	155	192	\N
1168	Hyundai Tucson 2Wd Mt Diesel	Car	21	18	4	Highway	/cars/tucson.jpg	20.8 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	SUV	\N	Hyundai	2Wd Mt Diesel	1995	4	62	1660	4475	1850	5	185	400	\N
1169	Hyundai Tucson 2Wd At Gl(O) Petrol	Car	23	18	4	Highway	/cars/tucson.jpg	22.47 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Hyundai	2Wd At Gl(O) Petrol	1999	4	62	1660	4475	1850	5	155	192	\N
1170	Hyundai Tucson 2Wd At Gls Petrol	Car	24	18	4	Highway	/cars/tucson.jpg	23.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Hyundai	2Wd At Gls Petrol	1999	4	62	1660	4475	1850	5	155	192	\N
1171	Hyundai Tucson 4Wd At Gls Diesel	Car	27	18	4	Highway	/cars/tucson.jpg	26.97 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Hyundai	4Wd At Gls Diesel	1995	4	62	1660	4475	1850	5	185	400	\N
1172	Mercedes-Benz Mercedes-Benz A-Class 200D	Car	29	18	4	City	/cars/mercedes-benz-a-class.jpg	28.87 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Hatchback	\N	Mercedes-Benz	200D	2143	4	50	1433	4292	2022	5	136	300	\N
1173	Hyundai Tucson 2Wd At Gl(O) Diesel	Car	25	18	4	Highway	/cars/tucson.jpg	24.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Hyundai	2Wd At Gl(O) Diesel	1995	4	62	1660	4475	1850	5	185	400	\N
1174	Mercedes-Benz Mercedes-Benz A-Class 180	Car	28	18	4	City	/cars/mercedes-benz-a-class.jpg	27.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Mercedes-Benz	180	1595	4	50	1433	4292	1780	5	122	200	\N
1175	Skoda Rapid 1.5 Tdi Cr Active	Car	11	18	4	City	/cars/rapid.jpg	10.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	1.5 Tdi Cr Active	1498	4	55	1466	4413	1699	5	110	250	\N
1176	Nissan Micra Xvd	Car	9	18	4	City	/cars/micra.jpg	8.13 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Nissan	Xvd	1461	4	41	1525	3825	1665	5	64	160	\N
1177	Volvo V40 Cross Country T4	Car	30	18	4	City	/cars/v40-cross-country.jpg	29.62 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Volvo	T4	1596	4	50	1470	4370	1857	5	180	240	\N
1178	Skoda Rapid 1.6 Mpi Ambition	Car	10	18	4	City	/cars/rapid.jpg	9.99 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	1.6 Mpi Ambition	1598	4	55	1466	4413	1699	5	105	153	\N
1179	Skoda Rapid 1.6 Mpi Active	Car	9	18	4	City	/cars/rapid.jpg	8.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	1.6 Mpi Active	1598	4	55	1466	4413	1699	5	105	153	\N
1180	Skoda Rapid 1.5 Tdi Cr Ambition At	Car	13	18	4	City	/cars/rapid.jpg	12.5 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	1.5 Tdi Cr Ambition At	1498	4	55	1466	4413	1699	5	110	250	\N
1181	Skoda Rapid 1.5 Tdi Cr Ambition	Car	12	18	4	City	/cars/rapid.jpg	11.3 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	1.5 Tdi Cr Ambition	1498	4	55	1466	4413	1699	5	110	250	\N
1182	Skoda Rapid 1.6 Mpi Style At	Car	13	18	4	City	/cars/rapid.jpg	12.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	1.6 Mpi Style At	1598	4	55	1466	4413	1699	5	105	153	\N
1183	Skoda Rapid 1.5 Tdi Cr Style At	Car	14	18	4	City	/cars/rapid.jpg	14.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Skoda	1.5 Tdi Cr Style At	1498	4	55	1466	4413	1699	5	110	250	\N
1184	Skoda Rapid 1.5 Tdi Cr Style	Car	13	18	4	City	/cars/rapid.jpg	12.74 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	1.5 Tdi Cr Style	1498	4	55	1466	4413	1699	5	110	250	\N
1185	Skoda Rapid 1.6 Mpi Style	Car	12	18	4	City	/cars/rapid.jpg	11.16 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	1.6 Mpi Style	1598	4	55	1466	4413	1699	5	105	153	\N
1186	Skoda Rapid 1.6 Mpi Ambition At	Car	10	18	4	City	/cars/rapid.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	1.6 Mpi Ambition At	1598	4	55	1466	4413	1699	5	105	153	\N
1187	Skoda Rapid Onyx Mt Diesel	Car	12	18	4	City	/cars/rapid.jpg	11.59 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Skoda	Onyx Mt Diesel	1498	4	55	1466	4413	1699	5	110	250	\N
1188	Skoda Rapid Onyx At Petrol	Car	11	18	4	City	/cars/rapid.jpg	11.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Onyx At Petrol	1598	4	55	1466	4413	1699	5	105	153	\N
1190	Skoda Rapid Onyx Mt Petrol	Car	10	18	4	City	/cars/rapid.jpg	9.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Onyx Mt Petrol	1598	4	55	1466	4413	1699	5	105	153	\N
1191	Isuzu Dmax V-Cross Standard	Car	17	18	4	City	/cars/dmax-v-cross.jpg	16.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Pick-up	\N	Isuzu	Standard	2499	4	0	1840	5295	1860	5	134	320	\N
1192	Isuzu Dmax V-Cross High Z	Car	19	18	4	City	/cars/dmax-v-cross.jpg	18.07 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Pick-up	\N	Isuzu	High Z	2499	4	0	1840	5295	1860	5	134	320	\N
1194	Mercedes-Benz Mercedes-Benz Gla-Class 45 Amg 4Matic	Car	78	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	77.85 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	45 Amg 4Matic	1991	4	50	1479	4445	1804	5	360	450	\N
1195	Mercedes-Benz Mercedes-Benz Gla-Class 200 D Sport	Car	36	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	35.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	200 D Sport	2143	4	70	1494	4424	1804	5	136	300	\N
1196	Mercedes-Benz Mercedes-Benz Gla-Class 200 Sport	Car	35	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	34.38 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	200 Sport	1991	4	50	1494	4424	1804	5	183	300	\N
1197	Mercedes-Benz Mercedes-Benz Gla-Class 200 D Style	Car	33	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	32.33 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	200 D Style	2143	4	70	1494	4424	1804	5	136	300	\N
1198	Mercedes-Benz Mercedes-Benz Gla-Class 45 Aero Edition	Car	81	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	80.67 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	SUV	\N	Mercedes-Benz	45 Aero Edition	1991	4	50	1479	4445	1804	5	375	475	\N
1199	Honda Accord Hybrid 2.0 At	Car	44	18	4	City	/cars/accord-hybrid.jpg	43.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Sedan	\N	Honda	2.0 At	1993	4	60	1464	4933	1849	5	145	175	\N
1200	Mercedes-Benz Mercedes-Benz Gla-Class 220 D 4Matic	Car	39	18	4	Highway	/cars/mercedes-benz-gla-class.jpg	38.64 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	SUV	\N	Mercedes-Benz	220 D 4Matic	2143	4	70	1494	4424	1804	5	170	350	\N
1201	Skoda Octavia Style 1.8 Tsi At	Car	21	18	4	City	/cars/octavia.jpg	20.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	Style 1.8 Tsi At	1798	4	50	1476	4670	1814	5	180	250	\N
1203	Skoda Octavia Style 1.4 Tsi	Car	19	18	4	City	/cars/octavia.jpg	19.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Style 1.4 Tsi	1395	4	50	1476	4670	1814	5	140	250	\N
1204	Skoda Octavia L & K 1.8 Tsi At	Car	24	18	4	City	/cars/octavia.jpg	23.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Skoda	L & K 1.8 Tsi At	1798	4	50	1476	4670	1814	5	180	250	\N
1205	Mahindra Verito 1.5 D4 Bs-Iv	Car	8	18	4	City	/cars/verito.jpg	7.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Mahindra	1.5 D4 Bs-Iv	1461	4	50	1540	4277	1740	5	65	160	\N
1206	Skoda Octavia Corporate Edition 1.4 Tsi	Car	16	18	4	City	/cars/octavia.jpg	15.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Skoda	Corporate Edition 1.4 Tsi	1395	4	50	1476	4670	1814	5	140	250	\N
1207	Mahindra Verito 1.5 D2	Car	8	18	4	City	/cars/verito.jpg	7.48 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Mahindra	1.5 D2	1461	4	50	1540	4277	1740	5	65	160	\N
1208	Mahindra Verito 1.5 D6 Bs-Iv	Car	9	18	4	City	/cars/verito.jpg	8.45 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Mahindra	1.5 D6 Bs-Iv	1461	4	50	1540	4277	1740	5	120	280	\N
1209	Maruti Suzuki Celerio X Vxi	Car	5	18	4	City	/cars/celerio-x.jpg	4.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	998	3	35	1560	3600	1600	5	68	90	\N
1210	Maruti Suzuki Celerio X Vxi (O)	Car	5	18	4	City	/cars/celerio-x.jpg	4.81 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi (O)	998	3	35	1560	3600	1600	5	68	90	\N
1211	Maruti Suzuki Celerio X Zxi (O)	Car	6	18	4	City	/cars/celerio-x.jpg	5.4 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi (O)	998	3	35	1560	3600	1600	5	68	90	\N
1212	Maruti Suzuki Celerio X Vxi Amt (O)	Car	6	18	4	City	/cars/celerio-x.jpg	5.24 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi Amt (O)	998	3	35	1560	3600	1600	5	68	90	\N
1213	Maruti Suzuki Celerio X Zxi	Car	5	18	4	City	/cars/celerio-x.jpg	5.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi	998	3	35	1560	3600	1600	5	68	90	\N
1214	Maruti Suzuki Celerio X Vxi Amt	Car	6	18	4	City	/cars/celerio-x.jpg	5.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi Amt	998	3	35	1560	3600	1600	5	68	90	\N
1215	Maruti Suzuki Celerio X Zxi Amt (O)	Car	6	18	4	City	/cars/celerio-x.jpg	5.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi Amt (O)	998	3	35	1560	3600	1600	5	68	90	\N
1216	Maruti Suzuki Celerio X Zxi Amt	Car	6	18	4	City	/cars/celerio-x.jpg	5.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi Amt	998	3	35	1560	3600	1600	5	68	90	\N
1217	Hyundai Xcent Prime T+	Car	6	18	4	City	/cars/xcent-prime.jpg	5.56 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Hyundai	T+	1197	4	43	1520	3995	1660	5	83	114	\N
1218	Volkswagen Polo Comfortline 1.0 (P)	Car	7	18	4	City	/cars/polo.jpg	6.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Volkswagen	Comfortline 1.0 (P)	999	3	45	1469	3971	1682	5	76	95	\N
1219	Hyundai Elite I20 Era 1.2	Car	6	18	4	City	/cars/elite-i20.jpg	5.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Era 1.2	1197	4	45	1505	3995	1710	5	84	115	\N
1220	Volkswagen Polo Highline Plus 1.0 (P)	Car	8	18	4	City	/cars/polo.jpg	7.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Volkswagen	Highline Plus 1.0 (P)	999	3	45	1469	3971	1682	5	76	95	\N
1221	Volkswagen Polo Trendline 1.0L (P)	Car	6	18	4	City	/cars/polo.jpg	5.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Volkswagen	Trendline 1.0L (P)	999	3	45	1469	3971	1682	5	76	95	\N
1222	Volkswagen Polo Comfortline 1.5 (D)	Car	9	18	4	City	/cars/polo.jpg	8.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Volkswagen	Comfortline 1.5 (D)	1498	4	45	1469	3971	1682	5	90	230	\N
1223	Volkswagen Polo Trendline 1.5L (D)	Car	8	18	4	City	/cars/polo.jpg	7.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Volkswagen	Trendline 1.5L (D)	1498	4	45	1469	3971	1682	5	90	230	\N
1224	Volkswagen Polo Highline Plus 1.5 (D)	Car	10	18	4	City	/cars/polo.jpg	9.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Volkswagen	Highline Plus 1.5 (D)	1498	4	45	1469	3971	1682	5	90	230	\N
1225	Volkswagen Ameo Trendline 1.5L Tdi	Car	8	18	4	City	/cars/ameo.jpg	7.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Trendline 1.5L Tdi	1498	0	45	1483	3995	1682	5	110	250	\N
1226	Volkswagen Polo Gt Tdi	Car	10	18	4	City	/cars/polo.jpg	9.88 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Volkswagen	Gt Tdi	1498	4	45	1469	3971	1682	5	110	250	\N
1227	Volkswagen Polo Gt Tsi	Car	10	18	4	City	/cars/polo.jpg	9.76 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Volkswagen	Gt Tsi	1197	4	45	1469	3971	1682	5	105	175	\N
1228	Volkswagen Ameo Highline Plus 1.5L Tdi	Car	10	18	4	City	/cars/ameo.jpg	9.26 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Highline Plus 1.5L Tdi	1498	0	45	1483	3995	1682	5	110	250	\N
1229	Volkswagen Ameo Comfortline 1.5L Tdi	Car	9	18	4	City	/cars/ameo.jpg	8.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Volkswagen	Comfortline 1.5L Tdi	1498	0	45	1483	3995	1682	5	110	250	\N
1230	Volkswagen Ameo Highline Plus 1.5L Tdi Dsg	Car	10	18	4	City	/cars/ameo.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	Highline Plus 1.5L Tdi Dsg	1498	0	45	1483	3995	1682	5	110	250	\N
1231	Maruti Suzuki Celerio Vxi	Car	5	18	4	City	/cars/celerio.jpg	4.65 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi	998	3	35	1560	3600	1600	5	68	90	\N
1232	Maruti Suzuki Celerio Zxi	Car	5	18	4	City	/cars/celerio.jpg	4.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi	998	3	35	1560	3600	1600	5	68	90	\N
1233	Maruti Suzuki Celerio Vxi At	Car	6	18	4	City	/cars/celerio.jpg	5.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi At	998	3	35	1560	3600	1600	5	68	90	\N
1234	Volkswagen Ameo Gt Line Tdi Dsg	Car	10	18	4	City	/cars/ameo.jpg	10.0 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Volkswagen	Gt Line Tdi Dsg	1498	0	45	1483	3995	1682	5	110	250	\N
1235	Maruti Suzuki Celerio Zxi (Opt)	Car	6	18	4	City	/cars/celerio.jpg	5.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Zxi (Opt)	998	3	35	1560	3600	1600	5	68	90	\N
1236	Maruti Suzuki Celerio Vxi (O) Mt	Car	5	18	4	City	/cars/celerio.jpg	4.72 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Maruti Suzuki	Vxi (O) Mt	998	3	35	1560	3600	1600	5	68	90	\N
1237	Maruti Suzuki Celerio Zxi Ags	Car	6	18	4	City	/cars/celerio.jpg	5.34 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi Ags	998	3	35	1560	3600	1600	5	68	90	\N
1238	Maruti Suzuki Celerio Zxi (O) Ags	Car	6	18	4	City	/cars/celerio.jpg	5.43 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Zxi (O) Ags	998	3	35	1560	3600	1600	5	68	90	\N
1239	Maruti Suzuki Celerio Vxi (O) Ags	Car	6	18	4	City	/cars/celerio.jpg	5.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Maruti Suzuki	Vxi (O) Ags	998	3	35	1560	3600	1600	5	68	90	\N
1240	Hyundai Grand I10 Prime Era T Vtvt	Car	5	18	4	City	/cars/grand-i10-prime.jpg	4.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Era T Vtvt	1197	4	43	1520	3765	1660	5	83	114	\N
1241	Tata Altroz Xz Petrol	Car	8	18	4	City	/cars/altroz.jpg	7.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xz Petrol	1199	3	37	1523	3990	1755	5	86	113	\N
1242	Tata Altroz Xm Petrol	Car	7	18	4	City	/cars/altroz.jpg	6.15 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xm Petrol	1199	3	37	1523	3990	1755	5	86	113	\N
1243	Hyundai Grand I10 Prime Era T+ Vtvt	Car	5	18	4	City	/cars/grand-i10-prime.jpg	4.78 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	Era T+ Vtvt	1197	4	43	1520	3765	1660	5	83	114	\N
1244	Tata Altroz Xt Petrol	Car	7	18	4	City	/cars/altroz.jpg	6.84 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xt Petrol	1199	3	37	1523	3990	1755	5	86	113	\N
1245	Tata Altroz Xm Diesel	Car	8	18	4	City	/cars/altroz.jpg	7.75 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xm Diesel	1497	4	37	1523	3990	1755	5	90	200	\N
1246	Tata Altroz Xz Diesel	Car	10	18	4	City	/cars/altroz.jpg	9.04 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xz Diesel	1497	4	37	1523	3990	1755	5	90	200	\N
1247	Tata Altroz Xz (O) Petrol	Car	8	18	4	City	/cars/altroz.jpg	7.69 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Tata	Xz (O) Petrol	1199	3	37	1523	3990	1755	5	86	113	\N
1248	Tata Altroz Xt Diesel	Car	9	18	4	City	/cars/altroz.jpg	8.44 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xt Diesel	1497	4	37	1523	3990	1755	5	90	200	\N
1249	Tata Tigor Revotron Xm	Car	7	18	4	City	/cars/tigor.jpg	6.1 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Tata	Revotron Xm	1199	3	35	1537	3992	1677	5	86	113	\N
1251	Tata Altroz Xz (O) Diesel	Car	10	18	4	City	/cars/altroz.jpg	9.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Tata	Xz (O) Diesel	1497	4	37	1523	3990	1755	5	90	200	\N
1253	Tata Tigor Revotron Xma	Car	7	18	4	City	/cars/tigor.jpg	6.6 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	AMT	\N	Sedan	\N	Tata	Revotron Xma	1199	3	35	1537	3992	1677	5	86	113	\N
1254	Tata Zest Xe Diesel	Car	8	18	4	City	/cars/zest.jpg	7.03 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Tata	Xe Diesel	1248	4	44	1570	3995	1706	5	75	190	\N
1255	Tata Zest Xms Diesel	Car	8	18	4	City	/cars/zest.jpg	7.94 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Tata	Xms Diesel	1248	4	44	1570	3995	1706	5	75	190	\N
1256	Tata Zest Xt Diesel	Car	9	18	4	City	/cars/zest.jpg	8.55 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Tata	Xt Diesel	1248	4	44	1570	3995	1706	5	90	200	\N
1257	Tata Zest Xta Diesel	Car	10	18	4	City	/cars/zest.jpg	9.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Tata	Xta Diesel	1248	4	44	1570	3995	1706	5	90	200	\N
1258	Tata Zest Zest Premio Edition	Car	8	18	4	City	/cars/zest.jpg	7.89 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Tata	Zest Premio Edition	1248	4	44	1570	3995	1706	5	75	190	\N
1259	Hyundai Verna 1.6 Crdi Sx(O) At	Car	15	18	4	City	/cars/verna.jpg	14.08 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Hyundai	1.6 Crdi Sx(O) At	1582	4	45	1445	4440	1729	5	128	260	\N
1260	Hyundai Verna 1.6 Crdi Sx (O)	Car	14	18	4	City	/cars/verna.jpg	13.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	1.6 Crdi Sx (O)	1582	4	45	1445	4440	1729	5	128	260	\N
1261	Hyundai Verna 1.6 Crdi Sx	Car	12	18	4	City	/cars/verna.jpg	11.73 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Hyundai	1.6 Crdi Sx	1582	4	45	1445	4440	1729	5	128	260	\N
1262	Hyundai Verna 1.6 Crdi Sx Plus At	Car	14	18	4	City	/cars/verna.jpg	13.29 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Sedan	\N	Hyundai	1.6 Crdi Sx Plus At	1582	4	45	1445	4440	1729	5	128	260	\N
1264	Volkswagen Vento Gt Line (D)	Car	15	18	4	City	/cars/vento.jpg	14.49 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Hatchback	\N	Volkswagen	Gt Line (D)	1498	4	45	1469	3971	1682	5	110	250	\N
1265	Volkswagen Vento Gt Line (P) Dsg	Car	14	18	4	City	/cars/vento.jpg	13.18 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Volkswagen	Gt Line (P) Dsg	1197	4	45	1469	3971	1682	5	105	175	\N
1267	Maruti Suzuki Omni 5 Str Bs-Iv	Car	3	18	4	City	/cars/omni.jpg	2.83 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	MPV	\N	Maruti Suzuki	5 Str Bs-Iv	796	3	35	1640	3370	1410	5	34.7	59	\N
1268	Hyundai Grand I10 1.2 Kappa Vtvt Magna	Car	6	18	4	City	/cars/grand-i10.jpg	5.86 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Magna	1197	4	43	1520	3765	1660	5	83	114	\N
1270	Hyundai Grand I10 1.2 Kappa Vtvt Sportz	Car	7	18	4	City	/cars/grand-i10.jpg	6.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Sportz	1197	4	43	1520	3765	1660	5	83	114	\N
1271	Hyundai Grand I10 1.2 Kappa Vtvt Magna At	Car	7	18	4	City	/cars/grand-i10.jpg	6.52 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Magna At	1197	4	43	1520	3765	1660	5	83	114	\N
1272	Hyundai Grand I10 1.2 Kappa Vtvt Sportz At	Car	8	18	4	City	/cars/grand-i10.jpg	7.06 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Sportz At	1197	4	43	1520	3765	1660	5	83	114	\N
1273	Honda City Sv Mt Petrol	Car	10	18	4	City	/cars/city.jpg	9.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	Sv Mt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
1274	Honda City V Mt Petrol	Car	11	18	4	City	/cars/city.jpg	10.66 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	V Mt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
1275	Hyundai Grand I10 1.2 Kappa Vtvt Sportz Dual Tone	Car	7	18	4	City	/cars/grand-i10.jpg	6.41 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Hatchback	\N	Hyundai	1.2 Kappa Vtvt Sportz Dual Tone	1197	4	43	1520	3765	1660	5	83	114	\N
1276	Toyota Prius Z8	Car	46	18	4	City	/cars/prius.jpg	45.09 Lakhs	Imported from Indian Vehicle Dataset	\N	Hybrid	Automatic	\N	Sedan	\N	Toyota	Z8	1798	4	43	1490	4540	1760	5	98	142	\N
1277	Honda City V Mt Diesel	Car	12	18	4	City	/cars/city.jpg	11.91 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	V Mt Diesel	1498	4	40	1495	4440	1695	5	100	200	\N
1278	Honda City Vx Mt Petrol	Car	12	18	4	City	/cars/city.jpg	11.82 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Manual	\N	Sedan	\N	Honda	Vx Mt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
1279	Honda City Vx Cvt Petrol	Car	14	18	4	City	/cars/city.jpg	13.12 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	Vx Cvt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
1280	Honda City Sv Mt Diesel	Car	12	18	4	City	/cars/city.jpg	11.11 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Sv Mt Diesel	1498	4	40	1495	4440	1695	5	100	200	\N
1281	Honda City V Cvt Petrol	Car	13	18	4	City	/cars/city.jpg	12.01 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	V Cvt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
1269	Bmw X1 Xdrive20D M Sport	Car	46	18	4	Highway	/cars/x1.jpg	45.7 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Automatic	\N	Crossover, SUV	\N	Bmw	Xdrive20D M Sport	1995	4	51	1612	4439	2058	5	190	400	\N
1282	Honda City Vx Mt Diesel	Car	14	18	4	City	/cars/city.jpg	13.02 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Vx Mt Diesel	1498	4	40	1495	4440	1695	5	100	200	\N
1283	Honda City Zx Mt Diesel	Car	15	18	4	City	/cars/city.jpg	14.21 Lakhs	Imported from Indian Vehicle Dataset	\N	Diesel	Manual	\N	Sedan	\N	Honda	Zx Mt Diesel	1498	4	40	1495	4440	1695	5	100	200	\N
1284	Honda City Zx Cvt Petrol	Car	15	18	4	City	/cars/city.jpg	14.31 Lakhs	Imported from Indian Vehicle Dataset	\N	Petrol	Automatic	\N	Sedan	\N	Honda	Zx Cvt Petrol	1497	4	40	1495	4440	1695	5	119	145	\N
\.


--
-- Name: comparison_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.comparison_history_id_seq', 9, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.favorites_id_seq', 20, true);


--
-- Name: recommendation_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.recommendation_history_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: vehicle_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.vehicle_reviews_id_seq', 6, true);


--
-- Name: vehicle_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.vehicle_views_id_seq', 122, true);


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.vehicles_id_seq', 1284, true);


--
-- Name: comparison_history comparison_history_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.comparison_history
    ADD CONSTRAINT comparison_history_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: recommendation_history recommendation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendation_history
    ADD CONSTRAINT recommendation_history_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_reviews vehicle_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_reviews
    ADD CONSTRAINT vehicle_reviews_pkey PRIMARY KEY (id);


--
-- Name: vehicle_views vehicle_views_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_views
    ADD CONSTRAINT vehicle_views_pkey PRIMARY KEY (id);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id) ON DELETE CASCADE;


--
-- Name: vehicle_reviews vehicle_reviews_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_reviews
    ADD CONSTRAINT vehicle_reviews_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id);


--
-- Name: vehicle_views vehicle_views_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.vehicle_views
    ADD CONSTRAINT vehicle_views_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 58ifOdSbhpcmTOaYlS2T1mPuR1ThoegXYCOlMWB93Ic7QEYLwMQr4jAjgT6fGvR

