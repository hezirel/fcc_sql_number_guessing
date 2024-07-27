--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO freecodecamp;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'Hello', 0);
INSERT INTO public.games VALUES (2, 'Hello', 0);
INSERT INTO public.games VALUES (3, 'Hasnaine', 5);
INSERT INTO public.games VALUES (4, 'Hasnaine', 15);
INSERT INTO public.games VALUES (5, 'user_1722094639578', 614);
INSERT INTO public.games VALUES (6, 'user_1722094639578', 747);
INSERT INTO public.games VALUES (7, 'user_1722094639577', 46);
INSERT INTO public.games VALUES (8, 'user_1722094639577', 496);
INSERT INTO public.games VALUES (9, 'user_1722094639578', 696);
INSERT INTO public.games VALUES (10, 'user_1722094639578', 172);
INSERT INTO public.games VALUES (11, 'user_1722094639578', 617);
INSERT INTO public.games VALUES (12, 'user_1722094650224', 613);
INSERT INTO public.games VALUES (13, 'user_1722094650224', 643);
INSERT INTO public.games VALUES (14, 'user_1722094650223', 256);
INSERT INTO public.games VALUES (15, 'user_1722094650223', 159);
INSERT INTO public.games VALUES (16, 'user_1722094650224', 709);
INSERT INTO public.games VALUES (17, 'user_1722094650224', 544);
INSERT INTO public.games VALUES (18, 'user_1722094650224', 369);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

