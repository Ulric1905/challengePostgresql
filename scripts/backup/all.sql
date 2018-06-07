--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md57464df180ef610b2c0d922f680261852';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE read_only_user;
ALTER ROLE read_only_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE read_user;
ALTER ROLE read_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md578bb8fc43248f7c2e49953295edfa967';


--
-- Role memberships
--

GRANT read_only_user TO read_user GRANTED BY admin;




--
-- Database creation
--

CREATE DATABASE admin WITH TEMPLATE = template0 OWNER = postgres;
GRANT ALL ON DATABASE admin TO admin;
CREATE DATABASE proj WITH TEMPLATE = template0 OWNER = admin;
CREATE DATABASE projclassique WITH TEMPLATE = template0 OWNER = admin;
CREATE DATABASE shows WITH TEMPLATE = template0 OWNER = admin;
GRANT CONNECT ON DATABASE shows TO read_only_user;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE ynov WITH TEMPLATE = template0 OWNER = admin;


\connect admin

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: episodes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.episodes (
    episode_id integer NOT NULL,
    show_id integer,
    season integer NOT NULL,
    number integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.episodes OWNER TO admin;

--
-- Name: episodes_episode_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.episodes_episode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episodes_episode_id_seq OWNER TO admin;

--
-- Name: episodes_episode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.episodes_episode_id_seq OWNED BY public.episodes.episode_id;


--
-- Name: shows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.shows (
    show_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(355) NOT NULL,
    release_year integer NOT NULL,
    genre character varying(50) NOT NULL,
    network character varying(100) NOT NULL
);


ALTER TABLE public.shows OWNER TO admin;

--
-- Name: shows_show_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.shows_show_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_show_id_seq OWNER TO admin;

--
-- Name: shows_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.shows_show_id_seq OWNED BY public.shows.show_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    registration_timestamp timestamp without time zone NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(355) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO admin;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: episodes episode_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.episodes ALTER COLUMN episode_id SET DEFAULT nextval('public.episodes_episode_id_seq'::regclass);


--
-- Name: shows show_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.shows ALTER COLUMN show_id SET DEFAULT nextval('public.shows_show_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: episodes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.episodes (episode_id, show_id, season, number, "timestamp") FROM stdin;
\.


--
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.shows (show_id, name, description, release_year, genre, network) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (user_id, registration_timestamp, firstname, lastname, email, password) FROM stdin;
\.


--
-- Name: episodes_episode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.episodes_episode_id_seq', 1, false);


--
-- Name: shows_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.shows_show_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: episodes episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (episode_id);


--
-- Name: shows shows_description_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_description_key UNIQUE (description);


--
-- Name: shows shows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (show_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: episodes episodes_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(show_id);


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

