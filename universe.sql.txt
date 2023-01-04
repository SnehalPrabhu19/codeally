--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(30) NOT NULL,
    density integer,
    popullation numeric(5,2),
    area numeric(5,2)
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continent_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continent_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation text,
    description text NOT NULL,
    alt_name character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    year integer,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    nacolor text,
    number_moon integer NOT NULL,
    has_life boolean,
    has_ring boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance numeric(5,2) NOT NULL,
    dimagnitude numeric(5,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continent_continent_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 'Asia', 150, 464.61, 31.03);
INSERT INTO public.continent VALUES (2, 'Africa', 45, 13.40, 29.64);
INSERT INTO public.continent VALUES (3, 'Europe', 34, 7.47, 22.13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Bodes galaxy', 'Ursa Major', 'named after astronomer', 'M81');
INSERT INTO public.galaxy VALUES (2, 'Butterfly galaxy', 'Virgo', 'binary', 'NGC 4567');
INSERT INTO public.galaxy VALUES (3, 'Cigar galaxy', 'Ursa Major', 'shaped like a cigar', 'M82');
INSERT INTO public.galaxy VALUES (4, 'Milky way galaxy', NULL, 'band of light', NULL);
INSERT INTO public.galaxy VALUES (5, 'Tadpole galaxy', 'Draca', 'long tail', 'UGC 10214');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool galaxy', 'Canes', 'looks like a whirlpool', 'M51A');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1609, 'month', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 'greek god', 4);
INSERT INTO public.moon VALUES (3, 'IO', 1610, 'ancester to hiracles', 5);
INSERT INTO public.moon VALUES (4, 'Europa', 1610, 'mother of king minos', 5);
INSERT INTO public.moon VALUES (5, 'Arche', 1610, 'one of the muses', 5);
INSERT INTO public.moon VALUES (6, 'Carpo', 1610, 'daughter of zeus', 5);
INSERT INTO public.moon VALUES (7, 'Kallichore', 1610, 'one of the munymphs', 5);
INSERT INTO public.moon VALUES (8, 'Helike', 1610, 'one of the nymphs', 5);
INSERT INTO public.moon VALUES (9, 'Herse', 1610, 'daughter of zeus', 5);
INSERT INTO public.moon VALUES (10, 'Dei', 1610, 'daughter of deioneus', 5);
INSERT INTO public.moon VALUES (11, 'Mimas', 1643, 'son of gaia', 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1765, 'daone of the titans', 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1603, 'greek titan', 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 1785, 'daone of the titans', 6);
INSERT INTO public.moon VALUES (15, 'Cordelia', 1863, 'hamlet', 7);
INSERT INTO public.moon VALUES (16, 'Ophelia', 1985, 'King lear', 7);
INSERT INTO public.moon VALUES (17, 'Julliet', 1963, 'romeo and julliet', 7);
INSERT INTO public.moon VALUES (18, 'Portia', 1585, 'King lear', 7);
INSERT INTO public.moon VALUES (19, 'Helemede', 1563, 'greek mythology', 8);
INSERT INTO public.moon VALUES (20, 'Sao', 1485, 'safety at sea', 8);
INSERT INTO public.moon VALUES (21, 'Neso', 1769, 'greek mythology', 8);
INSERT INTO public.moon VALUES (22, 'Hippocamp', 1780, 'sae-horse', 8);
INSERT INTO public.moon VALUES (23, 'Nix', 1969, 'hydra', 9);
INSERT INTO public.moon VALUES (24, 'Ilmare', 2009, 'greek goddess', 11);
INSERT INTO public.moon VALUES (25, 'Styx', 2019, 'mythic creature', 10);
INSERT INTO public.moon VALUES (26, 'Dysmonia', 2005, 'greek god', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'gray', 0, true, false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'yellow', 0, false, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'blue', 1, true, false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'red', 2, true, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'orange', 53, false, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'hazel', 62, false, true, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'light blue', 27, false, true, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'dark blue', 14, false, true, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'brown', 5, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Varda', 'brown', 1, false, true, 2);
INSERT INTO public.planet VALUES (11, 'TOI 270c', 'yellow', 2, false, false, 2);
INSERT INTO public.planet VALUES (12, 'Eris', 'black', 1, false, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alcor', 81.70, 2.00, 6);
INSERT INTO public.star VALUES (2, 'Sirius', 8.61, -1.33, 4);
INSERT INTO public.star VALUES (3, 'Drocon', 103.80, 7.00, 5);
INSERT INTO public.star VALUES (4, 'Urus', 20.13, 4.00, 3);
INSERT INTO public.star VALUES (5, 'Alto', 7.17, -2.20, 2);
INSERT INTO public.star VALUES (6, 'Keid', 19.19, 10.31, 1);
INSERT INTO public.star VALUES (7, 'Khamba', 16.86, 5.60, 2);


--
-- Name: continent_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continent_continent_id_seq', 33, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

