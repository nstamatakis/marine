--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-04-10 22:34:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 210 (class 1259 OID 33095)
-- Name: audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    action character varying(255) NOT NULL,
    user_id integer NOT NULL,
    meta jsonb NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audits OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33093)
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 209
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- TOC entry 208 (class 1259 OID 33082)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 33080)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 212 (class 1259 OID 33106)
-- Name: invitations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitations (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.invitations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33104)
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invitations_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 211
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invitations_id_seq OWNED BY public.invitations.id;


--
-- TOC entry 197 (class 1259 OID 33018)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33016)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 201 (class 1259 OID 33046)
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 33037)
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33062)
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 33060)
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 203
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- TOC entry 206 (class 1259 OID 33074)
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 33072)
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 205
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- TOC entry 202 (class 1259 OID 33055)
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33114)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    system_name character varying(255)
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33112)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 213
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 219 (class 1259 OID 41204)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id integer,
    lat double precision,
    lon double precision,
    heading integer,
    course integer,
    speed integer,
    status bigint,
    mmsi integer,
    callsign character varying(255),
    imo integer,
    length double precision,
    width double precision,
    draught double precision,
    type bigint
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33125)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id bigint NOT NULL,
    system_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33123)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 215
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 199 (class 1259 OID 33026)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 33024)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 218 (class 1259 OID 41087)
-- Name: vessels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vessels (
    id bigint NOT NULL,
    callsign character varying(255),
    length double precision NOT NULL,
    width double precision NOT NULL,
    draught double precision NOT NULL,
    mmsi integer
);


ALTER TABLE public.vessels OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41085)
-- Name: vessels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vessels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessels_id_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 217
-- Name: vessels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vessels_id_seq OWNED BY public.vessels.id;


--
-- TOC entry 2768 (class 2604 OID 33098)
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 33085)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 33109)
-- Name: invitations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations ALTER COLUMN id SET DEFAULT nextval('public.invitations_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 33021)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 33065)
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 33077)
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 33117)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 33128)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 33029)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 41090)
-- Name: vessels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vessels ALTER COLUMN id SET DEFAULT nextval('public.vessels_id_seq'::regclass);


--
-- TOC entry 2939 (class 0 OID 33095)
-- Dependencies: 210
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audits (id, action, user_id, meta, created_at, updated_at) FROM stdin;
1	TEST	1	[]	2020-04-06 19:24:21	2020-04-06 19:24:21
2	vessels::json	1	[]	2020-04-06 19:28:43	2020-04-06 19:28:43
3	vessels::xml	1	[]	2020-04-06 19:29:35	2020-04-06 19:29:35
4	vessels::xml	1	[]	2020-04-06 19:50:44	2020-04-06 19:50:44
5	vessels::xml	1	[]	2020-04-06 19:50:45	2020-04-06 19:50:45
6	vessels::xml	1	[]	2020-04-06 19:50:46	2020-04-06 19:50:46
7	vessels::xml	1	[]	2020-04-06 19:50:47	2020-04-06 19:50:47
8	vessels::xml	1	[]	2020-04-06 19:50:48	2020-04-06 19:50:48
9	vessels::xml	1	[]	2020-04-06 19:50:49	2020-04-06 19:50:49
10	vessels::xml	1	[]	2020-04-06 19:50:50	2020-04-06 19:50:50
11	vessels::xml	1	[]	2020-04-06 19:50:51	2020-04-06 19:50:51
12	vessels::xml	1	[]	2020-04-06 19:50:52	2020-04-06 19:50:52
13	vessels::xml	1	[]	2020-04-06 19:50:53	2020-04-06 19:50:53
14	vessels::xml	1	[]	2020-04-06 19:50:54	2020-04-06 19:50:54
15	vessels::xml	1	[]	2020-04-06 19:50:56	2020-04-06 19:50:56
16	vessels::xml	1	[]	2020-04-06 19:50:56	2020-04-06 19:50:56
17	vessels::xml	1	[]	2020-04-06 19:51:08	2020-04-06 19:51:08
18	vessels::xml	1	[]	2020-04-06 19:51:10	2020-04-06 19:51:10
19	vessels::xml	1	[]	2020-04-06 19:51:15	2020-04-06 19:51:15
20	vessels::xml	1	[]	2020-04-06 19:54:44	2020-04-06 19:54:44
21	vessels::xml	1	[]	2020-04-06 19:54:49	2020-04-06 19:54:49
22	vessels::xml	1	[]	2020-04-06 19:54:50	2020-04-06 19:54:50
23	vessels::xml	1	[]	2020-04-06 19:54:51	2020-04-06 19:54:51
24	vessels::xml	1	[]	2020-04-06 19:54:52	2020-04-06 19:54:52
25	vessels::xml	1	[]	2020-04-06 19:54:52	2020-04-06 19:54:52
26	vessels::xml	1	[]	2020-04-06 19:54:53	2020-04-06 19:54:53
27	vessels::xml	1	[]	2020-04-06 19:54:54	2020-04-06 19:54:54
28	vessels::xml	1	[]	2020-04-06 19:54:55	2020-04-06 19:54:55
29	vessels::xml	1	[]	2020-04-06 19:54:56	2020-04-06 19:54:56
30	vessels::xml	1	[]	2020-04-06 19:54:57	2020-04-06 19:54:57
31	vessels::xml	1	[]	2020-04-06 19:54:58	2020-04-06 19:54:58
32	vessels::xml	1	[]	2020-04-06 19:55:31	2020-04-06 19:55:31
33	vessels::xml	1	[]	2020-04-06 19:57:02	2020-04-06 19:57:02
34	vessels::xml	1	[]	2020-04-06 19:57:47	2020-04-06 19:57:47
35	vessels::xml	1	[]	2020-04-06 19:58:12	2020-04-06 19:58:12
36	vessels::xml	1	[]	2020-04-06 20:03:55	2020-04-06 20:03:55
37	vessels::xml	1	[]	2020-04-06 20:05:35	2020-04-06 20:05:35
38	vessels::xml	1	[]	2020-04-06 20:05:36	2020-04-06 20:05:36
39	vessels::xml	1	[]	2020-04-06 20:05:37	2020-04-06 20:05:37
40	vessels::xml	1	[]	2020-04-06 20:05:38	2020-04-06 20:05:38
41	vessels::xml	1	[]	2020-04-06 20:05:39	2020-04-06 20:05:39
42	vessels::xml	1	[]	2020-04-06 20:05:39	2020-04-06 20:05:39
43	vessels::xml	1	[]	2020-04-06 20:05:40	2020-04-06 20:05:40
44	vessels::xml	1	[]	2020-04-06 20:05:41	2020-04-06 20:05:41
45	vessels::xml	1	[]	2020-04-06 20:05:42	2020-04-06 20:05:42
46	vessels::xml	1	[]	2020-04-06 20:05:43	2020-04-06 20:05:43
47	vessels::xml	1	[]	2020-04-06 20:05:44	2020-04-06 20:05:44
48	vessels::xml	1	[]	2020-04-06 20:05:51	2020-04-06 20:05:51
49	vessels::xml	1	[]	2020-04-06 20:05:52	2020-04-06 20:05:52
50	vessels::xml	1	[]	2020-04-06 20:06:10	2020-04-06 20:06:10
51	vessels::xml	1	[]	2020-04-06 20:09:05	2020-04-06 20:09:05
52	vessels::xml	1	[]	2020-04-06 20:09:11	2020-04-06 20:09:11
53	vessels::xml	1	[]	2020-04-06 20:09:21	2020-04-06 20:09:21
54	vessels::xml	1	[]	2020-04-06 20:09:51	2020-04-06 20:09:51
55	vessels::xml	1	[]	2020-04-06 20:10:00	2020-04-06 20:10:00
56	vessels::xml	1	[]	2020-04-06 20:10:20	2020-04-06 20:10:20
57	vessels::xml	1	[]	2020-04-06 20:10:24	2020-04-06 20:10:24
58	vessels::xml	1	[]	2020-04-06 20:10:30	2020-04-06 20:10:30
59	vessels::xml	1	[]	2020-04-06 20:11:18	2020-04-06 20:11:18
60	vessels::xml	1	[]	2020-04-06 20:11:21	2020-04-06 20:11:21
61	vessels::xml	1	[]	2020-04-06 20:11:27	2020-04-06 20:11:27
62	vessels::xml	1	[]	2020-04-06 20:12:30	2020-04-06 20:12:30
63	vessels::xml	1	[]	2020-04-06 20:12:38	2020-04-06 20:12:38
64	vessels::xml	1	[]	2020-04-06 20:12:51	2020-04-06 20:12:51
65	vessels::xml	1	[]	2020-04-06 20:12:58	2020-04-06 20:12:58
66	vessels::xml	1	[]	2020-04-06 20:14:36	2020-04-06 20:14:36
67	vessels::xml	1	[]	2020-04-06 20:14:41	2020-04-06 20:14:41
68	vessels::xml	1	[]	2020-04-06 20:14:46	2020-04-06 20:14:46
69	vessels::xml	1	[]	2020-04-06 20:15:36	2020-04-06 20:15:36
70	vessels::xml	1	[]	2020-04-06 20:15:37	2020-04-06 20:15:37
71	vessels::xml	1	[]	2020-04-06 20:15:47	2020-04-06 20:15:47
72	vessels::xml	1	[]	2020-04-06 20:15:50	2020-04-06 20:15:50
73	vessels::xml	1	[]	2020-04-06 20:16:39	2020-04-06 20:16:39
74	vessels::xml	1	[]	2020-04-06 20:16:40	2020-04-06 20:16:40
75	vessels::xml	1	[]	2020-04-06 20:16:41	2020-04-06 20:16:41
76	vessels::xml	1	[]	2020-04-06 20:16:41	2020-04-06 20:16:41
77	vessels::xml	1	[]	2020-04-06 20:16:42	2020-04-06 20:16:42
78	vessels::xml	1	[]	2020-04-06 20:16:43	2020-04-06 20:16:43
79	vessels::xml	1	[]	2020-04-06 20:16:44	2020-04-06 20:16:44
80	vessels::xml	1	[]	2020-04-06 20:16:45	2020-04-06 20:16:45
81	vessels::xml	1	[]	2020-04-06 20:16:45	2020-04-06 20:16:45
82	vessels::xml	1	[]	2020-04-06 20:16:46	2020-04-06 20:16:46
83	vessels::xml	1	[]	2020-04-06 20:16:47	2020-04-06 20:16:47
84	vessels::xml	1	[]	2020-04-06 20:16:48	2020-04-06 20:16:48
85	vessels::xml	1	[]	2020-04-06 20:16:48	2020-04-06 20:16:48
86	vessels::xml	1	[]	2020-04-06 20:17:47	2020-04-06 20:17:47
87	vessels::xml	1	[]	2020-04-06 20:17:56	2020-04-06 20:17:56
88	vessels::xml	1	[]	2020-04-06 20:18:01	2020-04-06 20:18:01
89	vessels::xml	1	[]	2020-04-06 20:18:04	2020-04-06 20:18:04
90	vessels::xml	1	[]	2020-04-06 20:18:07	2020-04-06 20:18:07
91	vessels::xml	1	[]	2020-04-06 20:18:11	2020-04-06 20:18:11
92	vessels::xml	1	[]	2020-04-06 20:19:33	2020-04-06 20:19:33
93	vessels::xml	1	[]	2020-04-06 20:19:36	2020-04-06 20:19:36
94	vessels::xml	1	[]	2020-04-06 20:19:39	2020-04-06 20:19:39
95	vessels::xml	1	[]	2020-04-06 20:19:46	2020-04-06 20:19:46
96	vessels::xml	1	[]	2020-04-06 20:25:11	2020-04-06 20:25:11
97	vessels::xml	1	[]	2020-04-06 20:25:17	2020-04-06 20:25:17
98	vessels::xml	1	[]	2020-04-06 20:25:18	2020-04-06 20:25:18
99	vessels::xml	1	[]	2020-04-06 20:25:18	2020-04-06 20:25:18
100	vessels::xml	1	[]	2020-04-06 20:25:19	2020-04-06 20:25:19
101	vessels::xml	1	[]	2020-04-06 20:25:20	2020-04-06 20:25:20
102	vessels::xml	1	[]	2020-04-06 20:25:20	2020-04-06 20:25:20
103	vessels::xml	1	[]	2020-04-06 20:25:21	2020-04-06 20:25:21
104	vessels::xml	1	[]	2020-04-06 20:25:22	2020-04-06 20:25:22
105	vessels::xml	1	[]	2020-04-06 20:25:23	2020-04-06 20:25:23
106	vessels::xml	1	[]	2020-04-06 20:25:24	2020-04-06 20:25:24
107	vessels::xml	1	[]	2020-04-06 20:25:25	2020-04-06 20:25:25
108	vessels::xml	1	[]	2020-04-06 20:25:26	2020-04-06 20:25:26
109	vessels::xml	1	[]	2020-04-06 20:25:26	2020-04-06 20:25:26
110	vessels::xml	1	[]	2020-04-06 20:26:53	2020-04-06 20:26:53
111	vessels::xml	1	[]	2020-04-06 20:26:57	2020-04-06 20:26:57
112	vessels::xml	1	[]	2020-04-06 20:26:58	2020-04-06 20:26:58
113	vessels::xml	1	[]	2020-04-06 20:26:59	2020-04-06 20:26:59
114	vessels::xml	1	[]	2020-04-06 20:26:59	2020-04-06 20:26:59
115	vessels::xml	1	[]	2020-04-06 20:27:00	2020-04-06 20:27:00
116	vessels::xml	1	[]	2020-04-06 20:27:01	2020-04-06 20:27:01
117	vessels::xml	1	[]	2020-04-06 20:27:02	2020-04-06 20:27:02
118	vessels::xml	1	[]	2020-04-06 20:27:04	2020-04-06 20:27:04
119	vessels::xml	1	[]	2020-04-06 20:27:05	2020-04-06 20:27:05
120	vessels::xml	1	[]	2020-04-06 20:27:06	2020-04-06 20:27:06
121	vessels::xml	1	[]	2020-04-06 20:27:07	2020-04-06 20:27:07
122	vessels::xml	1	[]	2020-04-06 20:27:08	2020-04-06 20:27:08
123	vessels::xml	1	[]	2020-04-06 20:27:08	2020-04-06 20:27:08
124	vessels::xml	1	[]	2020-04-06 20:27:09	2020-04-06 20:27:09
125	vessels::xml	1	[]	2020-04-06 20:27:10	2020-04-06 20:27:10
126	vessels::xml	1	[]	2020-04-06 20:27:11	2020-04-06 20:27:11
127	vessels::xml	1	[]	2020-04-06 20:27:11	2020-04-06 20:27:11
128	vessels::xml	1	[]	2020-04-06 20:27:12	2020-04-06 20:27:12
129	vessels::xml	1	[]	2020-04-06 20:27:13	2020-04-06 20:27:13
130	vessels::xml	1	[]	2020-04-06 20:27:15	2020-04-06 20:27:15
131	vessels::xml	1	[]	2020-04-06 20:34:15	2020-04-06 20:34:15
132	vessels::xml	1	[]	2020-04-06 20:34:17	2020-04-06 20:34:17
133	vessels::xml	1	[]	2020-04-06 20:34:17	2020-04-06 20:34:17
134	vessels::xml	1	[]	2020-04-06 20:34:18	2020-04-06 20:34:18
135	vessels::xml	1	[]	2020-04-06 20:34:19	2020-04-06 20:34:19
136	vessels::xml	1	[]	2020-04-06 20:34:20	2020-04-06 20:34:20
137	vessels::xml	1	[]	2020-04-06 20:34:20	2020-04-06 20:34:20
138	vessels::xml	1	[]	2020-04-06 20:34:21	2020-04-06 20:34:21
139	vessels::xml	1	[]	2020-04-06 20:34:22	2020-04-06 20:34:22
140	vessels::xml	1	[]	2020-04-06 20:34:23	2020-04-06 20:34:23
141	vessels::xml	1	[]	2020-04-06 20:34:24	2020-04-06 20:34:24
142	vessels::xml	1	[]	2020-04-06 20:34:25	2020-04-06 20:34:25
143	vessels::xml	1	[]	2020-04-06 20:34:26	2020-04-06 20:34:26
144	vessels::xml	1	[]	2020-04-06 20:34:28	2020-04-06 20:34:28
145	vessels::xml	1	[]	2020-04-06 20:34:29	2020-04-06 20:34:29
146	vessels::xml	1	[]	2020-04-06 20:34:30	2020-04-06 20:34:30
147	vessels::xml	1	[]	2020-04-06 20:38:17	2020-04-06 20:38:17
148	vessels::xml	1	[]	2020-04-06 20:38:18	2020-04-06 20:38:18
149	vessels::xml	1	[]	2020-04-06 20:38:19	2020-04-06 20:38:19
150	vessels::xml	1	[]	2020-04-06 20:38:20	2020-04-06 20:38:20
151	vessels::xml	1	[]	2020-04-06 20:38:20	2020-04-06 20:38:20
152	vessels::xml	1	[]	2020-04-06 20:38:21	2020-04-06 20:38:21
153	vessels::xml	1	[]	2020-04-06 20:38:22	2020-04-06 20:38:22
154	vessels::xml	1	[]	2020-04-06 20:38:22	2020-04-06 20:38:22
155	vessels::xml	1	[]	2020-04-06 20:38:24	2020-04-06 20:38:24
156	vessels::xml	1	[]	2020-04-06 20:38:37	2020-04-06 20:38:37
157	vessels::xml	1	[]	2020-04-06 20:38:38	2020-04-06 20:38:38
158	vessels::xml	1	[]	2020-04-06 20:38:39	2020-04-06 20:38:39
159	vessels::xml	1	[]	2020-04-06 20:38:40	2020-04-06 20:38:40
160	vessels::xml	1	[]	2020-04-06 20:38:41	2020-04-06 20:38:41
161	vessels::xml	1	[]	2020-04-06 20:38:42	2020-04-06 20:38:42
162	vessels::xml	1	[]	2020-04-06 20:38:42	2020-04-06 20:38:42
163	vessels::xml	1	[]	2020-04-06 20:38:43	2020-04-06 20:38:43
164	vessels::xml	1	[]	2020-04-06 20:38:44	2020-04-06 20:38:44
165	vessels::xml	1	[]	2020-04-06 20:38:44	2020-04-06 20:38:44
166	vessels::xml	1	[]	2020-04-06 20:38:45	2020-04-06 20:38:45
167	vessels::xml	1	[]	2020-04-06 20:38:47	2020-04-06 20:38:47
168	vessels::xml	1	[]	2020-04-06 20:38:48	2020-04-06 20:38:48
169	vessels::xml	1	[]	2020-04-06 20:39:21	2020-04-06 20:39:21
170	vessels::xml	1	[]	2020-04-06 20:41:00	2020-04-06 20:41:00
171	vessels::xml	1	[]	2020-04-06 20:41:03	2020-04-06 20:41:03
172	vessels::xml	1	[]	2020-04-06 20:41:05	2020-04-06 20:41:05
173	vessels::xml	1	[]	2020-04-06 20:41:07	2020-04-06 20:41:07
174	vessels::xml	1	[]	2020-04-06 20:41:08	2020-04-06 20:41:08
175	vessels::xml	1	[]	2020-04-06 20:41:09	2020-04-06 20:41:09
176	vessels::xml	1	[]	2020-04-06 20:41:10	2020-04-06 20:41:10
177	vessels::xml	1	[]	2020-04-06 20:41:11	2020-04-06 20:41:11
178	vessels::xml	1	[]	2020-04-06 20:41:12	2020-04-06 20:41:12
179	vessels::xml	1	[]	2020-04-06 20:41:12	2020-04-06 20:41:12
180	vessels::xml	1	[]	2020-04-06 20:41:14	2020-04-06 20:41:14
181	vessels::xml	1	[]	2020-04-06 20:42:04	2020-04-06 20:42:04
182	vessels::xml	1	[]	2020-04-06 20:42:24	2020-04-06 20:42:24
183	vessels::xml	1	[]	2020-04-06 20:42:29	2020-04-06 20:42:29
184	vessels::xml	1	[]	2020-04-06 20:42:32	2020-04-06 20:42:32
185	vessels::xml	1	[]	2020-04-06 20:42:33	2020-04-06 20:42:33
186	vessels::xml	1	[]	2020-04-06 20:42:34	2020-04-06 20:42:34
187	vessels::xml	1	[]	2020-04-06 20:42:34	2020-04-06 20:42:34
188	vessels::xml	1	[]	2020-04-06 20:42:35	2020-04-06 20:42:35
189	vessels::xml	1	[]	2020-04-06 20:42:36	2020-04-06 20:42:36
190	vessels::xml	1	[]	2020-04-06 20:42:39	2020-04-06 20:42:39
191	vessels::xml	1	[]	2020-04-06 20:42:39	2020-04-06 20:42:39
192	vessels::xml	1	[]	2020-04-06 20:42:46	2020-04-06 20:42:46
193	vessels::xml	1	[]	2020-04-06 20:42:53	2020-04-06 20:42:53
194	vessels::xml	1	[]	2020-04-06 20:43:10	2020-04-06 20:43:10
195	vessels::xml	1	[]	2020-04-06 20:44:07	2020-04-06 20:44:07
196	vessels::xml	1	[]	2020-04-06 20:44:07	2020-04-06 20:44:07
197	vessels::xml	1	[]	2020-04-06 20:48:03	2020-04-06 20:48:03
198	vessels::xml	1	[]	2020-04-06 20:48:04	2020-04-06 20:48:04
199	vessels::xml	1	[]	2020-04-06 20:48:05	2020-04-06 20:48:05
200	vessels::xml	1	[]	2020-04-06 20:48:06	2020-04-06 20:48:06
201	vessels::xml	1	[]	2020-04-06 20:48:07	2020-04-06 20:48:07
202	vessels::xml	1	[]	2020-04-06 20:48:07	2020-04-06 20:48:07
203	vessels::xml	1	[]	2020-04-06 20:48:08	2020-04-06 20:48:08
204	vessels::xml	1	[]	2020-04-06 20:48:47	2020-04-06 20:48:47
205	vessels::xml	1	[]	2020-04-06 20:48:48	2020-04-06 20:48:48
206	vessels::xml	1	[]	2020-04-06 20:48:57	2020-04-06 20:48:57
207	vessels::xml	1	[]	2020-04-06 20:49:00	2020-04-06 20:49:00
208	vessels::xml	1	[]	2020-04-06 20:49:03	2020-04-06 20:49:03
209	vessels::xml	1	[]	2020-04-06 20:49:04	2020-04-06 20:49:04
210	vessels::xml	1	[]	2020-04-06 20:49:04	2020-04-06 20:49:04
211	vessels::xml	1	[]	2020-04-06 20:49:05	2020-04-06 20:49:05
212	vessels::xml	1	[]	2020-04-06 20:49:06	2020-04-06 20:49:06
213	vessels::xml	1	[]	2020-04-06 20:49:07	2020-04-06 20:49:07
214	vessels::xml	1	[]	2020-04-06 20:49:07	2020-04-06 20:49:07
215	vessels::xml	1	[]	2020-04-06 20:49:08	2020-04-06 20:49:08
216	vessels::xml	1	[]	2020-04-06 20:49:11	2020-04-06 20:49:11
217	vessels::xml	1	[]	2020-04-06 20:54:08	2020-04-06 20:54:08
218	vessels::xml	1	[]	2020-04-06 20:54:09	2020-04-06 20:54:09
219	vessels::xml	1	[]	2020-04-06 20:54:10	2020-04-06 20:54:10
220	vessels::xml	1	[]	2020-04-06 20:54:11	2020-04-06 20:54:11
221	vessels::xml	1	[]	2020-04-06 20:54:11	2020-04-06 20:54:11
222	vessels::xml	1	[]	2020-04-06 20:54:12	2020-04-06 20:54:12
223	vessels::xml	1	[]	2020-04-06 20:54:13	2020-04-06 20:54:13
224	vessels::xml	1	[]	2020-04-06 20:54:14	2020-04-06 20:54:14
225	vessels::xml	1	[]	2020-04-06 20:54:14	2020-04-06 20:54:14
226	vessels::xml	1	[]	2020-04-06 20:54:15	2020-04-06 20:54:15
227	vessels::xml	1	[]	2020-04-06 20:54:16	2020-04-06 20:54:16
228	vessels::xml	1	[]	2020-04-06 20:54:18	2020-04-06 20:54:18
229	vessels::xml	1	[]	2020-04-06 20:54:18	2020-04-06 20:54:18
230	vessels::xml	1	[]	2020-04-06 20:54:19	2020-04-06 20:54:19
231	vessels::xml	1	[]	2020-04-06 20:54:30	2020-04-06 20:54:30
232	vessels::xml	1	[]	2020-04-06 20:54:31	2020-04-06 20:54:31
233	vessels::xml	1	[]	2020-04-06 20:54:31	2020-04-06 20:54:31
234	vessels::xml	1	[]	2020-04-06 20:54:32	2020-04-06 20:54:32
235	vessels::xml	1	[]	2020-04-06 20:54:33	2020-04-06 20:54:33
236	vessels::xml	1	[]	2020-04-06 20:54:33	2020-04-06 20:54:33
237	vessels::xml	1	[]	2020-04-06 20:54:34	2020-04-06 20:54:34
238	vessels::xml	1	[]	2020-04-06 20:54:35	2020-04-06 20:54:35
239	vessels::xml	1	[]	2020-04-06 20:57:13	2020-04-06 20:57:13
240	vessels::xml	1	[]	2020-04-06 20:57:14	2020-04-06 20:57:14
241	vessels::xml	1	[]	2020-04-06 20:57:15	2020-04-06 20:57:15
242	vessels::xml	1	[]	2020-04-06 20:57:16	2020-04-06 20:57:16
243	vessels::xml	1	[]	2020-04-06 20:57:16	2020-04-06 20:57:16
244	vessels::xml	1	[]	2020-04-06 20:57:17	2020-04-06 20:57:17
245	vessels::xml	1	[]	2020-04-06 20:57:18	2020-04-06 20:57:18
246	vessels::xml	1	[]	2020-04-06 20:57:19	2020-04-06 20:57:19
247	vessels::xml	1	[]	2020-04-06 20:57:19	2020-04-06 20:57:19
248	vessels::xml	1	[]	2020-04-06 20:57:20	2020-04-06 20:57:20
249	vessels::xml	1	[]	2020-04-06 20:57:21	2020-04-06 20:57:21
250	vessels::xml	1	[]	2020-04-06 20:57:33	2020-04-06 20:57:33
251	vessels::xml	1	[]	2020-04-06 20:57:34	2020-04-06 20:57:34
252	vessels::xml	1	[]	2020-04-06 20:57:35	2020-04-06 20:57:35
253	vessels::xml	1	[]	2020-04-06 20:57:35	2020-04-06 20:57:35
254	vessels::xml	1	[]	2020-04-06 20:57:36	2020-04-06 20:57:36
255	vessels::xml	1	[]	2020-04-06 20:57:37	2020-04-06 20:57:37
256	vessels::xml	1	[]	2020-04-06 20:57:38	2020-04-06 20:57:38
257	vessels::xml	1	[]	2020-04-06 20:57:38	2020-04-06 20:57:38
258	vessels::xml	1	[]	2020-04-06 20:57:39	2020-04-06 20:57:39
259	vessels::xml	1	[]	2020-04-06 20:57:40	2020-04-06 20:57:40
260	vessels::xml	1	[]	2020-04-06 20:57:51	2020-04-06 20:57:51
261	vessels::xml	1	[]	2020-04-06 20:57:52	2020-04-06 20:57:52
262	vessels::xml	1	[]	2020-04-06 20:59:06	2020-04-06 20:59:06
263	vessels::xml	1	[]	2020-04-06 20:59:07	2020-04-06 20:59:07
264	vessels::xml	1	[]	2020-04-06 20:59:08	2020-04-06 20:59:08
265	vessels::xml	1	[]	2020-04-06 20:59:08	2020-04-06 20:59:08
266	vessels::xml	1	[]	2020-04-06 20:59:09	2020-04-06 20:59:09
267	vessels::xml	1	[]	2020-04-06 20:59:10	2020-04-06 20:59:10
268	vessels::xml	1	[]	2020-04-06 20:59:10	2020-04-06 20:59:10
269	vessels::xml	1	[]	2020-04-06 20:59:11	2020-04-06 20:59:11
270	vessels::json	1	[]	2020-04-06 21:00:12	2020-04-06 21:00:12
271	vessels::json	1	[]	2020-04-06 21:00:12	2020-04-06 21:00:12
272	vessels::json	1	[]	2020-04-06 21:09:19	2020-04-06 21:09:19
273	vessels::json	1	[]	2020-04-06 21:09:20	2020-04-06 21:09:20
274	vessels::json	1	[]	2020-04-06 21:09:21	2020-04-06 21:09:21
275	vessels::json	1	[]	2020-04-06 21:09:22	2020-04-06 21:09:22
276	vessels::json	1	[]	2020-04-06 21:09:22	2020-04-06 21:09:22
277	vessels::json	1	[]	2020-04-06 21:09:23	2020-04-06 21:09:23
278	vessels::json	1	[]	2020-04-06 21:09:23	2020-04-06 21:09:23
279	vessels::json	1	[]	2020-04-06 21:09:24	2020-04-06 21:09:24
280	vessels::json	1	[]	2020-04-06 21:10:26	2020-04-06 21:10:26
281	vessels::json	1	[]	2020-04-06 21:10:29	2020-04-06 21:10:29
282	vessels::json	1	[]	2020-04-06 21:10:29	2020-04-06 21:10:29
283	vessels::json	1	[]	2020-04-06 21:10:30	2020-04-06 21:10:30
284	vessels::json	1	[]	2020-04-06 21:10:30	2020-04-06 21:10:30
285	vessels::json	1	[]	2020-04-06 21:10:31	2020-04-06 21:10:31
286	vessels::json	1	[]	2020-04-06 21:12:08	2020-04-06 21:12:08
287	vessels::json	1	[]	2020-04-06 21:12:10	2020-04-06 21:12:10
288	vessels::json	1	[]	2020-04-06 21:12:11	2020-04-06 21:12:11
289	vessels::json	1	[]	2020-04-06 21:12:12	2020-04-06 21:12:12
290	vessels::json	1	[]	2020-04-06 21:12:13	2020-04-06 21:12:13
291	vessels::json	1	[]	2020-04-06 21:12:15	2020-04-06 21:12:15
292	vessels::json	1	[]	2020-04-06 21:12:16	2020-04-06 21:12:16
293	vessels::json	1	[]	2020-04-06 21:12:17	2020-04-06 21:12:17
294	vessels::json	1	[]	2020-04-06 21:12:18	2020-04-06 21:12:18
295	vessels::json	1	[]	2020-04-06 21:12:20	2020-04-06 21:12:20
296	vessels::json	1	[]	2020-04-06 21:13:32	2020-04-06 21:13:32
297	vessels::json	1	[]	2020-04-06 21:13:32	2020-04-06 21:13:32
298	vessels::json	1	[]	2020-04-06 21:19:40	2020-04-06 21:19:40
299	vessels::json	1	[]	2020-04-06 21:19:54	2020-04-06 21:19:54
300	vessels::json	1	[]	2020-04-06 21:20:29	2020-04-06 21:20:29
301	vessels::json	1	[]	2020-04-06 21:20:29	2020-04-06 21:20:29
302	vessels::json	1	[]	2020-04-06 21:20:30	2020-04-06 21:20:30
303	vessels::json	1	[]	2020-04-06 21:20:31	2020-04-06 21:20:31
304	vessels::json	1	[]	2020-04-06 21:20:31	2020-04-06 21:20:31
305	vessels::json	1	[]	2020-04-06 21:20:32	2020-04-06 21:20:32
306	vessels::json	1	[]	2020-04-06 21:20:33	2020-04-06 21:20:33
307	vessels::json	1	[]	2020-04-06 21:20:33	2020-04-06 21:20:33
308	vessels::json	1	[]	2020-04-06 21:22:29	2020-04-06 21:22:29
309	vessels::json	1	[]	2020-04-06 21:22:35	2020-04-06 21:22:35
310	vessels::json	1	[]	2020-04-06 21:22:36	2020-04-06 21:22:36
311	vessels::json	1	[]	2020-04-06 21:22:37	2020-04-06 21:22:37
312	vessels::json	1	[]	2020-04-06 21:22:38	2020-04-06 21:22:38
313	vessels::json	1	[]	2020-04-06 21:22:39	2020-04-06 21:22:39
314	vessels::json	1	[]	2020-04-06 21:22:39	2020-04-06 21:22:39
315	vessels::json	1	[]	2020-04-06 21:22:40	2020-04-06 21:22:40
316	vessels::json	1	[]	2020-04-06 21:22:41	2020-04-06 21:22:41
317	vessels::json	1	[]	2020-04-06 21:22:42	2020-04-06 21:22:42
318	vessels::json	1	[]	2020-04-06 21:23:57	2020-04-06 21:23:57
319	vessels::json	1	[]	2020-04-06 21:23:58	2020-04-06 21:23:58
320	vessels::json	1	[]	2020-04-06 21:24:02	2020-04-06 21:24:02
321	vessels::json	1	[]	2020-04-06 21:24:02	2020-04-06 21:24:02
322	vessels::json	1	[]	2020-04-06 21:24:03	2020-04-06 21:24:03
323	vessels::json	1	[]	2020-04-06 21:24:04	2020-04-06 21:24:04
324	vessels::json	1	[]	2020-04-06 21:24:05	2020-04-06 21:24:05
325	vessels::json	1	[]	2020-04-06 21:24:05	2020-04-06 21:24:05
326	vessels::json	1	[]	2020-04-06 21:24:06	2020-04-06 21:24:06
327	vessels::json	1	[]	2020-04-06 21:24:07	2020-04-06 21:24:07
328	vessels::json	1	[]	2020-04-06 21:24:08	2020-04-06 21:24:08
329	vessels::json	1	[]	2020-04-06 21:24:09	2020-04-06 21:24:09
330	vessels::json	1	[]	2020-04-06 21:24:10	2020-04-06 21:24:10
331	vessels::json	1	[]	2020-04-06 21:24:10	2020-04-06 21:24:10
332	vessels::json	1	[]	2020-04-06 21:24:15	2020-04-06 21:24:15
333	vessels::json	1	[]	2020-04-06 21:24:16	2020-04-06 21:24:16
334	vessels::json	1	[]	2020-04-06 21:24:17	2020-04-06 21:24:17
335	vessels::json	1	[]	2020-04-06 21:24:18	2020-04-06 21:24:18
336	vessels::json	1	[]	2020-04-06 21:24:19	2020-04-06 21:24:19
337	vessels::json	1	[]	2020-04-06 21:24:19	2020-04-06 21:24:19
338	vessels::json	1	[]	2020-04-06 21:24:20	2020-04-06 21:24:20
339	vessels::json	1	[]	2020-04-06 21:24:21	2020-04-06 21:24:21
340	vessels::json	1	[]	2020-04-06 21:24:21	2020-04-06 21:24:21
341	vessels::json	1	[]	2020-04-06 21:24:48	2020-04-06 21:24:48
342	vessels::json	1	[]	2020-04-06 21:24:53	2020-04-06 21:24:53
343	vessels::json	1	[]	2020-04-06 21:24:54	2020-04-06 21:24:54
344	vessels::json	1	[]	2020-04-06 21:24:55	2020-04-06 21:24:55
345	vessels::json	1	[]	2020-04-06 21:24:56	2020-04-06 21:24:56
346	vessels::json	1	[]	2020-04-06 21:24:57	2020-04-06 21:24:57
347	vessels::json	1	[]	2020-04-06 21:24:57	2020-04-06 21:24:57
348	vessels::json	1	[]	2020-04-06 21:24:58	2020-04-06 21:24:58
349	vessels::json	1	[]	2020-04-06 21:24:59	2020-04-06 21:24:59
350	vessels::json	1	[]	2020-04-06 21:25:00	2020-04-06 21:25:00
351	vessels::json	1	[]	2020-04-06 21:25:01	2020-04-06 21:25:01
352	vessels::json	1	[]	2020-04-06 21:25:02	2020-04-06 21:25:02
353	vessels::json	1	[]	2020-04-06 21:25:07	2020-04-06 21:25:07
354	vessels::json	1	[]	2020-04-06 21:25:08	2020-04-06 21:25:08
355	vessels::json	1	[]	2020-04-06 21:25:08	2020-04-06 21:25:08
356	vessels::json	1	[]	2020-04-06 21:25:09	2020-04-06 21:25:09
357	vessels::json	1	[]	2020-04-06 21:25:20	2020-04-06 21:25:20
358	vessels::json	1	[]	2020-04-06 21:25:21	2020-04-06 21:25:21
359	vessels::json	1	[]	2020-04-06 21:25:22	2020-04-06 21:25:22
360	vessels::json	1	[]	2020-04-06 21:25:22	2020-04-06 21:25:22
361	vessels::json	1	[]	2020-04-06 21:25:23	2020-04-06 21:25:23
362	vessels::json	1	[]	2020-04-06 21:25:24	2020-04-06 21:25:24
363	vessels::json	1	[]	2020-04-06 21:25:25	2020-04-06 21:25:25
364	vessels::json	1	[]	2020-04-06 21:25:25	2020-04-06 21:25:25
365	vessels::json	1	[]	2020-04-06 21:25:26	2020-04-06 21:25:26
366	vessels::json	1	[]	2020-04-06 21:25:27	2020-04-06 21:25:27
367	vessels::json	1	[]	2020-04-06 21:25:38	2020-04-06 21:25:38
368	vessels::json	1	[]	2020-04-06 21:25:39	2020-04-06 21:25:39
369	vessels::json	1	[]	2020-04-06 21:25:41	2020-04-06 21:25:41
370	vessels::json	1	[]	2020-04-06 21:28:55	2020-04-06 21:28:55
371	vessels::json	1	[]	2020-04-06 21:29:10	2020-04-06 21:29:10
372	vessels::json	1	[]	2020-04-06 21:29:28	2020-04-06 21:29:28
373	vessels::json	1	[]	2020-04-06 22:28:14	2020-04-06 22:28:14
374	vessels::json	1	[]	2020-04-06 22:28:16	2020-04-06 22:28:16
375	vessels::json	1	[]	2020-04-06 22:28:17	2020-04-06 22:28:17
376	vessels::json	1	[]	2020-04-06 22:28:17	2020-04-06 22:28:17
377	vessels::json	1	[]	2020-04-06 22:28:18	2020-04-06 22:28:18
378	vessels::json	1	[]	2020-04-06 22:28:19	2020-04-06 22:28:19
379	vessels::json	1	[]	2020-04-06 22:28:20	2020-04-06 22:28:20
380	vessels::json	1	[]	2020-04-06 23:36:26	2020-04-06 23:36:26
381	vessels::json	1	[]	2020-04-06 23:36:31	2020-04-06 23:36:31
382	vessels::json	1	[]	2020-04-06 23:36:54	2020-04-06 23:36:54
383	vessels::json	1	[]	2020-04-06 23:41:06	2020-04-06 23:41:06
384	vessels::json	1	[]	2020-04-06 23:41:11	2020-04-06 23:41:11
385	vessels::json	1	[]	2020-04-06 23:41:18	2020-04-06 23:41:18
386	vessels::json	1	[]	2020-04-06 23:41:19	2020-04-06 23:41:19
387	vessels::json	1	[]	2020-04-06 23:41:20	2020-04-06 23:41:20
388	vessels::json	1	[]	2020-04-06 23:41:21	2020-04-06 23:41:21
389	vessels::json	1	[]	2020-04-06 23:41:21	2020-04-06 23:41:21
390	vessels::json	1	[]	2020-04-07 12:26:52	2020-04-07 12:26:52
391	vessels::json	5	[]	2020-04-07 12:42:47	2020-04-07 12:42:47
392	vessels::json	5	[]	2020-04-07 12:42:49	2020-04-07 12:42:49
393	vessels::json	5	[]	2020-04-07 12:42:50	2020-04-07 12:42:50
394	vessels::json	5	[]	2020-04-07 12:42:50	2020-04-07 12:42:50
395	vessels::json	5	[]	2020-04-07 12:42:51	2020-04-07 12:42:51
396	vessels::json	5	[]	2020-04-07 12:42:52	2020-04-07 12:42:52
397	vessels::json	5	[]	2020-04-07 12:42:52	2020-04-07 12:42:52
398	vessels::json	5	[]	2020-04-07 12:42:53	2020-04-07 12:42:53
399	vessels::json	5	[]	2020-04-07 12:42:53	2020-04-07 12:42:53
400	vessels::json	5	[]	2020-04-07 12:42:54	2020-04-07 12:42:54
401	vessels::json	5	[]	2020-04-07 16:36:33	2020-04-07 16:36:33
402	vessels::json	6	[]	2020-04-07 20:00:46	2020-04-07 20:00:46
403	vessels::json	6	[]	2020-04-07 20:00:57	2020-04-07 20:00:57
404	vessels::json	6	[]	2020-04-07 20:01:20	2020-04-07 20:01:20
405	vessels::json	6	[]	2020-04-07 20:01:39	2020-04-07 20:01:39
406	vessels::json	6	[]	2020-04-07 20:01:47	2020-04-07 20:01:47
407	vessels::json	6	[]	2020-04-07 20:02:03	2020-04-07 20:02:03
408	vessels::json	6	[]	2020-04-07 20:02:39	2020-04-07 20:02:39
409	vessels::json	6	[]	2020-04-07 20:02:40	2020-04-07 20:02:40
410	vessels::json	6	[]	2020-04-07 20:02:41	2020-04-07 20:02:41
411	vessels::json	6	[]	2020-04-07 20:02:42	2020-04-07 20:02:42
412	vessels::json	6	[]	2020-04-07 20:02:43	2020-04-07 20:02:43
413	vessels::json	6	[]	2020-04-07 20:02:44	2020-04-07 20:02:44
414	vessels::json	6	[]	2020-04-07 20:02:45	2020-04-07 20:02:45
415	vessels::json	6	[]	2020-04-07 20:02:46	2020-04-07 20:02:46
416	vessels::json	6	[]	2020-04-07 20:02:47	2020-04-07 20:02:47
417	vessels::json	6	[]	2020-04-07 20:02:48	2020-04-07 20:02:48
418	vessels::json	6	[]	2020-04-07 20:02:59	2020-04-07 20:02:59
419	vessels::json	6	[]	2020-04-07 20:03:00	2020-04-07 20:03:00
420	vessels::json	6	[]	2020-04-07 20:04:34	2020-04-07 20:04:34
421	vessels::json	6	[]	2020-04-07 20:07:54	2020-04-07 20:07:54
422	vessels::json	6	[]	2020-04-07 20:08:10	2020-04-07 20:08:10
423	vessels::json	6	[]	2020-04-07 20:10:47	2020-04-07 20:10:47
424	vessels::json	6	[]	2020-04-07 20:10:53	2020-04-07 20:10:53
425	vessels::json	6	[]	2020-04-07 20:12:47	2020-04-07 20:12:47
426	vessels::json	6	[]	2020-04-07 20:13:02	2020-04-07 20:13:02
427	vessels::json	6	[]	2020-04-07 20:13:07	2020-04-07 20:13:07
428	vessels::json	6	[]	2020-04-07 20:13:10	2020-04-07 20:13:10
429	vessels::json	6	[]	2020-04-07 20:13:24	2020-04-07 20:13:24
430	vessels::json	6	[]	2020-04-07 20:13:35	2020-04-07 20:13:35
431	vessels::json	6	[]	2020-04-08 16:55:24	2020-04-08 16:55:24
432	vessels::json	6	[]	2020-04-08 16:55:52	2020-04-08 16:55:52
433	vessels::json	8	[]	2020-04-08 16:59:39	2020-04-08 16:59:39
434	vessels::json	8	[]	2020-04-08 16:59:41	2020-04-08 16:59:41
435	vessels::json	8	[]	2020-04-08 16:59:42	2020-04-08 16:59:42
436	vessels::json	8	[]	2020-04-08 16:59:44	2020-04-08 16:59:44
437	vessels::json	8	[]	2020-04-08 16:59:45	2020-04-08 16:59:45
438	vessels::json	8	[]	2020-04-08 16:59:46	2020-04-08 16:59:46
439	vessels::json	8	[]	2020-04-08 16:59:47	2020-04-08 16:59:47
440	vessels::json	8	[]	2020-04-08 16:59:48	2020-04-08 16:59:48
441	vessels::json	8	[]	2020-04-08 16:59:49	2020-04-08 16:59:49
442	vessels::json	8	[]	2020-04-08 16:59:50	2020-04-08 16:59:50
443	vessels::json	8	[]	2020-04-08 17:00:02	2020-04-08 17:00:02
444	vessels::json	8	[]	2020-04-08 17:00:02	2020-04-08 17:00:02
445	vessels::xml	8	[]	2020-04-08 17:00:37	2020-04-08 17:00:37
446	vessels::xml	8	[]	2020-04-08 17:00:43	2020-04-08 17:00:43
447	vessels::xml	8	[]	2020-04-08 17:00:49	2020-04-08 17:00:49
448	vessels::xml	8	[]	2020-04-08 17:01:20	2020-04-08 17:01:20
449	vessels::xml	8	[]	2020-04-08 17:03:12	2020-04-08 17:03:12
450	vessels::xml	8	[]	2020-04-08 17:03:57	2020-04-08 17:03:57
451	vessels::xml	8	[]	2020-04-08 17:06:10	2020-04-08 17:06:10
452	vessels::xml	8	[]	2020-04-08 17:06:32	2020-04-08 17:06:32
453	vessels::xml	8	[]	2020-04-08 17:06:57	2020-04-08 17:06:57
454	vessels::xml	8	[]	2020-04-08 17:08:39	2020-04-08 17:08:39
455	vessels::json	8	[]	2020-04-08 17:08:54	2020-04-08 17:08:54
456	vessels::json	8	[]	2020-04-08 17:09:16	2020-04-08 17:09:16
457	vessels::json	8	[]	2020-04-08 17:09:24	2020-04-08 17:09:24
458	vessels::json	8	[]	2020-04-08 17:09:34	2020-04-08 17:09:34
459	vessels::json	8	[]	2020-04-08 17:41:29	2020-04-08 17:41:29
460	vessels::json	8	[]	2020-04-08 18:02:40	2020-04-08 18:02:40
461	vessels::json	8	[]	2020-04-08 20:49:56	2020-04-08 20:49:56
462	vessels::json	8	[]	2020-04-08 21:50:32	2020-04-08 21:50:32
463	vessels::json	8	[]	2020-04-08 21:50:43	2020-04-08 21:50:43
464	vessels::json	8	[]	2020-04-08 21:50:56	2020-04-08 21:50:56
465	vessels::json	8	[]	2020-04-08 22:08:02	2020-04-08 22:08:02
466	vessels::json	8	[]	2020-04-08 22:08:16	2020-04-08 22:08:16
467	vessels::json	8	[]	2020-04-08 22:16:20	2020-04-08 22:16:20
468	vessels::json	8	[]	2020-04-08 22:17:11	2020-04-08 22:17:11
469	vessels::json	8	[]	2020-04-08 22:17:45	2020-04-08 22:17:45
470	vessels::json	8	[]	2020-04-08 22:26:08	2020-04-08 22:26:08
471	vessels::json	8	[]	2020-04-08 22:26:35	2020-04-08 22:26:35
472	vessels::json	8	[]	2020-04-09 17:35:01	2020-04-09 17:35:01
473	vessels::json	8	[]	2020-04-09 17:35:10	2020-04-09 17:35:10
474	vessels::json	8	[]	2020-04-09 18:42:11	2020-04-09 18:42:11
475	vessels::json	8	[]	2020-04-09 18:49:29	2020-04-09 18:49:29
476	vessels::json	8	[]	2020-04-09 18:49:51	2020-04-09 18:49:51
477	vessels::json	8	[]	2020-04-09 18:50:02	2020-04-09 18:50:02
478	vessels::json	8	[]	2020-04-09 18:51:01	2020-04-09 18:51:01
479	vessels::json	8	[]	2020-04-09 18:52:44	2020-04-09 18:52:44
480	vessels::json	8	[]	2020-04-09 18:52:56	2020-04-09 18:52:56
481	vessels::json	8	[]	2020-04-09 18:53:40	2020-04-09 18:53:40
482	vessels::json	8	[]	2020-04-09 18:55:07	2020-04-09 18:55:07
483	vessels::json	8	[]	2020-04-09 18:55:36	2020-04-09 18:55:36
484	vessels::json	8	[]	2020-04-09 18:56:05	2020-04-09 18:56:05
485	vessels::json	8	[]	2020-04-09 18:56:38	2020-04-09 18:56:38
486	vessels::json	8	[]	2020-04-09 18:57:07	2020-04-09 18:57:07
487	vessels::json	8	[]	2020-04-09 18:57:20	2020-04-09 18:57:20
488	vessels::json	8	[]	2020-04-09 18:57:21	2020-04-09 18:57:21
489	vessels::json	8	[]	2020-04-09 18:58:06	2020-04-09 18:58:06
490	vessels::json	8	[]	2020-04-09 18:58:21	2020-04-09 18:58:21
491	vessels::json	8	[]	2020-04-09 18:58:51	2020-04-09 18:58:51
492	vessels::json	8	[]	2020-04-09 18:59:08	2020-04-09 18:59:08
493	vessels::json	8	[]	2020-04-09 19:04:57	2020-04-09 19:04:57
494	vessels::json	8	[]	2020-04-09 19:07:05	2020-04-09 19:07:05
495	vessels::json	8	[]	2020-04-09 19:08:00	2020-04-09 19:08:00
496	vessels::json	8	[]	2020-04-09 19:08:17	2020-04-09 19:08:17
497	vessels::json	8	[]	2020-04-09 19:12:31	2020-04-09 19:12:31
498	vessels::json	8	[]	2020-04-09 19:15:00	2020-04-09 19:15:00
499	vessels::json	8	[]	2020-04-09 19:16:59	2020-04-09 19:16:59
500	vessels::json	8	[]	2020-04-09 19:17:50	2020-04-09 19:17:50
501	vessels::json	8	[]	2020-04-09 19:17:57	2020-04-09 19:17:57
502	vessels::json	8	[]	2020-04-09 19:18:17	2020-04-09 19:18:17
503	vessels::json	8	[]	2020-04-09 19:18:44	2020-04-09 19:18:44
504	vessels::json	8	[]	2020-04-09 19:24:41	2020-04-09 19:24:41
505	vessels::json	8	[]	2020-04-09 19:25:00	2020-04-09 19:25:00
506	vessels::json	8	[]	2020-04-09 19:26:17	2020-04-09 19:26:17
507	vessels::json	8	[]	2020-04-09 19:27:02	2020-04-09 19:27:02
508	vessels::json	8	[]	2020-04-09 19:35:06	2020-04-09 19:35:06
509	vessels::xml	8	[]	2020-04-09 19:35:13	2020-04-09 19:35:13
510	vessels::json	8	[]	2020-04-09 19:35:26	2020-04-09 19:35:26
511	vessels::json	8	[]	2020-04-09 19:45:02	2020-04-09 19:45:02
512	vessels::json	8	[]	2020-04-09 19:45:23	2020-04-09 19:45:23
513	vessels::json	8	[]	2020-04-09 19:45:34	2020-04-09 19:45:34
514	vessels::json	8	[]	2020-04-09 19:47:11	2020-04-09 19:47:11
515	vessels::json	8	[]	2020-04-09 19:48:49	2020-04-09 19:48:49
516	vessels::json	8	[]	2020-04-09 19:49:16	2020-04-09 19:49:16
517	vessels::json	8	[]	2020-04-09 19:49:24	2020-04-09 19:49:24
518	vessels::json	8	[]	2020-04-09 19:50:39	2020-04-09 19:50:39
519	vessels::json	8	[]	2020-04-09 19:53:25	2020-04-09 19:53:25
520	vessels::json	8	[]	2020-04-09 19:55:11	2020-04-09 19:55:11
521	vessels::json	8	[]	2020-04-09 19:55:47	2020-04-09 19:55:47
522	vessels::json	8	[]	2020-04-09 19:55:58	2020-04-09 19:55:58
523	vessels::json	8	[]	2020-04-09 20:01:27	2020-04-09 20:01:27
524	vessels::json	8	[]	2020-04-09 20:01:44	2020-04-09 20:01:44
525	vessels::json	8	[]	2020-04-09 20:01:54	2020-04-09 20:01:54
526	vessels::json	8	[]	2020-04-09 20:02:06	2020-04-09 20:02:06
527	vessels::json	8	[]	2020-04-09 20:04:18	2020-04-09 20:04:18
528	vessels::json	8	[]	2020-04-09 20:04:47	2020-04-09 20:04:47
529	vessels::json	8	[]	2020-04-09 21:41:40	2020-04-09 21:41:40
530	vessels::json	8	[]	2020-04-09 21:42:19	2020-04-09 21:42:19
531	vessels::json	8	[]	2020-04-09 21:42:42	2020-04-09 21:42:42
532	vessels::json	8	[]	2020-04-09 21:47:33	2020-04-09 21:47:33
533	vessels::xml	8	[]	2020-04-09 21:48:09	2020-04-09 21:48:09
534	vessels::json	8	[]	2020-04-09 21:48:22	2020-04-09 21:48:22
535	vessels::json	8	[]	2020-04-09 21:57:18	2020-04-09 21:57:18
536	vessels::json	8	[]	2020-04-09 22:42:23	2020-04-09 22:42:23
537	vessels::json	8	[]	2020-04-09 22:42:40	2020-04-09 22:42:40
538	vessels::json	8	[]	2020-04-09 22:43:46	2020-04-09 22:43:46
539	vessels::json	8	[]	2020-04-09 22:46:36	2020-04-09 22:46:36
540	vessels::json	8	[]	2020-04-09 22:47:09	2020-04-09 22:47:09
541	vessels::json	8	[]	2020-04-09 22:48:51	2020-04-09 22:48:51
542	vessels::json	8	[]	2020-04-09 23:01:46	2020-04-09 23:01:46
543	vessels::json	8	[]	2020-04-09 23:12:20	2020-04-09 23:12:20
544	vessels::json	8	[]	2020-04-09 23:15:42	2020-04-09 23:15:42
545	vessels::json	8	[]	2020-04-09 23:17:50	2020-04-09 23:17:50
546	vessels::json	8	[]	2020-04-09 23:26:06	2020-04-09 23:26:06
547	vessels::json	8	[]	2020-04-09 23:27:01	2020-04-09 23:27:01
548	vessels::json	8	[]	2020-04-09 23:28:16	2020-04-09 23:28:16
549	vessels::json	8	[]	2020-04-09 23:28:24	2020-04-09 23:28:24
550	vessels::json	8	[]	2020-04-09 23:29:35	2020-04-09 23:29:35
551	vessels::json	8	[]	2020-04-09 23:29:52	2020-04-09 23:29:52
552	vessels::json	8	[]	2020-04-09 23:29:58	2020-04-09 23:29:58
553	vessels::json	8	[]	2020-04-09 23:32:05	2020-04-09 23:32:05
554	vessels::json	8	[]	2020-04-09 23:32:25	2020-04-09 23:32:25
555	vessels::json	8	[]	2020-04-09 23:32:30	2020-04-09 23:32:30
556	vessels::json	8	[]	2020-04-09 23:44:01	2020-04-09 23:44:01
557	vessels::json	8	[]	2020-04-09 23:44:29	2020-04-09 23:44:29
558	vessels::json	8	[]	2020-04-09 23:46:05	2020-04-09 23:46:05
559	vessels::json	8	[]	2020-04-09 23:46:52	2020-04-09 23:46:52
560	vessels::json	8	[]	2020-04-09 23:49:31	2020-04-09 23:49:31
561	vessels::json	8	[]	2020-04-09 23:53:18	2020-04-09 23:53:18
562	vessels::json	8	[]	2020-04-09 23:54:40	2020-04-09 23:54:40
563	vessels::json	8	[]	2020-04-09 23:56:12	2020-04-09 23:56:12
564	vessels::json	8	[]	2020-04-09 23:56:27	2020-04-09 23:56:27
565	vessels::json	8	[]	2020-04-09 23:58:56	2020-04-09 23:58:56
566	vessels::json	8	[]	2020-04-09 23:59:30	2020-04-09 23:59:30
567	vessels::json	8	[]	2020-04-09 23:59:46	2020-04-09 23:59:46
568	vessels::json	8	[]	2020-04-09 23:59:54	2020-04-09 23:59:54
569	vessels::json	8	[]	2020-04-10 00:07:23	2020-04-10 00:07:23
570	vessels::json	8	[]	2020-04-10 00:09:19	2020-04-10 00:09:19
571	vessels::json	8	[]	2020-04-10 00:11:52	2020-04-10 00:11:52
572	vessels::json	8	[]	2020-04-10 01:05:38	2020-04-10 01:05:38
573	vessels::json	8	[]	2020-04-10 01:09:50	2020-04-10 01:09:50
574	vessels::json	8	[]	2020-04-10 01:10:26	2020-04-10 01:10:26
575	vessels::json	8	[]	2020-04-10 01:11:58	2020-04-10 01:11:58
576	vessels::json	8	[]	2020-04-10 01:12:18	2020-04-10 01:12:18
577	vessels::json	8	[]	2020-04-10 01:16:36	2020-04-10 01:16:36
578	vessels::json	8	[]	2020-04-10 01:25:37	2020-04-10 01:25:37
579	vessels::json	8	[]	2020-04-10 01:25:51	2020-04-10 01:25:51
580	vessels::json	8	[]	2020-04-10 01:29:49	2020-04-10 01:29:49
581	vessels::json	8	[]	2020-04-10 01:33:19	2020-04-10 01:33:19
582	vessels::json	8	[]	2020-04-10 01:34:17	2020-04-10 01:34:17
583	vessels::json	8	[]	2020-04-10 01:34:18	2020-04-10 01:34:18
584	vessels::json	8	[]	2020-04-10 01:46:23	2020-04-10 01:46:23
585	vessels::json	8	[]	2020-04-10 01:50:35	2020-04-10 01:50:35
586	vessels::json	8	[]	2020-04-10 01:55:43	2020-04-10 01:55:43
587	vessels::json	8	[]	2020-04-10 01:59:16	2020-04-10 01:59:16
588	vessels::json	8	[]	2020-04-10 02:00:12	2020-04-10 02:00:12
589	vessels::json	8	[]	2020-04-10 02:00:20	2020-04-10 02:00:20
590	vessels::json	8	[]	2020-04-10 02:00:43	2020-04-10 02:00:43
591	vessels::json	8	[]	2020-04-10 02:01:04	2020-04-10 02:01:04
592	vessels::json	8	[]	2020-04-10 02:01:11	2020-04-10 02:01:11
593	vessels::json	8	[]	2020-04-10 02:01:39	2020-04-10 02:01:39
594	vessels::json	8	[]	2020-04-10 02:01:43	2020-04-10 02:01:43
595	vessels::json	8	[]	2020-04-10 02:01:48	2020-04-10 02:01:48
596	vessels::json	11	[]	2020-04-10 03:22:45	2020-04-10 03:22:45
597	vessels::json	11	[]	2020-04-10 03:34:53	2020-04-10 03:34:53
598	vessels::json	11	[]	2020-04-10 03:34:57	2020-04-10 03:34:57
599	vessels::json	11	[]	2020-04-10 03:34:58	2020-04-10 03:34:58
600	vessels::json	11	[]	2020-04-10 03:34:58	2020-04-10 03:34:58
601	vessels::json	11	[]	2020-04-10 03:34:59	2020-04-10 03:34:59
602	vessels::json	11	[]	2020-04-10 03:35:00	2020-04-10 03:35:00
603	vessels::json	11	[]	2020-04-10 03:35:00	2020-04-10 03:35:00
604	vessels::json	11	[]	2020-04-10 03:35:01	2020-04-10 03:35:01
605	vessels::json	11	[]	2020-04-10 03:35:02	2020-04-10 03:35:02
606	vessels::json	11	[]	2020-04-10 03:35:02	2020-04-10 03:35:02
607	vessels::json	12	[]	2020-04-10 03:37:12	2020-04-10 03:37:12
608	vessels::json	12	[]	2020-04-10 03:37:15	2020-04-10 03:37:15
609	vessels::json	12	[]	2020-04-10 03:37:15	2020-04-10 03:37:15
610	vessels::json	12	[]	2020-04-10 03:37:16	2020-04-10 03:37:16
611	vessels::json	12	[]	2020-04-10 03:37:17	2020-04-10 03:37:17
612	vessels::json	12	[]	2020-04-10 03:37:18	2020-04-10 03:37:18
613	vessels::json	12	[]	2020-04-10 03:37:18	2020-04-10 03:37:18
614	vessels::json	12	[]	2020-04-10 03:37:19	2020-04-10 03:37:19
615	vessels::json	12	[]	2020-04-10 03:37:20	2020-04-10 03:37:20
616	vessels::json	12	[]	2020-04-10 03:37:21	2020-04-10 03:37:21
617	vessels::json	12	[]	2020-04-10 03:50:57	2020-04-10 03:50:57
618	vessels::json	12	[]	2020-04-10 03:50:59	2020-04-10 03:50:59
619	vessels::json	12	[]	2020-04-10 03:50:59	2020-04-10 03:50:59
620	vessels::json	12	[]	2020-04-10 03:51:00	2020-04-10 03:51:00
621	vessels::json	12	[]	2020-04-10 03:51:01	2020-04-10 03:51:01
622	vessels::json	12	[]	2020-04-10 03:51:01	2020-04-10 03:51:01
623	vessels::json	12	[]	2020-04-10 03:51:02	2020-04-10 03:51:02
624	vessels::json	12	[]	2020-04-10 03:51:02	2020-04-10 03:51:02
625	vessels::json	12	[]	2020-04-10 03:51:03	2020-04-10 03:51:03
626	vessels::json	12	[]	2020-04-10 03:51:03	2020-04-10 03:51:03
627	vessels::json	12	[]	2020-04-10 03:54:28	2020-04-10 03:54:28
628	vessels::json	12	[]	2020-04-10 03:54:28	2020-04-10 03:54:28
629	vessels::json	12	[]	2020-04-10 03:54:29	2020-04-10 03:54:29
630	vessels::json	12	[]	2020-04-10 03:54:30	2020-04-10 03:54:30
631	vessels::json	12	[]	2020-04-10 03:54:30	2020-04-10 03:54:30
632	vessels::json	12	[]	2020-04-10 03:54:31	2020-04-10 03:54:31
633	vessels::json	12	[]	2020-04-10 03:54:32	2020-04-10 03:54:32
634	vessels::json	12	[]	2020-04-10 03:54:32	2020-04-10 03:54:32
635	vessels::json	12	[]	2020-04-10 03:54:33	2020-04-10 03:54:33
636	vessels::json	12	[]	2020-04-10 03:54:33	2020-04-10 03:54:33
637	vessels::json	12	[]	2020-04-10 03:55:33	2020-04-10 03:55:33
638	vessels::json	12	[]	2020-04-10 03:55:34	2020-04-10 03:55:34
639	vessels::json	12	[]	2020-04-10 03:55:34	2020-04-10 03:55:34
640	vessels::json	12	[]	2020-04-10 03:55:35	2020-04-10 03:55:35
641	vessels::json	12	[]	2020-04-10 03:55:36	2020-04-10 03:55:36
642	vessels::json	12	[]	2020-04-10 03:55:36	2020-04-10 03:55:36
643	vessels::json	12	[]	2020-04-10 03:55:37	2020-04-10 03:55:37
644	vessels::json	12	[]	2020-04-10 03:55:38	2020-04-10 03:55:38
645	vessels::json	12	[]	2020-04-10 03:55:38	2020-04-10 03:55:38
646	vessels::json	12	[]	2020-04-10 03:55:39	2020-04-10 03:55:39
647	vessels::json	12	[]	2020-04-10 13:04:50	2020-04-10 13:04:50
648	vessels::json	12	[]	2020-04-10 13:05:20	2020-04-10 13:05:20
649	vessels::json	12	[]	2020-04-10 13:05:31	2020-04-10 13:05:31
650	vessels::json	12	[]	2020-04-10 18:57:53	2020-04-10 18:57:53
651	vessels::json	12	[]	2020-04-10 19:00:39	2020-04-10 19:00:39
652	vessels::json	12	[]	2020-04-10 19:01:53	2020-04-10 19:01:53
653	vessels::json	12	[]	2020-04-10 19:08:32	2020-04-10 19:08:32
654	vessels::json	12	[]	2020-04-10 19:11:39	2020-04-10 19:11:39
655	vessels::json	12	[]	2020-04-10 19:11:52	2020-04-10 19:11:52
656	vessels::json	12	[]	2020-04-10 19:12:06	2020-04-10 19:12:06
657	vessels::json	12	[]	2020-04-10 19:12:08	2020-04-10 19:12:08
658	vessels::json	12	[]	2020-04-10 19:12:46	2020-04-10 19:12:46
659	vessels::json	12	[]	2020-04-10 19:14:21	2020-04-10 19:14:21
660	vessels::json	12	[]	2020-04-10 19:14:49	2020-04-10 19:14:49
661	vessels::json	12	[]	2020-04-10 19:16:22	2020-04-10 19:16:22
662	vessels::json	12	[]	2020-04-10 19:16:42	2020-04-10 19:16:42
663	vessels::json	12	[]	2020-04-10 19:16:51	2020-04-10 19:16:51
664	vessels::json	12	[]	2020-04-10 19:19:32	2020-04-10 19:19:32
\.


--
-- TOC entry 2937 (class 0 OID 33082)
-- Dependencies: 208
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 33106)
-- Dependencies: 212
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invitations (id, token, created_at, updated_at) FROM stdin;
1	UPlOG0H1GAySywIvSPXp	2020-04-07 12:28:51	2020-04-07 12:28:51
2	AnNlNHMhiZIASC5bW9gp	2020-04-07 19:59:21	2020-04-07 19:59:21
4	vlstcRQ84Hr8nom4tIYc	2020-04-07 20:24:26	2020-04-07 20:24:26
5	7bPIrnYxtsw3AWsNuRLq	2020-04-08 16:58:34	2020-04-08 16:58:34
6	fabYCXaZhwPUO63wZ8NX	2020-04-10 02:04:02	2020-04-10 02:04:02
7	DeBZ3dU8p6QVt6VcsPbJ	2020-04-10 02:04:09	2020-04-10 02:04:09
8	CmpdCzCj32XiGOSgjYRZ	2020-04-10 02:04:49	2020-04-10 02:04:49
9	yNlJltFM41vcYsBGhQB5	2020-04-10 03:36:21	2020-04-10 03:36:21
10	AaKqX5g2yoXugGacTWfb	2020-04-10 04:06:40	2020-04-10 04:06:40
\.


--
-- TOC entry 2926 (class 0 OID 33018)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2016_06_01_000001_create_oauth_auth_codes_table	1
3	2016_06_01_000002_create_oauth_access_tokens_table	1
4	2016_06_01_000003_create_oauth_refresh_tokens_table	1
5	2016_06_01_000004_create_oauth_clients_table	1
6	2016_06_01_000005_create_oauth_personal_access_clients_table	1
7	2019_08_19_000000_create_failed_jobs_table	1
8	2020_04_06_184137_create_audits_table	2
9	2020_04_07_120547_create_invitations_table	3
10	2020_04_07_151617_create_statuses_table	4
11	2020_04_07_154346_create_types_table	5
12	2020_04_08_163258_create_prd_vessels	6
13	2020_04_08_164609_create_prd_vessels	7
14	2020_04_08_213907_create_vessels_table	8
15	2020_04_08_215707_update_table_statuses	9
16	2020_04_09_165354_create_vessels	10
17	2020_04_09_171216_create_vessels	11
\.


--
-- TOC entry 2930 (class 0 OID 33046)
-- Dependencies: 201
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
c21625f85e3b7b10953647bf49673f91f5b0a9a63067d1a71ba667632f737d6a2e3ce63b38d741c8	1	1	authToken	[]	f	2020-04-05 15:58:32	2020-04-05 15:58:32	2021-04-05 15:58:32
ac1a790eaa66bf6b233d71eaa9896218e1195ca76175a4d9525b552a0d0ab84300d0d3e81c591938	1	1	authToken	[]	f	2020-04-05 16:07:47	2020-04-05 16:07:47	2021-04-05 16:07:47
b3c3b7eeb682ed8f39f51eafa20ec3c4761d0be0140025e8ad01df2fcbd439999ae4b9712a3f0859	1	1	authToken	[]	f	2020-04-06 23:35:09	2020-04-06 23:35:09	2021-04-06 23:35:09
52cdee635f27322a013c9b90fff64ebbf00a1720f45e8407df25fad0d8d8f166e82b5a56ce6b14e6	1	1	authToken	[]	f	2020-04-06 23:36:16	2020-04-06 23:36:16	2021-04-06 23:36:16
6ef200d52a2092e1be7795f9e4c3b1dd88bbab3d4238e6eade382399458cddc147aa4aaa2a7f0978	5	1	authToken	[]	f	2020-04-07 12:41:08	2020-04-07 12:41:08	2021-04-07 12:41:08
dc7e5856c40fa2e2d6aec534aa7459b7776ca9865db091df7a12d2b98bf2c1c16f768aa204799ba2	6	1	authToken	[]	f	2020-04-07 19:59:54	2020-04-07 19:59:54	2021-04-07 19:59:54
02fda62aa5072353372b50e81be2d35c9cf01c2fde9319964ffad8d04c30ed5d152586a20df6328c	8	1	authToken	[]	f	2020-04-08 16:58:54	2020-04-08 16:58:54	2021-04-08 16:58:54
abd307da8fe96e39a19b69bf2ed5d5565b6347650176b796b97c74828ddc04b724fcdeb2e847b526	8	1	authToken	[]	f	2020-04-10 01:34:43	2020-04-10 01:34:43	2021-04-10 01:34:43
a311db2ffe5455313a275f9807bfb34682995911502c9b0ccaaf51b3a1ce81d21f8e14b577a3bed1	8	1	authToken	[]	f	2020-04-10 01:53:07	2020-04-10 01:53:07	2021-04-10 01:53:07
5a5204f56a66f4947d669d9ae953ff12ae89c266f213e9bf071cfc7d7712577a2930e0f32a433a30	8	1	authToken	[]	f	2020-04-10 01:59:49	2020-04-10 01:59:49	2021-04-10 01:59:49
e12819fdcfe99c64bd8c872059f5c1f63097d86abb42bb412c80de61118d86502787d8aa00169d73	8	1	authToken	[]	f	2020-04-10 02:00:08	2020-04-10 02:00:08	2021-04-10 02:00:08
745bed791a9f81884bf18005b74e109e95eab5d2c18daec3f7f7618601144edf4356e538a59fa82a	10	1	authToken	[]	f	2020-04-10 02:03:36	2020-04-10 02:03:36	2021-04-10 02:03:36
3f2ef35cd3cffe3e684858c283aa33a72248fdc4b65383bf30c0063ed8f7654f6fa8c9785dfb7e26	10	1	authToken	[]	f	2020-04-10 02:08:36	2020-04-10 02:08:36	2021-04-10 02:08:36
d17f9d8a39fde3e43b190187b39b3e8bfb5b3eefe01e7f18d8f354e3600c159219c9444cc668ed21	10	1	authToken	[]	f	2020-04-10 02:19:16	2020-04-10 02:19:16	2021-04-10 02:19:16
428f3bbd40d162914e2d69b53c7b759fb6e719c5c2be9b9dcea3889d1bc860bb4f44d2445bc9b0ad	10	1	authToken	[]	f	2020-04-10 02:19:53	2020-04-10 02:19:53	2021-04-10 02:19:53
54a7bf1980299313ff21ab17756d3d00d220904b2501d65ee69733372f596d2fc2c08debb8d10385	11	1	authToken	[]	f	2020-04-10 03:22:33	2020-04-10 03:22:33	2021-04-10 03:22:33
ea319bb49df82eb2c25272c843224c05124031ca4217357dcd07f0dd9a84b32a1c9ef5a976248ca7	12	1	authToken	[]	f	2020-04-10 03:36:51	2020-04-10 03:36:51	2021-04-10 03:36:51
383269e3f62414f5e94d3873929a0a22d0a6d6eaf29d5119664edc5467bbb948895b00ff5e161062	12	1	authToken	[]	f	2020-04-10 04:06:22	2020-04-10 04:06:22	2021-04-10 04:06:22
\.


--
-- TOC entry 2929 (class 0 OID 33037)
-- Dependencies: 200
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 33062)
-- Dependencies: 204
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Marine Personal Access Client	lrgoR8J1LD53MBVX7OK4EiGeHC0LIfUvpSSOmp8L	http://localhost	t	f	f	2020-04-05 15:54:50	2020-04-05 15:54:50
2	\N	Marine Password Grant Client	pXRciYsq2bztoHI2SSqAwtJLKZBRVxDyhbjvpgte	http://localhost	f	t	f	2020-04-05 15:54:50	2020-04-05 15:54:50
\.


--
-- TOC entry 2935 (class 0 OID 33074)
-- Dependencies: 206
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2020-04-05 15:54:50	2020-04-05 15:54:50
\.


--
-- TOC entry 2931 (class 0 OID 33055)
-- Dependencies: 202
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 33114)
-- Dependencies: 214
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statuses (id, system_name) FROM stdin;
57	Undefined
58	At Anchor
59	Underway by Sail
60	Engaged in Fishing
61	Underway using Engine
62	Moored
63	Restricted Manoeuvrability
\.


--
-- TOC entry 2948 (class 0 OID 41204)
-- Dependencies: 219
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (id, lat, lon, heading, course, speed, status, mmsi, callsign, imo, length, width, draught, type) FROM stdin;
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2931	8.36145299999999914	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
33	49.883580000000002	-5.6334730000000004	329	331	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.883580000000002	-5.6334730000000004	329	331	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8809699999999978	-5.63123299999999993	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8809699999999978	-5.63123299999999993	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8783699999999968	-5.62899800000000017	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8783699999999968	-5.62899800000000017	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8757999999999981	-5.62682299999999991	330	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8757999999999981	-5.62682299999999991	330	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8705700000000007	-5.62233499999999964	331	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8705700000000007	-5.62233499999999964	331	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8731700000000018	-5.62459299999999995	330	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8731700000000018	-5.62459299999999995	330	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8675300000000021	-5.61971199999999982	330	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8675300000000021	-5.61971199999999982	330	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8644900000000035	-5.61711500000000008	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8644900000000035	-5.61711500000000008	329	331	108	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8610499999999988	-5.6141949999999996	328	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8610499999999988	-5.6141949999999996	328	330	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8581700000000012	-5.61128499999999963	317	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8581700000000012	-5.61128499999999963	317	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8554299999999984	-5.60798000000000041	320	322	106	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8554299999999984	-5.60798000000000041	320	322	106	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8526600000000002	-5.60464099999999998	320	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8526600000000002	-5.60464099999999998	320	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8499499999999998	-5.60129699999999975	320	322	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8499499999999998	-5.60129699999999975	320	322	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8476199999999992	-5.59846500000000002	319	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
33	49.8476199999999992	-5.59846500000000002	319	321	107	61	228259600	FMKQ	9417610	24.9899999999999984	7	33	285
2857	6.05991199999999974	1.25209199999999998	173	245	0	58	371812000	3EHL5	8807662	148	21	60	287
50	49.4255700000000004	-0.316516699999999984	34	304	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4255700000000004	-0.316516699999999984	34	304	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4261800000000022	-0.317830000000000001	36	305	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4261800000000022	-0.317830000000000001	36	305	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4264500000000027	-0.318396699999999977	36	306	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4264500000000027	-0.318396699999999977	36	306	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4268300000000025	-0.319251700000000027	37	306	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4268300000000025	-0.319251700000000027	37	306	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4273400000000009	-0.320361700000000027	38	307	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4273400000000009	-0.320361700000000027	38	307	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4281099999999967	-0.32209500000000002	40	306	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4281099999999967	-0.32209500000000002	40	306	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4286699999999968	-0.323390000000000011	41	307	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4286699999999968	-0.323390000000000011	41	307	15	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4289599999999965	-0.324056699999999975	41	307	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
50	49.4289599999999965	-0.324056699999999975	41	307	16	61	228263700	FMLW	9364980	165	26.8000000000000007	63	277
91	47.7454299999999989	-3.34817000000000009	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454299999999989	-3.34817000000000009	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454499999999982	-3.34817799999999988	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454499999999982	-3.34817799999999988	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454200000000029	-3.34818499999999997	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454200000000029	-3.34818499999999997	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454899999999967	-3.348217	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
91	47.7454899999999967	-3.348217	214	94	0	61	228267700	FNKP	9398814	24.9899999999999984	9.5	42	276
127	44.8877299999999977	-0.532471699999999992	168	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8877299999999977	-0.532471699999999992	168	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8877400000000009	-0.532608300000000034	168	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8877400000000009	-0.532608300000000034	168	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8878100000000018	-0.53265499999999999	167	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8878100000000018	-0.53265499999999999	167	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8878100000000018	-0.532658300000000029	167	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
127	44.8878100000000018	-0.532658300000000029	167	144	0	61	228278826	FNMP	9398826	24.9899999999999984	9.5	40	276
149	50.9703900000000019	1.86896499999999999	74	337	1	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703900000000019	1.86896499999999999	74	337	1	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703799999999987	1.86896700000000004	75	64	0	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703799999999987	1.86896700000000004	75	64	0	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703900000000019	1.86896499999999999	74	260	0	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703900000000019	1.86896499999999999	74	260	0	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703999999999979	1.86897500000000005	74	10	1	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703999999999979	1.86897500000000005	74	10	1	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703900000000019	1.86896799999999996	74	31	0	61	228283600	FNNP	9422184	30.25	11	51	267
149	50.9703900000000019	1.86896799999999996	74	31	0	61	228283600	FNNP	9422184	30.25	11	51	267
154	50.9702300000000008	1.86839200000000005	248	28	0	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702300000000008	1.86839200000000005	248	28	0	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702300000000008	1.86838799999999994	248	219	1	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702300000000008	1.86838799999999994	248	219	1	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702399999999969	1.868398	248	357	1	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702399999999969	1.868398	248	357	1	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702500000000001	1.8684019999999999	248	336	1	61	228283700	FNNQ	9422172	30.25	11	51	267
154	50.9702500000000001	1.8684019999999999	248	336	1	61	228283700	FNNQ	9422172	30.25	11	51	267
158	49.4725800000000007	0.185458299999999993	337	291	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725800000000007	0.185458299999999993	337	291	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185464999999999991	336	313	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185464999999999991	336	313	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185481699999999999	337	293	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185481699999999999	337	293	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185473300000000008	336	325	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725999999999999	0.185473300000000008	336	325	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725800000000007	0.185471699999999989	336	274	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
158	49.4725800000000007	0.185471699999999989	336	274	0	61	228284800	FLEF	9393709	30.3000000000000007	10.4000000000000004	52	276
164	41.9250899999999973	8.74031199999999941	0	327	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9250899999999973	8.74031199999999941	0	327	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9250899999999973	8.74031500000000072	0	325	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9250899999999973	8.74031500000000072	0	325	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9250800000000012	8.74030300000000082	0	334	0	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9250800000000012	8.74030300000000082	0	334	0	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9251000000000005	8.74028999999999989	0	316	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9251000000000005	8.74028999999999989	0	316	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9251000000000005	8.74030300000000082	0	322	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
164	41.9251000000000005	8.74030300000000082	0	322	1	61	228285700	FNNY	9462110	23.3000000000000007	8.24000000000000021	45	276
177	43.3978499999999983	4.98376700000000028	330	299	0	61	228287800	FNOF	9393711	30.3000000000000007	10.4000000000000004	50	276
177	43.3978499999999983	4.98376700000000028	330	299	0	61	228287800	FNOF	9393711	30.3000000000000007	10.4000000000000004	50	276
178	49.4753400000000028	0.13239999999999999	279	94	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753400000000028	0.13239999999999999	279	94	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132428299999999999	280	263	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132428299999999999	280	263	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132404999999999995	279	351	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132404999999999995	279	351	0	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132404999999999995	279	278	1	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
178	49.4753499999999988	0.132404999999999995	279	278	1	61	228287900	FNOI	9393723	30.3000000000000007	10.4000000000000004	53	276
203	51.041089999999997	2.36167499999999997	207	295	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.041089999999997	2.36167499999999997	207	295	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410699999999977	2.3616830000000002	207	304	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410699999999977	2.3616830000000002	207	304	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410699999999977	2.36168500000000003	207	292	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410699999999977	2.36168500000000003	207	292	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410800000000009	2.36171700000000007	207	292	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
203	51.0410800000000009	2.36171700000000007	207	292	0	61	228293600	FNQN	9393747	30.3000000000000007	10.4000000000000004	31	276
209	51.0383199999999988	2.19162699999999999	68	323	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383199999999988	2.19162699999999999	68	323	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383199999999988	2.1916319999999998	68	327	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383199999999988	2.1916319999999998	68	327	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383199999999988	2.1916199999999999	67	266	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383199999999988	2.1916199999999999	67	266	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383100000000027	2.1916199999999999	68	327	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
209	51.0383100000000027	2.1916199999999999	68	327	0	61	228293700	FNQP	9393735	30.3000000000000007	10.4000000000000004	51	276
226	44.8880800000000022	-0.532681599999999977	203	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
226	44.8880800000000022	-0.532681599999999977	203	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
226	44.8881000000000014	-0.532661700000000016	204	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
226	44.8881000000000014	-0.532661700000000016	204	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
226	44.888069999999999	-0.53263499999999997	203	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
226	44.888069999999999	-0.53263499999999997	203	50	0	61	228296800	FNQY	9475961	24.9899999999999984	9.5	48	276
227	49.4591399999999979	0.550883400000000023	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591399999999979	0.550883400000000023	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591399999999979	0.550931700000000024	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591399999999979	0.550931700000000024	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591500000000011	0.550865000000000049	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591500000000011	0.550865000000000049	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591399999999979	0.55088170000000003	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
227	49.4591399999999979	0.55088170000000003	101	280	0	61	228296900	FNQZ	9434010	24.9899999999999984	9.5	50	276
245	47.7280999999999977	-3.3629380000000002	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
245	47.7280999999999977	-3.3629380000000002	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
245	47.7280900000000017	-3.3629929999999999	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
245	47.7280900000000017	-3.3629929999999999	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
245	47.7280900000000017	-3.36297500000000005	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
245	47.7280900000000017	-3.36297500000000005	231	0	0	61	228301600	FNRM	9244465	27.8500000000000014	8.5	52	285
246	51.6494500000000016	-9.9045330000000007	230	273	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494500000000016	-9.9045330000000007	230	273	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494399999999985	-9.9045330000000007	231	284	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494399999999985	-9.9045330000000007	231	284	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494599999999977	-9.90454000000000079	231	317	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494599999999977	-9.90454000000000079	231	317	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494300000000024	-9.9045229999999993	231	295	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
246	51.6494300000000024	-9.9045229999999993	231	295	0	61	228301700	FNRN	9478731	29.8999999999999986	10.8000000000000007	62	268
302	38.9537300000000002	-124.783000000000001	307	306	109	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9537300000000002	-124.783000000000001	307	306	109	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9513499999999979	-124.778800000000004	307	306	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9513499999999979	-124.778800000000004	307	306	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9490100000000012	-124.774799999999999	307	305	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9490100000000012	-124.774799999999999	307	305	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9579299999999975	-124.790099999999995	307	306	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9579299999999975	-124.790099999999995	307	306	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9558699999999973	-124.786600000000007	307	307	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9558699999999973	-124.786600000000007	307	307	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9380900000000025	-124.755700000000004	307	306	104	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9380900000000025	-124.755700000000004	307	306	104	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9358700000000013	-124.751800000000003	308	306	101	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9358700000000013	-124.751800000000003	308	306	101	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9339399999999998	-124.748400000000004	307	305	102	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9339399999999998	-124.748400000000004	307	305	102	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9441800000000029	-124.766499999999994	307	305	109	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9441800000000029	-124.766499999999994	307	305	109	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9466099999999997	-124.770600000000002	307	307	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9466099999999997	-124.770600000000002	307	307	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9400899999999979	-124.759200000000007	307	305	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9400899999999979	-124.759200000000007	307	305	106	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9421699999999973	-124.762900000000002	307	306	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
302	38.9421699999999973	-124.762900000000002	307	306	108	61	228315600	FNUY	9453559	365.5	51.2000000000000028	144	266
320	41.7167900000000031	143.194999999999993	268	267	157	61	228316800	FNVK	9454395	365.5	51.2000000000000028	110	266
320	41.7167900000000031	143.194999999999993	268	267	157	61	228316800	FNVK	9454395	365.5	51.2000000000000028	110	266
320	41.7163800000000009	143.185100000000006	267	266	156	61	228316800	FNVK	9454395	365.5	51.2000000000000028	110	266
320	41.7163800000000009	143.185100000000006	267	266	156	61	228316800	FNVK	9454395	365.5	51.2000000000000028	110	266
326	5.7030839999999996	2.3572829999999998	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.7030839999999996	2.3572829999999998	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70274999999999999	2.36226700000000012	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70274999999999999	2.36226700000000012	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70246600000000026	2.36733299999999991	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70246600000000026	2.36733299999999991	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70216700000000021	2.37250000000000005	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70216700000000021	2.37250000000000005	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70188299999999959	2.37756699999999999	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70188299999999959	2.37756699999999999	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70155000000000012	2.38351699999999989	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70155000000000012	2.38351699999999989	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70368299999999984	2.34643300000000021	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70368299999999984	2.34643300000000021	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70336700000000008	2.35213299999999981	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70336700000000008	2.35213299999999981	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70431699999999964	2.3359169999999998	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70431699999999964	2.3359169999999998	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70401700000000034	2.34114999999999984	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70401700000000034	2.34114999999999984	93	93	170	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70528299999999966	2.31908300000000001	93	92	171	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70528299999999966	2.31908300000000001	93	92	171	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70500000000000007	2.3243330000000002	93	93	171	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70500000000000007	2.3243330000000002	93	93	171	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70466699999999971	2.3299669999999999	93	93	171	61	256609000	9HA3963	9409156	154	25.5	54	294
326	5.70466699999999971	2.3299669999999999	93	93	171	61	256609000	9HA3963	9409156	154	25.5	54	294
341	39.0218300000000013	0.665200000000000014	25	27	69	61	228320600	FMBZ	9291602	105.5	16.8000000000000007	64	274
341	39.0218300000000013	0.665200000000000014	25	27	69	61	228320600	FMBZ	9291602	105.5	16.8000000000000007	64	274
387	4.67178499999999985	7.15885999999999978	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67178499999999985	7.15885999999999978	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.671767	7.15883200000000031	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.671767	7.15883200000000031	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67179699999999976	7.15883499999999984	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67179699999999976	7.15883499999999984	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67181499999999961	7.15883499999999984	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67181499999999961	7.15883499999999984	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67177299999999995	7.15882500000000022	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67177299999999995	7.15882500000000022	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67180700000000027	7.15885000000000016	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67180700000000027	7.15885000000000016	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.6718080000000004	7.15883800000000026	358	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.6718080000000004	7.15883800000000026	358	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67186199999999996	7.15883999999999965	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
387	4.67186199999999996	7.15883999999999965	359	285	0	61	657122100	5NXA8	9320934	67.3900000000000006	15.4000000000000004	48	288
389	4.56845999999999997	-2.36717300000000019	84	82	83	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56845999999999997	-2.36717300000000019	84	82	83	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56790400000000041	-2.37223000000000006	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56790400000000041	-2.37223000000000006	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56760500000000036	-2.37488799999999989	84	83	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56760500000000036	-2.37488799999999989	84	83	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.569102	-2.36138700000000012	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.569102	-2.36138700000000012	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57087000000000021	-2.34474699999999991	84	84	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57087000000000021	-2.34474699999999991	84	84	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57108500000000006	-2.34278200000000014	84	84	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57108500000000006	-2.34278200000000014	84	84	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57043200000000027	-2.34904700000000011	84	83	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57043200000000027	-2.34904700000000011	84	83	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57071200000000033	-2.34628799999999993	84	85	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.57071200000000033	-2.34628799999999993	84	85	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56993000000000027	-2.35368200000000005	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
389	4.56993000000000027	-2.35368200000000005	84	82	84	61	228322600	FMGV	9340403	67.3900000000000006	15.4000000000000004	58	273
402	4.03559399999999968	7.50780699999999968	216	274	1	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03559399999999968	7.50780699999999968	216	274	1	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03551699999999958	7.50790600000000019	216	303	2	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03551699999999958	7.50790600000000019	216	303	2	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03542000000000023	7.50803900000000013	217	301	2	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03542000000000023	7.50803900000000013	217	301	2	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03548500000000043	7.50795999999999975	216	306	1	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
402	4.03548500000000043	7.50795999999999975	216	306	1	61	228323900	FMDR	9307463	73.2000000000000028	16.5	39	270
413	-3.81135700000000011	10.5388999999999999	344	314	6	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81135700000000011	10.5388999999999999	344	314	6	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81135299999999999	10.5388699999999993	345	324	1	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81135299999999999	10.5388699999999993	345	324	1	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81135499999999983	10.5388400000000004	344	309	3	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81135499999999983	10.5388400000000004	344	309	3	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81133800000000011	10.5388800000000007	345	297	2	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81133800000000011	10.5388800000000007	345	297	2	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81131699999999984	10.5388500000000001	344	319	4	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81131699999999984	10.5388500000000001	344	319	4	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81131300000000017	10.5389300000000006	345	336	3	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81131300000000017	10.5389300000000006	345	336	3	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81132500000000007	10.5388699999999993	344	321	4	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
413	-3.81132500000000007	10.5388699999999993	344	321	4	61	228324800	FMFG	9307475	73.2000000000000028	16.5	48	270
414	4.10077499999999961	8.01674500000000023	350	117	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10077499999999961	8.01674500000000023	350	117	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079800000000017	8.01676400000000022	350	101	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079800000000017	8.01676400000000022	350	101	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078799999999966	8.01670200000000044	349	122	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078799999999966	8.01670200000000044	349	122	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10076199999999957	8.01672399999999996	349	122	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10076199999999957	8.01672399999999996	349	122	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10081000000000007	8.01681999999999917	349	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10081000000000007	8.01681999999999917	349	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079499999999975	8.01669700000000063	350	175	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079499999999975	8.01669700000000063	350	175	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078999999999994	8.01669099999999979	350	158	2	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078999999999994	8.01669099999999979	350	158	2	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079999999999956	8.01679099999999956	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10079999999999956	8.01679099999999956	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078500000000012	8.01681300000000086	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10078500000000012	8.01681300000000086	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10075300000000009	8.01681999999999917	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.10075300000000009	8.01681999999999917	350	173	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.1008129999999996	8.01685299999999934	349	131	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
414	4.1008129999999996	8.01685299999999934	349	131	1	61	657145500	5OAA2	9331294	73.2000000000000028	16.5	45	270
438	-6.36172499999999985	11.1244399999999999	20	4	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.36172499999999985	11.1244399999999999	20	4	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.36298299999999983	11.1243499999999997	20	1	12	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.36298299999999983	11.1243499999999997	20	1	12	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35990300000000008	11.1246600000000004	19	4	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35990300000000008	11.1246600000000004	19	4	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35817799999999966	11.1248799999999992	21	7	15	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35817799999999966	11.1248799999999992	21	7	15	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35963499999999993	11.1246899999999993	20	6	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35963499999999993	11.1246899999999993	20	6	13	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35941799999999979	11.1247100000000003	22	7	15	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35941799999999979	11.1247100000000003	22	7	15	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35887799999999981	11.1247699999999998	22	7	14	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35887799999999981	11.1247699999999998	22	7	14	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35735000000000028	11.1250199999999992	22	7	14	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
438	-6.35735000000000028	11.1250199999999992	22	7	14	61	228327700	FVGR	9281970	69.7000000000000028	17.1999999999999993	49	267
457	-23.3407499999999999	-43.6423699999999997	242	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3407499999999999	-43.6423699999999997	242	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3429000000000002	-43.6463899999999967	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3429000000000002	-43.6463899999999967	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3372799999999998	-43.6359800000000035	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3372799999999998	-43.6359800000000035	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3388799999999996	-43.6389199999999988	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3388799999999996	-43.6389199999999988	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3457299999999996	-43.6514299999999977	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3457299999999996	-43.6514299999999977	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.346779999999999	-43.6533500000000032	240	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.346779999999999	-43.6533500000000032	240	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3268200000000014	-43.6164300000000011	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3268200000000014	-43.6164300000000011	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3230800000000009	-43.6093800000000016	241	240	113	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3230800000000009	-43.6093800000000016	241	240	113	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3246700000000011	-43.6123800000000017	241	239	113	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3246700000000011	-43.6123800000000017	241	239	113	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3340700000000005	-43.62988	242	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3340700000000005	-43.62988	242	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3353700000000011	-43.6323700000000017	242	240	115	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3353700000000011	-43.6323700000000017	242	240	115	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3321499999999986	-43.6263500000000022	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3321499999999986	-43.6263500000000022	241	239	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3299999999999983	-43.6224199999999982	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
457	-23.3299999999999983	-43.6224199999999982	241	240	114	61	538007634	V7YG7	9391531	183	32.2000000000000028	86	274
466	15.7173300000000005	-61.5290699999999973	210	210	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7173300000000005	-61.5290699999999973	210	210	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7209599999999998	-61.5268500000000031	210	209	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7209599999999998	-61.5268500000000031	210	209	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7137100000000007	-61.5313099999999977	210	210	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7137100000000007	-61.5313099999999977	210	210	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7063500000000005	-61.5357699999999994	210	210	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7063500000000005	-61.5357699999999994	210	210	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7100600000000004	-61.5335299999999989	209	208	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7100600000000004	-61.5335299999999989	209	208	130	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6981099999999998	-61.5408199999999965	209	208	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6981099999999998	-61.5408199999999965	209	208	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7022600000000008	-61.5383199999999988	209	211	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.7022600000000008	-61.5383199999999988	209	211	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6898700000000009	-61.5459200000000024	212	212	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6898700000000009	-61.5459200000000024	212	212	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6934699999999996	-61.5436699999999988	209	210	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6934699999999996	-61.5436699999999988	209	210	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6835500000000003	-61.5506999999999991	217	219	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6835500000000003	-61.5506999999999991	217	219	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6869099999999992	-61.5480200000000011	216	215	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6869099999999992	-61.5480200000000011	216	215	129	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6797699999999995	-61.5537899999999993	216	218	127	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
466	15.6797699999999995	-61.5537899999999993	216	218	127	61	228330800	FNKK	9377066	119.540000000000006	20	64	274
455	-8.79232099999999939	13.2552699999999994	154	109	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79232099999999939	13.2552699999999994	154	109	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79241700000000037	13.2553999999999998	180	136	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79241700000000037	13.2553999999999998	180	136	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.7923600000000004	13.2553000000000001	214	328	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.7923600000000004	13.2553000000000001	214	328	1	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79237999999999964	13.2554099999999995	177	124	3	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79237999999999964	13.2554099999999995	177	124	3	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79240099999999991	13.2554099999999995	239	282	2	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
455	-8.79240099999999991	13.2554099999999995	239	282	2	61	355764000	HO7184	9499709	34.0300000000000011	6.70000000000000018	14	273
475	25.1633199999999988	-79.484250000000003	2	5	81	61	236662000	ZDPD8	9327504	129	22	60	264
475	25.1633199999999988	-79.484250000000003	2	5	81	61	236662000	ZDPD8	9327504	129	22	60	264
475	25.1610499999999995	-79.4845200000000034	3	5	83	61	236662000	ZDPD8	9327504	129	22	60	264
475	25.1610499999999995	-79.4845200000000034	3	5	83	61	236662000	ZDPD8	9327504	129	22	60	264
475	25.1721000000000004	-79.4834100000000063	2	5	83	61	236662000	ZDPD8	9327504	129	22	60	264
475	25.1721000000000004	-79.4834100000000063	2	5	83	61	236662000	ZDPD8	9327504	129	22	60	264
517	27.0498800000000017	-93.7009999999999934	311	308	140	61	228337900	FLSQ	9450624	334.04000000000002	42.7999999999999972	100	266
517	27.0498800000000017	-93.7009999999999934	311	308	140	61	228337900	FLSQ	9450624	334.04000000000002	42.7999999999999972	100	266
544	34.243859999999998	-76.0644199999999984	231	230	143	61	228338600	FMEK	9299630	334.069999999999993	42.7999999999999972	105	266
544	34.243859999999998	-76.0644199999999984	231	230	143	61	228338600	FMEK	9299630	334.069999999999993	42.7999999999999972	105	266
553	32.0811100000000025	-81.0444300000000055	70	70	62	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0811100000000025	-81.0444300000000055	70	70	62	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.081780000000002	-81.042119999999997	66	66	63	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.081780000000002	-81.042119999999997	66	66	63	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0803900000000013	-81.0485199999999963	79	82	55	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0803900000000013	-81.0485199999999963	79	82	55	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0806200000000032	-81.0466399999999965	74	77	58	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0806200000000032	-81.0466399999999965	74	77	58	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0803500000000028	-81.0505799999999965	86	92	51	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0803500000000028	-81.0505799999999965	86	92	51	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0805999999999969	-81.0559999999999974	91	92	46	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0805999999999969	-81.0559999999999974	91	92	46	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0805199999999999	-81.0526799999999952	92	92	47	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0805199999999999	-81.0526799999999952	92	92	47	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0824700000000007	-81.0401999999999987	66	65	65	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0824700000000007	-81.0401999999999987	66	65	65	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0835900000000009	-81.0370900000000063	66	66	69	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0835900000000009	-81.0370900000000063	66	66	69	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0846500000000034	-81.0340999999999951	66	65	80	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0846500000000034	-81.0340999999999951	66	65	80	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0855800000000002	-81.0314599999999956	66	65	88	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0855800000000002	-81.0314599999999956	66	65	88	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0865599999999986	-81.0286600000000021	65	67	94	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0865599999999986	-81.0286600000000021	65	67	94	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0879699999999985	-81.0252600000000029	50	54	96	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
553	32.0879699999999985	-81.0252600000000029	50	54	96	61	228339600	FLSU	9450648	334	42.7999999999999972	123	266
1153	44.7372599999999991	-2.08262700000000001	327	243	7	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7372599999999991	-2.08262700000000001	327	243	7	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.737090000000002	-2.08293799999999996	320	258	5	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.737090000000002	-2.08293799999999996	320	258	5	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.736930000000001	-2.08339199999999991	323	292	6	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.736930000000001	-2.08339199999999991	323	292	6	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7366799999999998	-2.08375200000000005	319	199	4	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7366799999999998	-2.08375200000000005	319	199	4	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7378500000000017	-2.0813480000000002	322	229	7	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7378500000000017	-2.0813480000000002	322	229	7	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7381200000000021	-2.08088700000000015	321	243	6	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7381200000000021	-2.08088700000000015	321	243	6	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7382899999999992	-2.08061000000000007	319	230	8	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7382899999999992	-2.08061000000000007	319	230	8	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7375400000000027	-2.0817420000000002	321	241	8	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1153	44.7375400000000027	-2.0817420000000002	321	241	8	61	228858000	FTMJ	6523614	31.8599999999999994	7.21999999999999975	45	285
1187	43.3267000000000024	-2.42120200000000008	219	324	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.3267000000000024	-2.42120200000000008	219	324	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.32667	-2.4211999999999998	220	322	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.32667	-2.4211999999999998	220	322	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.3266800000000032	-2.42118000000000011	218	356	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.3266800000000032	-2.42118000000000011	218	356	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.3266800000000032	-2.42119699999999982	220	314	1	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.3266800000000032	-2.42119699999999982	220	314	1	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.32667	-2.42119699999999982	220	312	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1187	43.32667	-2.42119699999999982	220	312	0	61	228904000	FHVD	8862351	24.4400000000000013	5	0	285
1248	48.6638000000000019	-6.67554300000000023	286	290	91	61	228935000	FQBA	9183219	23.5	6	38	268
1248	48.6638000000000019	-6.67554300000000023	286	290	91	61	228935000	FQBA	9183219	23.5	6	38	268
1248	48.6653099999999981	-6.6814549999999997	285	291	91	61	228935000	FQBA	9183219	23.5	6	38	268
1248	48.6653099999999981	-6.6814549999999997	285	291	91	61	228935000	FQBA	9183219	23.5	6	38	268
1394	52.3690100000000029	5.00859499999999969	511	80	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3690100000000029	5.00859499999999969	511	80	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3693900000000028	5.01207699999999967	511	75	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3693900000000028	5.01207699999999967	511	75	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3706800000000001	5.01869500000000013	511	69	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3706800000000001	5.01869500000000013	511	69	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3699900000000014	5.01539200000000029	511	71	75	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3699900000000014	5.01539200000000029	511	71	75	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3685100000000006	5.00028999999999968	511	86	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3685100000000006	5.00028999999999968	511	86	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3686700000000016	5.00506999999999991	511	82	79	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3686700000000016	5.00506999999999991	511	82	79	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3684200000000004	4.99674700000000005	511	89	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3684200000000004	4.99674700000000005	511	89	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3684399999999997	4.99252499999999966	511	93	76	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3684399999999997	4.99252499999999966	511	93	76	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3736699999999971	5.02878700000000034	511	62	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3736699999999971	5.02878700000000034	511	62	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3726699999999994	5.02565300000000015	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3726699999999994	5.02565300000000015	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3715100000000007	5.02197300000000002	511	63	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3715100000000007	5.02197300000000002	511	63	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3757000000000019	5.03508499999999959	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3757000000000019	5.03508499999999959	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3746700000000018	5.03190700000000035	511	62	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3746700000000018	5.03190700000000035	511	62	77	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3767100000000028	5.03824000000000005	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
1394	52.3767100000000028	5.03824000000000005	511	62	78	61	244750341	PE6580	9533311	110	11.4700000000000006	2	297
501	35.7558300000000031	-6.7068329999999996	62	35	2	61	228335900	FMEL	9299783	334.069999999999993	42.7999999999999972	139	266
501	35.7558300000000031	-6.7068329999999996	62	35	2	61	228335900	FMEL	9299783	334.069999999999993	42.7999999999999972	139	266
587	49.3873099999999994	1.00890499999999994	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873099999999994	1.00890499999999994	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873400000000018	1.00888200000000006	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873400000000018	1.00888200000000006	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873400000000018	1.00890799999999992	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873400000000018	1.00890799999999992	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873299999999986	1.00889300000000004	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
587	49.3873299999999986	1.00889300000000004	1	314	0	61	228344800	FLTF	9502702	32	11.5999999999999996	53	267
611	53.144129999999997	-11.8509499999999992	6	356	39	61	228349800	FLTR	9108025	28.5	7.5	48	285
611	53.144129999999997	-11.8509499999999992	6	356	39	61	228349800	FLTR	9108025	28.5	7.5	48	285
618	39.5977900000000034	-67.320210000000003	299	301	210	61	228353600	FMEJ	9299628	334.069999999999993	42.7999999999999972	127	266
618	39.5977900000000034	-67.320210000000003	299	301	210	61	228353600	FMEJ	9299628	334.069999999999993	42.7999999999999972	127	266
618	39.6100399999999979	-67.3457899999999938	302	303	209	61	228353600	FMEJ	9299628	334.069999999999993	42.7999999999999972	127	266
618	39.6100399999999979	-67.3457899999999938	302	303	209	61	228353600	FMEJ	9299628	334.069999999999993	42.7999999999999972	127	266
580	39.0906700000000029	-33.7513700000000014	89	85	177	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
580	39.0906700000000029	-33.7513700000000014	89	85	177	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
580	39.0896499999999989	-33.7714700000000008	89	86	178	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
580	39.0896499999999989	-33.7714700000000008	89	86	178	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
580	39.0926199999999966	-33.7130900000000011	89	85	180	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
580	39.0926199999999966	-33.7130900000000011	89	85	180	61	228343900	FMFS	9299642	349	42.7999999999999972	136	266
1459	47.1432599999999979	-58.2055799999999977	292	293	116	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1459	47.1432599999999979	-58.2055799999999977	292	293	116	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1459	47.1467699999999965	-58.2179599999999979	293	292	117	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1459	47.1467699999999965	-58.2179599999999979	293	292	117	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1459	47.1522099999999966	-58.2369100000000017	292	292	117	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1459	47.1522099999999966	-58.2369100000000017	292	292	117	61	538008873	V7A2858	9580962	161.680000000000007	23	67	274
1461	44.2685299999999984	8.80980199999999947	302	289	42	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2685299999999984	8.80980199999999947	302	289	42	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2681400000000025	8.81136000000000053	301	287	44	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2681400000000025	8.81136000000000053	301	287	44	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2689299999999974	8.80837600000000087	304	288	39	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2689299999999974	8.80837600000000087	304	288	39	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2693799999999982	8.80680699999999916	305	289	37	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2693799999999982	8.80680699999999916	305	289	37	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2701800000000034	8.80393699999999946	308	290	33	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2701800000000034	8.80393699999999946	308	290	33	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2697999999999965	8.80533299999999919	307	290	34	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2697999999999965	8.80533299999999919	307	290	34	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2667000000000002	8.8172650000000008	294	285	56	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2667000000000002	8.8172650000000008	294	285	56	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2661999999999978	8.8197410000000005	291	283	62	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2661999999999978	8.8197410000000005	291	283	62	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2671300000000016	8.81534699999999916	297	286	52	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2671300000000016	8.81534699999999916	297	286	52	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.267710000000001	8.8129849999999994	299	288	48	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.267710000000001	8.8129849999999994	299	288	48	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2649800000000013	8.82672299999999943	286	280	77	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2649800000000013	8.82672299999999943	286	280	77	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2656300000000016	8.82283999999999935	288	281	67	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2656300000000016	8.82283999999999935	288	281	67	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2640600000000006	8.83276399999999917	285	279	90	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2640600000000006	8.83276399999999917	285	279	90	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2645399999999967	8.82963400000000043	285	280	83	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1461	44.2645399999999967	8.82963400000000043	285	280	83	61	229005000	9HA2982	9525912	366.04000000000002	51.2000000000000028	92	266
1470	12.1494499999999999	72.7729599999999976	316	313	173	61	229006000	9HA2983	9525900	366.04000000000002	48.3299999999999983	135	266
1470	12.1494499999999999	72.7729599999999976	316	313	173	61	229006000	9HA2983	9525900	366.04000000000002	48.3299999999999983	135	266
1474	23.5360499999999995	59.4822699999999998	129	127	145	61	229007000	9HA2984	9525936	366.019999999999982	51.2000000000000028	142	266
1474	23.5360499999999995	59.4822699999999998	129	127	145	61	229007000	9HA2984	9525936	366.019999999999982	51.2000000000000028	142	266
1474	22.8310600000000008	60.4510900000000007	131	132	149	61	229007000	9HA2984	9525936	366.019999999999982	51.2000000000000028	142	266
1474	22.8310600000000008	60.4510900000000007	131	132	149	61	229007000	9HA2984	9525936	366.019999999999982	51.2000000000000028	142	266
1524	37.5204299999999975	-0.547449999999999992	53	50	90	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5204299999999975	-0.547449999999999992	53	50	90	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5185600000000008	-0.550283300000000031	53	50	89	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5185600000000008	-0.550283300000000031	53	50	89	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5243400000000022	-0.541560000000000041	54	49	87	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5243400000000022	-0.541560000000000041	54	49	87	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5223200000000006	-0.544631700000000052	53	49	89	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5223200000000006	-0.544631700000000052	53	49	89	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5266400000000004	-0.538035000000000041	53	50	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5266400000000004	-0.538035000000000041	53	50	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5097099999999983	-0.563459999999999961	54	50	86	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5097099999999983	-0.563459999999999961	54	50	86	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5076499999999982	-0.56644669999999997	53	49	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5076499999999982	-0.56644669999999997	53	49	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5058300000000031	-0.568971699999999969	53	48	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5058300000000031	-0.568971699999999969	53	48	83	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5040499999999994	-0.571441700000000052	54	47	81	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5040499999999994	-0.571441700000000052	54	47	81	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5140000000000029	-0.557150000000000034	54	51	88	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5140000000000029	-0.557150000000000034	54	51	88	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5161500000000032	-0.553930000000000033	53	49	92	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5161500000000032	-0.553930000000000033	53	49	92	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5118599999999986	-0.560301700000000014	53	49	91	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1524	37.5118599999999986	-0.560301700000000014	53	49	91	61	229011000	9HA2987	9621871	189.990000000000009	28.5	97	275
1594	1.41185000000000005	139.780900000000003	129	131	98	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.41185000000000005	139.780900000000003	129	131	98	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.41809999999999992	139.773899999999998	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.41809999999999992	139.773899999999998	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42025000000000001	139.7714	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42025000000000001	139.7714	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42379999999999995	139.767300000000006	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42379999999999995	139.767300000000006	129	130	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42521699999999996	139.76570000000001	129	131	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.42521699999999996	139.76570000000001	129	131	97	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.4293499999999999	139.760899999999992	129	131	96	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.4293499999999999	139.760899999999992	129	131	96	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.43293300000000001	139.756900000000002	129	131	96	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1594	1.43293300000000001	139.756900000000002	129	131	96	61	636018183	D5OO2	9227003	288.970000000000027	44.9799999999999969	60	275
1595	5.06329199999999968	0.81834169999999995	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.06329199999999968	0.81834169999999995	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.06680300000000017	0.820001699999999945	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.06680300000000017	0.820001699999999945	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.05884599999999995	0.81622170000000005	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.05884599999999995	0.81622170000000005	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07022300000000037	0.82166170000000005	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07022300000000037	0.82166170000000005	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07367499999999971	0.82332660000000002	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07367499999999971	0.82332660000000002	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07806200000000008	0.825453299999999945	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.07806200000000008	0.825453299999999945	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08149099999999976	0.827119999999999966	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08149099999999976	0.827119999999999966	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08545400000000036	0.82903669999999996	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08545400000000036	0.82903669999999996	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08879000000000037	0.83064669999999996	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.08879000000000037	0.83064669999999996	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09228500000000039	0.832331700000000008	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09228500000000039	0.832331700000000008	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09579200000000032	0.834003300000000003	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09579200000000032	0.834003300000000003	23	25	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09921799999999958	0.835691700000000037	23	26	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1595	5.09921799999999958	0.835691700000000037	23	26	117	61	229036000	9HA3011	9529475	274.370000000000005	48	170	295
1597	15.7490799999999993	41.4106299999999976	141	139	114	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7490799999999993	41.4106299999999976	141	139	114	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7601899999999997	41.4011700000000005	143	141	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7601899999999997	41.4011700000000005	143	141	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7555599999999991	41.4050099999999972	142	140	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7555599999999991	41.4050099999999972	142	140	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7568800000000007	41.403889999999997	142	141	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7568800000000007	41.403889999999997	142	141	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7515000000000001	41.4084999999999965	141	139	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1597	15.7515000000000001	41.4084999999999965	141	139	115	61	229037000	9HA3012	9527855	248.969999999999999	43.7999999999999972	129	295
1528	36.9859799999999979	-30.9750799999999984	242	243	111	61	229013000	9HA2990	9498274	186	23.9699999999999989	76	275
1528	36.9859799999999979	-30.9750799999999984	242	243	111	61	229013000	9HA2990	9498274	186	23.9699999999999989	76	275
1542	1.29017500000000007	104.020499999999998	62	71	17	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.29017500000000007	104.020499999999998	62	71	17	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28971300000000011	104.019199999999998	65	66	23	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28971300000000011	104.019199999999998	65	66	23	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28768199999999999	104.014899999999997	64	56	21	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28768199999999999	104.014899999999997	64	56	21	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.2873349999999999	104.014499999999998	62	53	23	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.2873349999999999	104.014499999999998	62	53	23	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28891700000000009	104.017499999999998	65	62	28	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28891700000000009	104.017499999999998	65	62	28	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28831999999999991	104.016199999999998	64	65	24	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.28831999999999991	104.016199999999998	64	65	24	61	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1640	-16.8086300000000008	-151.375200000000007	358	292	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8086300000000008	-151.375200000000007	358	292	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8086400000000005	-151.375100000000003	17	303	0	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8086400000000005	-151.375100000000003	17	303	0	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083600000000004	-151.375499999999988	49	351	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083600000000004	-151.375499999999988	49	351	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083899999999993	-151.375499999999988	39	342	2	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083899999999993	-151.375499999999988	39	342	2	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084699999999998	-151.375499999999988	28	339	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084699999999998	-151.375499999999988	28	339	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084799999999994	-151.375400000000013	15	315	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084799999999994	-151.375400000000013	15	315	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8085200000000015	-151.375400000000013	354	296	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8085200000000015	-151.375400000000013	354	296	3	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8086300000000008	-151.375200000000007	2	286	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8086300000000008	-151.375200000000007	2	286	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8085500000000003	-151.37530000000001	338	288	4	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8085500000000003	-151.37530000000001	338	288	4	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083300000000015	-151.375499999999988	57	3	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083300000000015	-151.375499999999988	57	3	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083300000000015	-151.375499999999988	68	36	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083300000000015	-151.375499999999988	68	36	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.80837	-151.375400000000013	98	160	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.80837	-151.375400000000013	98	160	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083400000000012	-151.375499999999988	93	146	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083400000000012	-151.375499999999988	93	146	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083199999999984	-151.375499999999988	87	118	0	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8083199999999984	-151.375499999999988	87	118	0	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084400000000009	-151.375400000000013	92	159	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084400000000009	-151.375400000000013	92	159	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084600000000002	-151.375400000000013	84	149	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1640	-16.8084600000000002	-151.375400000000013	84	149	1	61	319142100	ZGHV	1011264	46.7000000000000028	8.55000000000000071	30	262
1679	44.6024200000000022	37.6517300000000006	179	152	24	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6024200000000022	37.6517300000000006	179	152	24	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6082600000000014	37.6484799999999993	180	163	32	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6082600000000014	37.6484799999999993	180	163	32	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6101600000000005	37.6477099999999965	180	165	35	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6101600000000005	37.6477099999999965	180	165	35	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6041799999999995	37.6505700000000019	180	156	26	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6041799999999995	37.6505700000000019	180	156	26	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6063499999999991	37.6493600000000015	180	160	29	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1679	44.6063499999999991	37.6493600000000015	180	160	29	61	229070000	9HA3043	9633458	274.199999999999989	50.0399999999999991	93	295
1680	41.3858800000000002	29.1236299999999986	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3858800000000002	29.1236299999999986	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3841499999999982	29.1238300000000017	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3841499999999982	29.1238300000000017	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3804999999999978	29.1241500000000002	178	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3804999999999978	29.1241500000000002	178	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3821900000000014	29.1239899999999992	179	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3821900000000014	29.1239899999999992	179	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3944199999999967	29.1227599999999995	179	177	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3944199999999967	29.1227599999999995	179	177	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.391840000000002	29.1230399999999996	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.391840000000002	29.1230399999999996	179	175	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3898500000000027	29.1232299999999995	179	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3898500000000027	29.1232299999999995	179	175	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3881500000000031	29.1234099999999998	179	176	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3881500000000031	29.1234099999999998	179	176	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.375709999999998	29.1246399999999994	179	175	60	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.375709999999998	29.1246399999999994	179	175	60	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3731700000000018	29.1249900000000004	178	173	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3731700000000018	29.1249900000000004	178	173	62	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3774000000000015	29.1244699999999987	179	174	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3774000000000015	29.1244699999999987	179	174	61	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3709100000000021	29.1254099999999987	179	172	63	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1680	41.3709100000000021	29.1254099999999987	179	172	63	61	636017300	D5KG3	9631929	140	16.6000000000000014	47	290
1688	19.9550200000000011	-74.0922699999999992	201	203	164	61	229074000	9HA3047	9506459	319	37.3999999999999986	86	277
1688	19.9550200000000011	-74.0922699999999992	201	203	164	61	229074000	9HA3047	9506459	319	37.3999999999999986	86	277
1688	19.9325200000000002	-74.102729999999994	201	203	163	61	229074000	9HA3047	9506459	319	37.3999999999999986	86	277
1688	19.9325200000000002	-74.102729999999994	201	203	163	61	229074000	9HA3047	9506459	319	37.3999999999999986	86	277
1703	5.78708199999999984	-79.923419999999993	17	15	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.78708199999999984	-79.923419999999993	17	15	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.78378999999999976	-79.924359999999993	16	14	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.78378999999999976	-79.924359999999993	16	14	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7802699999999998	-79.9253499999999946	16	15	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7802699999999998	-79.9253499999999946	16	15	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.77395800000000037	-79.9271200000000022	16	16	123	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.77395800000000037	-79.9271200000000022	16	16	123	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7767419999999996	-79.9263499999999993	16	16	121	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7767419999999996	-79.9263499999999993	16	16	121	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7685550000000001	-79.9285600000000045	15	14	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.7685550000000001	-79.9285600000000045	15	14	122	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.80009499999999978	-79.9196299999999979	17	16	121	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.80009499999999978	-79.9196299999999979	17	16	121	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.80271000000000026	-79.9188900000000046	17	15	120	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1703	5.80271000000000026	-79.9188900000000046	17	15	120	61	229079000	9HA3052	9541306	183	32.2000000000000028	110	274
1652	36.6470500000000001	-34.3856400000000022	268	269	148	61	229059000	9HA3033	9414931	330	60	215	295
1652	36.6470500000000001	-34.3856400000000022	268	269	148	61	229059000	9HA3033	9414931	330	60	215	295
1652	36.6446600000000018	-34.4984499999999983	268	266	148	61	229059000	9HA3033	9414931	330	60	215	295
1652	36.6446600000000018	-34.4984499999999983	268	266	148	61	229059000	9HA3033	9414931	330	60	215	295
1653	14.8336500000000004	42.9348299999999981	180	175	1	61	538006843	V7AJ9	9182796	144.050000000000011	23.1499999999999986	80	274
1653	14.8336500000000004	42.9348299999999981	180	175	1	61	538006843	V7AJ9	9182796	144.050000000000011	23.1499999999999986	80	274
1719	53.1244500000000031	1.606325	195	204	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1244500000000031	1.606325	195	204	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1224699999999999	1.60474199999999989	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1224699999999999	1.60474199999999989	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1204999999999998	1.60318800000000006	197	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1204999999999998	1.60318800000000006	197	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.118540000000003	1.60160499999999995	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.118540000000003	1.60160499999999995	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.115949999999998	1.5995029999999999	197	206	79	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.115949999999998	1.5995029999999999	197	206	79	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1337800000000016	1.61383999999999994	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1337800000000016	1.61383999999999994	195	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1306399999999996	1.61125000000000007	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1306399999999996	1.61125000000000007	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1283499999999975	1.60941299999999998	196	206	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1283499999999975	1.60941299999999998	196	206	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1263999999999967	1.60785200000000006	195	204	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1263999999999967	1.60785200000000006	195	204	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1383399999999995	1.61756000000000011	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1383399999999995	1.61756000000000011	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1357100000000031	1.6154599999999999	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1357100000000031	1.6154599999999999	196	206	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1402799999999971	1.6191279999999999	196	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1402799999999971	1.6191279999999999	196	205	78	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1422299999999979	1.62069799999999997	195	206	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1719	53.1422299999999979	1.62069799999999997	195	206	77	61	229086000	9HA3059	9651852	78.5999999999999943	17.6000000000000014	51	273
1714	-38.5756500000000031	138.895600000000002	280	280	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5756500000000031	138.895600000000002	280	280	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5740499999999997	138.884500000000003	279	279	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5740499999999997	138.884500000000003	279	279	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.57376	138.882299999999987	279	279	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.57376	138.882299999999987	279	279	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5730500000000021	138.876800000000003	279	278	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5730500000000021	138.876800000000003	279	278	117	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5777799999999971	138.909899999999993	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5777799999999971	138.909899999999993	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5783199999999979	138.913499999999999	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5783199999999979	138.913499999999999	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5791699999999977	138.919000000000011	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5791699999999977	138.919000000000011	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5795699999999968	138.92179999999999	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5795699999999968	138.92179999999999	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5801700000000025	138.925900000000013	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5801700000000025	138.925900000000013	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5822700000000012	138.940300000000008	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5822700000000012	138.940300000000008	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5806499999999986	138.929300000000012	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1714	-38.5806499999999986	138.929300000000012	280	280	118	61	229084000	9HA3057	9380063	182.5	32.2000000000000028	97	291
1727	30.2265200000000007	-10.0909300000000002	253	247	120	61	229090000	9HA3062	9641730	293.199999999999989	42.2000000000000028	82	277
1727	30.2265200000000007	-10.0909300000000002	253	247	120	61	229090000	9HA3062	9641730	293.199999999999989	42.2000000000000028	82	277
1733	1.44648200000000005	104.789400000000001	286	278	109	61	229093000	9HA3063	9412177	243.97999999999999	42	80	291
1733	1.44648200000000005	104.789400000000001	286	278	109	61	229093000	9HA3063	9412177	243.97999999999999	42	80	291
1746	53.5430700000000002	9.91871599999999987	267	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5430700000000002	9.91871599999999987	267	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431099999999986	9.91868700000000025	268	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431099999999986	9.91868700000000025	268	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431000000000026	9.9186759999999996	269	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431000000000026	9.9186759999999996	269	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431099999999986	9.91872500000000024	268	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1746	53.5431099999999986	9.91872500000000024	268	305	0	61	229095000	9HA3065	9618745	28.6700000000000017	10.1300000000000008	50	276
1780	-16.6195999999999984	119.230500000000006	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6195999999999984	119.230500000000006	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6160500000000013	119.232399999999998	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6160500000000013	119.232399999999998	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6090699999999991	119.236099999999993	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6090699999999991	119.236099999999993	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6124299999999998	119.234300000000005	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6124299999999998	119.234300000000005	209	206	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6036000000000001	119.238900000000001	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.6036000000000001	119.238900000000001	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.5971499999999992	119.242400000000004	209	207	121	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.5971499999999992	119.242400000000004	209	207	121	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.5990800000000007	119.241399999999999	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1780	-16.5990800000000007	119.241399999999999	209	207	120	61	370194000	3EJN6	9475301	288.970000000000027	45	180	275
1783	36.634999999999998	0.081666660000000002	81	82	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.634999999999998	0.081666660000000002	81	82	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6366700000000023	0.0916666700000000056	81	82	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6366700000000023	0.0916666700000000056	81	82	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6333399999999969	0.0716666700000000018	81	84	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6333399999999969	0.0716666700000000018	81	84	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6333399999999969	0.0616666699999999998	81	80	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6333399999999969	0.0616666699999999998	81	80	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6316699999999997	0.0516666699999999979	81	83	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1783	36.6316699999999997	0.0516666699999999979	81	83	90	61	277563000	LYBQ	9125669	99.980000000000004	16.5	43	290
1828	-29.2869600000000005	153.959800000000001	12	15	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2869600000000005	153.959800000000001	12	15	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2845699999999987	153.960499999999996	12	15	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2845699999999987	153.960499999999996	12	15	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2835399999999986	153.960800000000006	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2835399999999986	153.960800000000006	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2811100000000017	153.961500000000001	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2811100000000017	153.961500000000001	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2726100000000002	153.964100000000002	12	11	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2726100000000002	153.964100000000002	12	11	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2695299999999996	153.965000000000003	12	15	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2695299999999996	153.965000000000003	12	15	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2780899999999988	153.962400000000002	13	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2780899999999988	153.962400000000002	13	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2749799999999993	153.963400000000007	12	16	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2749799999999993	153.963400000000007	12	16	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2664700000000018	153.965800000000002	12	14	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2664700000000018	153.965800000000002	12	14	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2644500000000001	153.96629999999999	12	12	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2644500000000001	153.96629999999999	12	12	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2613200000000013	153.967099999999988	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2613200000000013	153.967099999999988	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2630100000000013	153.966700000000003	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2630100000000013	153.966700000000003	12	13	76	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2609400000000015	153.967199999999991	12	14	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2609400000000015	153.967199999999991	12	14	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2592299999999987	153.967700000000008	12	10	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1828	-29.2592299999999987	153.967700000000008	12	10	77	61	229125000	9HA3088	9597238	229.02000000000001	32.2899999999999991	145	275
1829	-27.8402700000000003	43.8574199999999976	243	247	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8402700000000003	43.8574199999999976	243	247	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8407400000000003	43.8560900000000018	242	246	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8407400000000003	43.8560900000000018	242	246	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8413399999999989	43.8543900000000022	244	250	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8413399999999989	43.8543900000000022	244	250	88	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8384500000000017	43.8624999999999972	243	247	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8384500000000017	43.8624999999999972	243	247	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8372799999999998	43.8657800000000009	243	247	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8372799999999998	43.8657800000000009	243	247	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8366800000000012	43.8674499999999981	243	247	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8366800000000012	43.8674499999999981	243	247	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8337199999999996	43.876339999999999	243	246	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8337199999999996	43.876339999999999	243	246	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8328699999999998	43.8787499999999966	242	248	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8328699999999998	43.8787499999999966	242	248	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8354299999999988	43.8712099999999978	244	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8354299999999988	43.8712099999999978	244	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8355700000000006	43.8708400000000012	244	247	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8355700000000006	43.8708400000000012	244	247	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8348399999999998	43.872950000000003	244	250	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8348399999999998	43.872950000000003	244	250	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8342999999999989	43.8745800000000017	243	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8342999999999989	43.8745800000000017	243	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8309399999999982	43.8844500000000011	243	246	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8309399999999982	43.8844500000000011	243	246	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.831430000000001	43.8828299999999984	243	253	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.831430000000001	43.8828299999999984	243	253	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.83202	43.8812500000000014	242	244	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.83202	43.8812500000000014	242	244	85	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.830210000000001	43.8865300000000005	243	252	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.830210000000001	43.8865300000000005	243	252	86	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8290399999999991	43.8903400000000019	244	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8290399999999991	43.8903400000000019	244	248	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8295299999999983	43.8887100000000032	244	251	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1829	-27.8295299999999983	43.8887100000000032	244	251	87	61	229126000	9HA3089	9597226	229	32.2899999999999991	127	275
1786	-23.1993699999999983	53.4370699999999985	235	237	105	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1993699999999983	53.4370699999999985	235	237	105	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2012500000000017	53.4340100000000007	236	237	107	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2012500000000017	53.4340100000000007	236	237	107	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2001899999999992	53.4357499999999987	235	236	106	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2001899999999992	53.4357499999999987	235	236	106	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.20383	53.4296099999999967	237	237	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.20383	53.4296099999999967	237	237	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2046099999999988	53.4282800000000009	237	238	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2046099999999988	53.4282800000000009	237	238	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2028299999999987	53.4313399999999987	237	236	104	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.2028299999999987	53.4313399999999987	237	236	104	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.206669999999999	53.4248400000000032	237	238	99	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.206669999999999	53.4248400000000032	237	238	99	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1930399999999999	53.4478300000000033	236	237	102	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1930399999999999	53.4478300000000033	236	237	102	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1920199999999994	53.4495300000000029	236	236	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1920199999999994	53.4495300000000029	236	236	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1967600000000012	53.4414599999999993	236	238	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1967600000000012	53.4414599999999993	236	238	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1958300000000008	53.4431200000000004	236	237	101	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1958300000000008	53.4431200000000004	236	237	101	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1953099999999992	53.4440200000000019	236	236	99	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1953099999999992	53.4440200000000019	236	236	99	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1849999999999987	53.46096	235	237	101	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1849999999999987	53.46096	235	237	101	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1865400000000008	53.4584100000000007	235	237	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1865400000000008	53.4584100000000007	235	237	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1906999999999996	53.4516599999999968	235	235	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1906999999999996	53.4516599999999968	235	235	100	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1881500000000003	53.4558299999999988	235	236	104	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1786	-23.1881500000000003	53.4558299999999988	235	236	104	61	229109000	9HA3077	9600865	274.5	48.0399999999999991	90	295
1817	-11.4961599999999997	152.027999999999992	220	220	119	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.4961599999999997	152.027999999999992	220	220	119	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5012600000000003	152.023699999999991	220	218	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5012600000000003	152.023699999999991	220	218	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5067900000000005	152.019200000000012	220	219	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5067900000000005	152.019200000000012	220	219	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5093700000000005	152.017099999999999	221	218	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5093700000000005	152.017099999999999	221	218	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5221199999999993	152.006400000000014	220	218	119	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5221199999999993	152.006400000000014	220	218	119	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5127100000000002	152.014199999999988	220	220	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5127100000000002	152.014199999999988	220	220	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5165299999999995	152.010999999999996	220	221	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1817	-11.5165299999999995	152.010999999999996	220	221	118	61	229120000	9HA3085	9590096	229.5	36.9200000000000017	74	275
1838	5.87333299999999969	83.644999999999996	270	258	210	61	229130000	9HA3093	9255854	278.850000000000023	42.6300000000000026	96	293
1838	5.87333299999999969	83.644999999999996	270	258	210	61	229130000	9HA3093	9255854	278.850000000000023	42.6300000000000026	96	293
1853	-39.2142699999999991	158.078000000000003	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2142699999999991	158.078000000000003	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2139200000000017	158.073000000000008	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2139200000000017	158.073000000000008	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2135699999999972	158.067599999999999	277	274	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2135699999999972	158.067599999999999	277	274	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2125199999999978	158.052400000000006	279	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2125199999999978	158.052400000000006	279	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2128299999999967	158.0565	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2128299999999967	158.0565	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2121300000000019	158.047599999999989	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2121300000000019	158.047599999999989	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2118800000000007	158.044199999999989	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2118800000000007	158.044199999999989	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2152299999999983	158.091000000000008	277	274	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2152299999999983	158.091000000000008	277	274	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2148299999999992	158.085399999999993	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2148299999999992	158.085399999999993	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2145300000000034	158.081400000000002	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2145300000000034	158.081400000000002	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.21875	158.139299999999992	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.21875	158.139299999999992	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.21875	158.139299999999992	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.21875	158.139299999999992	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2176699999999983	158.125499999999988	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2176699999999983	158.125499999999988	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2180499999999981	158.130300000000005	279	276	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2180499999999981	158.130300000000005	279	276	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.217019999999998	158.116399999999999	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.217019999999998	158.116399999999999	278	275	194	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2166300000000021	158.11099999999999	278	275	192	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2166300000000021	158.11099999999999	278	275	192	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2177199999999999	158.126100000000008	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1853	-39.2177199999999999	158.126100000000008	278	275	193	61	229136000	9HA3097	9188647	292.5	38.7999999999999972	85	277
1867	-8.86710000000000065	-1.88433300000000004	325	322	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.86710000000000065	-1.88433300000000004	325	322	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.87121699999999969	-1.88129999999999997	326	324	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.87121699999999969	-1.88129999999999997	326	324	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.87398300000000084	-1.87933299999999992	327	324	123	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.87398300000000084	-1.87933299999999992	327	324	123	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.8529169999999997	-1.89484999999999992	326	323	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.8529169999999997	-1.89484999999999992	326	323	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83765000000000001	-1.90625	326	323	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83765000000000001	-1.90625	326	323	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83533300000000033	-1.90799999999999992	326	323	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83533300000000033	-1.90799999999999992	326	323	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83346700000000062	-1.90936700000000004	326	324	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.83346700000000062	-1.90936700000000004	326	324	124	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.84638299999999944	-1.89973299999999989	327	323	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.84638299999999944	-1.89973299999999989	327	323	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.84913300000000014	-1.89766699999999999	326	322	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1867	-8.84913300000000014	-1.89766699999999999	326	322	122	61	229141000	9HA3101	9468138	190	32.259999999999998	128	275
1906	15.66967	-146.671999999999997	266	269	126	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.66967	-146.671999999999997	266	269	126	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6694499999999994	-146.681000000000012	267	267	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6694499999999994	-146.681000000000012	267	267	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6693300000000004	-146.687099999999987	267	268	124	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6693300000000004	-146.687099999999987	267	268	124	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6692800000000005	-146.690699999999993	267	270	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6692800000000005	-146.690699999999993	267	270	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6692599999999995	-146.695999999999998	267	269	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1906	15.6692599999999995	-146.695999999999998	267	269	125	61	229159000	9HA3115	9644184	199.990000000000009	32	106	275
1909	14.0691199999999998	-35.8580200000000033	221	221	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.0691199999999998	-35.8580200000000033	221	221	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.0819500000000009	-35.8463700000000003	221	219	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.0819500000000009	-35.8463700000000003	221	219	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.0996400000000008	-35.8308099999999996	222	220	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.0996400000000008	-35.8308099999999996	222	220	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.09361	-35.8361799999999988	221	220	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1909	14.09361	-35.8361799999999988	221	220	122	61	229161000	9HA3117	9429431	229	36.8400000000000034	130	275
1878	53.920180000000002	171.186399999999992	257	258	116	61	229148000	9HA3106	9570840	230	38	142	275
1878	53.920180000000002	171.186399999999992	257	258	116	61	229148000	9HA3106	9570840	230	38	142	275
1878	53.9214100000000016	171.197000000000003	257	259	116	61	229148000	9HA3106	9570840	230	38	142	275
1878	53.9214100000000016	171.197000000000003	257	259	116	61	229148000	9HA3106	9570840	230	38	142	275
1878	53.9255799999999965	171.236199999999997	257	260	116	61	229148000	9HA3106	9570840	230	38	142	275
1878	53.9255799999999965	171.236199999999997	257	260	116	61	229148000	9HA3106	9570840	230	38	142	275
1884	44.9171600000000026	168.257200000000012	63	47	66	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9171600000000026	168.257200000000012	63	47	66	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9179600000000008	168.258600000000001	65	49	69	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9179600000000008	168.258600000000001	65	49	69	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9200000000000017	168.263299999999987	65	54	60	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9200000000000017	168.263299999999987	65	54	60	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9219300000000032	168.266600000000011	70	59	61	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9219300000000032	168.266600000000011	70	59	61	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9214699999999993	168.265500000000003	71	60	64	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1884	44.9214699999999993	168.265500000000003	71	60	64	61	538006861	V7SF6	9493535	224.879999999999995	32.259999999999998	128	275
1886	35.9562999999999988	35.067300000000003	11	7	105	61	229152000	9HA3109	9262924	241.030000000000001	42.0399999999999991	82	295
1886	35.9562999999999988	35.067300000000003	11	7	105	61	229152000	9HA3109	9262924	241.030000000000001	42.0399999999999991	82	295
1888	42.6458500000000029	-9.80938800000000022	4	6	86	61	538006862	V7SF7	9563677	225	32.259999999999998	130	275
1888	42.6458500000000029	-9.80938800000000022	4	6	86	61	538006862	V7SF7	9563677	225	32.259999999999998	130	275
1930	4.39097600000000021	80.4433199999999999	161	217	21	61	229172000	9HA3125	9314088	246.800000000000011	42	83	295
1930	4.39097600000000021	80.4433199999999999	161	217	21	61	229172000	9HA3125	9314088	246.800000000000011	42	83	295
1958	20.9663700000000013	88.1509300000000025	157	325	1	61	229191000	9HA3137	9353735	154.849999999999994	21.7399999999999984	71	266
1958	20.9663700000000013	88.1509300000000025	157	325	1	61	229191000	9HA3137	9353735	154.849999999999994	21.7399999999999984	71	266
1958	20.9663499999999985	88.1509199999999993	157	333	1	61	229191000	9HA3137	9353735	154.849999999999994	21.7399999999999984	71	266
1958	20.9663499999999985	88.1509199999999993	157	333	1	61	229191000	9HA3137	9353735	154.849999999999994	21.7399999999999984	71	266
1960	57.6969300000000018	10.5947700000000005	235	235	88	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6969300000000018	10.5947700000000005	235	235	88	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6956500000000005	10.59145	237	235	72	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6956500000000005	10.59145	237	235	72	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6947199999999967	10.5890000000000004	235	233	54	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6947199999999967	10.5890000000000004	235	233	54	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6940000000000026	10.5874299999999995	242	231	36	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6940000000000026	10.5874299999999995	242	231	36	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6933300000000031	10.5860000000000003	271	227	17	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6933300000000031	10.5860000000000003	271	227	17	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7016100000000023	10.6235999999999997	268	266	71	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7016100000000023	10.6235999999999997	268	266	71	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7014399999999981	10.6187699999999996	268	266	80	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7014399999999981	10.6187699999999996	268	266	80	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7017200000000017	10.6273999999999997	266	262	69	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7017200000000017	10.6273999999999997	266	262	69	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7021700000000024	10.6318000000000001	257	246	68	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7021700000000024	10.6318000000000001	257	246	68	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7007300000000001	10.6068200000000008	249	253	85	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7007300000000001	10.6068200000000008	249	253	85	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7012100000000032	10.6122800000000002	267	266	85	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.7012100000000032	10.6122800000000002	267	266	85	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6982799999999969	10.5985200000000006	238	237	88	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6982799999999969	10.5985200000000006	238	237	88	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6995999999999967	10.6025299999999998	242	242	87	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1960	57.6995999999999967	10.6025299999999998	242	242	87	61	219355000	OYPD2	9318230	92.8599999999999994	14.0999999999999996	63	269
1962	57.2733300000000014	0.841666600000000042	89	93	0	61	259161000	LAZO7	9625504	92.2000000000000028	20.6400000000000006	60	273
1962	57.2733300000000014	0.841666600000000042	89	93	0	61	259161000	LAZO7	9625504	92.2000000000000028	20.6400000000000006	60	273
1967	43.9655500000000004	13.6568699999999996	124	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9655500000000004	13.6568699999999996	124	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9636199999999988	13.6606400000000008	124	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9636199999999988	13.6606400000000008	124	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9687699999999992	13.6505100000000006	124	125	118	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9687699999999992	13.6505100000000006	124	125	118	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9731900000000024	13.6417800000000007	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9731900000000024	13.6417800000000007	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9751100000000008	13.6380199999999991	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9751100000000008	13.6380199999999991	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9782399999999996	13.6318099999999998	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9782399999999996	13.6318099999999998	123	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9826300000000003	13.6228999999999996	123	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9826300000000003	13.6228999999999996	123	125	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9801100000000034	13.6279900000000005	123	124	118	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.9801100000000034	13.6279900000000005	123	124	118	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.987639999999999	13.6128599999999995	122	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1967	43.987639999999999	13.6128599999999995	122	124	119	61	271044017	TCA3359	9034743	113.629999999999995	17.6999999999999993	59	274
1968	3.37716700000000003	-30.9254099999999994	193	195	142	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.37716700000000003	-30.9254099999999994	193	195	142	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.38965499999999986	-30.9220900000000007	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.38965499999999986	-30.9220900000000007	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.36653499999999983	-30.9282299999999992	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.36653499999999983	-30.9282299999999992	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.37033300000000002	-30.9272400000000012	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.37033300000000002	-30.9272400000000012	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.36380699999999999	-30.92896	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.36380699999999999	-30.92896	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.35397500000000015	-30.9315399999999983	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.35397500000000015	-30.9315399999999983	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.34978199999999982	-30.9326399999999992	193	194	142	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.34978199999999982	-30.9326399999999992	193	194	142	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.34668799999999989	-30.9334600000000002	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.34668799999999989	-30.9334600000000002	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.3440850000000002	-30.9341399999999993	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.3440850000000002	-30.9341399999999993	193	194	141	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.33802200000000004	-30.9357399999999991	194	194	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.33802200000000004	-30.9357399999999991	194	194	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.3361200000000002	-30.9362500000000011	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1968	3.3361200000000002	-30.9362500000000011	193	195	140	61	229196000	9HA3141	9595967	189.990000000000009	28.3099999999999987	65	275
1978	14.7556399999999996	59.2906699999999987	115	113	113	61	229203000	9HA3147	9649081	187	27.8000000000000007	62	275
1978	14.7556399999999996	59.2906699999999987	115	113	113	61	229203000	9HA3147	9649081	187	27.8000000000000007	62	275
1978	14.76755	59.2621699999999976	115	113	113	61	229203000	9HA3147	9649081	187	27.8000000000000007	62	275
1978	14.76755	59.2621699999999976	115	113	113	61	229203000	9HA3147	9649081	187	27.8000000000000007	62	275
1982	19.4867500000000007	37.3153500000000022	348	252	1	61	355009000	3FMJ3	9261047	176.819999999999993	29.3999999999999986	96	275
1982	19.4867500000000007	37.3153500000000022	348	252	1	61	355009000	3FMJ3	9261047	176.819999999999993	29.3999999999999986	96	275
1992	24.4712400000000017	-15.8876500000000007	205	205	113	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4712400000000017	-15.8876500000000007	205	205	113	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4854699999999994	-15.8800899999999992	204	206	113	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4854699999999994	-15.8800899999999992	204	206	113	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.468399999999999	-15.8891899999999993	205	206	114	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.468399999999999	-15.8891899999999993	205	206	114	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4570399999999992	-15.8952399999999994	204	206	112	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4570399999999992	-15.8952399999999994	204	206	112	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4617499999999986	-15.8927300000000002	204	204	114	61	229213000	9HA3153	9625475	180	30	65	275
1992	24.4617499999999986	-15.8927300000000002	204	204	114	61	229213000	9HA3153	9625475	180	30	65	275
2049	-10.8917000000000002	45.3116500000000002	52	57	119	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.8917000000000002	45.3116500000000002	52	57	119	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9064200000000007	45.2882800000000003	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9064200000000007	45.2882800000000003	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9022500000000004	45.2949600000000032	52	56	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9022500000000004	45.2949600000000032	52	56	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9013100000000005	45.2964500000000001	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9013100000000005	45.2964500000000001	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9001199999999994	45.2983100000000007	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.9001199999999994	45.2983100000000007	52	57	120	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.8874300000000002	45.3183099999999968	52	58	121	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.8874300000000002	45.3183099999999968	52	58	121	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.8821499999999993	45.3264899999999997	52	56	123	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2049	-10.8821499999999993	45.3264899999999997	52	56	123	61	636019928	D5VU7	9217553	183.949999999999989	25.3000000000000007	70	266
2050	4.64553399999999961	-50.3950999999999993	122	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.64553399999999961	-50.3950999999999993	122	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65816699999999972	-50.4157500000000027	121	121	106	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65816699999999972	-50.4157500000000027	121	121	106	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.6609499999999997	-50.4202999999999975	122	122	106	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.6609499999999997	-50.4202999999999975	122	122	106	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65996599999999983	-50.4185999999999979	121	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65996599999999983	-50.4185999999999979	121	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65098300000000009	-50.4039799999999971	122	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65098300000000009	-50.4039799999999971	122	120	105	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65426699999999993	-50.4093299999999971	122	119	107	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65426699999999993	-50.4093299999999971	122	119	107	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65249999999999986	-50.4064699999999988	122	121	107	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2050	4.65249999999999986	-50.4064699999999988	122	121	107	61	538005971	V7IO7	9246308	171.590000000000003	27	102	275
2073	55.227249999999998	13.2514099999999999	93	93	113	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.227249999999998	13.2514099999999999	93	93	113	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2280200000000008	13.2313500000000008	93	94	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2280200000000008	13.2313500000000008	93	94	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.228270000000002	13.2248800000000006	93	93	114	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.228270000000002	13.2248800000000006	93	93	114	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2277699999999996	13.2377400000000005	93	94	113	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2277699999999996	13.2377400000000005	93	94	113	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2275500000000008	13.2432599999999994	93	94	114	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2275500000000008	13.2432599999999994	93	94	114	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2301199999999994	13.1838899999999999	93	94	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2301199999999994	13.1838899999999999	93	94	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2303599999999975	13.1773600000000002	93	93	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2303599999999975	13.1773600000000002	93	93	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2297799999999981	13.1914599999999993	93	95	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2297799999999981	13.1914599999999993	93	95	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2294800000000023	13.1979000000000006	93	95	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2294800000000023	13.1979000000000006	93	95	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2285200000000032	13.2184399999999993	93	93	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2285200000000032	13.2184399999999993	93	93	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2288300000000021	13.2118500000000001	93	94	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2288300000000021	13.2118500000000001	93	94	116	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2291299999999978	13.20533	93	95	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2073	55.2291299999999978	13.20533	93	95	115	61	229245000	9HA3170	9188958	95.1599999999999966	13.1699999999999999	38	290
2080	14.01511	-17.7467700000000015	174	172	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.01511	-17.7467700000000015	174	172	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0203399999999991	-17.7474699999999999	174	173	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0203399999999991	-17.7474699999999999	174	173	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0102499999999992	-17.7460799999999992	174	172	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0102499999999992	-17.7460799999999992	174	172	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0045000000000002	-17.7454099999999997	177	175	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0045000000000002	-17.7454099999999997	177	175	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0261499999999995	-17.7482000000000006	175	173	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0261499999999995	-17.7482000000000006	175	173	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0314800000000002	-17.7487899999999996	175	174	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0314800000000002	-17.7487899999999996	175	174	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0417100000000001	-17.7501999999999995	172	170	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0417100000000001	-17.7501999999999995	172	170	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0368200000000005	-17.7493899999999982	176	171	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	14.0368200000000005	-17.7493899999999982	176	171	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9845199999999998	-17.7431899999999985	176	172	158	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9845199999999998	-17.7431899999999985	176	172	158	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9995799999999999	-17.7451000000000008	176	176	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9995799999999999	-17.7451000000000008	176	176	161	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9942299999999999	-17.7446699999999993	172	174	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9942299999999999	-17.7446699999999993	172	174	160	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9809999999999999	-17.7427899999999994	178	174	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2080	13.9809999999999999	-17.7427899999999994	178	174	159	61	229247000	9HA3172	9208356	188.560000000000002	26.5	82	266
2086	5.99405300000000008	95.1300600000000003	88	87	140	61	636092878	D5RZ3	9623673	256.069999999999993	37.3999999999999986	103	266
2086	5.99405300000000008	95.1300600000000003	88	87	140	61	636092878	D5RZ3	9623673	256.069999999999993	37.3999999999999986	103	266
2093	57.5016699999999972	-1.77976000000000001	269	246	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016699999999972	-1.77976000000000001	269	246	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016699999999972	-1.77976500000000004	269	192	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016699999999972	-1.77976500000000004	269	192	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016499999999979	-1.77976200000000007	269	136	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016499999999979	-1.77976200000000007	269	136	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016499999999979	-1.77975799999999995	269	199	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016499999999979	-1.77975799999999995	269	199	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016699999999972	-1.77976000000000001	269	281	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2093	57.5016699999999972	-1.77976000000000001	269	281	0	61	258955000	LAYS7	9665073	143.75	27.0399999999999991	70	286
2176	52.7917599999999965	4.16648800000000019	30	30	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.7917599999999965	4.16648800000000019	30	30	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.7996800000000022	4.17396499999999993	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.7996800000000022	4.17396499999999993	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.7959099999999992	4.17039700000000035	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.7959099999999992	4.17039700000000035	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8096000000000032	4.1832849999999997	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8096000000000032	4.1832849999999997	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8046099999999967	4.17859599999999975	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8046099999999967	4.17859599999999975	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8140900000000002	4.18752999999999975	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8140900000000002	4.18752999999999975	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8178899999999985	4.19108299999999989	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8178899999999985	4.19108299999999989	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8224500000000035	4.19535400000000003	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8224500000000035	4.19535400000000003	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8269799999999989	4.19965200000000038	29	29	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8269799999999989	4.19965200000000038	29	29	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.835329999999999	4.20748899999999981	29	29	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.835329999999999	4.20748899999999981	29	29	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.83155	4.2039200000000001	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.83155	4.2039200000000001	29	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8398699999999977	4.21176800000000018	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8398699999999977	4.21176800000000018	30	30	158	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8444399999999987	4.21601300000000023	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2176	52.8444399999999987	4.21601300000000023	30	29	157	61	229288000	9HA3206	8911736	139.5	19	57	283
2177	29.5927100000000003	-89.8236899999999991	126	127	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.5927100000000003	-89.8236899999999991	126	127	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.5986900000000013	-89.8345300000000009	114	112	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.5986900000000013	-89.8345300000000009	114	112	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.5961500000000015	-89.8291200000000032	124	122	174	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.5961500000000015	-89.8291200000000032	124	122	174	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6004700000000014	-89.8404199999999946	106	102	177	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6004700000000014	-89.8404199999999946	106	102	177	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.601700000000001	-89.8469300000000004	100	102	176	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.601700000000001	-89.8469300000000004	100	102	176	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6027200000000015	-89.8525199999999984	100	101	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6027200000000015	-89.8525199999999984	100	101	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.604849999999999	-89.8650399999999934	99	102	173	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.604849999999999	-89.8650399999999934	99	102	173	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6037500000000016	-89.8584900000000033	99	100	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6037500000000016	-89.8584900000000033	99	100	175	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.60595	-89.870980000000003	100	103	172	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.60595	-89.870980000000003	100	103	172	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6095900000000007	-89.8833999999999946	109	112	170	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6095900000000007	-89.8833999999999946	109	112	170	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6075100000000013	-89.8773900000000054	105	110	171	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6075100000000013	-89.8773900000000054	105	110	171	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6117899999999992	-89.8893099999999947	111	116	167	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6117899999999992	-89.8893099999999947	111	116	167	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6143199999999993	-89.8943799999999982	120	120	165	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2177	29.6143199999999993	-89.8943799999999982	120	120	165	61	229289000	9HA3207	9629548	183	32.2000000000000028	119	274
2189	53.5432500000000005	9.91817700000000002	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5432500000000005	9.91817700000000002	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5431999999999988	9.91813199999999995	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5431999999999988	9.91813199999999995	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5432300000000012	9.91818699999999964	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5432300000000012	9.91818699999999964	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5431499999999971	9.91811200000000071	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2189	53.5431499999999971	9.91811200000000071	269	3	1	61	229294000	9HA3212	9597367	23.1400000000000006	12	58	276
2194	53.5432500000000005	9.91865600000000036	273	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2194	53.5432500000000005	9.91865600000000036	273	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2194	53.5432699999999997	9.91857100000000003	273	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2194	53.5432699999999997	9.91857100000000003	273	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2194	53.5432699999999997	9.91860900000000001	274	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2194	53.5432699999999997	9.91860900000000001	274	19	0	61	229295000	9HA3213	9597355	23.1400000000000006	12.6300000000000008	58	276
2197	37.9293300000000002	-8.84583399999999997	143	147	60	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9293300000000002	-8.84583399999999997	143	147	60	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9276699999999991	-8.84416700000000056	143	142	65	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9276699999999991	-8.84416700000000056	143	142	65	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9256699999999967	-8.84249999999999936	147	147	70	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9256699999999967	-8.84249999999999936	147	147	70	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9231600000000029	-8.84066699999999983	177	159	75	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9231600000000029	-8.84066699999999983	177	159	75	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9196700000000035	-8.84116500000000016	227	210	71	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9196700000000035	-8.84116500000000016	227	210	71	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9176700000000011	-8.84566700000000061	254	256	92	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9176700000000011	-8.84566700000000061	254	256	92	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9153299999999973	-8.85333299999999923	252	249	137	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9153299999999973	-8.85333299999999923	252	249	137	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9118300000000019	-8.86633299999999913	252	252	161	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9118300000000019	-8.86633299999999913	252	252	161	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9136700000000033	-8.85966699999999996	251	251	153	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9136700000000033	-8.85966699999999996	251	251	153	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9096699999999984	-8.87449800000000089	252	251	162	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2197	37.9096699999999984	-8.87449800000000089	252	251	162	61	255805836	CQBH	9360972	125.849999999999994	21.8000000000000007	72	266
2205	-34.5386700000000033	-35.443010000000001	279	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5386700000000033	-35.443010000000001	279	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2925	-24.1226100000000017	-46.2974299999999985	89	92	2	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2205	-34.5399200000000022	-35.4353199999999973	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5399200000000022	-35.4353199999999973	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5406600000000026	-35.430410000000002	280	280	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5406600000000026	-35.430410000000002	280	280	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5415599999999969	-35.4247999999999976	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5415599999999969	-35.4247999999999976	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.54251	-35.4185000000000016	279	281	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.54251	-35.4185000000000016	279	281	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.544710000000002	-35.4045500000000004	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.544710000000002	-35.4045500000000004	280	279	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5454599999999985	-35.399560000000001	279	281	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5454599999999985	-35.399560000000001	279	281	127	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5462599999999966	-35.3946699999999979	280	280	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2205	-34.5462599999999966	-35.3946699999999979	280	280	126	61	229305000	9HA3216	9630664	229	32.259999999999998	137	275
2208	-35.1643400000000028	7.08379500000000029	90	86	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643400000000028	7.08379500000000029	90	86	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643299999999996	7.08741299999999974	90	90	107	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643299999999996	7.08741299999999974	90	90	107	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643400000000028	7.0935100000000002	89	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643400000000028	7.0935100000000002	89	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643400000000028	7.09042800000000017	89	88	105	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643400000000028	7.09042800000000017	89	88	105	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643299999999996	7.09585199999999983	89	91	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1643299999999996	7.09585199999999983	89	91	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.10573500000000013	90	89	107	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.10573500000000013	90	89	107	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.164279999999998	7.09860299999999977	90	89	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.164279999999998	7.09860299999999977	90	89	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.101858	90	88	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.101858	90	88	108	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642900000000012	7.11087199999999964	89	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642900000000012	7.11087199999999964	89	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.1133280000000001	90	87	105	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.1133280000000001	90	87	105	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.10797300000000032	90	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642700000000019	7.10797300000000032	90	89	106	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642599999999987	7.1222979999999998	90	93	104	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642599999999987	7.1222979999999998	90	93	104	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12828499999999998	90	89	100	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12828499999999998	90	89	100	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12477499999999964	90	87	104	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12477499999999964	90	87	104	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12996300000000005	91	88	102	61	229308000	9HA3218	9609469	210	36.5	123	275
2208	-35.1642500000000027	7.12996300000000005	91	88	102	61	229308000	9HA3218	9609469	210	36.5	123	275
2134	-25.2332999999999998	-30.4340100000000007	275	274	137	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2332999999999998	-30.4340100000000007	275	274	137	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.23386	-30.428370000000001	275	277	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.23386	-30.428370000000001	275	277	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2326599999999992	-30.4409300000000016	275	277	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2326599999999992	-30.4409300000000016	275	277	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2329700000000017	-30.4375	275	276	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2329700000000017	-30.4375	275	276	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2314299999999996	-30.4534500000000001	275	276	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2314299999999996	-30.4534500000000001	275	276	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2307400000000008	-30.4605500000000013	275	272	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2307400000000008	-30.4605500000000013	275	272	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2310499999999998	-30.4571700000000014	275	279	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2310499999999998	-30.4571700000000014	275	279	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2297699999999985	-30.4707000000000008	275	277	140	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2297699999999985	-30.4707000000000008	275	277	140	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2301800000000007	-30.4664600000000014	275	274	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2301800000000007	-30.4664600000000014	275	274	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2304899999999996	-30.4630699999999983	275	275	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2304899999999996	-30.4630699999999983	275	275	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2288099999999993	-30.4800399999999989	275	282	141	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2288099999999993	-30.4800399999999989	275	282	141	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2292099999999984	-30.4762099999999982	275	277	141	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2292099999999984	-30.4762099999999982	275	277	141	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2283499999999989	-30.4846199999999996	275	279	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2283499999999989	-30.4846199999999996	275	279	139	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2279400000000003	-30.4889100000000006	275	275	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2134	-25.2279400000000003	-30.4889100000000006	275	275	138	61	229269000	9HA3188	9587245	299.920000000000016	50	95	275
2142	12.4330599999999993	61.3310400000000016	114	112	110	61	538008244	V7A2133	9288851	249.870000000000005	43.7999999999999972	75	295
2142	12.4330599999999993	61.3310400000000016	114	112	110	61	538008244	V7A2133	9288851	249.870000000000005	43.7999999999999972	75	295
2146	-40.0001099999999994	-17.7164700000000011	89	89	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001099999999994	-17.7164700000000011	89	89	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0000900000000001	-17.7212299999999985	89	90	130	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0000900000000001	-17.7212299999999985	89	90	130	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001000000000033	-17.7133800000000008	90	91	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001000000000033	-17.7133800000000008	90	91	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.000160000000001	-17.7069599999999987	90	90	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.000160000000001	-17.7069599999999987	90	90	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001800000000003	-17.6920099999999998	89	89	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001800000000003	-17.6920099999999998	89	89	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001499999999979	-17.6864600000000003	90	90	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001499999999979	-17.6864600000000003	90	90	131	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001400000000018	-17.6576500000000003	90	90	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001400000000018	-17.6576500000000003	90	90	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001299999999986	-17.6544600000000003	89	92	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001299999999986	-17.6544600000000003	89	92	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6656900000000014	89	88	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6656900000000014	89	88	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001999999999995	-17.6688000000000009	89	90	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001999999999995	-17.6688000000000009	89	90	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6816800000000001	89	89	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6816800000000001	89	89	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6792000000000016	89	88	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001699999999971	-17.6792000000000016	89	88	132	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001900000000035	-17.6720000000000006	89	90	133	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2146	-40.0001900000000035	-17.6720000000000006	89	90	133	61	538005909	V7IA9	9418444	228.990000000000009	32.2999999999999972	93	275
2108	47.4864800000000002	162.25800000000001	61	62	92	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2108	47.4864800000000002	162.25800000000001	61	62	92	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2108	47.4818399999999983	162.246800000000007	60	56	95	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2108	47.4818399999999983	162.246800000000007	60	56	95	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2108	47.489130000000003	162.264600000000002	60	56	95	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2108	47.489130000000003	162.264600000000002	60	56	95	61	229264000	9HA3182	9644500	254.990000000000009	43	126	275
2167	-0.249446699999999993	144.754700000000014	156	149	115	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.249446699999999993	144.754700000000014	156	149	115	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.255048300000000006	144.757800000000003	156	152	114	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.255048300000000006	144.757800000000003	156	152	114	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.240024999999999988	144.749599999999987	156	152	114	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.240024999999999988	144.749599999999987	156	152	114	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.221446699999999996	144.739599999999996	155	152	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.221446699999999996	144.739599999999996	155	152	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.223286700000000005	144.740600000000001	156	152	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.223286700000000005	144.740600000000001	156	152	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.227420000000000011	144.742799999999988	156	151	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2167	-0.227420000000000011	144.742799999999988	156	151	113	61	229283000	9HA3201	9609122	229	32.259999999999998	83	275
2169	23.8106800000000014	119.8322	324	328	127	61	229284000	9HA3202	9633408	229	32.259999999999998	75	275
2169	23.8106800000000014	119.8322	324	328	127	61	229284000	9HA3202	9633408	229	32.259999999999998	75	275
2169	23.8267699999999998	119.822800000000001	334	336	127	61	229284000	9HA3202	9633408	229	32.259999999999998	75	275
2169	23.8267699999999998	119.822800000000001	334	336	127	61	229284000	9HA3202	9633408	229	32.259999999999998	75	275
2214	36.5618499999999997	-34.6240900000000025	190	195	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5618499999999997	-34.6240900000000025	190	195	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.559429999999999	-34.6248199999999997	190	194	93	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.559429999999999	-34.6248199999999997	190	194	93	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5526100000000014	-34.6264800000000008	188	186	87	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5526100000000014	-34.6264800000000008	188	186	87	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5458199999999991	-34.628309999999999	191	186	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5458199999999991	-34.628309999999999	191	186	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5364599999999982	-34.6309699999999978	191	197	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5364599999999982	-34.6309699999999978	191	197	90	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5380200000000031	-34.6304200000000009	194	186	92	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5380200000000031	-34.6304200000000009	194	186	92	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5409399999999991	-34.6297300000000021	189	186	93	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2214	36.5409399999999991	-34.6297300000000021	189	186	93	61	538008779	V7A2750	9522946	178.830000000000013	28.629999999999999	103	275
2234	5.86251700000000042	-79.8087500000000034	19	17	127	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.86251700000000042	-79.8087500000000034	19	17	127	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.86031700000000022	-79.8094300000000061	19	17	127	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.86031700000000022	-79.8094300000000061	19	17	127	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.86648299999999967	-79.8074799999999982	19	18	125	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.86648299999999967	-79.8074799999999982	19	18	125	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.89526699999999959	-79.798419999999993	19	17	125	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.89526699999999959	-79.798419999999993	19	17	125	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.8913000000000002	-79.7996399999999966	19	17	124	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2234	5.8913000000000002	-79.7996399999999966	19	17	124	61	229316000	9HA3225	9258026	182.5	32.2000000000000028	85	291
2236	47.9423200000000023	-6.79669300000000032	208	209	124	61	229317000	9HA3226	9279733	179.879999999999995	32.2000000000000028	96	291
2236	47.9423200000000023	-6.79669300000000032	208	209	124	61	229317000	9HA3226	9279733	179.879999999999995	32.2000000000000028	96	291
2255	48.9884199999999979	-68.1253300000000053	227	218	86	61	229324000	9HA3233	9596026	189.990000000000009	28.3099999999999987	73	275
2255	48.9884199999999979	-68.1253300000000053	227	218	86	61	229324000	9HA3233	9596026	189.990000000000009	28.3099999999999987	73	275
2258	17.7028299999999987	-76.551959999999994	86	83	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7028299999999987	-76.551959999999994	86	83	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7024000000000008	-76.557069999999996	88	83	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7024000000000008	-76.557069999999996	88	83	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.70336	-76.5471699999999942	83	82	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.70336	-76.5471699999999942	83	82	133	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7040599999999984	-76.5423399999999958	82	81	134	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7040599999999984	-76.5423399999999958	82	81	134	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7018699999999995	-76.5611899999999963	84	81	132	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7018699999999995	-76.5611899999999963	84	81	132	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7011399999999988	-76.5661499999999933	83	82	132	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7011399999999988	-76.5661499999999933	83	82	132	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7007000000000012	-76.5700400000000059	86	84	131	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7007000000000012	-76.5700400000000059	86	84	131	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7061600000000006	-76.5280300000000011	86	83	134	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7061600000000006	-76.5280300000000011	86	83	134	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7066000000000017	-76.5237099999999941	85	83	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7066000000000017	-76.5237099999999941	85	83	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7047600000000003	-76.5380600000000015	82	79	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7047600000000003	-76.5380600000000015	82	79	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7053499999999993	-76.5344199999999972	84	81	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2258	17.7053499999999993	-76.5344199999999972	84	81	135	61	538008089	V7ZC6	9609653	179.97999999999999	30.0500000000000007	105	275
2259	48.9526499999999984	-5.6673669999999996	236	236	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9526499999999984	-5.6673669999999996	236	236	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9545699999999968	-5.66265000000000018	235	239	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9545699999999968	-5.66265000000000018	235	239	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9478799999999978	-5.67861700000000003	236	236	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9478799999999978	-5.67861700000000003	236	236	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9500799999999998	-5.67341699999999971	236	237	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9500799999999998	-5.67341699999999971	236	237	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9454700000000003	-5.68445	236	243	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9454700000000003	-5.68445	236	243	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9687699999999992	-5.62831700000000001	236	238	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9687699999999992	-5.62831700000000001	236	238	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.966700000000003	-5.63325000000000031	236	238	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.966700000000003	-5.63325000000000031	236	238	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9649000000000001	-5.637683	235	237	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9649000000000001	-5.637683	235	237	118	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9565699999999993	-5.65781699999999965	236	238	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9565699999999993	-5.65781699999999965	236	238	119	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9585700000000017	-5.6529499999999997	236	235	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9585700000000017	-5.6529499999999997	236	235	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9630900000000011	-5.64211699999999983	236	238	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9630900000000011	-5.64211699999999983	236	238	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9610699999999994	-5.64700000000000024	235	238	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2259	48.9610699999999994	-5.64700000000000024	235	238	120	61	538008088	V7YU2	9609665	179.949999999999989	30.1400000000000006	107	275
2273	-24.9200000000000017	-42.5591700000000017	200	233	66	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9200000000000017	-42.5591700000000017	200	233	66	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9208299999999987	-42.5601699999999994	188	227	68	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9208299999999987	-42.5601699999999994	188	227	68	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9215000000000018	-42.5608300000000028	179	218	64	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9215000000000018	-42.5608300000000028	179	218	64	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9194999999999993	-42.5579999999999998	213	239	66	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9194999999999993	-42.5579999999999998	213	239	66	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9188299999999998	-42.5568400000000011	221	241	65	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9188299999999998	-42.5568400000000011	221	241	65	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9168300000000009	-42.554000000000002	218	237	45	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9168300000000009	-42.554000000000002	218	237	45	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9128299999999996	-42.5503300000000024	189	208	31	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9128299999999996	-42.5503300000000024	189	208	31	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9134999999999991	-42.5506699999999967	192	220	37	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9134999999999991	-42.5506699999999967	192	220	37	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.914670000000001	-42.5516700000000014	203	223	39	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.914670000000001	-42.5516700000000014	203	223	39	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9155000000000015	-42.5521699999999967	213	208	37	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9155000000000015	-42.5521699999999967	213	208	37	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9108300000000007	-42.5498400000000032	154	163	19	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9108300000000007	-42.5498400000000032	154	163	19	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9096699999999984	-42.5499999999999972	144	193	24	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2273	-24.9096699999999984	-42.5499999999999972	144	193	24	61	229330000	9HA3240	9625724	278.300000000000011	48.7000000000000028	163	271
2300	-34.9891799999999975	0.705345	271	270	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891799999999975	0.705345	271	270	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.706550000000000011	271	270	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.706550000000000011	271	270	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892200000000031	0.714210000000000012	272	269	110	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892200000000031	0.714210000000000012	272	269	110	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.711578299999999997	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.711578299999999997	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.709133299999999966	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9891900000000007	0.709133299999999966	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892200000000031	0.71968169999999998	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892200000000031	0.71968169999999998	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892400000000023	0.725894999999999957	271	270	110	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892400000000023	0.725894999999999957	271	270	110	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892699999999977	0.731511699999999987	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892699999999977	0.731511699999999987	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893199999999993	0.740228400000000009	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893199999999993	0.740228400000000009	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893100000000032	0.737199999999999966	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893100000000032	0.737199999999999966	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892899999999969	0.751044999999999963	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892899999999969	0.751044999999999963	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892899999999969	0.753499999999999948	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9892899999999969	0.753499999999999948	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893399999999986	0.758573399999999953	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893399999999986	0.758573399999999953	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893300000000025	0.756075000000000053	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893300000000025	0.756075000000000053	271	270	111	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893199999999993	0.748460000000000014	271	269	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893199999999993	0.748460000000000014	271	269	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893300000000025	0.744746699999999984	271	269	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2300	-34.9893300000000025	0.744746699999999984	271	269	112	61	229342000	9HA3249	9598799	225	32.2999999999999972	126	275
2305	40.7240299999999991	28.8966899999999995	156	240	7	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7240299999999991	28.8966899999999995	156	240	7	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.724260000000001	28.8972100000000012	157	241	8	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.724260000000001	28.8972100000000012	157	241	8	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7245399999999975	28.8978999999999999	157	242	7	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7245399999999975	28.8978999999999999	157	242	7	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7247199999999978	28.898340000000001	151	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7247199999999978	28.898340000000001	151	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7251499999999993	28.8993000000000002	134	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7251499999999993	28.8993000000000002	134	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7249100000000013	28.8987499999999997	144	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2305	40.7249100000000013	28.8987499999999997	144	239	6	61	229344000	9HA3252	9195860	95.1599999999999966	13.1699999999999999	65	290
2310	21.1610000000000014	38.6665899999999993	146	145	111	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1610000000000014	38.6665899999999993	146	145	111	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1633299999999984	38.663330000000002	146	146	110	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1633299999999984	38.663330000000002	146	146	110	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1571800000000003	38.6693599999999975	146	145	112	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1571800000000003	38.6693599999999975	146	145	112	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1316699999999997	38.6850000000000023	146	147	110	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2310	21.1316699999999997	38.6850000000000023	146	147	110	61	229347000	9HA3255	9512331	228.990000000000009	32.259999999999998	71	275
2353	24.6582000000000008	67.1299900000000065	203	202	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6582000000000008	67.1299900000000065	203	202	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6728999999999985	67.1372700000000009	205	207	128	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6728999999999985	67.1372700000000009	205	207	128	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6694700000000005	67.1353799999999978	204	206	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6694700000000005	67.1353799999999978	204	206	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6660900000000005	67.1336100000000044	204	204	130	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6660900000000005	67.1336100000000044	204	204	130	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6620099999999987	67.1316800000000029	203	203	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6620099999999987	67.1316800000000029	203	203	129	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6799900000000001	67.1405799999999999	193	187	126	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6799900000000001	67.1405799999999999	193	187	126	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6762000000000015	67.1392299999999977	206	204	126	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6762000000000015	67.1392299999999977	206	204	126	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6834600000000002	67.1413000000000011	190	190	127	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6834600000000002	67.1413000000000011	190	190	127	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6875099999999996	67.1419700000000006	189	189	127	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2353	24.6875099999999996	67.1419700000000006	189	189	127	61	311000889	C6EG6	9150406	184.099999999999994	25.3000000000000007	101	266
2284	24.4572299999999991	57.9074700000000036	123	123	136	61	229336000	9HA3245	9529499	274.389999999999986	48	90	295
2284	24.4572299999999991	57.9074700000000036	123	123	136	61	229336000	9HA3245	9529499	274.389999999999986	48	90	295
2284	24.4252800000000008	57.9610699999999994	123	122	135	61	229336000	9HA3245	9529499	274.389999999999986	48	90	295
2284	24.4252800000000008	57.9610699999999994	123	122	135	61	229336000	9HA3245	9529499	274.389999999999986	48	90	295
2409	49.6843799999999973	-4.48862800000000028	84	82	80	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6843799999999973	-4.48862800000000028	84	82	80	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6836399999999969	-4.49763800000000025	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6836399999999969	-4.49763800000000025	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6840299999999999	-4.49301499999999976	84	82	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6840299999999999	-4.49301499999999976	84	82	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6856000000000009	-4.47361200000000014	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6856000000000009	-4.47361200000000014	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.685290000000002	-4.47725300000000015	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.685290000000002	-4.47725300000000015	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6847199999999987	-4.48440499999999975	84	82	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6847199999999987	-4.48440499999999975	84	82	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.684980000000003	-4.48093800000000009	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.684980000000003	-4.48093800000000009	84	83	81	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6873900000000006	-4.45068999999999981	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6873900000000006	-4.45068999999999981	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6871200000000002	-4.45425200000000032	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6871200000000002	-4.45425200000000032	84	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6868600000000029	-4.4577530000000003	84	82	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6868600000000029	-4.4577530000000003	84	82	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.685929999999999	-4.46954700000000038	84	82	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.685929999999999	-4.46954700000000038	84	82	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6862899999999996	-4.46525299999999969	85	81	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6862899999999996	-4.46525299999999969	85	81	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6865700000000032	-4.46159499999999998	85	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2409	49.6865700000000032	-4.46159499999999998	85	83	82	61	314452000	8PAO4	9651541	119.799999999999997	18.1999999999999993	80	290
2436	17.4774899999999995	-20.4105099999999986	29	26	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4774899999999995	-20.4105099999999986	29	26	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4814499999999988	-20.4084299999999992	29	27	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4814499999999988	-20.4084299999999992	29	27	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4682999999999993	-20.4151500000000006	28	26	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4682999999999993	-20.4151500000000006	28	26	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4739100000000001	-20.4123300000000008	28	25	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4739100000000001	-20.4123300000000008	28	25	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2925	-24.1226100000000017	-46.2974299999999985	89	92	2	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2436	17.452300000000001	-20.4241700000000002	33	31	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.452300000000001	-20.4241700000000002	33	31	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4557099999999998	-20.4220800000000011	31	28	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4557099999999998	-20.4220800000000011	31	28	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4631700000000016	-20.4178999999999995	30	27	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4631700000000016	-20.4178999999999995	30	27	122	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4596599999999995	-20.419830000000001	30	28	121	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4596599999999995	-20.419830000000001	30	28	121	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4423500000000011	-20.4300800000000002	32	28	124	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4423500000000011	-20.4300800000000002	32	28	124	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4463000000000008	-20.4277900000000017	32	28	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2436	17.4463000000000008	-20.4277900000000017	32	28	123	61	229381000	9HA3286	9266140	177	28.3999999999999986	67	275
2450	59.0493000000000023	5.86966699999999975	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0493000000000023	5.86966699999999975	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0521900000000031	5.87009700000000034	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0521900000000031	5.87009700000000034	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0550799999999967	5.87054200000000037	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0550799999999967	5.87054200000000037	182	184	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0579499999999982	5.87102699999999977	182	184	103	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0579499999999982	5.87102699999999977	182	184	103	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0398599999999973	5.86752300000000027	185	187	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0398599999999973	5.86752300000000027	185	187	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0365099999999998	5.86663699999999988	188	189	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0365099999999998	5.86663699999999988	188	189	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0460599999999971	5.86913000000000018	184	185	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0460599999999971	5.86913000000000018	184	185	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.043210000000002	5.8684580000000004	186	187	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.043210000000002	5.8684580000000004	186	187	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0208200000000005	5.86162199999999967	187	189	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0208200000000005	5.86162199999999967	187	189	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0236999999999981	5.86253199999999985	188	189	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0236999999999981	5.86253199999999985	188	189	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0265699999999995	5.86340299999999992	188	189	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0265699999999995	5.86340299999999992	188	189	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0331899999999976	5.8656170000000003	188	188	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0331899999999976	5.8656170000000003	188	188	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0298900000000017	5.8644879999999997	189	190	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0298900000000017	5.8644879999999997	189	190	104	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0174099999999981	5.86050200000000032	188	190	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2450	59.0174099999999981	5.86050200000000032	188	190	105	61	229385000	9HA3290	9375446	81.2999999999999972	13.25	34	290
2457	-15.7223699999999997	2.38011799999999996	323	322	130	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7223699999999997	2.38011799999999996	323	322	130	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7204700000000006	2.37860799999999983	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7204700000000006	2.37860799999999983	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7237899999999993	2.38125300000000006	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7237899999999993	2.38125300000000006	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7176600000000004	2.37635800000000019	323	322	130	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7176600000000004	2.37635800000000019	323	322	130	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.73902	2.39340300000000017	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.73902	2.39340300000000017	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7337299999999995	2.38924499999999984	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7337299999999995	2.38924499999999984	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7318800000000003	2.3877600000000001	323	321	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7318800000000003	2.3877600000000001	323	321	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7499500000000001	2.40199799999999986	323	322	128	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7499500000000001	2.40199799999999986	323	322	128	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7467000000000006	2.39941300000000002	323	322	128	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7467000000000006	2.39941300000000002	323	322	128	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7433300000000003	2.39676499999999981	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2457	-15.7433300000000003	2.39676499999999981	323	322	129	61	229387000	9HA3291	9587257	299.920000000000016	50	188	275
2393	44.3821299999999965	37.8613799999999969	85	326	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3821299999999965	37.8613799999999969	85	326	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3811299999999989	37.86233	79	322	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3811299999999989	37.86233	79	322	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3832799999999992	37.8605500000000035	82	339	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3832799999999992	37.8605500000000035	82	339	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3848500000000001	37.8599000000000032	96	345	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2393	44.3848500000000001	37.8599000000000032	96	345	14	61	229363000	9HA3270	9387126	88.7999999999999972	13.5	43	290
2466	-41.5199700000000007	-73.0374500000000069	147	240	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199700000000007	-73.0374500000000069	147	240	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199300000000022	-73.0374300000000005	147	226	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199300000000022	-73.0374300000000005	147	226	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.0374300000000005	147	285	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.0374300000000005	147	285	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.037469999999999	147	351	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.037469999999999	147	351	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.037469999999999	147	26	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199500000000015	-73.037469999999999	147	26	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199700000000007	-73.037469999999999	147	32	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2466	-41.5199700000000007	-73.037469999999999	147	32	0	61	725001523	CA5511	8917871	122	19.0399999999999991	60	283
2478	-34.9054599999999979	20.427109999999999	83	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9054599999999979	20.427109999999999	83	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9056300000000022	20.4260699999999993	82	76	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9056300000000022	20.4260699999999993	82	76	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9060699999999997	20.423919999999999	81	76	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9060699999999997	20.423919999999999	81	76	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.904200000000003	20.4349699999999999	82	79	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.904200000000003	20.4349699999999999	82	79	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9047800000000024	20.4312499999999986	83	79	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9047800000000024	20.4312499999999986	83	79	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9035099999999971	20.4391199999999991	82	78	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9035099999999971	20.4391199999999991	82	78	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9035099999999971	20.4391199999999991	82	78	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9035099999999971	20.4391199999999991	82	78	95	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9079199999999972	20.4133700000000005	82	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9079199999999972	20.4133700000000005	82	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9088700000000003	20.4080100000000009	81	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9088700000000003	20.4080100000000009	81	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9084900000000005	20.4101900000000001	81	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9084900000000005	20.4101900000000001	81	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9075699999999998	20.4155000000000015	81	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9075699999999998	20.4155000000000015	81	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9072400000000016	20.4175600000000017	81	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9072400000000016	20.4175600000000017	81	78	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9066800000000015	20.4208099999999995	79	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9066800000000015	20.4208099999999995	79	77	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9092600000000033	20.4059400000000011	81	78	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9092600000000033	20.4059400000000011	81	78	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9097500000000025	20.4032499999999999	81	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9097500000000025	20.4032499999999999	81	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.911290000000001	20.394169999999999	81	78	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.911290000000001	20.394169999999999	81	78	97	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9102099999999993	20.4005800000000015	81	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2478	-34.9102099999999993	20.4005800000000015	81	77	96	61	564305000	9V9267	9525285	249.120000000000005	37.3999999999999986	135	266
2505	18.9500500000000009	58.8492000000000033	207	209	146	61	636017116	D5JJ5	9134490	205.5	27.3999999999999986	99	266
2505	18.9500500000000009	58.8492000000000033	207	209	146	61	636017116	D5JJ5	9134490	205.5	27.3999999999999986	99	266
2507	12.0916700000000006	85.5116699999999952	33	29	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2507	12.0916700000000006	85.5116699999999952	33	29	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2507	12.0716699999999992	85.5	33	29	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2507	12.0716699999999992	85.5	33	29	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2507	12.0500000000000007	85.4866600000000005	33	32	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2507	12.0500000000000007	85.4866600000000005	33	32	140	61	210663000	5BSN4	9625918	170	29.8000000000000007	84	266
2510	37.7407699999999977	-9.66713599999999929	347	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7407699999999977	-9.66713599999999929	347	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7454499999999982	-9.66848500000000044	347	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7454499999999982	-9.66848500000000044	347	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7502100000000027	-9.66981499999999983	346	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7502100000000027	-9.66981499999999983	346	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7595699999999965	-9.67252000000000045	347	347	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7595699999999965	-9.67252000000000045	347	347	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7548400000000015	-9.67117000000000004	347	346	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7548400000000015	-9.67117000000000004	347	346	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7684100000000029	-9.67506999999999984	346	346	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7684100000000029	-9.67506999999999984	346	346	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7642799999999994	-9.67386499999999927	346	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7642799999999994	-9.67386499999999927	346	347	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7864300000000028	-9.68120200000000075	347	344	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7864300000000028	-9.68120200000000075	347	344	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7824900000000028	-9.6797380000000004	346	343	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7824900000000028	-9.6797380000000004	346	343	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7790099999999995	-9.67844700000000024	345	343	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7790099999999995	-9.67844700000000024	345	343	130	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7732000000000028	-9.67648100000000078	347	347	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7732000000000028	-9.67648100000000078	347	347	131	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7921600000000026	-9.68311100000000025	347	344	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2510	37.7921600000000026	-9.68311100000000025	347	344	129	61	229406000	9HA3307	9290309	243.960000000000008	42	80	295
2521	43.7917100000000019	-8.0840999999999994	67	69	71	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7917100000000019	-8.0840999999999994	67	69	71	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7907399999999996	-8.08758800000000022	68	69	74	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7907399999999996	-8.08758800000000022	68	69	74	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7926199999999994	-8.08111199999999918	68	68	61	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7926199999999994	-8.08111199999999918	68	68	61	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7950900000000019	-8.07310499999999998	67	64	70	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7950900000000019	-8.07310499999999998	67	64	70	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.796050000000001	-8.07018700000000067	69	65	69	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.796050000000001	-8.07018700000000067	69	65	69	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7934699999999992	-8.07852500000000084	68	64	66	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7934699999999992	-8.07852500000000084	68	64	66	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7942400000000021	-8.07586700000000057	69	69	65	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7942400000000021	-8.07586700000000057	69	69	65	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.797699999999999	-8.06417800000000007	66	69	64	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.797699999999999	-8.06417800000000007	66	69	64	61	229412000	9HA3312	9661857	110	19.5	66	274
2889	22.2730700000000006	91.7329900000000009	348	258	0	58	229602000	9HA3438	9576961	199	32	131	275
2521	43.7970400000000026	-8.06680899999999923	69	67	72	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7970400000000026	-8.06680899999999923	69	67	72	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7995099999999979	-8.05864599999999953	66	64	71	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7995099999999979	-8.05864599999999953	66	64	71	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7985899999999972	-8.06143199999999993	65	66	68	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.7985899999999972	-8.06143199999999993	65	66	68	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.8006200000000021	-8.05522599999999933	66	66	75	61	229412000	9HA3312	9661857	110	19.5	66	274
2521	43.8006200000000021	-8.05522599999999933	66	66	75	61	229412000	9HA3312	9661857	110	19.5	66	274
2526	11.9015299999999993	-68.6184200000000004	254	257	133	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9015299999999993	-68.6184200000000004	254	257	133	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9065700000000003	-68.6058000000000021	234	238	131	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9065700000000003	-68.6058000000000021	234	238	131	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9093499999999999	-68.6017200000000003	227	232	130	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9093499999999999	-68.6017200000000003	227	232	130	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9045699999999997	-68.6095700000000051	240	244	131	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9045699999999997	-68.6095700000000051	240	244	131	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9024999999999999	-68.6147799999999961	248	252	132	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9024999999999999	-68.6147799999999961	248	252	132	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.922167	-68.5903200000000055	209	216	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.922167	-68.5903200000000055	209	216	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9120500000000007	-68.598550000000003	220	225	128	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9120500000000007	-68.598550000000003	220	225	128	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9151000000000007	-68.5956800000000015	213	220	127	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9151000000000007	-68.5956800000000015	213	220	127	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9293499999999995	-68.5850300000000033	209	216	127	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9293499999999995	-68.5850300000000033	209	216	127	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9330999999999996	-68.5822699999999941	209	215	125	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9330999999999996	-68.5822699999999941	209	215	125	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9236000000000004	-68.5892800000000022	209	215	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9236000000000004	-68.5892800000000022	209	215	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9264500000000009	-68.5871900000000068	209	215	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2526	11.9264500000000009	-68.5871900000000068	209	215	126	61	229415000	9HA3314	8819500	268.319999999999993	36	78	277
2529	51.8112700000000004	4.88323000000000018	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112700000000004	4.88323000000000018	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112599999999972	4.88323000000000018	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112599999999972	4.88323000000000018	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112599999999972	4.88323499999999999	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112599999999972	4.88323499999999999	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112500000000011	4.88323399999999985	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112500000000011	4.88323399999999985	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112500000000011	4.88323199999999957	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2529	51.8112500000000011	4.88323199999999957	135	135	0	61	311000943	C6EN2	9295103	70.0999999999999943	11.6999999999999993	31	273
2550	44.9547900000000027	14.1049799999999994	147	191	1	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9547900000000027	14.1049799999999994	147	191	1	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9545499999999976	14.1052099999999996	150	125	5	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9545499999999976	14.1052099999999996	150	125	5	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9547900000000027	14.1056399999999993	116	224	3	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9547900000000027	14.1056399999999993	116	224	3	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9550899999999984	14.1051000000000002	57	134	5	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9550899999999984	14.1051000000000002	57	134	5	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9549400000000006	14.1057100000000002	81	101	10	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2550	44.9549400000000006	14.1057100000000002	81	101	10	61	229425000	9HA3321	9381990	92.9599999999999937	24	32	289
2552	37.9608500000000006	23.5709699999999991	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2552	37.9608500000000006	23.5709699999999991	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2552	37.9608699999999999	23.5709599999999995	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2552	37.9608699999999999	23.5709599999999995	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2552	37.9608699999999999	23.5709699999999991	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2552	37.9608699999999999	23.5709699999999991	3	3	0	61	229426000	9HA3316	9463425	44.1700000000000017	9	30	262
2601	22.995000000000001	119.063299999999998	157	174	120	61	477326800	VRSM6	9147227	146.449999999999989	22.6999999999999993	73	290
2601	22.995000000000001	119.063299999999998	157	174	120	61	477326800	VRSM6	9147227	146.449999999999989	22.6999999999999993	73	290
2610	17.9100199999999994	-80.9109299999999934	316	315	120	61	229446000	9HA3334	9363479	179.879999999999995	32.2299999999999969	114	295
2610	17.9100199999999994	-80.9109299999999934	316	315	120	61	229446000	9HA3334	9363479	179.879999999999995	32.2299999999999969	114	295
2614	-12.6524400000000004	51.0864100000000008	318	319	94	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6524400000000004	51.0864100000000008	318	319	94	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6509400000000003	51.0851100000000002	319	319	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6509400000000003	51.0851100000000002	319	319	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6413799999999998	51.0769700000000029	319	320	92	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6413799999999998	51.0769700000000029	319	320	92	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6430199999999999	51.0783600000000035	319	320	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6430199999999999	51.0783600000000035	319	320	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6457099999999993	51.0806699999999978	319	320	92	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6457099999999993	51.0806699999999978	319	320	92	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6446400000000008	51.0797600000000003	319	319	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6446400000000008	51.0797600000000003	319	319	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6286699999999996	51.0664000000000016	319	321	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2614	-12.6286699999999996	51.0664000000000016	319	321	93	61	229450000	9HA3338	9427433	111.5	17.6000000000000014	76	298
2617	40.8317499999999995	1.45586299999999991	110	139	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8317499999999995	1.45586299999999991	110	139	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.835090000000001	1.45124699999999995	109	132	48	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.835090000000001	1.45124699999999995	109	132	48	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8361700000000027	1.44975999999999994	109	135	48	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8361700000000027	1.44975999999999994	109	135	48	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8338800000000006	1.453017	106	129	47	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8338800000000006	1.453017	106	129	47	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8329200000000014	1.45437799999999995	106	132	43	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8329200000000014	1.45437799999999995	106	132	43	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8384900000000002	1.4468399999999999	110	133	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8384900000000002	1.4468399999999999	110	133	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8395200000000003	1.44551699999999994	110	140	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8395200000000003	1.44551699999999994	110	140	45	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8372600000000006	1.44835699999999989	110	135	46	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8372600000000006	1.44835699999999989	110	135	46	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8419299999999978	1.44246500000000011	110	134	44	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8419299999999978	1.44246500000000011	110	134	44	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8407399999999967	1.44403999999999999	110	136	47	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8407399999999967	1.44403999999999999	110	136	47	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8430099999999996	1.4411179999999999	110	134	44	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2617	40.8430099999999996	1.4411179999999999	110	134	44	61	563091400	9V6251	9542984	142.490000000000009	21.629999999999999	73	294
2627	41.7466500000000025	142.699399999999997	84	83	175	61	477510600	VRPE8	9244946	303.839999999999975	40	110	266
2627	41.7466500000000025	142.699399999999997	84	83	175	61	477510600	VRPE8	9244946	303.839999999999975	40	110	266
2627	41.7461300000000008	142.693000000000012	84	84	174	61	477510600	VRPE8	9244946	303.839999999999975	40	110	266
2627	41.7461300000000008	142.693000000000012	84	84	174	61	477510600	VRPE8	9244946	303.839999999999975	40	110	266
2629	52.7547700000000006	3.70570000000000022	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7547700000000006	3.70570000000000022	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7571700000000021	3.70913300000000001	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7571700000000021	3.70913300000000001	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7596300000000014	3.71265000000000001	220	221	116	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7596300000000014	3.71265000000000001	220	221	116	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7704999999999984	3.72840000000000016	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7704999999999984	3.72840000000000016	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7668800000000005	3.72318300000000013	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7668800000000005	3.72318300000000013	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7619800000000012	3.71606699999999979	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7619800000000012	3.71606699999999979	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7644499999999965	3.71968299999999985	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7644499999999965	3.71968299999999985	220	221	115	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7784800000000018	3.7400500000000001	220	221	111	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7784800000000018	3.7400500000000001	220	221	111	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.781170000000003	3.74393300000000018	220	221	111	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.781170000000003	3.74393300000000018	220	221	111	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7749499999999969	3.73488299999999995	220	221	113	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2629	52.7749499999999969	3.73488299999999995	220	221	113	61	477348500	VRPE9	9244934	303.819999999999993	40	129	266
2630	26.8855000000000004	-91.5015899999999931	319	316	168	61	477684200	VROW3	9244922	303.839999999999975	40	131	266
2630	26.8855000000000004	-91.5015899999999931	319	316	168	61	477684200	VROW3	9244922	303.839999999999975	40	131	266
2634	-29.2337200000000017	-36.2912099999999995	113	112	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2337200000000017	-36.2912099999999995	113	112	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2325100000000013	-36.2945300000000017	113	112	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2325100000000013	-36.2945300000000017	113	112	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2283599999999986	-36.3061799999999977	113	113	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2283599999999986	-36.3061799999999977	113	113	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2297599999999989	-36.3022899999999993	113	110	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2297599999999989	-36.3022899999999993	113	110	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2309300000000007	-36.2989900000000034	113	110	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2309300000000007	-36.2989900000000034	113	110	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2348199999999991	-36.2881	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2348199999999991	-36.2881	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2364500000000014	-36.2835400000000021	113	112	131	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2364500000000014	-36.2835400000000021	113	112	131	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2243500000000012	-36.3171600000000012	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2243500000000012	-36.3171600000000012	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2224299999999992	-36.3224900000000019	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2224299999999992	-36.3224900000000019	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2255099999999999	-36.3139400000000023	113	111	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2255099999999999	-36.3139400000000023	113	111	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2269499999999987	-36.3100000000000023	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2269499999999987	-36.3100000000000023	113	112	133	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.219850000000001	-36.3296100000000024	113	113	130	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.219850000000001	-36.3296100000000024	113	113	130	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2186999999999983	-36.3327600000000004	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2186999999999983	-36.3327600000000004	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.21631	-36.3392699999999991	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.21631	-36.3392699999999991	113	111	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2177399999999992	-36.3354100000000031	113	113	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2634	-29.2177399999999992	-36.3354100000000031	113	113	132	61	229458000	9HA3347	9628154	299.949999999999989	48.3200000000000003	134	266
2640	2.14548300000000003	119.321700000000007	186	188	124	61	356761000	3FZC3	9122679	224.969999999999999	32.25	72	275
2640	2.14548300000000003	119.321700000000007	186	188	124	61	356761000	3FZC3	9122679	224.969999999999999	32.25	72	275
2645	-33.8647300000000016	26.6658299999999997	77	77	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8647300000000016	26.6658299999999997	77	77	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8653699999999986	26.6621400000000008	77	79	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8653699999999986	26.6621400000000008	77	79	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8633700000000033	26.6745899999999985	84	85	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8633700000000033	26.6745899999999985	84	85	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8639200000000002	26.6701100000000011	80	77	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8639200000000002	26.6701100000000011	80	77	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8663900000000027	26.6535100000000007	81	83	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8663900000000027	26.6535100000000007	81	83	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8659299999999988	26.6579300000000003	80	82	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8659299999999988	26.6579300000000003	80	82	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8668300000000002	26.6490800000000014	82	86	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8668300000000002	26.6490800000000014	82	86	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8671500000000023	26.6447000000000003	84	80	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8671500000000023	26.6447000000000003	84	80	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8618900000000025	26.6870000000000012	78	78	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8618900000000025	26.6870000000000012	78	78	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8611199999999997	26.69191	83	81	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8611199999999997	26.69191	83	81	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8624900000000011	26.6831999999999994	78	80	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8624900000000011	26.6831999999999994	78	80	112	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.863030000000002	26.6789799999999993	80	83	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.863030000000002	26.6789799999999993	80	83	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8607200000000006	26.6968800000000002	82	84	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2645	-33.8607200000000006	26.6968800000000002	82	84	113	61	229462000	9HA3351	9323900	190	32.259999999999998	100	275
2671	26.3862799999999993	-78.640979999999999	294	288	81	61	312407000	V3WL4	9186948	95.9500000000000028	16	41	294
2671	26.3862799999999993	-78.640979999999999	294	288	81	61	312407000	V3WL4	9186948	95.9500000000000028	16	41	294
2673	-10.5688499999999994	139.772999999999996	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5688499999999994	139.772999999999996	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.56752	139.765800000000013	281	281	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.56752	139.765800000000013	281	281	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5699900000000007	139.780000000000001	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5699900000000007	139.780000000000001	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5702999999999996	139.782000000000011	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5702999999999996	139.782000000000011	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5707100000000001	139.784400000000005	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5707100000000001	139.784400000000005	279	279	146	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5720100000000006	139.792200000000008	279	279	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5720100000000006	139.792200000000008	279	279	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5636700000000001	139.746600000000001	281	281	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2673	-10.5636700000000001	139.746600000000001	281	281	145	61	229474000	9HA3361	9632820	255.400000000000006	37.4299999999999997	114	266
2678	-0.284115000000000006	72.8746699999999947	51	54	121	61	229478000	9HA3365	9650171	199.900000000000006	32.3200000000000003	74	275
2678	-0.284115000000000006	72.8746699999999947	51	54	121	61	229478000	9HA3365	9650171	199.900000000000006	32.3200000000000003	74	275
2692	4.52638799999999986	119.630099999999999	175	176	123	61	229486000	9HA3371	9643910	189.990000000000009	32.259999999999998	107	275
2692	4.52638799999999986	119.630099999999999	175	176	123	61	229486000	9HA3371	9643910	189.990000000000009	32.259999999999998	107	275
2698	15.1946700000000003	148.330500000000001	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1946700000000003	148.330500000000001	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1850000000000005	148.334499999999991	342	336	159	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1850000000000005	148.334499999999991	342	336	159	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1878700000000002	148.333300000000008	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1878700000000002	148.333300000000008	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2116699999999998	148.323700000000002	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2116699999999998	148.323700000000002	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2146699999999999	148.322300000000013	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2146699999999999	148.322300000000013	342	336	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2083300000000001	148.324999999999989	342	336	162	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2083300000000001	148.324999999999989	342	336	162	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2029999999999994	148.327200000000005	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2029999999999994	148.327200000000005	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1983300000000003	148.329000000000008	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.1983300000000003	148.329000000000008	342	337	161	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2346699999999995	148.314300000000003	342	337	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2346699999999995	148.314300000000003	342	337	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2230000000000008	148.318999999999988	342	337	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2698	15.2230000000000008	148.318999999999988	342	337	160	61	229488000	9HA3373	9280603	277.279999999999973	40	111	266
2701	-23.7385899999999985	112.235600000000005	353	348	172	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7385899999999985	112.235600000000005	353	348	172	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7454800000000006	112.236800000000002	351	346	167	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7454800000000006	112.236800000000002	351	346	167	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7338200000000015	112.234800000000007	353	349	173	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7338200000000015	112.234800000000007	353	349	173	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7562800000000003	112.239400000000003	349	349	162	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7562800000000003	112.239400000000003	349	349	162	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.753820000000001	112.238900000000001	349	346	163	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.753820000000001	112.238900000000001	349	346	163	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7486999999999995	112.2376	348	344	166	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7486999999999995	112.2376	348	344	166	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7769200000000005	112.244399999999999	348	343	138	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7769200000000005	112.244399999999999	348	343	138	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7856699999999996	112.246499999999997	349	349	136	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7856699999999996	112.246499999999997	349	349	136	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7711000000000006	112.242900000000006	349	345	139	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7711000000000006	112.242900000000006	349	345	139	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7746500000000012	112.243799999999993	348	346	138	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2701	-23.7746500000000012	112.243799999999993	348	346	138	61	229489000	9HA3374	9280627	277.279999999999973	40	128	266
2721	12.2337399999999992	-17.8897699999999986	358	359	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2337399999999992	-17.8897699999999986	358	359	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2383400000000009	-17.8900000000000006	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2383400000000009	-17.8900000000000006	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2286199999999994	-17.8895000000000017	358	356	124	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2286199999999994	-17.8895000000000017	358	356	124	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2479800000000001	-17.8905199999999986	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2479800000000001	-17.8905199999999986	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2428899999999992	-17.890270000000001	358	356	123	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2428899999999992	-17.890270000000001	358	356	123	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2530999999999999	-17.8908200000000015	358	358	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2530999999999999	-17.8908200000000015	358	358	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2656200000000002	-17.8914200000000001	358	358	123	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2656200000000002	-17.8914200000000001	358	358	123	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2690599999999996	-17.8916000000000004	358	357	120	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2690599999999996	-17.8916000000000004	358	357	120	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2570200000000007	-17.891020000000001	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2570200000000007	-17.891020000000001	358	357	122	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2610200000000003	-17.8912200000000006	358	356	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2610200000000003	-17.8912200000000006	358	356	121	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2736900000000002	-17.8918199999999992	358	357	123	61	229499000	9HQT7	8808525	176	32	70	291
2721	12.2736900000000002	-17.8918199999999992	358	357	123	61	229499000	9HQT7	8808525	176	32	70	291
2741	46.0613099999999989	31.2239499999999985	340	341	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0613099999999989	31.2239499999999985	340	341	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0579299999999989	31.2253900000000009	340	343	110	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0579299999999989	31.2253900000000009	340	343	110	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0646899999999988	31.2224000000000004	337	344	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0646899999999988	31.2224000000000004	337	344	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0543699999999987	31.2271999999999998	340	342	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0543699999999987	31.2271999999999998	340	342	111	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0505199999999988	31.2288899999999998	340	343	110	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0505199999999988	31.2288899999999998	340	343	110	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0465900000000019	31.2307500000000005	340	341	112	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0465900000000019	31.2307500000000005	340	341	112	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0754900000000021	31.2151500000000013	322	327	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0754900000000021	31.2151500000000013	322	327	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0778899999999965	31.2128100000000011	320	324	104	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0778899999999965	31.2128100000000011	320	324	104	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0802499999999995	31.2101700000000015	320	323	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0802499999999995	31.2101700000000015	320	323	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0725800000000021	31.2174699999999987	326	330	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0725800000000021	31.2174699999999987	326	330	105	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0689300000000017	31.2200600000000001	330	334	106	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0689300000000017	31.2200600000000001	330	334	106	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0825600000000009	31.2075600000000009	320	324	103	61	229524000	9HA3378	9311593	289	45	87	275
2741	46.0825600000000009	31.2075600000000009	320	324	103	61	229524000	9HA3378	9311593	289	45	87	275
2754	14.4493799999999997	130.749300000000005	325	324	104	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4493799999999997	130.749300000000005	325	324	104	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4216700000000007	130.77000000000001	322	318	100	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4216700000000007	130.77000000000001	322	318	100	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4283300000000008	130.764999999999986	322	321	100	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4283300000000008	130.764999999999986	322	321	100	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4350000000000005	130.758299999999991	322	320	100	61	229531000	9HA3383	9617519	292	45	116	275
2754	14.4350000000000005	130.758299999999991	322	320	100	61	229531000	9HA3383	9617519	292	45	116	275
2756	-21.6859199999999994	58.5078800000000001	237	236	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6859199999999994	58.5078800000000001	237	236	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6873499999999986	58.5055199999999971	237	238	93	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6873499999999986	58.5055199999999971	237	238	93	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6828900000000004	58.512590000000003	237	236	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6828900000000004	58.512590000000003	237	236	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6802400000000013	58.5168800000000005	237	237	96	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6802400000000013	58.5168800000000005	237	237	96	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6812000000000005	58.5153099999999995	237	235	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6812000000000005	58.5153099999999995	237	235	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6785400000000017	58.5197000000000003	237	237	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6785400000000017	58.5197000000000003	237	237	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6770800000000001	58.5220899999999986	237	237	97	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6770800000000001	58.5220899999999986	237	237	97	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6916800000000016	58.4984600000000015	236	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6916800000000016	58.4984600000000015	236	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6946599999999989	58.4937899999999971	236	235	96	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6946599999999989	58.4937899999999971	236	235	96	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6938899999999997	58.4949700000000021	236	234	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6938899999999997	58.4949700000000021	236	234	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6902100000000004	58.5007999999999981	236	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6902100000000004	58.5007999999999981	236	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6885499999999993	58.5035200000000017	237	237	93	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6885499999999993	58.5035200000000017	237	237	93	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6894899999999993	58.5019800000000032	237	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6894899999999993	58.5019800000000032	237	236	94	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6964100000000002	58.4910700000000006	237	235	95	61	229532000	9HA3384	9617521	292	45	185	275
2756	-21.6964100000000002	58.4910700000000006	237	235	95	61	229532000	9HA3384	9617521	292	45	185	275
2757	-6.7514700000000003	117.681100000000001	115	115	126	61	229533000	9HA3385	9646900	179.990000000000009	30	106	275
2757	-6.7514700000000003	117.681100000000001	115	115	126	61	229533000	9HA3385	9646900	179.990000000000009	30	106	275
2767	38.5945999999999998	-9.40526000000000018	23	346	2	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5945999999999998	-9.40526000000000018	23	346	2	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946899999999999	-9.40542499999999926	15	321	2	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946899999999999	-9.40542499999999926	15	321	2	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946399999999983	-9.40558599999999956	9	267	6	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946399999999983	-9.40558599999999956	9	267	6	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946599999999975	-9.40559000000000012	11	269	5	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5946599999999975	-9.40559000000000012	11	269	5	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5943100000000001	-9.40692100000000053	353	244	11	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5943100000000001	-9.40692100000000053	353	244	11	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5945200000000028	-9.40630099999999914	358	244	5	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5945200000000028	-9.40630099999999914	358	244	5	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5945899999999966	-9.4058489999999999	4	258	6	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2767	38.5945899999999966	-9.4058489999999999	4	258	6	61	477318300	VRSQ3	9196864	304.160000000000025	40.0300000000000011	132	266
2785	38.3704899999999967	15.7321500000000007	13	11	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3704899999999967	15.7321500000000007	13	11	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3746300000000033	15.7332000000000001	13	10	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3746300000000033	15.7332000000000001	13	10	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3652299999999968	15.7308299999999992	13	10	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3652299999999968	15.7308299999999992	13	10	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3797300000000021	15.7345000000000006	15	12	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3797300000000021	15.7345000000000006	15	12	113	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3528599999999997	15.72776	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3528599999999997	15.72776	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3486100000000008	15.7266600000000007	13	10	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3486100000000008	15.7266600000000007	13	10	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3569699999999969	15.7287700000000008	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3569699999999969	15.7287700000000008	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3605700000000027	15.7296800000000001	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3605700000000027	15.7296800000000001	13	11	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.34131	15.7247199999999996	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.34131	15.7247199999999996	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3444500000000019	15.7255500000000001	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3444500000000019	15.7255500000000001	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3339799999999968	15.7228200000000005	13	12	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3339799999999968	15.7228200000000005	13	12	114	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3371100000000027	15.7236499999999992	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2785	38.3371100000000027	15.7236499999999992	13	11	115	61	371743000	H9FF	9203904	148.580000000000013	23.1000000000000014	94	266
2789	3.33344199999999979	0.784496700000000047	98	282	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33344199999999979	0.784496700000000047	98	282	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3333879999999998	0.784616599999999997	97	282	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3333879999999998	0.784616599999999997	97	282	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33358199999999982	0.783973299999999984	99	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33358199999999982	0.783973299999999984	99	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33390800000000009	0.782873299999999994	101	287	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33390800000000009	0.782873299999999994	101	287	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3338350000000001	0.783161600000000013	100	288	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3338350000000001	0.783161600000000013	100	288	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33365799999999979	0.783708300000000024	99	284	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33365799999999979	0.783708300000000024	99	284	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33374199999999998	0.783431600000000006	100	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33374199999999998	0.783431600000000006	100	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33430500000000007	0.781548299999999974	100	283	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33430500000000007	0.781548299999999974	100	283	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33402799999999999	0.782561700000000027	101	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33402799999999999	0.782561700000000027	101	285	8	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3342369999999999	0.781874999999999987	100	284	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.3342369999999999	0.781874999999999987	100	284	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33416699999999988	0.782113300000000011	101	285	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2789	3.33416699999999988	0.782113300000000011	101	285	9	61	229550000	9HA3399	9632832	255.400000000000006	38	97	266
2818	-25.8745200000000004	47.4290200000000013	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8745200000000004	47.4290200000000013	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8736500000000014	47.4307000000000016	63	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8736500000000014	47.4307000000000016	63	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8729699999999987	47.4320700000000031	63	62	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8729699999999987	47.4320700000000031	63	62	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8709999999999987	47.4361999999999995	62	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8709999999999987	47.4361999999999995	62	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8721299999999985	47.4338699999999989	63	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8721299999999985	47.4338699999999989	63	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8700299999999999	47.4382000000000019	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8700299999999999	47.4382000000000019	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8783700000000003	47.421599999999998	61	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8783700000000003	47.421599999999998	61	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8795700000000011	47.4192800000000005	62	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8795700000000011	47.4192800000000005	62	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8790699999999987	47.4202700000000021	61	60	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8790699999999987	47.4202700000000021	61	60	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8776200000000003	47.4230299999999971	62	59	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8776200000000003	47.4230299999999971	62	59	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8760800000000017	47.4259800000000027	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8760800000000017	47.4259800000000027	62	60	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8836200000000005	47.4112999999999971	61	58	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8836200000000005	47.4112999999999971	61	58	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8823499999999989	47.413649999999997	62	60	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8823499999999989	47.413649999999997	62	60	74	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8805300000000003	47.4173199999999966	63	61	73	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8805300000000003	47.4173199999999966	63	61	73	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8813700000000004	47.4155799999999985	63	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2818	-25.8813700000000004	47.4155799999999985	63	61	75	61	229567000	9HA3415	9224738	289	45	97	275
2819	53.4514199999999988	-5.20889999999999986	228	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4514199999999988	-5.20889999999999986	228	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.44773	-5.2102170000000001	231	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.44773	-5.2102170000000001	231	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4491299999999967	-5.20971700000000038	230	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4491299999999967	-5.20971700000000038	230	192	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4432800000000015	-5.21198300000000003	233	194	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4432800000000015	-5.21198300000000003	233	194	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4447499999999991	-5.21138299999999965	233	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4447499999999991	-5.21138299999999965	233	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4458699999999993	-5.21095000000000041	232	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.4458699999999993	-5.21095000000000041	232	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.446869999999997	-5.21056700000000017	231	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2819	53.446869999999997	-5.21056700000000017	231	193	24	61	229568000	9HA3413	9328560	224.949999999999989	32.2000000000000028	89	275
2822	25.3049299999999988	120.638999999999996	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3049299999999988	120.638999999999996	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3085699999999996	120.641400000000004	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3085699999999996	120.641400000000004	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3153700000000015	120.646000000000001	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3153700000000015	120.646000000000001	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3109199999999994	120.643000000000001	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3109199999999994	120.643000000000001	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3189799999999998	120.648499999999999	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3189799999999998	120.648499999999999	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2966300000000004	120.633399999999995	32	32	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2966300000000004	120.633399999999995	32	32	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3025500000000001	120.6374	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.3025500000000001	120.6374	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2997000000000014	120.635499999999993	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2997000000000014	120.635499999999993	32	31	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2894700000000014	120.628600000000006	33	32	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2894700000000014	120.628600000000006	33	32	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.29223	120.630399999999995	32	30	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.29223	120.630399999999995	32	30	100	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.286999999999999	120.626900000000006	33	31	101	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.286999999999999	120.626900000000006	33	31	101	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2846299999999999	120.625299999999996	32	30	101	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2822	25.2846299999999999	120.625299999999996	32	30	101	61	636019741	D5VX9	9302762	224.939999999999998	32.259999999999998	135	275
2827	34.4690700000000021	23.5220400000000005	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4690700000000021	23.5220400000000005	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4799999999999969	23.5100000000000016	323	323	130	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4799999999999969	23.5100000000000016	323	323	130	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4562000000000026	23.5336299999999987	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4562000000000026	23.5336299999999987	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4533300000000011	23.5350000000000001	317	323	130	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4533300000000011	23.5350000000000001	317	323	130	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.46143	23.528929999999999	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.46143	23.528929999999999	323	323	138	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4470699999999965	23.5424100000000003	317	317	139	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4470699999999965	23.5424100000000003	317	317	139	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4415899999999979	23.5496300000000005	312	310	140	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2827	34.4415899999999979	23.5496300000000005	312	310	140	61	229572000	9HA3417	9620619	227.900000000000006	37.3599999999999994	118	266
2831	-24.2272800000000004	-42.5161000000000016	117	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2272800000000004	-42.5161000000000016	117	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2281699999999987	-42.5142099999999985	116	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2281699999999987	-42.5142099999999985	116	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.229099999999999	-42.5121699999999976	116	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.229099999999999	-42.5121699999999976	116	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2310599999999994	-42.5078499999999977	116	116	107	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2310599999999994	-42.5078499999999977	116	116	107	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2362700000000011	-42.4965499999999992	117	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2362700000000011	-42.4965499999999992	117	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.237639999999999	-42.4936900000000009	116	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.237639999999999	-42.4936900000000009	116	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2339200000000012	-42.5014899999999969	117	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2339200000000012	-42.5014899999999969	117	116	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.23508	-42.4990099999999984	117	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.23508	-42.4990099999999984	117	117	108	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2463599999999992	-42.4751199999999969	116	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2463599999999992	-42.4751199999999969	116	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2385799999999989	-42.4917000000000016	116	116	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2385799999999989	-42.4917000000000016	116	116	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2403900000000014	-42.4877899999999968	116	115	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2403900000000014	-42.4877899999999968	116	115	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2444300000000013	-42.4790599999999969	117	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2444300000000013	-42.4790599999999969	117	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2432899999999982	-42.4814599999999984	117	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2831	-24.2432899999999982	-42.4814599999999984	117	117	109	61	229574000	\N	9587269	299.920000000000016	50	118	275
2802	16.4040399999999984	55.5097700000000032	290	293	118	61	229557000	9HA3404	9477804	255.330000000000013	37.4099999999999966	125	266
2802	16.4040399999999984	55.5097700000000032	290	293	118	61	229557000	9HA3404	9477804	255.330000000000013	37.4099999999999966	125	266
2802	16.4176600000000015	55.4762100000000018	287	291	118	61	229557000	9HA3404	9477804	255.330000000000013	37.4099999999999966	125	266
2802	16.4176600000000015	55.4762100000000018	287	291	118	61	229557000	9HA3404	9477804	255.330000000000013	37.4099999999999966	125	266
2809	40.2505600000000001	3.46877300000000011	320	325	106	61	229561000	9HA3407	9458066	142.97999999999999	21.6999999999999993	61	274
2809	40.2505600000000001	3.46877300000000011	320	325	106	61	229561000	9HA3407	9458066	142.97999999999999	21.6999999999999993	61	274
2837	20.7636499999999984	-71.3475700000000046	293	292	127	61	319142900	ZGGZ6	8988026	43.6000000000000014	7.15000000000000036	26	262
2837	20.7636499999999984	-71.3475700000000046	293	292	127	61	319142900	ZGGZ6	8988026	43.6000000000000014	7.15000000000000036	26	262
2837	20.7612999999999985	-71.3407799999999952	289	290	118	61	319142900	ZGGZ6	8988026	43.6000000000000014	7.15000000000000036	26	262
2837	20.7612999999999985	-71.3407799999999952	289	290	118	61	319142900	ZGGZ6	8988026	43.6000000000000014	7.15000000000000036	26	262
2838	38.5925599999999989	15.4760600000000004	57	18	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2838	38.5925599999999989	15.4760600000000004	57	18	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2838	38.5930800000000005	15.4762500000000003	55	20	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2838	38.5930800000000005	15.4762500000000003	55	20	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2838	38.5935699999999997	15.4764199999999992	53	16	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2838	38.5935699999999997	15.4764199999999992	53	16	4	61	477318400	VRSP9	9196852	304.160000000000025	40.0300000000000011	82	266
2841	6.17666700000000013	91.1700000000000017	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.1700000000000017	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.1949999999999932	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.1949999999999932	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.2083400000000069	269	270	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.2083400000000069	269	270	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.22166	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2841	6.17666700000000013	91.22166	269	269	150	61	229580000	9HA3126	9657064	183	32.2199999999999989	83	274
2848	45.8804099999999977	-39.5301800000000014	73	76	157	61	229583000	9HA3424	9636747	294.199999999999989	44	94	293
2848	45.8804099999999977	-39.5301800000000014	73	76	157	61	229583000	9HA3424	9636747	294.199999999999989	44	94	293
2874	12.3372799999999998	61.6393600000000035	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2874	12.3372799999999998	61.6393600000000035	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2874	12.3386999999999993	61.6350800000000021	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2874	12.3386999999999993	61.6350800000000021	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2874	12.3423800000000004	61.6242799999999988	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2874	12.3423800000000004	61.6242799999999988	290	288	135	61	229597000	9HA3434	9679593	333	60.0399999999999991	204	295
2884	37.4127599999999987	11.6888900000000007	109	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4127599999999987	11.6888900000000007	109	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4111899999999977	11.6943300000000008	110	111	147	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4111899999999977	11.6943300000000008	110	111	147	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4092100000000016	11.7006300000000003	109	111	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4092100000000016	11.7006300000000003	109	111	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4076000000000022	11.7059999999999995	110	110	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4076000000000022	11.7059999999999995	110	110	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.41798	11.6716999999999995	110	110	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.41798	11.6716999999999995	110	110	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4145499999999984	11.6830300000000005	109	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4145499999999984	11.6830300000000005	109	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4161900000000003	11.6775800000000007	109	111	148	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4161900000000003	11.6775800000000007	109	111	148	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4057999999999993	11.7117500000000003	110	112	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4057999999999993	11.7117500000000003	110	112	150	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4041100000000029	11.7172000000000001	110	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4041100000000029	11.7172000000000001	110	111	151	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4003299999999967	11.7290799999999997	109	111	152	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.4003299999999967	11.7290799999999997	109	111	152	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.402230000000003	11.7231100000000001	110	112	153	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.402230000000003	11.7231100000000001	110	112	153	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.3985300000000009	11.7349800000000002	109	110	153	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2884	37.3985300000000009	11.7349800000000002	109	110	153	61	229600000	9HA3437	9406960	176.830000000000013	27.7399999999999984	108	266
2892	59.9625699999999995	4.19815299999999958	355	358	104	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9625699999999995	4.19815299999999958	355	358	104	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9596900000000019	4.19815800000000028	358	5	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9596900000000019	4.19815800000000028	358	5	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9659699999999987	4.19773300000000038	355	357	104	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9659699999999987	4.19773300000000038	355	357	104	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9692599999999985	4.1972820000000004	356	356	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9692599999999985	4.1972820000000004	356	356	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9825500000000034	4.19540799999999958	356	358	107	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9825500000000034	4.19540799999999958	356	358	107	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9790899999999993	4.19582500000000014	355	353	108	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9790899999999993	4.19582500000000014	355	353	108	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.976149999999997	4.1964220000000001	354	356	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.976149999999997	4.1964220000000001	354	356	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9727499999999978	4.19684800000000013	355	354	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9727499999999978	4.19684800000000013	355	354	106	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9992099999999979	4.19346200000000024	356	357	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9992099999999979	4.19346200000000024	356	357	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.992600000000003	4.1943469999999996	356	354	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.992600000000003	4.1943469999999996	356	354	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9956999999999994	4.19393200000000022	355	357	111	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9956999999999994	4.19393200000000022	355	357	111	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9890100000000004	4.19486000000000026	354	356	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9890100000000004	4.19486000000000026	354	356	110	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9855700000000027	4.19517499999999988	356	357	107	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2892	59.9855700000000027	4.19517499999999988	356	357	107	61	229604000	9HA3440	9303144	225	32.259999999999998	140	275
2896	46.5900000000000034	146.203300000000013	221	222	130	61	273452980	UBUS7	9287699	137.5	21.3000000000000007	79	266
2896	46.5900000000000034	146.203300000000013	221	222	130	61	273452980	UBUS7	9287699	137.5	21.3000000000000007	79	266
2933	33.3133300000000006	127.209999999999994	221	225	130	61	229613000	9HA3449	9659787	180.009999999999991	30	102	275
2933	33.3133300000000006	127.209999999999994	221	225	130	61	229613000	9HA3449	9659787	180.009999999999991	30	102	275
2934	14.3967500000000008	-139.973399999999998	272	276	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3967500000000008	-139.973399999999998	272	276	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3965899999999998	-139.9709	272	274	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3965899999999998	-139.9709	272	274	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3964400000000001	-139.968999999999994	273	272	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3964400000000001	-139.968999999999994	273	272	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3956300000000006	-139.958400000000012	275	274	130	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3956300000000006	-139.958400000000012	275	274	130	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3960600000000003	-139.963400000000007	272	275	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3960600000000003	-139.963400000000007	272	275	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3947800000000008	-139.948499999999996	275	276	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3947800000000008	-139.948499999999996	275	276	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3980099999999993	-139.994100000000003	271	271	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3980099999999993	-139.994100000000003	271	271	131	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3981200000000005	-139.996700000000004	272	273	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3981200000000005	-139.996700000000004	272	273	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3969900000000006	-139.976499999999987	272	275	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3969900000000006	-139.976499999999987	272	275	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3972999999999995	-139.982799999999997	272	271	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3972999999999995	-139.982799999999997	272	271	132	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3974200000000003	-139.9846	273	272	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.3974200000000003	-139.9846	273	272	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.39757	-139.987300000000005	273	274	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2934	14.39757	-139.987300000000005	273	274	133	61	229614000	9HA3450	9674373	180.009999999999991	30	83	275
2939	36.6242700000000028	13.20383	114	114	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6242700000000028	13.20383	114	114	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6276999999999973	13.1945200000000007	113	114	128	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6276999999999973	13.1945200000000007	113	114	128	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6260199999999969	13.1991300000000003	114	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6260199999999969	13.1991300000000003	114	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6294699999999978	13.1897500000000001	114	115	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6294699999999978	13.1897500000000001	114	115	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6316500000000005	13.1838200000000008	114	114	129	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6316500000000005	13.1838200000000008	114	114	129	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6406199999999984	13.15883	113	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6406199999999984	13.15883	113	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6389399999999981	13.1636799999999994	114	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6389399999999981	13.1636799999999994	114	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6438500000000005	13.1495700000000006	113	112	129	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6438500000000005	13.1495700000000006	113	112	129	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6422299999999979	13.1541999999999994	113	113	126	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6422299999999979	13.1541999999999994	113	113	126	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6334000000000017	13.1790699999999994	114	114	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6334000000000017	13.1790699999999994	114	114	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6353099999999969	13.1736000000000004	113	113	128	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6353099999999969	13.1736000000000004	113	113	128	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6369800000000012	13.1689699999999998	113	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2939	36.6369800000000012	13.1689699999999998	113	113	127	61	229618000	9HA3454	9294551	240.099999999999994	42.0300000000000011	80	295
2942	10.6945700000000006	-71.5590100000000007	5	44	3	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6945700000000006	-71.5590100000000007	5	44	3	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6944999999999997	-71.5589999999999975	3	293	1	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6944999999999997	-71.5589999999999975	3	293	1	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6945300000000003	-71.559039999999996	5	304	11	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6945300000000003	-71.559039999999996	5	304	11	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6946100000000008	-71.5589899999999943	6	338	5	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6946100000000008	-71.5589899999999943	6	338	5	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6946300000000001	-71.5589800000000054	6	322	6	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2942	10.6946300000000001	-71.5589800000000054	6	322	6	58	229619000	9HA3455	9436941	228.599999999999994	42	120	295
2944	-34.7274299999999982	-57.8556000000000026	211	177	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274299999999982	-57.8556000000000026	211	177	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274400000000014	-57.8556400000000011	211	149	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274400000000014	-57.8556400000000011	211	149	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274249999999967	-57.8556939999999997	212	73	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274249999999967	-57.8556939999999997	212	73	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274699999999967	-57.8557699999999997	212	57	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7274699999999967	-57.8557699999999997	212	57	1	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7273899999999998	-57.8556499999999971	211	97	0	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2944	-34.7273899999999998	-57.8556499999999971	211	97	0	58	229620000	9HA3457	9605255	299.870000000000005	48.3299999999999983	135	266
2918	36.8246600000000015	36.128779999999999	30	134	0	58	352310000	3EBW4	9050187	105.140000000000001	15.6999999999999993	64	294
2918	36.8246600000000015	36.128779999999999	30	134	0	58	352310000	3EBW4	9050187	105.140000000000001	15.6999999999999993	64	294
2925	-24.1226500000000001	-46.2974400000000017	90	69	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1226500000000001	-46.2974400000000017	90	69	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1225999999999985	-46.2974499999999978	93	97	8	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1225999999999985	-46.2974499999999978	93	97	8	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1226200000000013	-46.2974299999999985	91	73	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1226200000000013	-46.2974299999999985	91	73	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1225999999999985	-46.2974200000000025	93	77	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2925	-24.1225999999999985	-46.2974200000000025	93	77	3	58	229609000	9HA3445	9286592	228.990000000000009	32.259999999999998	83	275
2889	22.2730700000000006	91.7329900000000009	348	258	0	58	229602000	9HA3438	9576961	199	32	131	275
2853	38.9672399999999968	118.067499999999995	175	236	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672399999999968	118.067499999999995	175	236	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672300000000007	118.067499999999995	174	234	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672300000000007	118.067499999999995	174	234	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672399999999968	118.067599999999999	176	215	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672399999999968	118.067599999999999	176	215	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672399999999968	118.067599999999999	177	220	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672399999999968	118.067599999999999	177	220	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672499999999999	118.067599999999999	177	225	0	58	413702260	BVVT7	9177624	181	26	102	290
2853	38.9672499999999999	118.067599999999999	177	225	0	58	413702260	BVVT7	9177624	181	26	102	290
2857	6.05991199999999974	1.25209199999999998	173	245	0	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05992700000000006	1.2521230000000001	173	245	1	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05992700000000006	1.2521230000000001	173	245	1	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05994700000000019	1.25219799999999992	178	245	1	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05994700000000019	1.25219799999999992	178	245	1	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05993300000000001	1.252332	187	92	0	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05993300000000001	1.252332	187	92	0	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05997200000000014	1.25228800000000007	183	79	1	58	371812000	3EHL5	8807662	148	21	60	287
2857	6.05997200000000014	1.25228800000000007	183	79	1	58	371812000	3EHL5	8807662	148	21	60	287
2807	36.0768600000000035	-6.24526800000000026	276	92	1	58	219221000	OYHQ2	9543043	142.52000000000001	21.6000000000000014	64	294
2807	36.0768600000000035	-6.24526800000000026	276	92	1	58	219221000	OYHQ2	9543043	142.52000000000001	21.6000000000000014	64	294
2807	36.0768500000000003	-6.24526999999999965	273	130	1	58	219221000	OYHQ2	9543043	142.52000000000001	21.6000000000000014	64	294
2807	36.0768500000000003	-6.24526999999999965	273	130	1	58	219221000	OYHQ2	9543043	142.52000000000001	21.6000000000000014	64	294
2776	-29.9497	-51.3087700000000027	63	66	1	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9497	-51.3087700000000027	63	66	1	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9496299999999991	-51.3088100000000011	66	66	1	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9496299999999991	-51.3088100000000011	66	66	1	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9497399999999985	-51.3087299999999971	59	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9497399999999985	-51.3087299999999971	59	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9497199999999992	-51.3087299999999971	56	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9497199999999992	-51.3087299999999971	56	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9496900000000004	-51.3087400000000002	59	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2776	-29.9496900000000004	-51.3087400000000002	59	66	0	58	229543000	9HA3392	9654971	123	19	47	294
2793	1.172763	103.703400000000002	3	102	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.172763	103.703400000000002	3	102	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.172763	103.703599999999994	354	78	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.172763	103.703599999999994	354	78	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.17285299999999992	103.703699999999998	352	77	1	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.17285299999999992	103.703699999999998	352	77	1	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.17305499999999996	103.703800000000001	1	12	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.17305499999999996	103.703800000000001	1	12	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.1732149999999999	103.703900000000004	4	40	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2793	1.1732149999999999	103.703900000000004	4	40	2	58	229553000	9HA3401	9636785	280.569999999999993	43.4200000000000017	91	293
2800	-33.0036300000000011	-71.5851600000000019	259	203	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0036300000000011	-71.5851600000000019	259	203	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0034199999999984	-71.5851600000000019	255	171	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0034199999999984	-71.5851600000000019	255	171	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.003300000000003	-71.5852299999999957	248	135	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.003300000000003	-71.5852299999999957	248	135	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0031699999999972	-71.5853900000000039	241	129	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0031699999999972	-71.5853900000000039	241	129	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0030599999999978	-71.5855700000000041	236	100	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2800	-33.0030599999999978	-71.5855700000000041	236	100	2	58	229556000	9HA3403	9477799	255.289999999999992	37.4099999999999966	94	266
2817	1.26351799999999992	103.884500000000003	33	140	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26351799999999992	103.884500000000003	33	140	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26354300000000008	103.884399999999999	35	317	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26354300000000008	103.884399999999999	35	317	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350300000000004	103.884500000000003	29	247	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350300000000004	103.884500000000003	29	247	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350699999999994	103.884500000000003	32	125	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350699999999994	103.884500000000003	32	125	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350300000000004	103.884399999999999	33	262	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2817	1.26350300000000004	103.884399999999999	33	262	0	58	477521200	VRTE3	9237383	169.259999999999991	27.1999999999999993	73	275
2740	27.6175299999999986	-83.0527100000000047	331	116	2	58	229523000	9HA3377	9668403	199.97999999999999	32.240000000000002	73	275
2740	27.6175299999999986	-83.0527100000000047	331	116	2	58	229523000	9HA3377	9668403	199.97999999999999	32.240000000000002	73	275
2740	27.6174999999999997	-83.0527299999999968	332	198	1	58	229523000	9HA3377	9668403	199.97999999999999	32.240000000000002	73	275
2740	27.6174999999999997	-83.0527299999999968	332	198	1	58	229523000	9HA3377	9668403	199.97999999999999	32.240000000000002	73	275
2824	30.0781999999999989	-88.0355299999999943	2	250	3	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0781999999999989	-88.0355299999999943	2	250	3	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0782500000000006	-88.0357400000000041	33	70	4	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0782500000000006	-88.0357400000000041	33	70	4	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0781700000000001	-88.0358499999999964	21	276	2	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0781700000000001	-88.0358499999999964	21	276	2	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0782699999999998	-88.0352800000000002	29	93	5	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2824	30.0782699999999998	-88.0352800000000002	29	93	5	58	229570000	9HA3412	9326536	224.939999999999998	32.259999999999998	139	275
2613	10.3118999999999996	-61.4916600000000031	72	263	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3118999999999996	-61.4916600000000031	72	263	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3118999999999996	-61.4916699999999992	73	263	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3118999999999996	-61.4916699999999992	73	263	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3119200000000006	-61.4916600000000031	75	249	0	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3119200000000006	-61.4916600000000031	75	249	0	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3118700000000008	-61.4916699999999992	73	244	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3118700000000008	-61.4916699999999992	73	244	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3119200000000006	-61.4916699999999992	75	247	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2613	10.3119200000000006	-61.4916699999999992	75	247	1	58	352581000	3FRG3	9427500	93.1500000000000057	15.1999999999999993	50	274
2764	51.7852800000000002	3.34518199999999988	221	2	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.7852800000000002	3.34518199999999988	221	2	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.7852499999999978	3.34519000000000011	219	94	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.7852499999999978	3.34519000000000011	219	94	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.785260000000001	3.34520799999999996	221	309	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.785260000000001	3.34520799999999996	221	309	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.7852999999999994	3.34517299999999995	214	78	1	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.7852999999999994	3.34517299999999995	214	78	1	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.785269999999997	3.34509500000000015	219	318	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2764	51.785269999999997	3.34509500000000015	219	318	0	58	229536000	9HA3389	9180841	100	14.9499999999999993	60	290
2742	20.9749599999999994	72.624210000000005	357	213	1	58	219212000	OYHM2	9553646	142.509999999999991	21.6000000000000014	67	294
2742	20.9749599999999994	72.624210000000005	357	213	1	58	219212000	OYHM2	9553646	142.509999999999991	21.6000000000000014	67	294
2742	20.9749799999999986	72.624440000000007	359	82	4	58	219212000	OYHM2	9553646	142.509999999999991	21.6000000000000014	67	294
2742	20.9749799999999986	72.624440000000007	359	82	4	58	219212000	OYHM2	9553646	142.509999999999991	21.6000000000000014	67	294
2669	21.4564999999999984	39.0811700000000002	337	73	9	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0811700000000002	337	73	9	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0810000000000031	345	56	6	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0810000000000031	345	56	6	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.456669999999999	39.0813300000000012	328	268	6	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.456669999999999	39.0813300000000012	328	268	6	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0813300000000012	328	238	11	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0813300000000012	328	238	11	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0808299999999988	340	340	0	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2669	21.4564999999999984	39.0808299999999988	340	340	0	58	229470000	9HA3357	9261827	208.240000000000009	30.0500000000000007	111	266
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2670	1.70666699999999993	104.948300000000003	44	255	0	58	229471000	9HA3358	9636711	294.199999999999989	44	96	293
2638	40.9575099999999992	28.9121699999999997	121	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9575099999999992	28.9121699999999997	121	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576100000000025	28.9124100000000013	129	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576100000000025	28.9124100000000013	129	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9575600000000009	28.9122899999999987	125	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9575600000000009	28.9122899999999987	125	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576700000000002	28.912510000000001	139	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576700000000002	28.912510000000001	139	61	1	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576599999999971	28.9124799999999986	134	61	0	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2638	40.9576599999999971	28.9124799999999986	134	61	0	58	229459000	9HA3348	9396529	120.799999999999997	17.6000000000000014	67	290
2632	46.9540399999999991	37.4966500000000025	272	285	2	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9540399999999991	37.4966500000000025	272	285	2	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545699999999968	37.4963699999999989	253	354	7	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545699999999968	37.4963699999999989	253	354	7	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545400000000015	37.496299999999998	221	162	6	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545400000000015	37.496299999999998	221	162	6	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9542599999999979	37.4966500000000025	254	106	1	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9542599999999979	37.4966500000000025	254	106	1	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545499999999976	37.496459999999999	248	343	5	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2632	46.9545499999999976	37.496459999999999	248	343	5	58	213444000	4LSI2	9217797	115.329999999999998	19.6000000000000014	86	275
2618	6.26959499999999981	3.18377700000000008	140	143	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26959499999999981	3.18377700000000008	140	143	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26958199999999977	3.18378499999999987	141	185	1	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26958199999999977	3.18378499999999987	141	185	1	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26961200000000041	3.18380200000000002	143	143	1	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26961200000000041	3.18380200000000002	143	143	1	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26954999999999973	3.18376999999999999	140	170	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26954999999999973	3.18376999999999999	140	170	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26958699999999958	3.18379799999999991	140	118	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2618	6.26958699999999958	3.18379799999999991	140	118	0	58	229452000	9HA3340	9620607	227.870000000000005	37.3599999999999994	90	266
2599	-20.1757199999999983	57.4144799999999975	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757199999999983	57.4144799999999975	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757799999999996	57.4145299999999992	30	0	2	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757799999999996	57.4145299999999992	30	0	2	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1756999999999991	57.4144700000000014	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1756999999999991	57.4144700000000014	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757300000000015	57.4144799999999975	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757300000000015	57.4144799999999975	32	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757199999999983	57.4144500000000022	31	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2599	-20.1757199999999983	57.4144500000000022	31	0	0	58	229441000	9HA3330	9251846	201.050000000000011	29.8000000000000007	101	266
2512	24.219850000000001	-110.345500000000001	48	156	0	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2512	24.219850000000001	-110.345500000000001	48	156	0	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2512	24.2198999999999991	-110.345600000000005	51	156	1	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2512	24.2198999999999991	-110.345600000000005	51	156	1	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2512	24.2199799999999996	-110.345600000000005	53	156	0	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2512	24.2199799999999996	-110.345600000000005	53	156	0	58	229407000	9HA3308	9629574	183	32.2000000000000028	93	274
2515	-35.2203799999999987	-55.4688200000000009	71	63	3	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2203799999999987	-55.4688200000000009	71	63	3	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2203599999999994	-55.4688400000000001	73	80	1	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2203599999999994	-55.4688400000000001	73	80	1	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2204100000000011	-55.4688200000000009	71	117	2	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2204100000000011	-55.4688200000000009	71	117	2	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2204199999999972	-55.4687800000000024	69	72	2	58	538006335	V7LY5	9418456	229	32	78	275
2515	-35.2204199999999972	-55.4687800000000024	69	72	2	58	538006335	V7LY5	9418456	229	32	78	275
2459	51.9349300000000014	3.74702499999999983	230	310	1	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349300000000014	3.74702499999999983	230	310	1	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349300000000014	3.74689700000000014	230	274	1	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349300000000014	3.74689700000000014	230	274	1	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349899999999991	3.74670300000000012	225	316	0	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349899999999991	3.74670300000000012	225	316	0	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349500000000006	3.74681199999999981	230	333	2	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2459	51.9349500000000006	3.74681199999999981	230	333	2	58	229388000	9HA3292	9260005	182.550000000000011	27.7399999999999984	103	295
2414	13.6999499999999994	120.374600000000001	90	320	2	58	351560000	HP8634	9615860	119.950000000000003	16.8000000000000007	68	292
2414	13.6999499999999994	120.374600000000001	90	320	2	58	351560000	HP8634	9615860	119.950000000000003	16.8000000000000007	68	292
2297	40.761569999999999	29.6222899999999996	38	270	1	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.761569999999999	29.6222899999999996	38	270	1	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.761490000000002	29.6223099999999988	35	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.761490000000002	29.6223099999999988	35	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614500000000035	29.6223400000000012	33	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614500000000035	29.6223400000000012	33	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614099999999979	29.622440000000001	30	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614099999999979	29.622440000000001	30	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614099999999979	29.62256	26	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2297	40.7614099999999979	29.62256	26	270	0	58	271044133	TCA3489	9236511	207.990000000000009	32.3100000000000023	109	266
2232	-25.6932800000000015	-48.2031500000000008	94	342	1	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6932800000000015	-48.2031500000000008	94	342	1	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6932699999999983	-48.2030999999999992	94	17	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6932699999999983	-48.2030999999999992	94	17	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6933299999999996	-48.2031300000000016	92	26	1	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6933299999999996	-48.2031300000000016	92	26	1	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6934000000000005	-48.2030499999999975	91	16	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6934000000000005	-48.2030499999999975	91	16	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6933700000000016	-48.2030499999999975	93	21	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2232	-25.6933700000000016	-48.2030499999999975	93	21	0	58	229315000	9HA3224	9279719	179.879999999999995	32.2299999999999969	112	295
2367	51.8610600000000019	3.42371999999999987	213	303	0	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2367	51.8610600000000019	3.42371999999999987	213	303	0	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2367	51.8610600000000019	3.42373200000000022	215	303	1	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2367	51.8610600000000019	3.42373200000000022	215	303	1	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2367	51.861069999999998	3.42384300000000019	219	303	1	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2367	51.861069999999998	3.42384300000000019	219	303	1	58	241343000	SVCA9	9440526	249.960000000000008	44.0300000000000011	139	295
2387	37.5534000000000034	-1.11793300000000007	155	231	2	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2387	37.5534000000000034	-1.11793300000000007	155	231	2	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2387	37.5532800000000009	-1.11801700000000004	101	48	2	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2387	37.5532800000000009	-1.11801700000000004	101	48	2	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2387	37.5534200000000027	-1.11781700000000006	120	29	1	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2387	37.5534200000000027	-1.11781700000000006	120	29	1	58	352308000	3ECO	9442237	78.519999999999996	12.4000000000000004	47	287
2271	-23.1645000000000003	-44.4924999999999997	155	69	1	58	229329000	9HA3239	9625712	278.300000000000011	48.7000000000000028	95	271
2271	-23.1645000000000003	-44.4924999999999997	155	69	1	58	229329000	9HA3239	9625712	278.300000000000011	48.7000000000000028	95	271
2271	-23.1645000000000003	-44.4923300000000026	163	93	1	58	229329000	9HA3239	9625712	278.300000000000011	48.7000000000000028	95	271
2271	-23.1645000000000003	-44.4923300000000026	163	93	1	58	229329000	9HA3239	9625712	278.300000000000011	48.7000000000000028	95	271
2241	-24.0843200000000017	-46.3429599999999979	91	262	3	58	229319000	9HA3228	9629550	183	32.2000000000000028	74	274
2241	-24.0843200000000017	-46.3429599999999979	91	262	3	58	229319000	9HA3228	9629550	183	32.2000000000000028	74	274
2241	-24.0843799999999995	-46.3429500000000019	89	283	4	58	229319000	9HA3228	9629550	183	32.2000000000000028	74	274
2241	-24.0843799999999995	-46.3429500000000019	89	283	4	58	229319000	9HA3228	9629550	183	32.2000000000000028	74	274
2164	23.1609599999999993	-106.406199999999998	291	48	3	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.1609599999999993	-106.406199999999998	291	48	3	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.1608599999999996	-106.406300000000002	299	0	0	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.1608599999999996	-106.406300000000002	299	0	0	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.161010000000001	-106.406199999999998	286	244	1	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.161010000000001	-106.406199999999998	286	244	1	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.1608799999999988	-106.406300000000002	298	0	0	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2164	23.1608799999999988	-106.406300000000002	298	0	0	58	377523000	XCBS2	9123518	110.439999999999998	15.9000000000000004	41	263
2156	32.1316699999999997	19.9750000000000014	\N	0	0	58	636018167	D5OL9	9492751	125	21	61	266
2156	32.1316699999999997	19.9750000000000014	\N	0	0	58	636018167	D5OL9	9492751	125	21	61	266
2156	32.1316699999999997	19.9750000000000014	\N	0	0	58	636018167	D5OL9	9492751	125	21	61	266
2156	32.1316699999999997	19.9750000000000014	\N	0	0	58	636018167	D5OL9	9492751	125	21	61	266
2210	-13.0757399999999997	-38.6041700000000034	71	212	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.0757399999999997	-38.6041700000000034	71	212	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.0755999999999997	-38.6041700000000034	81	122	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.0755999999999997	-38.6041700000000034	81	122	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.0755499999999998	-38.6042500000000004	81	306	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.0755499999999998	-38.6042500000000004	81	306	1	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.07559	-38.6042100000000019	76	311	2	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2210	-13.07559	-38.6042100000000019	76	311	2	58	636016973	D5IR3	9408774	230.990000000000009	32.2899999999999991	123	266
2010	-25.7244199999999985	-48.2292500000000004	85	294	3	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7244199999999985	-48.2292500000000004	85	294	3	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7243600000000008	-48.2293099999999981	87	334	1	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7243600000000008	-48.2293099999999981	87	334	1	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7244500000000009	-48.2292500000000004	86	263	1	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7244500000000009	-48.2292500000000004	86	263	1	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7244099999999989	-48.2292399999999972	91	266	0	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2010	-25.7244099999999989	-48.2292399999999972	91	266	0	58	229221000	9HA3159	9644196	199.990000000000009	32	128	275
2042	46.2828900000000019	30.740829999999999	303	119	1	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2828900000000019	30.740829999999999	303	119	1	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2828900000000019	30.7408900000000003	302	116	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2828900000000019	30.7408900000000003	302	116	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2828900000000019	30.7409299999999988	302	44	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2828900000000019	30.7409299999999988	302	44	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2829300000000003	30.7409099999999995	301	336	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2829300000000003	30.7409099999999995	301	336	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2829699999999988	30.7408900000000003	300	333	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2042	46.2829699999999988	30.7408900000000003	300	333	0	58	229236000	9HA3162	9315537	185.069999999999993	23.7399999999999984	61	275
2089	37.2639199999999988	27.5887600000000006	511	199	3	58	229251000	9HA3175	9144043	183	30.9499999999999993	63	275
2089	37.2639199999999988	27.5887600000000006	511	199	3	58	229251000	9HA3175	9144043	183	30.9499999999999993	63	275
2053	60.018340000000002	29.3831200000000017	276	19	3	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.018340000000002	29.3831200000000017	276	19	3	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0180099999999968	29.3827999999999996	269	195	8	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0180099999999968	29.3827999999999996	269	195	8	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0179699999999983	29.3827299999999987	312	26	8	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0179699999999983	29.3827299999999987	312	26	8	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0176999999999978	29.382480000000001	318	335	2	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0176999999999978	29.382480000000001	318	335	2	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0182000000000002	29.3829199999999986	299	24	5	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2053	60.0182000000000002	29.3829199999999986	299	24	5	58	229241000	9HA3167	9195949	94.9599999999999937	13.1699999999999999	59	290
2000	13.2416699999999992	80.4000000000000057	73	59	0	58	229214000	9HA3154	9625463	180	30	90	275
2000	13.2416699999999992	80.4000000000000057	73	59	0	58	229214000	9HA3154	9625463	180	30	90	275
1985	6.05518300000000043	1.27905000000000002	169	53	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05518300000000043	1.27905000000000002	169	53	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05523300000000031	1.27908299999999997	173	53	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05523300000000031	1.27908299999999997	173	53	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05523300000000031	1.2790999999999999	179	160	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05523300000000031	1.2790999999999999	179	160	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05520000000000014	1.27906699999999995	177	232	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1985	6.05520000000000014	1.27906699999999995	177	232	0	58	229208000	9HA3151	9397468	183	32.2299999999999969	85	274
1937	51.8909999999999982	3.5585	241	178	2	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1937	51.8909999999999982	3.5585	241	178	2	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1937	51.8910800000000023	3.55831799999999987	239	316	7	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1937	51.8910800000000023	3.55831799999999987	239	316	7	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1937	51.8912100000000009	3.55819799999999997	229	340	3	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1937	51.8912100000000009	3.55819799999999997	229	340	3	58	229176000	9HA3129	9489584	121.620000000000005	16	64	274
1939	1.28703999999999996	103.9846	68	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28703999999999996	103.9846	68	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28702300000000003	103.984499999999997	69	2	0	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28702300000000003	103.984499999999997	69	2	0	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28708500000000003	103.9846	69	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28708500000000003	103.9846	69	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28712699999999991	103.9846	69	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28712699999999991	103.9846	69	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28716499999999989	103.9846	70	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1939	1.28716499999999989	103.9846	70	2	1	58	229178000	9HA3131	9597020	229	32.25	133	275
1896	44.8316700000000026	36.4433300000000031	84	356	0	58	273377820	UDUW	9136058	246.800000000000011	42	85	295
1896	44.8316700000000026	36.4433300000000031	84	356	0	58	273377820	UDUW	9136058	246.800000000000011	42	85	295
1916	-20.519169999999999	117.286199999999994	280	252	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.519169999999999	117.286199999999994	280	252	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.519169999999999	117.286199999999994	279	32	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.519169999999999	117.286199999999994	279	32	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.519169999999999	117.286199999999994	281	10	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.519169999999999	117.286199999999994	281	10	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.5189999999999984	117.286199999999994	279	311	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1916	-20.5189999999999984	117.286199999999994	279	311	0	58	229166000	9HA3120	9511349	291.800000000000011	45	176	275
1927	2.28571299999999988	102.005899999999997	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28571299999999988	102.005899999999997	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28571500000000016	102.005799999999994	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28571500000000016	102.005799999999994	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28569000000000022	102.006	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28569000000000022	102.006	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.285717	102.005899999999997	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.285717	102.005899999999997	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28568499999999997	102.006	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1927	2.28568499999999997	102.006	321	0	0	58	374669000	3ELA7	9203265	332	58	205	295
1871	40.88035	8.43933299999999953	65	286	3	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1871	40.88035	8.43933299999999953	65	286	3	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1871	40.8802499999999966	8.43947799999999937	43	0	2	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1871	40.8802499999999966	8.43947799999999937	43	0	2	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1871	40.8801899999999989	8.4394449999999992	52	190	4	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1871	40.8801899999999989	8.4394449999999992	52	190	4	58	229144000	9HA3103	9123245	89.769999999999996	13.1699999999999999	60	290
1874	35.2738200000000006	120.2273	156	219	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2738200000000006	120.2273	156	219	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737899999999982	120.227199999999996	155	166	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737899999999982	120.227199999999996	155	166	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737499999999997	120.227199999999996	155	223	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737499999999997	120.227199999999996	155	223	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737100000000012	120.227199999999996	153	215	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1874	35.2737100000000012	120.227199999999996	153	215	1	58	229146000	9HA3105	9598787	225	32.2999999999999972	129	275
1592	8.82601999999999975	-79.5176400000000001	33	294	0	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82601999999999975	-79.5176400000000001	33	294	0	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82604500000000058	-79.5176199999999938	33	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82604500000000058	-79.5176199999999938	33	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82604500000000058	-79.5175899999999984	31	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82604500000000058	-79.5175899999999984	31	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82608699999999935	-79.5175600000000031	31	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1592	8.82608699999999935	-79.5175600000000031	31	294	1	58	229033000	9HA3009	9486477	181.099999999999994	30.0399999999999991	96	275
1822	14.5084999999999997	49.0994499999999974	87	341	1	58	374222000	3FML3	9126467	122.549999999999997	19	50	290
1822	14.5084999999999997	49.0994499999999974	87	341	1	58	374222000	3FML3	9126467	122.549999999999997	19	50	290
1832	18.9309200000000004	72.7010999999999967	355	140	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309200000000004	72.7010999999999967	355	140	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309200000000004	72.7010999999999967	355	140	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309200000000004	72.7010999999999967	355	140	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309100000000008	72.7010899999999936	356	106	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309100000000008	72.7010899999999936	356	106	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309499999999993	72.7011600000000016	354	106	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309499999999993	72.7011600000000016	354	106	0	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309599999999989	72.7012	353	94	1	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1832	18.9309599999999989	72.7012	353	94	1	58	229128000	9HA3091	9605839	189.990000000000009	32.259999999999998	67	275
1771	-6.11226000000000003	12.2079799999999992	114	209	4	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1771	-6.11226000000000003	12.2079799999999992	114	209	4	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1771	-6.11231499999999972	12.2080000000000002	112	348	0	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1771	-6.11231499999999972	12.2080000000000002	112	348	0	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1771	-6.11229800000000001	12.2079799999999992	112	26	2	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1771	-6.11229800000000001	12.2079799999999992	112	26	2	58	229101000	9HA3070	9414462	178.699999999999989	28	88	275
1716	-33.870750000000001	25.7714299999999987	139	177	0	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.870750000000001	25.7714299999999987	139	177	0	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8708999999999989	25.7712299999999992	133	236	3	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8708999999999989	25.7712299999999992	133	236	3	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8708000000000027	25.7713500000000018	123	30	2	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8708000000000027	25.7713500000000018	123	30	2	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8710000000000022	25.7710499999999989	119	235	1	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1716	-33.8710000000000022	25.7710499999999989	119	235	1	58	229085000	9HA3058	9262900	179.990000000000009	32.2000000000000028	82	291
1617	51.4224299999999985	2.66698799999999991	251	147	0	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1617	51.4224299999999985	2.66698799999999991	251	147	0	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1617	51.4224400000000017	2.66697499999999987	251	147	1	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1617	51.4224400000000017	2.66697499999999987	251	147	1	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1617	51.4224400000000017	2.66695800000000016	251	147	1	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1617	51.4224400000000017	2.66695800000000016	251	147	1	58	229046000	9HA3023	9601194	249.97999999999999	44	87	295
1621	42.7808700000000002	132.948299999999989	17	301	1	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808700000000002	132.948299999999989	17	301	1	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808500000000009	132.948200000000014	15	281	2	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808500000000009	132.948200000000014	15	281	2	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808899999999994	132.948299999999989	19	304	1	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808899999999994	132.948299999999989	19	304	1	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808100000000024	132.948399999999992	7	279	2	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1621	42.7808100000000024	132.948399999999992	7	279	2	58	229047000	9HA3024	9528184	180	30.0500000000000007	98	275
1622	45.3775300000000001	36.6932299999999998	236	337	1	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1622	45.3775300000000001	36.6932299999999998	236	337	1	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1622	45.3775300000000001	36.693249999999999	239	310	1	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1622	45.3775300000000001	36.693249999999999	239	310	1	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1622	45.3775699999999986	36.6932199999999966	229	328	0	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1622	45.3775699999999986	36.6932199999999966	229	328	0	58	229048000	9HA3025	9391804	126.829999999999998	14.8000000000000007	25	290
1638	38.1916500000000028	26.0584099999999985	511	208	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1638	38.1916500000000028	26.0584099999999985	511	208	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1638	38.1917699999999982	26.0584400000000009	511	61	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1638	38.1917699999999982	26.0584400000000009	511	61	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1638	38.1918399999999991	26.0585099999999983	511	5	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1638	38.1918399999999991	26.0585099999999983	511	5	1	58	209874000	5BKX5	9054731	78	12.5	56	292
1542	1.2902849999999999	104.021000000000001	61	99	3	58	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1542	1.2902849999999999	104.021000000000001	61	99	3	58	636018669	D5QV2	9583225	228.990000000000009	32.259999999999998	90	275
1601	18.779440000000001	-93.1999100000000027	353	51	4	58	229038000	9HA3013	9537927	248.969999999999999	43.7999999999999972	82	295
1601	18.779440000000001	-93.1999100000000027	353	51	4	58	229038000	9HA3013	9537927	248.969999999999999	43.7999999999999972	82	295
1601	18.7793400000000013	-93.2000799999999998	355	154	1	58	229038000	9HA3013	9537927	248.969999999999999	43.7999999999999972	82	295
1601	18.7793400000000013	-93.2000799999999998	355	154	1	58	229038000	9HA3013	9537927	248.969999999999999	43.7999999999999972	82	295
1605	25.4259400000000007	55.2800500000000028	326	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259400000000007	55.2800500000000028	326	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259599999999999	55.280070000000002	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259599999999999	55.280070000000002	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259699999999995	55.2800599999999989	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259699999999995	55.2800599999999989	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259500000000003	55.2800200000000004	329	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259500000000003	55.2800200000000004	329	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259699999999995	55.2800599999999989	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1605	25.4259699999999995	55.2800599999999989	324	356	0	58	229041000	9HA3017	9626390	183	27.8000000000000007	69	290
1520	52.5291100000000029	4.28848499999999966	224	22	1	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1520	52.5291100000000029	4.28848499999999966	224	22	1	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1520	52.5291199999999989	4.28828099999999957	225	278	2	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1520	52.5291199999999989	4.28828099999999957	225	278	2	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1520	52.5291700000000006	4.28793000000000024	218	263	3	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1520	52.5291700000000006	4.28793000000000024	218	263	3	58	229010000	9HA2986	9621895	189.960000000000008	28.5	69	275
1456	63.0141300000000015	7.82058099999999978	279	107	1	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.0141300000000015	7.82058099999999978	279	107	1	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.01417	7.8206680000000004	272	106	2	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.01417	7.8206680000000004	272	106	2	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.0140499999999975	7.82068299999999983	281	93	2	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.0140499999999975	7.82068299999999983	281	93	2	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.0141399999999976	7.82047999999999988	274	302	3	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
1456	63.0141399999999976	7.82047999999999988	274	302	3	58	229003000	9HA2980	9621869	189.990000000000009	28.5	65	275
2813	14.6771799999999999	-17.4280100000000004	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
463	51.8158900000000031	3.35412800000000022	209	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158900000000031	3.35412800000000022	209	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158999999999992	3.35406199999999988	209	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158999999999992	3.35406199999999988	209	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158999999999992	3.35409999999999986	212	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158999999999992	3.35409999999999986	212	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158799999999999	3.35419299999999998	216	0	0	58	228330700	FMLM	9333802	143	23	73	274
463	51.8158799999999999	3.35419299999999998	216	0	0	58	228330700	FMLM	9333802	143	23	73	274
560	29.821670000000001	122.521699999999996	149	268	1	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.821670000000001	122.521699999999996	149	268	1	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.821670000000001	122.521799999999999	149	67	3	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.821670000000001	122.521799999999999	149	67	3	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.821670000000001	122.521799999999999	149	45	2	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.821670000000001	122.521799999999999	149	45	2	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.8218299999999985	122.521799999999999	149	228	1	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
560	29.8218299999999985	122.521799999999999	149	228	1	58	228340900	FMFT	9299795	334.069999999999993	42.7999999999999972	115	266
456	57.685769999999998	-2.18951800000000008	294	322	2	58	253596000	LXGP	9285586	77.2999999999999972	18	45	273
456	57.685769999999998	-2.18951800000000008	294	322	2	58	253596000	LXGP	9285586	77.2999999999999972	18	45	273
456	57.6857299999999995	-2.18950800000000001	296	305	2	58	253596000	LXGP	9285586	77.2999999999999972	18	45	273
456	57.6857299999999995	-2.18950800000000001	296	305	2	58	253596000	LXGP	9285586	77.2999999999999972	18	45	273
267	16.8931700000000014	-25.003070000000001	54	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8931700000000014	-25.003070000000001	54	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8931399999999989	-25.0031099999999995	33	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8931399999999989	-25.0031099999999995	33	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.893180000000001	-25.0031700000000008	38	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.893180000000001	-25.0031700000000008	38	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8930399999999992	-25.0029800000000009	35	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8930399999999992	-25.0029800000000009	35	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8930599999999984	-25.003029999999999	0	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
267	16.8930599999999984	-25.003029999999999	0	0	0	58	228308600	FLEV	8027781	78.3499999999999943	13.6400000000000006	56	265
472	10.3181700000000003	-61.5025499999999994	88	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181700000000003	-61.5025499999999994	88	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181700000000003	-61.5025300000000001	87	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181700000000003	-61.5025300000000001	87	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181499999999993	-61.5025699999999986	88	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181499999999993	-61.5025699999999986	88	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181799999999999	-61.5025699999999986	90	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3181799999999999	-61.5025699999999986	90	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3182200000000002	-61.5025499999999994	92	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
472	10.3182200000000002	-61.5025499999999994	92	351	0	58	253124000	LXQS	9382114	120.980000000000004	17.1999999999999993	57	274
422	-8.74770799999999937	13.29556	280	261	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74770799999999937	13.29556	280	261	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74769200000000069	13.29556	280	234	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74769200000000069	13.29556	280	234	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74764799999999987	13.29556	280	241	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74764799999999987	13.29556	280	241	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74766200000000005	13.2955199999999998	280	255	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74766200000000005	13.2955199999999998	280	255	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74766499999999958	13.29556	280	261	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
422	-8.74766499999999958	13.29556	280	261	1	58	357029000	3FWF5	9372705	64.7999999999999972	16	48	279
19	51.5139100000000028	3.0242	253	261	32	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5139100000000028	3.0242	253	261	32	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138499999999979	3.02231300000000003	263	270	40	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138499999999979	3.02231300000000003	263	270	40	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138699999999972	3.02060800000000018	254	267	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138699999999972	3.02060800000000018	254	267	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138499999999979	3.01890800000000015	260	271	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138499999999979	3.01890800000000015	260	271	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138400000000019	3.01696799999999987	257	268	40	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138400000000019	3.01696799999999987	257	268	40	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5144200000000012	3.0155470000000002	325	321	45	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5144200000000012	3.0155470000000002	325	321	45	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.515509999999999	3.01635199999999992	76	54	49	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.515509999999999	3.01635199999999992	76	54	49	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.51614	3.01942500000000003	87	76	57	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.51614	3.01942500000000003	87	76	57	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5169399999999982	3.02087199999999978	338	22	38	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5169399999999982	3.02087199999999978	338	22	38	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5172799999999995	3.02049700000000021	184	179	18	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5172799999999995	3.02049700000000021	184	179	18	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5163300000000035	3.02020799999999978	214	203	37	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5163300000000035	3.02020799999999978	214	203	37	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5149499999999989	3.01910999999999996	215	204	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5149499999999989	3.01910999999999996	215	204	39	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138900000000035	3.01819499999999996	214	207	38	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
19	51.5138900000000035	3.01819499999999996	214	207	38	63	246836000	PCOS	9628855	34.5	8.33000000000000007	21	278
584	53.6124000000000009	6.53711299999999973	100	82	11	63	244130717	PDFT	9566318	85	15.8499999999999996	60	282
584	53.6124000000000009	6.53711299999999973	100	82	11	63	244130717	PDFT	9566318	85	15.8499999999999996	60	282
584	53.6125400000000027	6.5379820000000004	101	86	8	63	244130717	PDFT	9566318	85	15.8499999999999996	60	282
584	53.6125400000000027	6.5379820000000004	101	86	8	63	244130717	PDFT	9566318	85	15.8499999999999996	60	282
1706	51.6603300000000019	2.78716700000000017	201	137	1	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6603300000000019	2.78716700000000017	201	137	1	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6603300000000019	2.78716700000000017	200	256	2	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6603300000000019	2.78716700000000017	200	256	2	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6626699999999985	2.78949999999999987	209	210	26	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6626699999999985	2.78949999999999987	209	210	26	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6610000000000014	2.78783300000000001	210	213	21	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6610000000000014	2.78783300000000001	210	213	21	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6603300000000019	2.78716700000000017	207	247	1	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
1706	51.6603300000000019	2.78716700000000017	207	247	1	63	229080000	9HA3053	9583794	131.72999999999999	39	62	272
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	135	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2859	-23.3973300000000002	-41.4089999999999989	134	0	0	63	373106000	H9XF	9650975	84	32	110	284
2813	14.6771700000000003	-17.4280000000000008	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771700000000003	-17.4280000000000008	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771799999999999	-17.4280100000000004	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771700000000003	-17.4280100000000004	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771700000000003	-17.4280100000000004	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771899999999995	-17.4279800000000016	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2813	14.6771899999999995	-17.4279800000000016	199	19	0	62	229565000	9HA3410	9282613	175.599999999999994	28.3999999999999986	98	275
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2842	4.42166700000000024	7.13999999999999968	219	177	0	62	229581000	9HA3422	9636723	294.199999999999989	44	93	293
2847	10.1907300000000003	-61.6993500000000026	58	85	0	62	229582000	9HA3423	9636735	294.199999999999989	44	93	293
2847	10.1907300000000003	-61.6993500000000026	58	85	0	62	229582000	9HA3423	9636735	294.199999999999989	44	93	293
2847	10.1907300000000003	-61.6993500000000026	58	85	0	62	229582000	9HA3423	9636735	294.199999999999989	44	93	293
2847	10.1907300000000003	-61.6993500000000026	58	85	0	62	229582000	9HA3423	9636735	294.199999999999989	44	93	293
2781	51.8743399999999966	4.27479299999999984	13	34	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743399999999966	4.27479299999999984	13	34	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743499999999997	4.2747679999999999	13	51	1	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743499999999997	4.2747679999999999	13	51	1	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743499999999997	4.27478200000000008	14	34	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743499999999997	4.27478200000000008	14	34	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743300000000005	4.27477800000000041	13	76	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743300000000005	4.27477800000000041	13	76	0	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743600000000029	4.2748229999999996	13	44	1	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2781	51.8743600000000029	4.2748229999999996	13	44	1	62	229545000	9HA3395	9261516	138.110000000000014	23	71	274
2782	33.6055100000000024	-7.61386800000000008	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055100000000024	-7.61386800000000008	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.61388800000000021	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.61388800000000021	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.61389699999999969	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.61389699999999969	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055100000000024	-7.61390800000000034	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055100000000024	-7.61390800000000034	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.6139070000000002	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2782	33.6055300000000017	-7.6139070000000002	147	275	0	62	229546000	9HA3396	9596777	121.549999999999997	16	50	274
2835	52.0995800000000031	4.26629400000000025	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995800000000031	4.26629400000000025	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995899999999992	4.26629400000000025	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995899999999992	4.26629400000000025	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995899999999992	4.26628200000000035	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995899999999992	4.26628200000000035	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995800000000031	4.26627500000000026	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0995800000000031	4.26627500000000026	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0996000000000024	4.26627500000000026	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2835	52.0996000000000024	4.26627500000000026	219	212	0	62	311000682	C6DI3	9120205	117.5	17.5	64	287
2927	39.4517700000000033	-0.318510000000000015	332	131	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517700000000033	-0.318510000000000015	332	131	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517099999999985	-0.318518299999999976	332	242	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517099999999985	-0.318518299999999976	332	242	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517700000000033	-0.318531699999999973	332	33	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517700000000033	-0.318531699999999973	332	33	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.451749999999997	-0.318513299999999999	332	34	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.451749999999997	-0.318513299999999999	332	34	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517400000000009	-0.318514999999999993	332	25	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2927	39.4517400000000009	-0.318514999999999993	332	25	0	62	229610000	9HA3446	9276341	133.580000000000013	19.3999999999999986	61	266
2929	54.6893299999999982	20.2034300000000009	327	62	0	62	229611000	9HA3447	9674385	180.009999999999991	30	79	275
2929	54.6893299999999982	20.2034300000000009	327	62	0	62	229611000	9HA3447	9674385	180.009999999999991	30	79	275
2929	54.6893299999999982	20.2034300000000009	327	62	0	62	229611000	9HA3447	9674385	180.009999999999991	30	79	275
2929	54.6893299999999982	20.2034300000000009	327	62	0	62	229611000	9HA3447	9674385	180.009999999999991	30	79	275
2931	8.36145299999999914	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36145299999999914	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36145299999999914	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36146199999999951	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36146199999999951	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36145899999999997	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2931	8.36145899999999997	-62.6943699999999993	252	138	0	62	229612000	9HA3448	9674397	180.009999999999991	30	100	275
2949	41.3063000000000002	2.14646999999999988	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063000000000002	2.14646999999999988	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063100000000034	2.14648199999999978	37	226	1	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063100000000034	2.14648199999999978	37	226	1	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063000000000002	2.14645200000000003	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063000000000002	2.14645200000000003	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3062899999999971	2.14643799999999985	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3062899999999971	2.14643799999999985	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063100000000034	2.14649000000000001	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2949	41.3063100000000034	2.14649000000000001	37	29	0	62	229622000	9HA3459	9484479	365.810000000000002	48.4600000000000009	146	266
2950	2.9570599999999998	101.307100000000005	31	227	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2950	2.9570599999999998	101.307100000000005	31	227	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2950	2.95710499999999987	101.307100000000005	31	235	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2950	2.95710499999999987	101.307100000000005	31	235	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2950	2.95708299999999991	101.307100000000005	31	31	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2950	2.95708299999999991	101.307100000000005	31	31	0	62	229623000	9HA3460	9664952	225	32.2999999999999972	79	275
2935	-23.8708999999999989	-46.3747899999999973	263	343	0	62	229615000	9HA3451	9674361	180.009999999999991	30	109	275
2935	-23.8708999999999989	-46.3747899999999973	263	343	0	62	229615000	9HA3451	9674361	180.009999999999991	30	109	275
2936	-33.3507699999999971	-60.175530000000002	307	239	0	62	229616000	9HA3452	9659799	180	30	65	275
2936	-33.3507699999999971	-60.175530000000002	307	239	0	62	229616000	9HA3452	9659799	180	30	65	275
2938	17.0124999999999993	-61.772590000000001	248	8	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.0124999999999993	-61.772590000000001	248	8	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.0124999999999993	-61.772590000000001	248	112	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.0124999999999993	-61.772590000000001	248	112	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.01248	-61.7725999999999971	248	236	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.01248	-61.7725999999999971	248	236	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.0124999999999993	-61.772590000000001	248	95	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.0124999999999993	-61.772590000000001	248	95	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.01248	-61.7725999999999971	248	235	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
2938	17.01248	-61.7725999999999971	248	235	0	62	229617000	9HA3453	1010284	90.0100000000000051	14.1999999999999993	18	262
264	43.4043399999999977	4.98916700000000013	4	304	1	62	228306800	FNPK	9539004	89.2000000000000028	13.8000000000000007	35	274
264	43.4043399999999977	4.98916700000000013	4	304	1	62	228306800	FNPK	9539004	89.2000000000000028	13.8000000000000007	35	274
2612	10.6413499999999992	-61.4975299999999976	255	341	0	62	355352000	3EVN3	9427536	92.3499999999999943	15.1999999999999993	43	274
2612	10.6413499999999992	-61.4975299999999976	255	341	0	62	355352000	3EVN3	9427536	92.3499999999999943	15.1999999999999993	43	274
2612	10.6413499999999992	-61.4975400000000008	255	341	0	62	355352000	3EVN3	9427536	92.3499999999999943	15.1999999999999993	43	274
2612	10.6413499999999992	-61.4975400000000008	255	341	0	62	355352000	3EVN3	9427536	92.3499999999999943	15.1999999999999993	43	274
2564	51.8269700000000029	4.7240000000000002	77	0	0	62	229430000	9HA3323	8661070	45.5	8	30	262
2564	51.8269700000000029	4.7240000000000002	77	0	0	62	229430000	9HA3323	8661070	45.5	8	30	262
2564	51.82667	4.72333300000000023	77	0	0	62	229430000	9HA3323	8661070	45.5	8	30	262
2564	51.82667	4.72333300000000023	77	0	0	62	229430000	9HA3323	8661070	45.5	8	30	262
2543	43.5419800000000023	10.2965900000000001	351	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419800000000023	10.2965900000000001	351	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419300000000007	10.2965900000000001	351	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419300000000007	10.2965900000000001	351	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419699999999992	10.2965900000000001	352	270	1	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419699999999992	10.2965900000000001	352	270	1	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419699999999992	10.2965999999999998	354	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419699999999992	10.2965999999999998	354	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419399999999968	10.2965900000000001	353	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2543	43.5419399999999968	10.2965900000000001	353	270	0	62	538071319	V7MG9	9559286	53.3999999999999986	9.40000000000000036	32	262
2545	-34.642159999999997	-58.3429399999999987	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.642159999999997	-58.3429399999999987	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6424099999999981	-58.3428699999999978	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6424099999999981	-58.3428699999999978	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6421700000000001	-58.3429599999999979	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6421700000000001	-58.3429599999999979	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6422099999999986	-58.3429300000000026	334	293	1	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6422099999999986	-58.3429300000000026	334	293	1	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6422299999999979	-58.3429599999999979	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2545	-34.6422299999999979	-58.3429599999999979	334	293	0	62	636019582	D5VE2	9619452	299.180000000000007	48.1899999999999977	96	266
2523	45.4313799999999972	12.3104999999999993	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313799999999972	12.3104999999999993	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313500000000019	12.3104800000000001	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313500000000019	12.3104800000000001	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313500000000019	12.3104899999999997	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313500000000019	12.3104899999999997	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313799999999972	12.3104700000000005	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2523	45.4313799999999972	12.3104700000000005	120	228	0	62	229413000	9HB3158	8994001	97.2000000000000028	15.9499999999999993	48	262
2524	43.816749999999999	7.78822499999999973	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2524	43.816749999999999	7.78822499999999973	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2524	43.816749999999999	7.78818500000000036	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2524	43.816749999999999	7.78818500000000036	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2524	43.8167299999999997	7.78822300000000034	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2524	43.8167299999999997	7.78822300000000034	297	280	1	62	319080400	ZGEU7	1009869	49	9	28	262
2684	-36.7083200000000005	-72.9899800000000027	350	310	1	62	229481000	9HA3367	9231157	210	30.1000000000000014	86	266
2684	-36.7083200000000005	-72.9899800000000027	350	310	1	62	229481000	9HA3367	9231157	210	30.1000000000000014	86	266
2684	-36.7082100000000011	-72.9899900000000059	350	310	1	62	229481000	9HA3367	9231157	210	30.1000000000000014	86	266
2684	-36.7082100000000011	-72.9899900000000059	350	310	1	62	229481000	9HA3367	9231157	210	30.1000000000000014	86	266
2654	37.9520499999999998	23.5959199999999996	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959199999999996	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959199999999996	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959199999999996	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2654	37.9520499999999998	23.5959299999999992	348	321	0	62	636018498	D5PY7	9130327	150	23	74	266
2657	22.3256699999999988	114.127300000000005	72	208	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3256699999999988	114.127300000000005	72	208	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3255000000000017	114.127200000000002	72	171	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3255000000000017	114.127200000000002	72	171	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3256599999999992	114.127399999999994	72	179	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3256599999999992	114.127399999999994	72	179	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3255300000000005	114.127099999999999	72	181	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3255300000000005	114.127099999999999	72	181	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3256699999999988	114.127300000000005	72	181	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2657	22.3256699999999988	114.127300000000005	72	181	0	62	229467000	9HA3355	9628166	299.949999999999989	48.3200000000000003	122	266
2664	24.2776700000000005	120.524600000000007	330	131	1	62	229469000	9HA3356	9261815	208.240000000000009	29.8000000000000007	104	266
2664	24.2776700000000005	120.524600000000007	330	131	1	62	229469000	9HA3356	9261815	208.240000000000009	29.8000000000000007	104	266
2664	24.2776700000000005	120.524500000000003	330	235	1	62	229469000	9HA3356	9261815	208.240000000000009	29.8000000000000007	104	266
2664	24.2776700000000005	120.524500000000003	330	235	1	62	229469000	9HA3356	9261815	208.240000000000009	29.8000000000000007	104	266
2746	36.6842299999999994	36.1962499999999991	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842299999999994	36.1962499999999991	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842200000000034	36.1962499999999991	67	272	1	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842200000000034	36.1962499999999991	67	272	1	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842100000000002	36.1962800000000016	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842100000000002	36.1962800000000016	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842299999999994	36.1962299999999999	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2746	36.6842299999999994	36.1962299999999999	67	272	0	62	271044633	TCA4362	9106479	151.469999999999999	24	87	266
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025399999999998	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025399999999998	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.0025499999999994	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.002600000000001	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2758	-21.002600000000001	164.666500000000013	159	227	0	62	229534000	9HA3386	9646895	179.990000000000009	30	67	275
2733	40.9641299999999973	28.6837300000000006	356	269	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641299999999973	28.6837300000000006	356	269	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9642199999999974	28.6837000000000018	356	312	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9642199999999974	28.6837000000000018	356	312	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641799999999989	28.6836899999999986	356	315	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641799999999989	28.6836899999999986	356	315	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641499999999965	28.6836899999999986	356	336	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641499999999965	28.6836899999999986	356	336	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641700000000029	28.6837000000000018	356	290	0	62	636019355	D5UC8	9196840	294	40	138	266
2733	40.9641700000000029	28.6837000000000018	356	290	0	62	636019355	D5UC8	9196840	294	40	138	266
2704	43.5801500000000033	10.3172800000000002	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801500000000033	10.3172800000000002	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801799999999986	10.3172700000000006	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801799999999986	10.3172700000000006	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801700000000025	10.3173200000000005	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801700000000025	10.3173200000000005	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.580210000000001	10.3172599999999992	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.580210000000001	10.3172599999999992	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801599999999993	10.3172899999999998	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2704	43.5801599999999993	10.3172899999999998	194	202	0	62	229490000	9HA3375	9165310	195.099999999999994	25.1999999999999993	66	280
2773	29.8892500000000005	122.056899999999999	272	195	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8892500000000005	122.056899999999999	272	195	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8888600000000011	122.056899999999999	272	202	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8888600000000011	122.056899999999999	272	202	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8889500000000012	122.057000000000002	272	194	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8889500000000012	122.057000000000002	272	194	1	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.88889	122.057100000000005	272	304	0	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.88889	122.057100000000005	272	304	0	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8888500000000015	122.057100000000005	272	202	0	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2773	29.8888500000000015	122.057100000000005	272	202	0	62	229541000	9HA3391	9628178	299.949999999999989	48.3200000000000003	130	266
2790	39.55715	2.62778199999999984	5	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.55715	2.62778199999999984	5	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62778	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62778	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.55715	2.62778499999999982	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.55715	2.62778499999999982	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62775999999999987	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62775999999999987	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62775200000000009	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
2790	39.5571600000000032	2.62775200000000009	4	0	0	62	229551000	9HA3400	1000239	48.6000000000000014	8.42999999999999972	28	262
1708	38.7656500000000008	26.9153599999999997	156	277	0	62	229081000	9HA3054	9558244	189.990000000000009	32.259999999999998	112	275
1708	38.7656500000000008	26.9153599999999997	156	277	0	62	229081000	9HA3054	9558244	189.990000000000009	32.259999999999998	112	275
1655	61.6103299999999976	5.07053699999999985	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103299999999976	5.07053699999999985	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103299999999976	5.07054999999999989	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103299999999976	5.07054999999999989	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.61036	5.07057499999999983	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.61036	5.07057499999999983	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103299999999976	5.07058300000000006	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103299999999976	5.07058300000000006	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103400000000008	5.07052700000000023	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1655	61.6103400000000008	5.07052700000000023	244	255	0	62	229061000	9HA3034	9358060	117.379999999999995	17.9699999999999989	59	283
1726	16.7878000000000007	96.1189899999999966	180	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7878000000000007	96.1189899999999966	180	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7877900000000011	96.1189999999999998	181	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7877900000000011	96.1189999999999998	181	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7878000000000007	96.1189600000000013	180	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7878000000000007	96.1189600000000013	180	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7877800000000015	96.1189600000000013	181	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1726	16.7877800000000015	96.1189600000000013	181	227	0	62	229089000	9HA3061	9644251	159.599999999999994	24.3999999999999986	60	275
1774	47.2977899999999991	-2.14850699999999994	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2977899999999991	-2.14850699999999994	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2978000000000023	-2.14853799999999984	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2978000000000023	-2.14853799999999984	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2977500000000006	-2.1485129999999999	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2977500000000006	-2.1485129999999999	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2977599999999967	-2.14853000000000005	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1774	47.2977599999999967	-2.14853000000000005	241	335	0	62	229102000	9HA3071	9608697	179.900000000000006	28.3999999999999986	60	275
1784	51.0136699999999976	2.17984499999999981	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136699999999976	2.17984499999999981	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136499999999984	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136499999999984	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136899999999969	2.17976700000000001	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136899999999969	2.17976700000000001	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136899999999969	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0136899999999969	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0137199999999993	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1784	51.0137199999999993	2.17975699999999994	346	288	0	62	229108000	9HA3076	9125657	99.980000000000004	16.5	45	290
1781	37.3342000000000027	27.2625999999999991	511	314	0	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.3342000000000027	27.2625999999999991	511	314	0	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.3342099999999988	27.2626099999999987	511	311	1	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.3342099999999988	27.2626099999999987	511	311	1	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.334220000000002	27.2626099999999987	511	329	0	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.334220000000002	27.2626099999999987	511	329	0	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.3342000000000027	27.2626099999999987	511	330	0	62	229106000	9HA3018	9656709	36	9	28	262
1781	37.3342000000000027	27.2626099999999987	511	330	0	62	229106000	9HA3018	9656709	36	9	28	262
659	10.3770199999999999	-75.5107500000000016	160	255	0	62	228354600	FMHR	9299654	349	42.7999999999999972	124	266
659	10.3770199999999999	-75.5107500000000016	160	255	0	62	228354600	FMHR	9299654	349	42.7999999999999972	124	266
510	48.3852400000000031	-4.45445500000000028	219	312	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.3852400000000031	-4.45445500000000028	219	312	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.3852400000000031	-4.45444300000000037	219	87	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.3852400000000031	-4.45444300000000037	219	87	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.38523	-4.45445500000000028	219	343	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.38523	-4.45445500000000028	219	343	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.38523	-4.45445500000000028	219	200	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
510	48.38523	-4.45445500000000028	219	200	0	62	228337700	FMJD	9306495	289.600000000000023	43.3500000000000014	72	293
605	51.0165000000000006	2.18049999999999988	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165000000000006	2.18049999999999988	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053700000000017	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053700000000017	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053799999999987	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053799999999987	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165000000000006	2.18049999999999988	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165000000000006	2.18049999999999988	74	73	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053499999999989	74	74	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
605	51.0165700000000015	2.18053499999999989	74	74	0	62	228349600	FNOP	9431630	170	27.1999999999999993	85	266
1527	53.8874700000000004	9.18154099999999929	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874700000000004	9.18154099999999929	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874899999999997	9.18154799999999938	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874899999999997	9.18154799999999938	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874799999999965	9.1815149999999992	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874799999999965	9.1815149999999992	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874700000000004	9.18149400000000071	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1527	53.8874700000000004	9.18149400000000071	268	269	0	62	229012000	9HA2988	9621883	189.960000000000008	28.5	103	275
1607	26.4999299999999991	50.2073499999999981	192	264	0	62	229042000	9HA3019	9530644	229	36.8400000000000034	75	275
1607	26.4999299999999991	50.2073499999999981	192	264	0	62	229042000	9HA3019	9530644	229	36.8400000000000034	75	275
1607	26.4999199999999995	50.2073200000000028	192	254	0	62	229042000	9HA3019	9530644	229	36.8400000000000034	75	275
1607	26.4999199999999995	50.2073200000000028	192	254	0	62	229042000	9HA3019	9530644	229	36.8400000000000034	75	275
1614	51.0441799999999972	2.34636200000000006	227	156	1	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441799999999972	2.34636200000000006	227	156	1	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441700000000012	2.34635499999999997	227	250	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441700000000012	2.34635499999999997	227	250	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441700000000012	2.34636800000000001	227	84	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441700000000012	2.34636800000000001	227	84	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441799999999972	2.3463630000000002	227	138	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.0441799999999972	2.3463630000000002	227	138	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.044159999999998	2.34638299999999989	227	117	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
1614	51.044159999999998	2.34638299999999989	227	117	0	62	229044000	9HA3020	9583782	131.72999999999999	39	65	273
319	-7.23559999999999981	11.2875499999999995	234	143	1	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
319	-7.23559999999999981	11.2875499999999995	234	143	1	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
319	-7.23550000000000004	11.2874700000000008	230	140	2	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
319	-7.23550000000000004	11.2874700000000008	230	140	2	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
319	-7.23540000000000028	11.2873800000000006	227	136	2	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
319	-7.23540000000000028	11.2873800000000006	227	136	2	62	311000270	C6BI3	9387542	333.129999999999995	60	34	286
1535	51.7871600000000001	4.6342869999999996	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871600000000001	4.6342869999999996	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871700000000033	4.63429800000000025	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871700000000033	4.63429800000000025	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871700000000033	4.6342749999999997	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871700000000033	4.6342749999999997	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871999999999986	4.63427699999999998	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871999999999986	4.63427699999999998	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871600000000001	4.63430500000000034	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1535	51.7871600000000001	4.63430500000000034	26	26	0	62	229015000	9HA2992	9525584	109	16.8000000000000007	52	274
1547	41.3422499999999999	2.15047500000000014	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422499999999999	2.15047500000000014	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422499999999999	2.1504850000000002	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422499999999999	2.1504850000000002	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422430000000034	2.15047670000000002	6	356	1	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422430000000034	2.15047670000000002	6	356	1	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422499999999999	2.15046699999999991	6	356	1	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422499999999999	2.15046699999999991	6	356	1	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422600000000031	2.15047699999999997	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1547	41.3422600000000031	2.15047699999999997	6	356	0	62	229020000	9HA2996	9409754	128.199999999999989	16.7399999999999984	31	290
1549	6.94680199999999992	79.8388400000000047	188	325	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94680199999999992	79.8388400000000047	188	325	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94680199999999992	79.8388499999999937	188	255	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94680199999999992	79.8388499999999937	188	255	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679499999999983	79.8388400000000047	188	157	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679499999999983	79.8388400000000047	188	157	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679800000000025	79.8388400000000047	188	226	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679800000000025	79.8388400000000047	188	226	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679999999999964	79.8388400000000047	188	333	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1549	6.94679999999999964	79.8388400000000047	188	333	0	62	229021000	9HA2997	9433183	132.439999999999998	31.3999999999999986	66	296
1643	22.3719999999999999	113.915300000000002	134	208	1	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
1643	22.3719999999999999	113.915300000000002	134	208	1	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
1643	22.3719999999999999	113.915300000000002	134	205	1	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
1643	22.3719999999999999	113.915300000000002	134	205	1	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
1643	22.3721199999999989	113.915499999999994	134	209	0	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
1643	22.3721199999999989	113.915499999999994	134	209	0	62	538006857	V7GS8	9316048	225	32.2000000000000028	75	275
411	-5.3969750000000003	12.1940899999999992	318	180	1	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.3969750000000003	12.1940899999999992	318	180	1	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695299999999989	12.19407	319	293	1	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695299999999989	12.19407	319	293	1	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695000000000036	12.1940899999999992	319	323	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695000000000036	12.1940899999999992	319	323	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695600000000031	12.1941000000000006	319	323	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39695600000000031	12.1941000000000006	319	323	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39691800000000033	12.1940899999999992	319	333	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
411	-5.39691800000000033	12.1940899999999992	319	333	2	62	228324700	FMGF	9307451	73.2000000000000028	16.5	52	273
390	36.5394500000000022	-6.2718670000000003	338	292	0	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.5394500000000022	-6.2718670000000003	338	292	0	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.539430000000003	-6.27187499999999964	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.539430000000003	-6.27187499999999964	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.539430000000003	-6.27188199999999973	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.539430000000003	-6.27188199999999973	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.5394599999999983	-6.27188199999999973	339	292	0	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.5394599999999983	-6.27188199999999973	339	292	0	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.5394500000000022	-6.27187800000000006	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
390	36.5394500000000022	-6.27187800000000006	339	292	1	62	228322700	FNRB	9319715	90.7000000000000028	18.8500000000000014	55	273
394	25.9222000000000001	51.5974300000000028	54	305	0	62	376416000	J8B5650	9394105	73.2000000000000028	16.5	54	270
394	25.9222000000000001	51.5974300000000028	54	305	0	62	376416000	J8B5650	9394105	73.2000000000000028	16.5	54	270
401	25.4680399999999985	55.5074400000000026	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680399999999985	55.5074400000000026	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680700000000009	55.5074499999999986	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680700000000009	55.5074499999999986	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680299999999988	55.5074100000000001	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680299999999988	55.5074100000000001	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680500000000016	55.5073700000000017	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680500000000016	55.5073700000000017	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680299999999988	55.5073900000000009	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
401	25.4680299999999988	55.5073900000000009	209	322	0	62	374425000	3FQA4	9331323	73.2000000000000028	16.5	40	270
354	51.8774599999999992	4.29661199999999965	69	158	3	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774599999999992	4.29661199999999965	69	158	3	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774500000000032	4.29661700000000035	69	158	2	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774500000000032	4.29661700000000035	69	158	2	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774999999999977	4.29666700000000024	69	23	1	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774999999999977	4.29666700000000024	69	23	1	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774999999999977	4.29666700000000024	69	68	0	62	354431000	3EXV9	9310305	140	23	78	274
354	51.8774999999999977	4.29666700000000024	69	68	0	62	354431000	3EXV9	9310305	140	23	78	274
198	43.4031700000000029	4.98883299999999963	3	67	0	62	228292700	FNQL	9406984	89.2000000000000028	13.8000000000000007	50	274
198	43.4031700000000029	4.98883299999999963	3	67	0	62	228292700	FNQL	9406984	89.2000000000000028	13.8000000000000007	50	274
461	35.8962999999999965	-5.4999469999999997	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962999999999965	-5.4999469999999997	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962700000000012	-5.49991300000000027	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962700000000012	-5.49991300000000027	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962999999999965	-5.49992000000000036	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962999999999965	-5.49992000000000036	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962900000000005	-5.49992999999999999	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962900000000005	-5.49992999999999999	49	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962900000000005	-5.49992500000000017	50	275	0	62	228330600	FMLN	9333814	143	23	69	274
461	35.8962900000000005	-5.49992500000000017	50	275	0	62	228330600	FMLN	9333814	143	23	69	274
487	37.337609999999998	126.590199999999996	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.337609999999998	126.590199999999996	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.337609999999998	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.337609999999998	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.3376400000000004	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.3376400000000004	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.337609999999998	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.337609999999998	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.3375899999999987	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
487	37.3375899999999987	126.590100000000007	92	356	0	62	228333700	FMLU	9320075	289.600000000000023	43.3500000000000014	114	293
1448	37.9590499999999977	23.5620200000000004	8	30	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590499999999977	23.5620200000000004	8	30	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590299999999985	23.5619900000000015	8	20	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590299999999985	23.5619900000000015	8	20	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590499999999977	23.5620100000000008	8	17	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590499999999977	23.5620100000000008	8	17	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590600000000009	23.5619900000000015	8	1	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590600000000009	23.5619900000000015	8	1	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590400000000017	23.5619799999999984	8	358	0	62	229001000	9HA2978	7827213	162	24	61	277
1448	37.9590400000000017	23.5619799999999984	8	358	0	62	229001000	9HA2978	7827213	162	24	61	277
1450	43.1939700000000002	27.9010399999999983	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1939700000000002	27.9010399999999983	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940299999999979	27.9010299999999987	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940299999999979	27.9010299999999987	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940000000000026	27.9009900000000002	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940000000000026	27.9009900000000002	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1939700000000002	27.9010800000000003	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1939700000000002	27.9010800000000003	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940200000000019	27.9010899999999999	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1450	43.1940200000000019	27.9010899999999999	358	99	0	62	247381900	IBWI	9556844	157	24.8000000000000007	98	275
1842	25.1843700000000013	56.3586900000000028	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843700000000013	56.3586900000000028	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843499999999985	56.3587500000000006	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843499999999985	56.3587500000000006	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843600000000016	56.3587500000000006	0	284	1	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843600000000016	56.3587500000000006	0	284	1	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843800000000009	56.3587300000000013	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843800000000009	56.3587300000000013	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843499999999985	56.3588499999999968	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1842	25.1843499999999985	56.3588499999999968	0	284	0	62	229131000	9HA3094	9594418	189.990000000000009	32.259999999999998	77	275
1797	40.8425299999999964	14.2774800000000006	202	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8425299999999964	14.2774800000000006	202	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8424699999999987	14.2774999999999999	202	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8424699999999987	14.2774999999999999	202	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8425099999999972	14.2774400000000004	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8425099999999972	14.2774400000000004	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8425099999999972	14.2774199999999993	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.8425099999999972	14.2774199999999993	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.842489999999998	14.2774699999999992	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1797	40.842489999999998	14.2774699999999992	201	212	0	62	538071313	V7VW3	9267522	69.0999999999999943	13.8000000000000007	25	277
1809	1.30750300000000008	103.644400000000005	225	355	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30750300000000008	103.644400000000005	225	355	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30748799999999998	103.644400000000005	225	355	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30748799999999998	103.644400000000005	225	355	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30749800000000005	103.644400000000005	225	11	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30749800000000005	103.644400000000005	225	11	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30748799999999998	103.644499999999994	225	6	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1809	1.30748799999999998	103.644499999999994	225	6	0	62	229116000	9HA3082	9644330	132.439999999999998	31.3999999999999986	60	273
1991	29.9380799999999994	122.261399999999995	288	244	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	244	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	23	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	23	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	267	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	267	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	289	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	289	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	239	0	62	229212000	9HA3152	9455686	292	45	90	275
1991	29.9380799999999994	122.261399999999995	288	239	0	62	229212000	9HA3152	9455686	292	45	90	275
2002	-3.14937500000000004	-58.5100100000000012	240	134	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14937500000000004	-58.5100100000000012	240	134	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14936499999999997	-58.5100600000000028	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14936499999999997	-58.5100600000000028	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14936499999999997	-58.5100399999999965	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14936499999999997	-58.5100399999999965	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.1493549999999999	-58.5100699999999989	239	134	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.1493549999999999	-58.5100699999999989	239	134	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14938299999999982	-58.5100399999999965	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2002	-3.14938299999999982	-58.5100399999999965	240	131	0	62	229215000	9HA3155	9625451	180	30	88	275
2006	29.7218899999999984	-95.2376900000000006	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7218899999999984	-95.2376900000000006	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219200000000008	-95.2376900000000006	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219200000000008	-95.2376900000000006	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219100000000012	-95.237710000000007	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219100000000012	-95.237710000000007	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7218899999999984	-95.2376799999999974	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7218899999999984	-95.2376799999999974	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219000000000015	-95.237710000000007	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2006	29.7219000000000015	-95.237710000000007	55	253	0	62	229218000	9HA3156	9657789	199.990000000000009	32.259999999999998	118	275
2007	59.1222500000000011	9.61520999999999937	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.1222500000000011	9.61520999999999937	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.122320000000002	9.61522700000000086	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.122320000000002	9.61522700000000086	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.1222399999999979	9.61527599999999971	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.1222399999999979	9.61527599999999971	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.1222800000000035	9.6152230000000003	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2007	59.1222800000000035	9.6152230000000003	30	36	0	62	229219000	9HA3157	9644201	199.990000000000009	32	133	275
2044	-22.9317700000000002	-43.8345500000000001	266	252	0	62	538007887	V7RY3	9452854	190.009999999999991	32.3200000000000003	68	275
2044	-22.9317700000000002	-43.8345500000000001	266	252	0	62	538007887	V7RY3	9452854	190.009999999999991	32.3200000000000003	68	275
2044	-22.9317799999999998	-43.8345500000000001	266	354	1	62	538007887	V7RY3	9452854	190.009999999999991	32.3200000000000003	68	275
2044	-22.9317799999999998	-43.8345500000000001	266	354	1	62	538007887	V7RY3	9452854	190.009999999999991	32.3200000000000003	68	275
2099	14.6767900000000004	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2099	14.6767900000000004	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2099	14.6767800000000008	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2099	14.6767800000000008	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2099	14.6768000000000001	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2099	14.6768000000000001	-17.4264900000000011	198	252	0	62	538008353	V7A2270	9587166	179.900000000000006	28.4299999999999997	83	275
2107	30.1898899999999983	122.062299999999993	12	102	1	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1898899999999983	122.062299999999993	12	102	1	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1898799999999987	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1898799999999987	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1898899999999983	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1898899999999983	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1899699999999989	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2107	30.1899699999999989	122.062299999999993	12	12	0	62	229263000	9HA3184	9301469	210.060000000000002	30.2300000000000004	104	266
2161	29.5305900000000001	34.9410000000000025	216	292	1	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5305900000000001	34.9410000000000025	216	292	1	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5306099999999994	34.9409800000000033	216	282	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5306099999999994	34.9409800000000033	216	282	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5305700000000009	34.9410099999999986	216	260	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5305700000000009	34.9410099999999986	216	260	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5305900000000001	34.9409899999999993	216	260	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2161	29.5305900000000001	34.9409899999999993	216	260	0	62	229281000	9HA3199	9595981	189.900000000000006	28.3599999999999994	64	275
2121	32.2459599999999966	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2121	32.2459599999999966	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2121	32.2459699999999998	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2121	32.2459699999999998	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2121	32.2459699999999998	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2121	32.2459699999999998	119.533299999999997	309	44	0	62	229266000	9HA3185	9608702	179.900000000000006	28.3999999999999986	84	275
2173	-20.3160699999999999	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160699999999999	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160699999999999	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160699999999999	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160600000000002	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160600000000002	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160799999999995	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2173	-20.3160799999999995	118.569299999999998	354	333	0	62	229286000	9HA3204	9464651	255.259999999999991	43	146	275
2215	43.5887999999999991	-5.92881500000000017	82	10	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5887999999999991	-5.92881500000000017	82	10	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5887999999999991	-5.92879299999999976	82	122	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5887999999999991	-5.92879299999999976	82	122	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888100000000023	-5.92877999999999972	82	10	1	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888100000000023	-5.92877999999999972	82	10	1	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888199999999983	-5.92876699999999968	82	52	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888199999999983	-5.92876699999999968	82	52	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888100000000023	-5.92879799999999957	82	23	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2215	43.5888100000000023	-5.92879799999999957	82	23	0	62	538008738	V7A2707	9522958	179	28.629999999999999	61	275
2218	46.8453500000000034	31.9699199999999983	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453500000000034	31.9699199999999983	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453500000000034	31.9699099999999987	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453500000000034	31.9699099999999987	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453400000000002	31.9699099999999987	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453400000000002	31.9699099999999987	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453700000000026	31.9698899999999995	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453700000000026	31.9698899999999995	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453700000000026	31.9698899999999995	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2218	46.8453700000000026	31.9698899999999995	211	356	0	62	538008769	V7A2738	9595254	178.830000000000013	28.629999999999999	102	275
2249	45.3942100000000011	28.0233500000000006	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3942100000000011	28.0233500000000006	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941200000000009	28.0233099999999986	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941200000000009	28.0233099999999986	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941999999999979	28.0233899999999991	181	241	0	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941999999999979	28.0233899999999991	181	241	0	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941999999999979	28.0234200000000016	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2249	45.3941999999999979	28.0234200000000016	181	241	1	62	229322000	9HA3231	9462859	138.840000000000003	16.5	28	290
2251	53.125390000000003	8.71773999999999916	19	213	0	62	229323000	9HA3232	9596038	189.990000000000009	28.3099999999999987	65	275
2251	53.125390000000003	8.71773999999999916	19	213	0	62	229323000	9HA3232	9596038	189.990000000000009	28.3099999999999987	65	275
2251	53.1253799999999998	8.71774199999999944	19	213	0	62	229323000	9HA3232	9596038	189.990000000000009	28.3099999999999987	65	275
2251	53.1253799999999998	8.71774199999999944	19	213	0	62	229323000	9HA3232	9596038	189.990000000000009	28.3099999999999987	65	275
2239	41.3409699999999987	2.15029499999999985	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2239	41.3409699999999987	2.15029499999999985	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2239	41.3409600000000026	2.15030300000000008	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2239	41.3409600000000026	2.15030300000000008	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2239	41.3409499999999994	2.15033699999999994	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2239	41.3409499999999994	2.15033699999999994	4	0	0	62	229318000	9HA3227	9342619	101.079999999999998	18.0199999999999996	60	291
2302	23.0255200000000002	113.523099999999999	338	187	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0255200000000002	113.523099999999999	338	187	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0254800000000017	113.522999999999996	338	189	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0254800000000017	113.522999999999996	338	189	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0255200000000002	113.522900000000007	338	203	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0255200000000002	113.522900000000007	338	203	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.025500000000001	113.522900000000007	338	205	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.025500000000001	113.522900000000007	338	205	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0255200000000002	113.522900000000007	338	204	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2302	23.0255200000000002	113.522900000000007	338	204	1	62	229343000	9HA3251	9291406	225	32.259999999999998	66	275
2277	36.1210799999999992	-5.35855299999999968	285	170	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.1210799999999992	-5.35855299999999968	285	170	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.1209399999999974	-5.35853700000000011	289	172	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.1209399999999974	-5.35853700000000011	289	172	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.120829999999998	-5.35855800000000038	292	192	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.120829999999998	-5.35855800000000038	292	192	2	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.1207100000000025	-5.35855999999999977	295	208	1	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2277	36.1207100000000025	-5.35855999999999977	295	208	1	62	229332000	9HA3242	9460837	90.2199999999999989	16	54	291
2388	29.9402499999999989	122.253200000000007	109	213	1	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9402499999999989	122.253200000000007	109	213	1	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9401800000000016	122.253399999999999	109	213	1	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9401800000000016	122.253399999999999	109	213	1	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9402200000000001	122.253299999999996	109	213	0	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9402200000000001	122.253299999999996	109	213	0	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9402299999999997	122.253299999999996	109	213	0	62	229361000	9HA3268	9662409	292	45	104	275
2388	29.9402299999999997	122.253299999999996	109	213	0	62	229361000	9HA3268	9662409	292	45	104	275
439	-5.2641720000000003	11.5738599999999998	94	102	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
2357	23.1902070000000009	-106.415610000000001	196	256	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1902070000000009	-106.415610000000001	196	256	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901599999999988	-106.415599999999998	196	197	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901599999999988	-106.415599999999998	196	197	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901900000000012	-106.415599999999998	196	256	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901900000000012	-106.415599999999998	196	256	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901800000000016	-106.415599999999998	196	41	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901800000000016	-106.415599999999998	196	41	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901900000000012	-106.415599999999998	196	41	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2357	23.1901900000000012	-106.415599999999998	196	41	0	62	229353000	9HA3260	9344019	179.879999999999995	32.2000000000000028	77	291
2416	38.7671800000000033	26.9145600000000016	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.7671800000000033	26.9145600000000016	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.767240000000001	26.9144199999999998	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.767240000000001	26.9144199999999998	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.7671700000000001	26.9145099999999999	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.7671700000000001	26.9145099999999999	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.7672099999999986	26.9145000000000003	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2416	38.7672099999999986	26.9145000000000003	154	328	0	62	229376000	9HA3282	9643908	189.990000000000009	32.259999999999998	65	275
2425	-0.93321670000000001	-80.720950000000002	261	183	1	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	183	1	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	81	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	81	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	138	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	138	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.7209299999999956	261	33	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.7209299999999956	261	33	0	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	169	1	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2425	-0.93321670000000001	-80.720950000000002	261	169	1	62	229378000	9HA3283	9616230	225.620000000000005	29.9899999999999984	64	277
2432	21.5686700000000009	108.335300000000004	353	223	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686700000000009	108.335300000000004	353	223	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686999999999998	108.335300000000004	353	223	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686999999999998	108.335300000000004	353	223	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686800000000005	108.335300000000004	353	57	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686800000000005	108.335300000000004	353	57	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686999999999998	108.335300000000004	353	57	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2432	21.5686999999999998	108.335300000000004	353	57	0	62	229380000	9HA3285	9311177	225	32.259999999999998	71	275
2442	34.6665599999999969	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665599999999969	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.0414099999999991	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.0414099999999991	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.0413899999999998	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.0413899999999998	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665399999999977	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665399999999977	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2442	34.6665500000000009	33.041400000000003	169	0	0	62	229383000	9HA3288	9589205	64	9.6899999999999995	36	277
2444	31.8339800000000004	34.6495900000000034	269	89	1	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.8339800000000004	34.6495900000000034	269	89	1	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.83399	34.6495699999999971	269	359	1	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.83399	34.6495699999999971	269	359	1	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.8339800000000004	34.6495699999999971	269	269	0	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.8339800000000004	34.6495699999999971	269	269	0	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.8340099999999993	34.6495400000000018	269	269	1	62	229384000	9HA3289	9320398	283	40	98	266
2444	31.8340099999999993	34.6495400000000018	269	269	1	62	229384000	9HA3289	9320398	283	40	98	266
2468	44.1709600000000009	28.6560600000000001	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.1709600000000009	28.6560600000000001	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.170969999999997	28.6560799999999993	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.170969999999997	28.6560799999999993	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.1709299999999985	28.656089999999999	254	290	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.1709299999999985	28.656089999999999	254	290	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.1709600000000009	28.6561200000000014	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2468	44.1709600000000009	28.6561200000000014	254	0	0	62	229392000	9HA3295	9637478	43.8800000000000026	7.59999999999999964	42	273
2400	39.4429999999999978	-0.305166700000000013	181	282	1	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2400	39.4429999999999978	-0.305166700000000013	181	282	1	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2400	39.4429999999999978	-0.305166700000000013	181	278	0	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2400	39.4429999999999978	-0.305166700000000013	181	278	0	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2400	39.4429999999999978	-0.305166700000000013	181	151	0	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2400	39.4429999999999978	-0.305166700000000013	181	151	0	62	229368000	9HA3275	9131527	185	25.1999999999999993	76	283
2401	42.9397700000000029	10.5594199999999994	511	327	0	62	229369000	9HA3276	9131515	185	25.1999999999999993	66	283
2401	42.9397700000000029	10.5594199999999994	511	327	0	62	229369000	9HA3276	9131515	185	25.1999999999999993	66	283
2401	42.9397700000000029	10.5594099999999997	511	86	1	62	229369000	9HA3276	9131515	185	25.1999999999999993	66	283
2401	42.9397700000000029	10.5594099999999997	511	86	1	62	229369000	9HA3276	9131515	185	25.1999999999999993	66	283
2516	-32.58202	-60.7820699999999974	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.58202	-60.7820699999999974	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819499999999991	-60.7821599999999975	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819499999999991	-60.7821599999999975	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819800000000015	-60.7821500000000015	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819800000000015	-60.7821500000000015	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5820500000000024	-60.7820699999999974	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5820500000000024	-60.7820699999999974	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819800000000015	-60.7821399999999983	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2516	-32.5819800000000015	-60.7821399999999983	329	268	0	62	229410000	9HA3310	9662332	186.960000000000008	28.6000000000000014	101	275
2488	51.5053699999999992	0.517848300000000039	63	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5053699999999992	0.517848300000000039	63	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5053699999999992	0.517833399999999999	62	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5053699999999992	0.517833399999999999	62	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5053899999999985	0.517888299999999968	58	15	1	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5053899999999985	0.517888299999999968	58	15	1	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5054099999999977	0.517859999999999987	64	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
2488	51.5054099999999977	0.517859999999999987	64	15	0	62	229398000	9HA3301	9631034	32.7000000000000028	12.8200000000000003	56	276
678	46.2759199999999993	-1.81795700000000005	511	183	88	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
678	46.2759199999999993	-1.81795700000000005	511	183	88	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
678	46.2886000000000024	-1.81611300000000009	511	184	92	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
678	46.2886000000000024	-1.81611300000000009	511	184	92	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
678	46.2926700000000011	-1.81560999999999995	511	183	87	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
678	46.2926700000000011	-1.81560999999999995	511	183	87	60	228367000	FQVN	8968466	22.8900000000000006	6	0	285
771	47.8330399999999969	-5.21584200000000031	261	97	33	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
771	47.8330399999999969	-5.21584200000000031	261	97	33	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
771	47.8327900000000028	-5.21426999999999996	261	106	31	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
771	47.8327900000000028	-5.21426999999999996	261	106	31	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
771	47.8315199999999976	-5.207897	261	106	23	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
771	47.8315199999999976	-5.207897	261	106	23	60	228394000	FGIP	8873908	24.8299999999999983	6	0	268
2714	40.8405100000000019	14.2720900000000004	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8405100000000019	14.2720900000000004	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404999999999987	14.2721099999999996	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404999999999987	14.2721099999999996	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404900000000026	14.2721099999999996	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404900000000026	14.2721099999999996	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404999999999987	14.2721400000000003	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
2714	40.8404999999999987	14.2721400000000003	511	0	0	60	229496000	9HB3488	8687854	30	7	30	268
439	-5.26422499999999971	11.5738599999999998	92	98	5	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26422499999999971	11.5738599999999998	92	98	5	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26422200000000018	11.5738599999999998	96	97	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26422200000000018	11.5738599999999998	96	97	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641669999999996	11.5739000000000001	94	84	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641669999999996	11.5739000000000001	94	84	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421500000000009	11.5738400000000006	95	118	5	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421500000000009	11.5738400000000006	95	118	5	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641549999999997	11.5738599999999998	95	101	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641549999999997	11.5738599999999998	95	101	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641720000000003	11.5738599999999998	94	102	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26419000000000015	11.5739000000000001	93	90	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26419000000000015	11.5739000000000001	93	90	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421500000000009	11.5739000000000001	93	93	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421500000000009	11.5739000000000001	93	93	3	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421799999999962	11.5739000000000001	93	104	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421799999999962	11.5739000000000001	93	104	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421399999999995	11.5739099999999997	94	90	8	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421399999999995	11.5739099999999997	94	90	8	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421199999999967	11.5739000000000001	96	112	2	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421199999999967	11.5739000000000001	96	112	2	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421399999999995	11.5739099999999997	97	91	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.26421399999999995	11.5739099999999997	97	91	4	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641840000000002	11.5739000000000001	98	89	6	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
439	-5.2641840000000002	11.5739000000000001	98	89	6	59	228327800	FTSZ	9280421	32.5	11.9499999999999993	50	276
446	-8.79193899999999928	13.2591599999999996	172	112	3	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79193899999999928	13.2591599999999996	172	112	3	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79186799999999913	13.2590400000000006	206	290	1	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79186799999999913	13.2590400000000006	206	290	1	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79191999999999929	13.2592199999999991	239	295	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79191999999999929	13.2592199999999991	239	295	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79187899999999978	13.2589299999999994	201	274	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79187899999999978	13.2589299999999994	201	274	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79188599999999987	13.2589699999999997	158	110	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
446	-8.79188599999999987	13.2589699999999997	158	110	2	57	228328700	FMHS	9377468	34.3299999999999983	6.70000000000000018	14	281
259	-6.23716500000000007	11.52332	253	252	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23716500000000007	11.52332	253	252	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23520499999999966	11.5297300000000007	254	253	287	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23520499999999966	11.5297300000000007	254	253	287	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24150999999999989	11.5093999999999994	255	252	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24150999999999989	11.5093999999999994	255	252	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23956700000000009	11.5155899999999995	254	252	292	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23956700000000009	11.5155899999999995	254	252	292	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22797999999999963	11.5536899999999996	253	253	297	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22797999999999963	11.5536899999999996	253	253	297	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2292329999999998	11.5494699999999995	254	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2292329999999998	11.5494699999999995	254	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23269200000000012	11.5379799999999992	253	253	290	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23269200000000012	11.5379799999999992	253	253	290	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23048499999999983	11.54528	253	253	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.23048499999999983	11.54528	253	253	291	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22674000000000039	11.5579099999999997	253	253	294	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22674000000000039	11.5579099999999997	253	253	294	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22534200000000038	11.56264	255	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22534200000000038	11.56264	255	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22355699999999956	11.5686999999999998	254	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.22355699999999956	11.5686999999999998	254	253	295	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25088500000000025	11.4797899999999995	254	252	285	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25088500000000025	11.4797899999999995	254	252	285	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24943999999999988	11.4843200000000003	252	252	283	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24943999999999988	11.4843200000000003	252	252	283	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2535999999999996	11.4712099999999992	254	252	286	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2535999999999996	11.4712099999999992	254	252	286	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2523200000000001	11.4752500000000008	253	252	286	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.2523200000000001	11.4752500000000008	253	252	286	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24623200000000001	11.4944799999999994	255	252	287	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24623200000000001	11.4944799999999994	255	252	287	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24767700000000037	11.4898900000000008	251	253	284	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.24767700000000037	11.4898900000000008	251	253	284	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25649799999999967	11.4620300000000004	252	252	288	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25649799999999967	11.4620300000000004	252	252	288	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25769299999999973	11.4582099999999993	252	253	283	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
259	-6.25769299999999973	11.4582099999999993	252	253	283	57	228305900	FNJZ	9499711	34	6.70000000000000018	14	273
307	50.5809700000000007	-1.89015700000000009	182	184	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5809700000000007	-1.89015700000000009	182	184	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5865500000000026	-1.88970799999999994	177	182	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5865500000000026	-1.88970799999999994	177	182	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5719700000000003	-1.89619699999999991	212	212	168	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5719700000000003	-1.89619699999999991	212	212	168	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5762500000000017	-1.89226800000000006	201	201	168	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5762500000000017	-1.89226800000000006	201	201	168	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.6025800000000032	-1.88931800000000005	177	180	170	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.6025800000000032	-1.88931800000000005	177	180	170	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.6078499999999991	-1.88924500000000006	177	180	170	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.6078499999999991	-1.88924500000000006	177	180	170	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.597450000000002	-1.88936999999999999	176	179	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.597450000000002	-1.88936999999999999	176	179	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5917600000000007	-1.88947299999999996	178	182	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5917600000000007	-1.88947299999999996	178	182	171	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5506999999999991	-1.91846000000000005	211	214	175	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5506999999999991	-1.91846000000000005	211	214	175	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5454900000000009	-1.92405300000000001	212	215	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5454900000000009	-1.92405300000000001	212	215	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5675999999999988	-1.90067699999999995	211	212	172	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5675999999999988	-1.90067699999999995	211	212	172	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5631199999999978	-1.90531800000000007	211	213	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5631199999999978	-1.90531800000000007	211	213	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5586899999999986	-1.9099569999999999	211	213	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5586899999999986	-1.9099569999999999	211	213	174	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5543300000000002	-1.91456800000000005	211	214	175	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
307	50.5543300000000002	-1.91456800000000005	211	214	175	57	228315700	FMLR	9170999	154.5	22.7399999999999984	59	283
\.


--
-- TOC entry 2945 (class 0 OID 33125)
-- Dependencies: 216
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, system_name, created_at, updated_at) FROM stdin;
262	Yacht	\N	\N
263	Cargo/Containership	\N	\N
264	Asphalt/Bitumen Tanker	\N	\N
265	Cable Layer	\N	\N
266	Container Ship	\N	\N
267	Fire Fighting Vessel	\N	\N
268	Fishing Vessel	\N	\N
269	Bunkering Tanker	\N	\N
270	Supply Vessel	\N	\N
271	Shuttle Tanker	\N	\N
272	Offshore Construction Jack Up	\N	\N
273	Offshore Supply Ship	\N	\N
274	Oil/Chemical Tanker	\N	\N
275	Bulk Carrier	\N	\N
276	Tug	\N	\N
277	Passenger Ship	\N	\N
278	Research/Survey Vessel	\N	\N
279	Tug/Supply Vessel	\N	\N
280	Ro-Ro/Container Carrier	\N	\N
281	High Speed Craft	\N	\N
282	Hopper Dredger	\N	\N
283	Ro-Ro Cargo	\N	\N
284	Accommodation Vessel	\N	\N
285	Trawler	\N	\N
286	Multi Purpose Offshore Vessel	\N	\N
287	Reefer	\N	\N
288	Anchor Handling Vessel	\N	\N
289	Cargo Barge	\N	\N
290	General Cargo	\N	\N
291	Oil Products Tanker	\N	\N
292	Cement Carrier	\N	\N
293	LNG Tanker	\N	\N
294	LPG Tanker	\N	\N
295	Crude Oil Tanker	\N	\N
296	Pipe Layer	\N	\N
297	Inland Tanker	\N	\N
298	Chemical Tanker	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 33026)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
11	Nick Testopoulos	nick@mail.gr	\N	$2y$10$AGcWQFWAu2G5X4mr4Ey.UelacB/2z6I9DGyLyuXK7id/hNwQbdvpm	\N	2020-04-10 06:21:50	2020-04-10 06:21:50
12	Sts The Dude	sts@mail.gr	\N	$2y$10$Q2VCwvydampRy/wG/LOQrua6nVqlABobWbyA0dg8eMycLDuBK66Qm	\N	2020-04-10 03:36:45	2020-04-10 03:36:45
\.


--
-- TOC entry 2947 (class 0 OID 41087)
-- Dependencies: 218
-- Data for Name: vessels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vessels (id, callsign, length, width, draught, mmsi) FROM stdin;
19	PCOS	34.5	8.33000000000000007	21	246836000
33	FMKQ	24.9899999999999984	7	33	228259600
50	FMLW	165	26.8000000000000007	63	228263700
91	FNKP	24.9899999999999984	9.5	42	228267700
127	FNMP	24.9899999999999984	9.5	40	228278826
149	FNNP	30.25	11	51	228283600
154	FNNQ	30.25	11	51	228283700
158	FLEF	30.3000000000000007	10.4000000000000004	52	228284800
164	FNNY	23.3000000000000007	8.24000000000000021	45	228285700
177	FNOF	30.3000000000000007	10.4000000000000004	50	228287800
178	FNOI	30.3000000000000007	10.4000000000000004	53	228287900
198	FNQL	89.2000000000000028	13.8000000000000007	50	228292700
203	FNQN	30.3000000000000007	10.4000000000000004	31	228293600
209	FNQP	30.3000000000000007	10.4000000000000004	51	228293700
226	FNQY	24.9899999999999984	9.5	48	228296800
227	FNQZ	24.9899999999999984	9.5	50	228296900
245	FNRM	27.8500000000000014	8.5	52	228301600
246	FNRN	29.8999999999999986	10.8000000000000007	62	228301700
259	FNJZ	34	6.70000000000000018	14	228305900
264	FNPK	89.2000000000000028	13.8000000000000007	35	228306800
267	FLEV	78.3499999999999943	13.6400000000000006	56	228308600
302	FNUY	365.5	51.2000000000000028	144	228315600
307	FMLR	154.5	22.7399999999999984	59	228315700
319	C6BI3	333.129999999999995	60	34	311000270
320	FNVK	365.5	51.2000000000000028	110	228316800
326	9HA3963	154	25.5	54	256609000
341	FMBZ	105.5	16.8000000000000007	64	228320600
354	3EXV9	140	23	78	354431000
387	5NXA8	67.3900000000000006	15.4000000000000004	48	657122100
389	FMGV	67.3900000000000006	15.4000000000000004	58	228322600
390	FNRB	90.7000000000000028	18.8500000000000014	55	228322700
394	J8B5650	73.2000000000000028	16.5	54	376416000
401	3FQA4	73.2000000000000028	16.5	40	374425000
402	FMDR	73.2000000000000028	16.5	39	228323900
411	FMGF	73.2000000000000028	16.5	52	228324700
413	FMFG	73.2000000000000028	16.5	48	228324800
414	5OAA2	73.2000000000000028	16.5	45	657145500
422	3FWF5	64.7999999999999972	16	48	357029000
438	FVGR	69.7000000000000028	17.1999999999999993	49	228327700
439	FTSZ	32.5	11.9499999999999993	50	228327800
446	FMHS	34.3299999999999983	6.70000000000000018	14	228328700
455	HO7184	34.0300000000000011	6.70000000000000018	14	355764000
456	LXGP	77.2999999999999972	18	45	253596000
457	V7YG7	183	32.2000000000000028	86	538007634
461	FMLN	143	23	69	228330600
463	FMLM	143	23	73	228330700
466	FNKK	119.540000000000006	20	64	228330800
472	LXQS	120.980000000000004	17.1999999999999993	57	253124000
475	ZDPD8	129	22	60	236662000
487	FMLU	289.600000000000023	43.3500000000000014	114	228333700
501	FMEL	334.069999999999993	42.7999999999999972	139	228335900
510	FMJD	289.600000000000023	43.3500000000000014	72	228337700
517	FLSQ	334.04000000000002	42.7999999999999972	100	228337900
544	FMEK	334.069999999999993	42.7999999999999972	105	228338600
553	FLSU	334	42.7999999999999972	123	228339600
560	FMFT	334.069999999999993	42.7999999999999972	115	228340900
580	FMFS	349	42.7999999999999972	136	228343900
584	PDFT	85	15.8499999999999996	60	244130717
587	FLTF	32	11.5999999999999996	53	228344800
605	FNOP	170	27.1999999999999993	85	228349600
611	FLTR	28.5	7.5	48	228349800
618	FMEJ	334.069999999999993	42.7999999999999972	127	228353600
659	FMHR	349	42.7999999999999972	124	228354600
678	FQVN	22.8900000000000006	6	0	228367000
771	FGIP	24.8299999999999983	6	0	228394000
1153	FTMJ	31.8599999999999994	7.21999999999999975	45	228858000
1187	FHVD	24.4400000000000013	5	0	228904000
1248	FQBA	23.5	6	38	228935000
1394	PE6580	110	11.4700000000000006	2	244750341
1448	9HA2978	162	24	61	229001000
1450	IBWI	157	24.8000000000000007	98	247381900
1456	9HA2980	189.990000000000009	28.5	65	229003000
1459	V7A2858	161.680000000000007	23	67	538008873
1461	9HA2982	366.04000000000002	51.2000000000000028	92	229005000
1470	9HA2983	366.04000000000002	48.3299999999999983	135	229006000
1474	9HA2984	366.019999999999982	51.2000000000000028	142	229007000
1520	9HA2986	189.960000000000008	28.5	69	229010000
1524	9HA2987	189.990000000000009	28.5	97	229011000
1527	9HA2988	189.960000000000008	28.5	103	229012000
1528	9HA2990	186	23.9699999999999989	76	229013000
1535	9HA2992	109	16.8000000000000007	52	229015000
1542	D5QV2	228.990000000000009	32.259999999999998	90	636018669
1547	9HA2996	128.199999999999989	16.7399999999999984	31	229020000
1549	9HA2997	132.439999999999998	31.3999999999999986	66	229021000
1592	9HA3009	181.099999999999994	30.0399999999999991	96	229033000
1594	D5OO2	288.970000000000027	44.9799999999999969	60	636018183
1595	9HA3011	274.370000000000005	48	170	229036000
1597	9HA3012	248.969999999999999	43.7999999999999972	129	229037000
1601	9HA3013	248.969999999999999	43.7999999999999972	82	229038000
1605	9HA3017	183	27.8000000000000007	69	229041000
1607	9HA3019	229	36.8400000000000034	75	229042000
1614	9HA3020	131.72999999999999	39	65	229044000
1617	9HA3023	249.97999999999999	44	87	229046000
1621	9HA3024	180	30.0500000000000007	98	229047000
1622	9HA3025	126.829999999999998	14.8000000000000007	25	229048000
1638	5BKX5	78	12.5	56	209874000
1640	ZGHV	46.7000000000000028	8.55000000000000071	30	319142100
1643	V7GS8	225	32.2000000000000028	75	538006857
1652	9HA3033	330	60	215	229059000
1653	V7AJ9	144.050000000000011	23.1499999999999986	80	538006843
1655	9HA3034	117.379999999999995	17.9699999999999989	59	229061000
1679	9HA3043	274.199999999999989	50.0399999999999991	93	229070000
1680	D5KG3	140	16.6000000000000014	47	636017300
1688	9HA3047	319	37.3999999999999986	86	229074000
1703	9HA3052	183	32.2000000000000028	110	229079000
1706	9HA3053	131.72999999999999	39	62	229080000
1708	9HA3054	189.990000000000009	32.259999999999998	112	229081000
1714	9HA3057	182.5	32.2000000000000028	97	229084000
1716	9HA3058	179.990000000000009	32.2000000000000028	82	229085000
1719	9HA3059	78.5999999999999943	17.6000000000000014	51	229086000
1726	9HA3061	159.599999999999994	24.3999999999999986	60	229089000
1727	9HA3062	293.199999999999989	42.2000000000000028	82	229090000
1733	9HA3063	243.97999999999999	42	80	229093000
1746	9HA3065	28.6700000000000017	10.1300000000000008	50	229095000
1771	9HA3070	178.699999999999989	28	88	229101000
1774	9HA3071	179.900000000000006	28.3999999999999986	60	229102000
1780	3EJN6	288.970000000000027	45	180	370194000
1781	9HA3018	36	9	28	229106000
1783	LYBQ	99.980000000000004	16.5	43	277563000
1784	9HA3076	99.980000000000004	16.5	45	229108000
1786	9HA3077	274.5	48.0399999999999991	90	229109000
1797	V7VW3	69.0999999999999943	13.8000000000000007	25	538071313
1809	9HA3082	132.439999999999998	31.3999999999999986	60	229116000
1817	9HA3085	229.5	36.9200000000000017	74	229120000
1822	3FML3	122.549999999999997	19	50	374222000
1828	9HA3088	229.02000000000001	32.2899999999999991	145	229125000
1829	9HA3089	229	32.2899999999999991	127	229126000
1832	9HA3091	189.990000000000009	32.259999999999998	67	229128000
1838	9HA3093	278.850000000000023	42.6300000000000026	96	229130000
1842	9HA3094	189.990000000000009	32.259999999999998	77	229131000
1853	9HA3097	292.5	38.7999999999999972	85	229136000
1867	9HA3101	190	32.259999999999998	128	229141000
1871	9HA3103	89.769999999999996	13.1699999999999999	60	229144000
1874	9HA3105	225	32.2999999999999972	129	229146000
1878	9HA3106	230	38	142	229148000
1884	V7SF6	224.879999999999995	32.259999999999998	128	538006861
1886	9HA3109	241.030000000000001	42.0399999999999991	82	229152000
1888	V7SF7	225	32.259999999999998	130	538006862
1896	UDUW	246.800000000000011	42	85	273377820
1906	9HA3115	199.990000000000009	32	106	229159000
1909	9HA3117	229	36.8400000000000034	130	229161000
1916	9HA3120	291.800000000000011	45	176	229166000
1927	3ELA7	332	58	205	374669000
1930	9HA3125	246.800000000000011	42	83	229172000
1937	9HA3129	121.620000000000005	16	64	229176000
1939	9HA3131	229	32.25	133	229178000
1958	9HA3137	154.849999999999994	21.7399999999999984	71	229191000
1960	OYPD2	92.8599999999999994	14.0999999999999996	63	219355000
1962	LAZO7	92.2000000000000028	20.6400000000000006	60	259161000
1967	TCA3359	113.629999999999995	17.6999999999999993	59	271044017
1968	9HA3141	189.990000000000009	28.3099999999999987	65	229196000
1978	9HA3147	187	27.8000000000000007	62	229203000
1982	3FMJ3	176.819999999999993	29.3999999999999986	96	355009000
1985	9HA3151	183	32.2299999999999969	85	229208000
1991	9HA3152	292	45	90	229212000
1992	9HA3153	180	30	65	229213000
2000	9HA3154	180	30	90	229214000
2002	9HA3155	180	30	88	229215000
2006	9HA3156	199.990000000000009	32.259999999999998	118	229218000
2007	9HA3157	199.990000000000009	32	133	229219000
2010	9HA3159	199.990000000000009	32	128	229221000
2042	9HA3162	185.069999999999993	23.7399999999999984	61	229236000
2044	V7RY3	190.009999999999991	32.3200000000000003	68	538007887
2049	D5VU7	183.949999999999989	25.3000000000000007	70	636019928
2050	V7IO7	171.590000000000003	27	102	538005971
2053	9HA3167	94.9599999999999937	13.1699999999999999	59	229241000
2073	9HA3170	95.1599999999999966	13.1699999999999999	38	229245000
2080	9HA3172	188.560000000000002	26.5	82	229247000
2086	D5RZ3	256.069999999999993	37.3999999999999986	103	636092878
2089	9HA3175	183	30.9499999999999993	63	229251000
2093	LAYS7	143.75	27.0399999999999991	70	258955000
2099	V7A2270	179.900000000000006	28.4299999999999997	83	538008353
2107	9HA3184	210.060000000000002	30.2300000000000004	104	229263000
2108	9HA3182	254.990000000000009	43	126	229264000
2121	9HA3185	179.900000000000006	28.3999999999999986	84	229266000
2134	9HA3188	299.920000000000016	50	95	229269000
2142	V7A2133	249.870000000000005	43.7999999999999972	75	538008244
2146	V7IA9	228.990000000000009	32.2999999999999972	93	538005909
2156	D5OL9	125	21	61	636018167
2161	9HA3199	189.900000000000006	28.3599999999999994	64	229281000
2164	XCBS2	110.439999999999998	15.9000000000000004	41	377523000
2167	9HA3201	229	32.259999999999998	83	229283000
2169	9HA3202	229	32.259999999999998	75	229284000
2173	9HA3204	255.259999999999991	43	146	229286000
2176	9HA3206	139.5	19	57	229288000
2177	9HA3207	183	32.2000000000000028	119	229289000
2189	9HA3212	23.1400000000000006	12	58	229294000
2194	9HA3213	23.1400000000000006	12.6300000000000008	58	229295000
2197	CQBH	125.849999999999994	21.8000000000000007	72	255805836
2205	9HA3216	229	32.259999999999998	137	229305000
2208	9HA3218	210	36.5	123	229308000
2210	D5IR3	230.990000000000009	32.2899999999999991	123	636016973
2214	V7A2750	178.830000000000013	28.629999999999999	103	538008779
2215	V7A2707	179	28.629999999999999	61	538008738
2218	V7A2738	178.830000000000013	28.629999999999999	102	538008769
2232	9HA3224	179.879999999999995	32.2299999999999969	112	229315000
2234	9HA3225	182.5	32.2000000000000028	85	229316000
2236	9HA3226	179.879999999999995	32.2000000000000028	96	229317000
2239	9HA3227	101.079999999999998	18.0199999999999996	60	229318000
2241	9HA3228	183	32.2000000000000028	74	229319000
2249	9HA3231	138.840000000000003	16.5	28	229322000
2251	9HA3232	189.990000000000009	28.3099999999999987	65	229323000
2255	9HA3233	189.990000000000009	28.3099999999999987	73	229324000
2258	V7ZC6	179.97999999999999	30.0500000000000007	105	538008089
2259	V7YU2	179.949999999999989	30.1400000000000006	107	538008088
2271	9HA3239	278.300000000000011	48.7000000000000028	95	229329000
2273	9HA3240	278.300000000000011	48.7000000000000028	163	229330000
2277	9HA3242	90.2199999999999989	16	54	229332000
2284	9HA3245	274.389999999999986	48	90	229336000
2297	TCA3489	207.990000000000009	32.3100000000000023	109	271044133
2300	9HA3249	225	32.2999999999999972	126	229342000
2302	9HA3251	225	32.259999999999998	66	229343000
2305	9HA3252	95.1599999999999966	13.1699999999999999	65	229344000
2310	9HA3255	228.990000000000009	32.259999999999998	71	229347000
2353	C6EG6	184.099999999999994	25.3000000000000007	101	311000889
2357	9HA3260	179.879999999999995	32.2000000000000028	77	229353000
2367	SVCA9	249.960000000000008	44.0300000000000011	139	241343000
2387	3ECO	78.519999999999996	12.4000000000000004	47	352308000
2388	9HA3268	292	45	104	229361000
2393	9HA3270	88.7999999999999972	13.5	43	229363000
2400	9HA3275	185	25.1999999999999993	76	229368000
2401	9HA3276	185	25.1999999999999993	66	229369000
2409	8PAO4	119.799999999999997	18.1999999999999993	80	314452000
2414	HP8634	119.950000000000003	16.8000000000000007	68	351560000
2416	9HA3282	189.990000000000009	32.259999999999998	65	229376000
2425	9HA3283	225.620000000000005	29.9899999999999984	64	229378000
2432	9HA3285	225	32.259999999999998	71	229380000
2436	9HA3286	177	28.3999999999999986	67	229381000
2442	9HA3288	64	9.6899999999999995	36	229383000
2444	9HA3289	283	40	98	229384000
2450	9HA3290	81.2999999999999972	13.25	34	229385000
2457	9HA3291	299.920000000000016	50	188	229387000
2459	9HA3292	182.550000000000011	27.7399999999999984	103	229388000
2466	CA5511	122	19.0399999999999991	60	725001523
2468	9HA3295	43.8800000000000026	7.59999999999999964	42	229392000
2478	9V9267	249.120000000000005	37.3999999999999986	135	564305000
2488	9HA3301	32.7000000000000028	12.8200000000000003	56	229398000
2505	D5JJ5	205.5	27.3999999999999986	99	636017116
2507	5BSN4	170	29.8000000000000007	84	210663000
2510	9HA3307	243.960000000000008	42	80	229406000
2512	9HA3308	183	32.2000000000000028	93	229407000
2515	V7LY5	229	32	78	538006335
2516	9HA3310	186.960000000000008	28.6000000000000014	101	229410000
2521	9HA3312	110	19.5	66	229412000
2523	9HB3158	97.2000000000000028	15.9499999999999993	48	229413000
2524	ZGEU7	49	9	28	319080400
2526	9HA3314	268.319999999999993	36	78	229415000
2529	C6EN2	70.0999999999999943	11.6999999999999993	31	311000943
2543	V7MG9	53.3999999999999986	9.40000000000000036	32	538071319
2545	D5VE2	299.180000000000007	48.1899999999999977	96	636019582
2550	9HA3321	92.9599999999999937	24	32	229425000
2552	9HA3316	44.1700000000000017	9	30	229426000
2564	9HA3323	45.5	8	30	229430000
2599	9HA3330	201.050000000000011	29.8000000000000007	101	229441000
2601	VRSM6	146.449999999999989	22.6999999999999993	73	477326800
2610	9HA3334	179.879999999999995	32.2299999999999969	114	229446000
2612	3EVN3	92.3499999999999943	15.1999999999999993	43	355352000
2613	3FRG3	93.1500000000000057	15.1999999999999993	50	352581000
2614	9HA3338	111.5	17.6000000000000014	76	229450000
2617	9V6251	142.490000000000009	21.629999999999999	73	563091400
2618	9HA3340	227.870000000000005	37.3599999999999994	90	229452000
2627	VRPE8	303.839999999999975	40	110	477510600
2629	VRPE9	303.819999999999993	40	129	477348500
2630	VROW3	303.839999999999975	40	131	477684200
2632	4LSI2	115.329999999999998	19.6000000000000014	86	213444000
2634	9HA3347	299.949999999999989	48.3200000000000003	134	229458000
2638	9HA3348	120.799999999999997	17.6000000000000014	67	229459000
2640	3FZC3	224.969999999999999	32.25	72	356761000
2645	9HA3351	190	32.259999999999998	100	229462000
2654	D5PY7	150	23	74	636018498
2657	9HA3355	299.949999999999989	48.3200000000000003	122	229467000
2664	9HA3356	208.240000000000009	29.8000000000000007	104	229469000
2669	9HA3357	208.240000000000009	30.0500000000000007	111	229470000
2670	9HA3358	294.199999999999989	44	96	229471000
2671	V3WL4	95.9500000000000028	16	41	312407000
2673	9HA3361	255.400000000000006	37.4299999999999997	114	229474000
2678	9HA3365	199.900000000000006	32.3200000000000003	74	229478000
2684	9HA3367	210	30.1000000000000014	86	229481000
2692	9HA3371	189.990000000000009	32.259999999999998	107	229486000
2698	9HA3373	277.279999999999973	40	111	229488000
2701	9HA3374	277.279999999999973	40	128	229489000
2704	9HA3375	195.099999999999994	25.1999999999999993	66	229490000
2714	9HB3488	30	7	30	229496000
2721	9HQT7	176	32	70	229499000
2733	D5UC8	294	40	138	636019355
2740	9HA3377	199.97999999999999	32.240000000000002	73	229523000
2741	9HA3378	289	45	87	229524000
2742	OYHM2	142.509999999999991	21.6000000000000014	67	219212000
2746	TCA4362	151.469999999999999	24	87	271044633
2754	9HA3383	292	45	116	229531000
2756	9HA3384	292	45	185	229532000
2757	9HA3385	179.990000000000009	30	106	229533000
2758	9HA3386	179.990000000000009	30	67	229534000
2764	9HA3389	100	14.9499999999999993	60	229536000
2767	VRSQ3	304.160000000000025	40.0300000000000011	132	477318300
2773	9HA3391	299.949999999999989	48.3200000000000003	130	229541000
2776	9HA3392	123	19	47	229543000
2781	9HA3395	138.110000000000014	23	71	229545000
2782	9HA3396	121.549999999999997	16	50	229546000
2785	H9FF	148.580000000000013	23.1000000000000014	94	371743000
2789	9HA3399	255.400000000000006	38	97	229550000
2790	9HA3400	48.6000000000000014	8.42999999999999972	28	229551000
2793	9HA3401	280.569999999999993	43.4200000000000017	91	229553000
2800	9HA3403	255.289999999999992	37.4099999999999966	94	229556000
2802	9HA3404	255.330000000000013	37.4099999999999966	125	229557000
2807	OYHQ2	142.52000000000001	21.6000000000000014	64	219221000
2809	9HA3407	142.97999999999999	21.6999999999999993	61	229561000
2813	9HA3410	175.599999999999994	28.3999999999999986	98	229565000
2817	VRTE3	169.259999999999991	27.1999999999999993	73	477521200
2818	9HA3415	289	45	97	229567000
2819	9HA3413	224.949999999999989	32.2000000000000028	89	229568000
2822	D5VX9	224.939999999999998	32.259999999999998	135	636019741
2824	9HA3412	224.939999999999998	32.259999999999998	139	229570000
2827	9HA3417	227.900000000000006	37.3599999999999994	118	229572000
2831	\N	299.920000000000016	50	118	229574000
2835	C6DI3	117.5	17.5	64	311000682
2837	ZGGZ6	43.6000000000000014	7.15000000000000036	26	319142900
2838	VRSP9	304.160000000000025	40.0300000000000011	82	477318400
2841	9HA3126	183	32.2199999999999989	83	229580000
2842	9HA3422	294.199999999999989	44	93	229581000
2847	9HA3423	294.199999999999989	44	93	229582000
2848	9HA3424	294.199999999999989	44	94	229583000
2853	BVVT7	181	26	102	413702260
2857	3EHL5	148	21	60	371812000
2859	H9XF	84	32	110	373106000
2874	9HA3434	333	60.0399999999999991	204	229597000
2884	9HA3437	176.830000000000013	27.7399999999999984	108	229600000
2889	9HA3438	199	32	131	229602000
2892	9HA3440	225	32.259999999999998	140	229604000
2896	UBUS7	137.5	21.3000000000000007	79	273452980
2918	3EBW4	105.140000000000001	15.6999999999999993	64	352310000
2925	9HA3445	228.990000000000009	32.259999999999998	83	229609000
2927	9HA3446	133.580000000000013	19.3999999999999986	61	229610000
2929	9HA3447	180.009999999999991	30	79	229611000
2931	9HA3448	180.009999999999991	30	100	229612000
2933	9HA3449	180.009999999999991	30	102	229613000
2934	9HA3450	180.009999999999991	30	83	229614000
2935	9HA3451	180.009999999999991	30	109	229615000
2936	9HA3452	180	30	65	229616000
2938	9HA3453	90.0100000000000051	14.1999999999999993	18	229617000
2939	9HA3454	240.099999999999994	42.0300000000000011	80	229618000
2942	9HA3455	228.599999999999994	42	120	229619000
2944	9HA3457	299.870000000000005	48.3299999999999983	135	229620000
2949	9HA3459	365.810000000000002	48.4600000000000009	146	229622000
2950	9HA3460	225	32.2999999999999972	79	229623000
\.


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 209
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audits_id_seq', 664, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 211
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invitations_id_seq', 10, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 17, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 203
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 2, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 205
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 213
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 63, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 215
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 298, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 217
-- Name: vessels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vessels_id_seq', 1, false);


--
-- TOC entry 2795 (class 2606 OID 33103)
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33091)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33111)
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 33023)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 33053)
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 33044)
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33070)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 33079)
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33059)
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 33122)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 33130)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 33036)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2778 (class 2606 OID 33034)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 41092)
-- Name: vessels vessels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vessels
    ADD CONSTRAINT vessels_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 1259 OID 33054)
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- TOC entry 2781 (class 1259 OID 33045)
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- TOC entry 2789 (class 1259 OID 33071)
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


-- Completed on 2020-04-10 22:34:05

--
-- PostgreSQL database dump complete
--

