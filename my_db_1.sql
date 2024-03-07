--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-04 13:25:53

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
-- TOC entry 226 (class 1259 OID 17341)
-- Name: BREAKFAST ORDER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BREAKFAST ORDER" (
    "ID" integer NOT NULL,
    "Number of servings" integer NOT NULL,
    "Serving time" character varying(20),
    "Price" double precision NOT NULL,
    "Client id" integer,
    "Hotel room id" integer,
    CONSTRAINT "BREAKFAST ORDER_Number of servings_check" CHECK (("Number of servings" > 0)),
    CONSTRAINT "BREAKFAST ORDER_Price_check" CHECK (("Price" >= (0)::double precision)),
    CONSTRAINT non_negative_price CHECK (("Price" >= (0)::double precision))
);


ALTER TABLE public."BREAKFAST ORDER" OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE "BREAKFAST ORDER"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."BREAKFAST ORDER" IS 'Table storing breakfast order information';


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."ID" IS 'Unique identifier for the breakfast order.';


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."Number of servings"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."Number of servings" IS 'Number of servings in the breakfast order.';


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."Serving time"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."Serving time" IS 'Time at which the breakfast is served.';


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."Price"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."Price" IS 'Total price of the breakfast order.';


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."Client id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."Client id" IS 'Client ID associated with the breakfast order.';


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "BREAKFAST ORDER"."Hotel room id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."BREAKFAST ORDER"."Hotel room id" IS 'Hotel room ID associated with the breakfast order.';


--
-- TOC entry 225 (class 1259 OID 17340)
-- Name: BREAKFAST ORDER_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BREAKFAST ORDER_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BREAKFAST ORDER_ID_seq" OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 225
-- Name: BREAKFAST ORDER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BREAKFAST ORDER_ID_seq" OWNED BY public."BREAKFAST ORDER"."ID";


--
-- TOC entry 218 (class 1259 OID 17257)
-- Name: CLIENT; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CLIENT" (
    "ID" integer NOT NULL,
    "Passport number" character varying(20) NOT NULL,
    "Full name" character varying(50) NOT NULL,
    "Birth date" date,
    "Phone number" character varying(20) NOT NULL,
    "Email" character varying(50),
    CONSTRAINT birth_date_not_future CHECK ((("Birth date" IS NULL) OR ("Birth date" <= CURRENT_DATE))),
    CONSTRAINT non_empty_full_name CHECK ((char_length(("Full name")::text) > 0)),
    CONSTRAINT non_empty_passport CHECK ((char_length(("Passport number")::text) > 0)),
    CONSTRAINT non_empty_phone_number CHECK ((char_length(("Phone number")::text) > 0)),
    CONSTRAINT valid_email_format CHECK ((("Email" IS NULL) OR (POSITION(('@'::text) IN ("Email")) > 0)))
);


ALTER TABLE public."CLIENT" OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "CLIENT"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."CLIENT" IS 'Table storing client information';


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."ID" IS 'Unique identifier for the client.';


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."Passport number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."Passport number" IS 'Passport number of the client.';


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."Full name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."Full name" IS 'Full name of the client.';


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."Birth date"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."Birth date" IS 'Date of birth of the client.';


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."Phone number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."Phone number" IS 'Phone number of the client.';


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "CLIENT"."Email"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CLIENT"."Email" IS 'Email address of the client.';


--
-- TOC entry 217 (class 1259 OID 17256)
-- Name: CLIENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CLIENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CLIENT_ID_seq" OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 217
-- Name: CLIENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CLIENT_ID_seq" OWNED BY public."CLIENT"."ID";


--
-- TOC entry 220 (class 1259 OID 17269)
-- Name: EMPLOYEE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EMPLOYEE" (
    "ID" integer NOT NULL,
    "Passport number" character varying(20) NOT NULL,
    "Full name" character varying(50) NOT NULL,
    "Birth date" date,
    "Phone number" character varying(20) NOT NULL,
    "Position at work" character varying(50) NOT NULL,
    CONSTRAINT birth_date_not_future_emp CHECK ((("Birth date" IS NULL) OR ("Birth date" <= CURRENT_DATE))),
    CONSTRAINT non_empty_full_name_emp CHECK ((char_length(("Full name")::text) > 0)),
    CONSTRAINT non_empty_passport_emp CHECK ((char_length(("Passport number")::text) > 0)),
    CONSTRAINT non_empty_phone_number CHECK ((char_length(("Phone number")::text) > 0))
);


ALTER TABLE public."EMPLOYEE" OWNER TO postgres;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "EMPLOYEE"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."EMPLOYEE" IS 'Table storing employee information';


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."ID" IS 'Unique identifier for the employee.';


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."Passport number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."Passport number" IS 'Passport number of the employee.';


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."Full name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."Full name" IS 'Full name of the employee.';


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."Birth date"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."Birth date" IS 'Date of birth of the employee.';


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."Phone number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."Phone number" IS 'Phone number of the employee.';


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "EMPLOYEE"."Position at work"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EMPLOYEE"."Position at work" IS 'Position held by the employee.';


--
-- TOC entry 219 (class 1259 OID 17268)
-- Name: EMPLOYEE_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EMPLOYEE_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EMPLOYEE_ID_seq" OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 219
-- Name: EMPLOYEE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EMPLOYEE_ID_seq" OWNED BY public."EMPLOYEE"."ID";


--
-- TOC entry 224 (class 1259 OID 17329)
-- Name: HOTEL ROOM; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HOTEL ROOM" (
    "ID" integer NOT NULL,
    "Room number" integer NOT NULL,
    "Number of beds" integer NOT NULL,
    "Number of rooms" integer NOT NULL,
    "Room type" character varying(50) NOT NULL,
    "Cost per day" double precision NOT NULL,
    "Status id" integer,
    CONSTRAINT "HOTEL ROOM_Cost per day_check" CHECK (("Cost per day" >= (0)::double precision)),
    CONSTRAINT non_empty_room_type CHECK ((char_length(("Room type")::text) > 0)),
    CONSTRAINT non_negative_number_of_rooms CHECK (("Number of rooms" >= 0)),
    CONSTRAINT non_negative_room_number CHECK (("Room number" >= 0)),
    CONSTRAINT positive_number_of_beds CHECK (("Number of beds" > 0))
);


ALTER TABLE public."HOTEL ROOM" OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE "HOTEL ROOM"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."HOTEL ROOM" IS 'Table storing hotel room information';


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."ID" IS 'Unique identifier for the hotel room.';


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."Room number"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."Room number" IS 'Number of the hotel room.';


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."Number of beds"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."Number of beds" IS 'Number of beds in the hotel room.';


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."Number of rooms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."Number of rooms" IS 'Number of rooms available.';


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."Room type"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."Room type" IS 'Type or category of the hotel room.';


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "HOTEL ROOM"."Cost per day"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM"."Cost per day" IS 'Cost per day for renting the hotel room.';


--
-- TOC entry 228 (class 1259 OID 17398)
-- Name: HOTEL ROOM STATUS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HOTEL ROOM STATUS" (
    "ID" integer NOT NULL,
    "Reservation" character varying(20) NOT NULL,
    "Arrival date" date,
    "Date of departure" date,
    "Issue date" date,
    "Issue time" character varying(20),
    "Client id" integer,
    "Hotel room id" integer,
    CONSTRAINT valid_departure_after_arrival CHECK (("Date of departure" >= "Arrival date")),
    CONSTRAINT valid_reservation CHECK ((char_length(("Reservation")::text) <= 20))
);


ALTER TABLE public."HOTEL ROOM STATUS" OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE "HOTEL ROOM STATUS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."HOTEL ROOM STATUS" IS 'Table storing hotel room status information';


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."ID" IS 'Unique identifier for the hotel room status.';


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Reservation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Reservation" IS 'Reservation status of the hotel room.';


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Arrival date"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Arrival date" IS 'Date of arrival for the reservation.';


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Date of departure"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Date of departure" IS 'Date of departure for the reservation.';


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Issue date"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Issue date" IS 'Date when the room status was issued.';


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Issue time"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Issue time" IS 'Time when the room status was issued.';


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Client id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Client id" IS 'Client ID associated with the room status.';


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "HOTEL ROOM STATUS"."Hotel room id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."HOTEL ROOM STATUS"."Hotel room id" IS 'Hotel room ID associated with the room status.';


--
-- TOC entry 227 (class 1259 OID 17397)
-- Name: HOTEL ROOM STATUS_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HOTEL ROOM STATUS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."HOTEL ROOM STATUS_ID_seq" OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 227
-- Name: HOTEL ROOM STATUS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HOTEL ROOM STATUS_ID_seq" OWNED BY public."HOTEL ROOM STATUS"."ID";


--
-- TOC entry 223 (class 1259 OID 17328)
-- Name: HOTEL ROOM_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HOTEL ROOM_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."HOTEL ROOM_ID_seq" OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 223
-- Name: HOTEL ROOM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HOTEL ROOM_ID_seq" OWNED BY public."HOTEL ROOM"."ID";


--
-- TOC entry 222 (class 1259 OID 17313)
-- Name: OTHER SERVICES; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OTHER SERVICES" (
    "ID" integer NOT NULL,
    "Service name" character varying(50) NOT NULL,
    "Service category" character varying(30),
    "Price" double precision NOT NULL,
    "Work schedule" character varying(50),
    "Client id" integer,
    CONSTRAINT "OTHER SERVICES_Price_check" CHECK (("Price" >= (0)::double precision)),
    CONSTRAINT non_empty_service_name CHECK ((char_length(("Service name")::text) > 0)),
    CONSTRAINT non_negative_price CHECK (("Price" >= (0)::double precision)),
    CONSTRAINT valid_service_category CHECK ((length(("Service category")::text) <= 30))
);


ALTER TABLE public."OTHER SERVICES" OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "OTHER SERVICES"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."OTHER SERVICES" IS 'Table storing other services information';


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."ID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."ID" IS 'Unique identifier for the service.';


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."Service name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."Service name" IS 'Name of the service.';


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."Service category"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."Service category" IS 'Category of the service.';


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."Price"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."Price" IS 'Price of the service.';


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."Work schedule"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."Work schedule" IS 'Work schedule of the service.';


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "OTHER SERVICES"."Client id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."OTHER SERVICES"."Client id" IS 'Client ID associated with the service.';


--
-- TOC entry 221 (class 1259 OID 17312)
-- Name: OTHER SERVICES_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OTHER SERVICES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OTHER SERVICES_ID_seq" OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 221
-- Name: OTHER SERVICES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OTHER SERVICES_ID_seq" OWNED BY public."OTHER SERVICES"."ID";


--
-- TOC entry 230 (class 1259 OID 17431)
-- Name: ROOM RESERVATION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ROOM RESERVATION" (
    "Employee id" integer NOT NULL,
    "Reservation id" integer NOT NULL
);


ALTER TABLE public."ROOM RESERVATION" OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE "ROOM RESERVATION"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."ROOM RESERVATION" IS 'Table storing room reservation information';


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN "ROOM RESERVATION"."Employee id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ROOM RESERVATION"."Employee id" IS 'Employee ID associated with the room reservation.';


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN "ROOM RESERVATION"."Reservation id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ROOM RESERVATION"."Reservation id" IS 'Reservation ID associated with the room reservation.';


--
-- TOC entry 229 (class 1259 OID 17416)
-- Name: SERVICE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SERVICE" (
    "Service id" integer NOT NULL,
    "Employee id" integer NOT NULL
);


ALTER TABLE public."SERVICE" OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE "SERVICE"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."SERVICE" IS 'Table storing service information';


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "SERVICE"."Service id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."SERVICE"."Service id" IS 'Service ID associated with the service.';


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "SERVICE"."Employee id"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."SERVICE"."Employee id" IS 'Employee ID associated with the service.';


--
-- TOC entry 4677 (class 2604 OID 17344)
-- Name: BREAKFAST ORDER ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BREAKFAST ORDER" ALTER COLUMN "ID" SET DEFAULT nextval('public."BREAKFAST ORDER_ID_seq"'::regclass);


--
-- TOC entry 4673 (class 2604 OID 17260)
-- Name: CLIENT ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CLIENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."CLIENT_ID_seq"'::regclass);


--
-- TOC entry 4674 (class 2604 OID 17272)
-- Name: EMPLOYEE ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EMPLOYEE" ALTER COLUMN "ID" SET DEFAULT nextval('public."EMPLOYEE_ID_seq"'::regclass);


--
-- TOC entry 4676 (class 2604 OID 17332)
-- Name: HOTEL ROOM ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM" ALTER COLUMN "ID" SET DEFAULT nextval('public."HOTEL ROOM_ID_seq"'::regclass);


--
-- TOC entry 4678 (class 2604 OID 17401)
-- Name: HOTEL ROOM STATUS ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM STATUS" ALTER COLUMN "ID" SET DEFAULT nextval('public."HOTEL ROOM STATUS_ID_seq"'::regclass);


--
-- TOC entry 4675 (class 2604 OID 17316)
-- Name: OTHER SERVICES ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OTHER SERVICES" ALTER COLUMN "ID" SET DEFAULT nextval('public."OTHER SERVICES_ID_seq"'::regclass);


--
-- TOC entry 4880 (class 0 OID 17341)
-- Dependencies: 226
-- Data for Name: BREAKFAST ORDER; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BREAKFAST ORDER" ("ID", "Number of servings", "Serving time", "Price", "Client id", "Hotel room id") FROM stdin;
1	2	08:00	15.5	2	33
2	1	07:30	8.75	6	36
3	3	09:45	22	7	47
4	1	07:00	8.05	8	51
5	3	09:15	20.25	11	41
6	1	07:00	9	13	53
7	4	08:30	16.75	14	43
8	1	07:45	10.5	15	45
9	3	09:45	22	19	49
10	1	07:15	11.25	21	39
11	2	08:45	18	24	34
12	1	07:30	9.75	25	55
13	3	10:00	24.5	27	57
14	1	07:00	10	29	59
\.


--
-- TOC entry 4872 (class 0 OID 17257)
-- Dependencies: 218
-- Data for Name: CLIENT; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CLIENT" ("ID", "Passport number", "Full name", "Birth date", "Phone number", "Email") FROM stdin;
1	AB1234XYZ	John Doe	1990-05-15	1234567890	john.doe@example.com
2	CD9876ABC	Alice Smith	1985-08-20	9876543210	alice.smith@example.com
3	EF5556DEF	Michael Johnson	1992-03-10	5556667770	michael.johnson@example.com
4	GH4443GHI	Emily Brown	1988-12-05	4443332220	emily.brown@example.com
5	IJ7778JKL	William Taylor	1995-06-25	7778889990	william.taylor@example.com
6	KL1112MNO	Sophia Wilson	1983-11-30	1112223330	sophia.wilson@example.com
7	MN4445PQR	James Martinez	1998-02-18	4445556660	james.martinez@example.com
8	OP7778STU	Olivia Lopez	1991-09-14	7778889991	olivia.lopez@example.com
9	QR1234VWX	Noah Garcia	1994-07-02	1234567891	noah.garcia@example.com
10	ST9876YZA	Emma Rodriguez	1986-04-23	9876543211	emma.rodriguez@example.com
11	UV5556BCD	Liam Miller	1997-08-08	5556667771	liam.miller@example.com
12	WX4443EFG	Ava Hernandez	1989-01-17	4443332221	ava.hernandez@example.com
13	YZ7778HIJ	Benjamin Jackson	1996-12-10	7778889992	benjamin.jackson@example.com
14	AB1234KLM	Mia Thompson	1993-04-05	1234567892	mia.thompson@example.com
15	CD5556NOP	Elijah White	1990-11-28	5556667772	elijah.white@example.com
16	EF9876PQR	Charlotte Clark	1987-06-15	9876543212	charlotte.clark@example.com
17	GH4443STU	Lucas Adams	1999-03-22	4443332222	lucas.adams@example.com
18	IJ7778VWX	Amelia Turner	1984-10-12	7778889993	amelia.turner@example.com
19	KL1234YZA	Mason Scott	1991-05-03	1234567893	mason.scott@example.com
20	MN5556BCD	Harper King	1998-08-18	5556667773	harper.king@example.com
21	OP4443EFG	Ethan Green	1985-01-28	4443332223	ethan.green@example.com
22	QR7778HIJ	Evelyn Baker	1994-06-15	7778889994	evelyn.baker@example.com
23	ST1234KLM	Logan Hill	1989-09-30	1234567894	logan.hill@example.com
24	UV5556NOP	Avery Hall	1997-12-25	5556667774	avery.hall@example.com
25	WX4443PQR	Sofia Young	1992-03-10	4443332224	sofia.young@example.com
26	YZ7778STU	Jackson Cook	1995-11-15	7778889995	jackson.cook@example.com
27	AB1234VWX	Aria Kelly	1986-04-23	1234567895	aria.kelly@example.com
28	CD5556YZA	Carter Ward	1990-08-08	5556667775	carter.ward@example.com
29	EF9876BCD	Luna Murphy	1983-01-17	4443332225	luna.murphy@example.com
30	GH1122EFG	Zoe Smith	1999-02-28	1122437190	zoe.smth@example.com
\.


--
-- TOC entry 4874 (class 0 OID 17269)
-- Dependencies: 220
-- Data for Name: EMPLOYEE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EMPLOYEE" ("ID", "Passport number", "Full name", "Birth date", "Phone number", "Position at work") FROM stdin;
1	AB123001	John Doe	1980-08-15	111222333	Front Desk Receptionist
2	AB123002	Alice Smith	1992-04-20	444555666	Housekeeping Supervisor
3	AB123003	Michael Johnson	1985-12-10	777888999	Quality Assurance Tester
4	AB123004	Emily Brown	1998-02-25	123456789	Chef
5	AB123005	William Taylor	1990-06-05	987654321	Event Coordinator
6	AB123006	Sophia Wilson	1983-11-30	555666777	IT Technician
7	AB123007	James Martinez	1995-03-18	444333222	Support Representative
8	AB123008	Olivia Lopez	1991-09-14	888777999	Frontend Developer
9	AB123009	Noah Garcia	1994-07-02	333222111	Hotel Manager
10	AB123010	Emma Rodriguez	1986-04-23	222333444	Housekeeper
11	AB123011	Liam Miller	1997-08-08	666777888	Guest Relations Specialist
12	AB123012	Ava Hernandez	1989-01-17	555444333	Massage Therapist
13	AB123013	Benjamin Jackson	1996-12-10	999888777	Waiter
14	AB123014	Mia Thompson	1993-04-05	123123123	Receptionist
15	AB123015	Elijah White	1990-11-28	456456456	Waiter
16	AB123016	Charlotte Clark	1987-06-15	789789789	Hotel Administrator
17	AB123017	Lucas Adams	1999-03-22	654654654	Event Coordinator
18	AB123018	Amelia Turner	1984-10-12	987987987	Housekeeping Supervisor
19	AB123019	Mason Scott	1991-05-03	987654321	Chef
20	AB123020	Harper King	1998-08-18	876543210	Receptionist
21	AB123021	Ethan Green	1985-01-28	765432109	Support Representative
22	AB123022	Evelyn Baker	1994-06-15	654321098	Massage Therapist
23	AB123023	Logan Hill	1989-09-30	543210987	Waiter
24	AB123024	Avery Hall	1997-12-25	432109876	Front Desk Receptionist
25	AB123025	Sofia Young	1992-03-10	321098765	Waiter
26	AB123026	Jackson Cook	1995-11-15	210987654	Chef
27	AB123027	Aria Kelly	1986-04-23	109876543	Guest Relations Specialist
28	AB123028	Carter Ward	1990-08-08	123432123	IT Technician
29	AB123029	Luna Murphy	1983-01-17	321123432	Housekeeping Supervisor
30	AB123030	Zoe Smith	1999-02-28	112243719	Waiter
\.


--
-- TOC entry 4878 (class 0 OID 17329)
-- Dependencies: 224
-- Data for Name: HOTEL ROOM; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HOTEL ROOM" ("ID", "Room number", "Number of beds", "Number of rooms", "Room type", "Cost per day", "Status id") FROM stdin;
31	101	2	5	Standard	100	31
32	102	1	3	Economy	80	32
33	103	3	2	Suite	150	33
34	104	2	4	Standard	120	34
35	105	1	1	Economy	70	35
36	106	3	3	Suite	160	36
37	107	2	5	Standard	110	37
38	108	1	3	Economy	85	38
39	109	3	2	Suite	140	39
40	110	2	4	Standard	130	40
41	111	1	1	Economy	75	41
42	112	3	3	Suite	170	42
43	113	2	5	Standard	90	43
44	114	1	3	Economy	95	44
45	115	3	2	Suite	180	45
46	116	2	4	Standard	110	46
47	117	1	1	Economy	65	47
48	118	3	3	Suite	150	48
49	119	2	5	Standard	120	49
50	120	1	3	Economy	100	50
51	121	3	2	Suite	190	51
52	122	2	4	Standard	140	52
53	123	1	1	Economy	60	53
54	124	3	3	Suite	160	54
55	125	2	5	Standard	130	55
56	126	1	3	Economy	75	56
57	127	3	2	Suite	170	57
58	128	2	4	Standard	150	58
59	129	1	1	Economy	85	59
60	130	3	3	Suite	180	60
\.


--
-- TOC entry 4882 (class 0 OID 17398)
-- Dependencies: 228
-- Data for Name: HOTEL ROOM STATUS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HOTEL ROOM STATUS" ("ID", "Reservation", "Arrival date", "Date of departure", "Issue date", "Issue time", "Client id", "Hotel room id") FROM stdin;
31	free	\N	\N	\N	\N	\N	31
32	free	\N	\N	\N	\N	\N	32
33	reserved	2024-03-14	2024-03-20	2024-03-13	16:45	2	33
34	reserved	2024-03-18	2024-03-24	2024-03-17	18:30	24	34
35	free	\N	\N	\N	\N	\N	35
36	reserved	2024-03-22	2024-03-28	2024-03-21	14:00	6	36
37	free	\N	\N	\N	\N	\N	37
38	free	\N	\N	\N	\N	\N	38
39	reserved	2024-03-28	2024-04-03	2024-03-27	13:15	21	39
40	free	\N	\N	\N	\N	\N	40
41	reserved	2024-04-01	2024-04-07	2024-03-31	09:45	11	41
42	free	\N	\N	\N	\N	\N	42
43	reserved	2024-04-05	2024-04-11	2024-04-04	19:15	14	43
44	free	\N	\N	\N	\N	\N	44
45	reserved	2024-04-09	2024-04-15	2024-04-08	21:30	15	45
46	free	\N	\N	\N	\N	\N	46
47	reserved	2024-04-13	2024-04-19	2024-04-12	17:00	7	47
48	free	\N	\N	\N	\N	\N	48
49	reserved	2024-04-17	2024-04-23	2024-04-16	22:15	19	49
50	free	\N	\N	\N	\N	\N	50
51	reserved	2024-04-21	2024-04-27	2024-04-20	18:30	8	51
52	free	\N	\N	\N	\N	\N	52
53	reserved	2024-04-25	2024-05-01	2024-04-24	20:45	13	53
54	free	\N	\N	\N	\N	\N	54
55	reserved	2024-04-29	2024-05-05	2024-04-28	15:15	25	55
56	free	\N	\N	\N	\N	\N	56
57	reserved	2024-05-03	2024-05-09	2024-05-02	17:30	27	57
58	free	\N	\N	\N	\N	\N	58
59	reserved	2024-05-07	2024-05-13	2024-05-06	10:15	29	59
60	free	\N	\N	\N	\N	\N	60
\.


--
-- TOC entry 4876 (class 0 OID 17313)
-- Dependencies: 222
-- Data for Name: OTHER SERVICES; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OTHER SERVICES" ("ID", "Service name", "Service category", "Price", "Work schedule", "Client id") FROM stdin;
1	Room Cleaning	Housekeeping	50	Daily, 9:00-17:00	7
2	Swedish Massage	Spa	120	By Appointment, 10:00-20:00	15
3	Airport Transfer	Transportation	80	24/7	1
4	Business Center Usage	Business	15	Business Hours, 8:00-18:00	25
5	Gourmet Dinner	Dining	150	Evenings, 18:00-22:00	3
6	Laundry Service	Housekeeping	30	By Request, 10:00-16:00	22
7	Fitness Training	Fitness	60	By Appointment, 7:00-19:00	10
8	Conference Room Rental	Business	100	Business Hours, 9:00-17:00	28
9	Spa Package	Spa	200	By Appointment, 10:00-20:00	14
10	City Tour	Excursion	90	By Appointment	29
11	Private Chef	Dining	180	By Appointment, 18:00-22:00	26
12	Car Rental	Transportation	70	24/7	11
13	Event Planning	Business	120	Business Hours, 9:00-17:00	18
14	Babysitting	Family	40	By Appointment, 8:00-22:00	4
15	Wine Tasting	Dining	75	Evenings, 18:00-20:00	20
16	Fitness Classes	Fitness	20	Daily, 7:00-18:00	8
17	Tech Support	Business	25	Business Hours, 9:00-17:00	9
18	Pet Care	Family	45	By Request	23
19	Room Service	Dining	25	24/7	2
20	Golf Package	Excursion	110	By Appointment	17
21	Personal Stylist	Spa	80	By Appointment, 10:00-18:00	13
22	Poolside Cabana Rental	Recreation	50	Daily, 10:00-18:00	12
23	Private Yoga Session	Fitness	70	By Appointment, 7:00-19:00	30
24	Gift Shop Purchase	Shopping	30	Business Hours, 9:00-20:00	21
25	Valet Parking	Transportation	15	24/7	19
26	Romantic Package	Dining	160	Evenings, 18:00-22:00	7
27	Photography Session	Excursion	130	By Appointment	27
28	Late Check-Out	Housekeeping	40	By Request	24
29	VIP Concierge	Business	90	24/7	16
30	Catering Service	Dining	120	By Appointment, 12:00-20:00	5
\.


--
-- TOC entry 4884 (class 0 OID 17431)
-- Dependencies: 230
-- Data for Name: ROOM RESERVATION; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ROOM RESERVATION" ("Employee id", "Reservation id") FROM stdin;
1	31
9	32
11	33
14	34
16	35
20	36
24	37
1	38
9	39
11	40
14	41
16	42
20	43
24	44
1	45
9	46
11	47
14	48
16	49
20	50
24	51
1	52
9	53
11	54
14	55
16	56
20	57
24	58
1	59
9	60
\.


--
-- TOC entry 4883 (class 0 OID 17416)
-- Dependencies: 229
-- Data for Name: SERVICE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SERVICE" ("Service id", "Employee id") FROM stdin;
1	2
2	3
3	4
4	5
5	6
6	7
7	8
8	10
9	12
10	13
11	15
12	17
13	18
14	19
15	21
16	22
17	23
18	25
19	26
20	27
21	28
22	29
23	30
24	2
25	3
26	4
27	5
28	6
29	7
30	8
\.


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 225
-- Name: BREAKFAST ORDER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BREAKFAST ORDER_ID_seq"', 14, true);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 217
-- Name: CLIENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CLIENT_ID_seq"', 30, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 219
-- Name: EMPLOYEE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EMPLOYEE_ID_seq"', 30, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 227
-- Name: HOTEL ROOM STATUS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HOTEL ROOM STATUS_ID_seq"', 60, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 223
-- Name: HOTEL ROOM_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HOTEL ROOM_ID_seq"', 60, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 221
-- Name: OTHER SERVICES_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OTHER SERVICES_ID_seq"', 30, true);


--
-- TOC entry 4711 (class 2606 OID 17349)
-- Name: BREAKFAST ORDER BREAKFAST ORDER_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BREAKFAST ORDER"
    ADD CONSTRAINT "BREAKFAST ORDER_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4703 (class 2606 OID 17267)
-- Name: CLIENT CLIENT_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CLIENT"
    ADD CONSTRAINT "CLIENT_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4705 (class 2606 OID 17278)
-- Name: EMPLOYEE EMPLOYEE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EMPLOYEE"
    ADD CONSTRAINT "EMPLOYEE_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4713 (class 2606 OID 17405)
-- Name: HOTEL ROOM STATUS HOTEL ROOM STATUS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM STATUS"
    ADD CONSTRAINT "HOTEL ROOM STATUS_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4709 (class 2606 OID 17339)
-- Name: HOTEL ROOM HOTEL ROOM_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM"
    ADD CONSTRAINT "HOTEL ROOM_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4707 (class 2606 OID 17322)
-- Name: OTHER SERVICES OTHER SERVICES_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OTHER SERVICES"
    ADD CONSTRAINT "OTHER SERVICES_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4717 (class 2606 OID 17435)
-- Name: ROOM RESERVATION ROOM RESERVATION_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ROOM RESERVATION"
    ADD CONSTRAINT "ROOM RESERVATION_pkey" PRIMARY KEY ("Employee id", "Reservation id");


--
-- TOC entry 4715 (class 2606 OID 17420)
-- Name: SERVICE SERVICE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SERVICE"
    ADD CONSTRAINT "SERVICE_pkey" PRIMARY KEY ("Service id", "Employee id");


--
-- TOC entry 4726 (class 2606 OID 17436)
-- Name: ROOM RESERVATION ROOM RESERVATION_Employee id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ROOM RESERVATION"
    ADD CONSTRAINT "ROOM RESERVATION_Employee id_fkey" FOREIGN KEY ("Employee id") REFERENCES public."EMPLOYEE"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4727 (class 2606 OID 17441)
-- Name: ROOM RESERVATION ROOM RESERVATION_Reservation id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ROOM RESERVATION"
    ADD CONSTRAINT "ROOM RESERVATION_Reservation id_fkey" FOREIGN KEY ("Reservation id") REFERENCES public."HOTEL ROOM STATUS"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4724 (class 2606 OID 17421)
-- Name: SERVICE SERVICE_Employee id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SERVICE"
    ADD CONSTRAINT "SERVICE_Employee id_fkey" FOREIGN KEY ("Employee id") REFERENCES public."EMPLOYEE"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 17426)
-- Name: SERVICE SERVICE_Service id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SERVICE"
    ADD CONSTRAINT "SERVICE_Service id_fkey" FOREIGN KEY ("Service id") REFERENCES public."OTHER SERVICES"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4718 (class 2606 OID 17323)
-- Name: OTHER SERVICES fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OTHER SERVICES"
    ADD CONSTRAINT fk_client_id FOREIGN KEY ("Client id") REFERENCES public."CLIENT"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4720 (class 2606 OID 17350)
-- Name: BREAKFAST ORDER fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BREAKFAST ORDER"
    ADD CONSTRAINT fk_client_id FOREIGN KEY ("Client id") REFERENCES public."CLIENT"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4722 (class 2606 OID 17406)
-- Name: HOTEL ROOM STATUS fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM STATUS"
    ADD CONSTRAINT fk_client_id FOREIGN KEY ("Client id") REFERENCES public."CLIENT"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4721 (class 2606 OID 17355)
-- Name: BREAKFAST ORDER fk_hotel_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BREAKFAST ORDER"
    ADD CONSTRAINT fk_hotel_room_id FOREIGN KEY ("Hotel room id") REFERENCES public."HOTEL ROOM"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4723 (class 2606 OID 17411)
-- Name: HOTEL ROOM STATUS fk_hotel_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM STATUS"
    ADD CONSTRAINT fk_hotel_room_id FOREIGN KEY ("Hotel room id") REFERENCES public."HOTEL ROOM"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4719 (class 2606 OID 17446)
-- Name: HOTEL ROOM fk_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HOTEL ROOM"
    ADD CONSTRAINT fk_status_id FOREIGN KEY ("Status id") REFERENCES public."HOTEL ROOM STATUS"("ID") ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-03-04 13:25:53

--
-- PostgreSQL database dump complete
--

