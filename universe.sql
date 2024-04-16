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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric NOT NULL,
    type text,
    has_life boolean
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
    name character varying(30),
    mass_in_quadrillion_kg numeric NOT NULL,
    mean_density numeric NOT NULL,
    surface_gravity numeric NOT NULL,
    composition text,
    escape_velocity numeric,
    surface_temperature integer NOT NULL,
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
    name character varying(30),
    mass_in_quadrillion_kg numeric NOT NULL,
    diameter_in_km integer NOT NULL,
    density integer NOT NULL,
    temperature integer NOT NULL,
    is_livable boolean,
    number_of_moons integer,
    composition text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_coordinates; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_coordinates (
    planet_coordinates_id integer NOT NULL,
    name character varying(20),
    system text DEFAULT 'horizontal'::text,
    altitude numeric NOT NULL,
    azimuth numeric NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_coordinates OWNER TO freecodecamp;

--
-- Name: planet_coordinates_planet_coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_coordinates_planet_coordinates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_coordinates_planet_coordinates_id_seq OWNER TO freecodecamp;

--
-- Name: planet_coordinates_planet_coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_coordinates_planet_coordinates_id_seq OWNED BY public.planet_coordinates.planet_coordinates_id;


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
    name character varying(30),
    distance numeric NOT NULL,
    radius integer NOT NULL,
    temperature integer NOT NULL,
    chemical_composition text,
    brightness numeric NOT NULL,
    class character varying(1),
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
-- Name: planet_coordinates planet_coordinates_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_coordinates ALTER COLUMN planet_coordinates_id SET DEFAULT nextval('public.planet_coordinates_planet_coordinates_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 25881, 9006, 1150000000000, 'spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2538000, 9006, 1100000000000, 'spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Black eye', 17000000, 13280, 50000000000, 'spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 489200000, 100, 2900000000, 'irregular', false);
INSERT INTO public.galaxy VALUES (5, 'Circinus', 13050000, 800, 7200000000, 'spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 29350000, 13250, 800000000000, 'spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 0.0734, 3344, 1.622, 'He,Ar,Ne', 2.32, 250, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1.06, 1861, 0.0057, 'He,Ar,Ne', 11.39, 233, 8);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.51, 1465, 0.003, 'He,Ar,Ne', 5.556, 233, 8);
INSERT INTO public.moon VALUES (4, 'Lo', 8.931, 3528, 1.796, 'SO2', 2.558, 110, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 4.799, 3013, 1.314, 'Fe,H2O', 2.025, 102, 4);
INSERT INTO public.moon VALUES (6, 'Garymede', 1.4819, 1936, 1.428, 'Fe2,O2,Si', 2.741, 110, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 1.0759, 1834, 1.235, 'CO2,O2', 2.441, 134, 4);
INSERT INTO public.moon VALUES (8, 'Miranda', 6.293, 1184, 0.076, 'H2O,Si', 0.189, 60, 6);
INSERT INTO public.moon VALUES (9, 'Ariel', 1.2331, 1517, 0.246, 'H2O,C', 0.533, 60, 6);
INSERT INTO public.moon VALUES (10, 'Umbriel', 1.2885, 1539, 0.252, 'H2O,C', 0.542, 75, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 3.445, 1683, 0.371, 'CO2,N,CH4', 0.765, 70, 6);
INSERT INTO public.moon VALUES (12, 'Oberon', 3.1104, 1682, 0.358, 'H2O,C', 0.738, 75, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1.3452, 1879, 1.352, NULL, 2.641, 93, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 2.306, 1.2371, 0.264, NULL, 0.635, 53, 5);
INSERT INTO public.moon VALUES (15, 'Triton', 2.1389, 2061, 0.779, 'NH4,N', 1.455, 38, 5);
INSERT INTO public.moon VALUES (16, 'Nereid', 3.57, 1500, 0.075, NULL, NULL, 50, 5);
INSERT INTO public.moon VALUES (17, 'Proteus', 1.55, 460, 0.023, 'CH4,CN', 0.099, 51, 5);
INSERT INTO public.moon VALUES (18, 'Naiad', 1.2, 800, 0.016, NULL, NULL, 51, 5);
INSERT INTO public.moon VALUES (19, 'Thalassa', 3.54, 1230, 0.084, NULL, NULL, 51, 5);
INSERT INTO public.moon VALUES (20, 'Despina', 0.71, 400, 0.006, NULL, 0.032, 51, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, 4880, 5427, 437, false, 0, 'Ni,Si,S,C', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.8675, 12100, 5243, 232, true, 0, 'Fe,CO2,N', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5972, 12740, 5513, 255, true, 1, 'Fe,O2,Si,Mg', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1898.2, 139820, 1326, 88, false, 95, 'H,He', 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 568.34, 116460, 687, 134, false, 146, 'H,He', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 86.810, 50720, 1270, 76, false, 28, 'CH4,NH3,H2O', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 102.409, 49240, 1638, 72, false, 16, 'H,He,CH4', 1);
INSERT INTO public.planet VALUES (8, 'Mars', 0.6417, 6780, 3933, 209, false, 2, 'Fe,Ni,S', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-243', 2.475, 6540, 2470, 145, false, 15, 'Fe,Ni,CO2', 2);
INSERT INTO public.planet VALUES (10, 'Galilieo-22', 14.384, 38260, 1327, 86, false, 22, 'H,He', 3);
INSERT INTO public.planet VALUES (11, 'GOP-A2', 0.73, 6240, 5120, 215, false, 0, 'Ni,Si,CO2', 4);
INSERT INTO public.planet VALUES (12, 'Odipus-4C', 10.361, 28100, 3491, 174, false, 53, 'NH3,He,H', 5);
INSERT INTO public.planet VALUES (13, 'M652-x', 692.15, 137220, 884, 94, false, 104, 'H,He', 6);


--
-- Data for Name: planet_coordinates; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 150070000, 696340, 5772, 'H,He', 98000, 'G', 1);
INSERT INTO public.star VALUES (2, 'Mirach', 199, 69570000, 3842, 'C,He', 186000000, 'M', 2);
INSERT INTO public.star VALUES (3, 'Alpheratz', 97, 1880000, 13800, 'Hg,Mn', 23520000, 'B', 2);
INSERT INTO public.star VALUES (4, 'Antares', 240, 2400000, 6240, 'C,He', 450000, 'K', 3);
INSERT INTO public.star VALUES (5, 'Sirius', 321, 278000, 4270, 'Mn,He', 2479000, 'B', 5);
INSERT INTO public.star VALUES (6, 'Altair', 754, 1360000, 9340, 'H,He', 274000000, 'M', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_coordinates_planet_coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_coordinates_planet_coordinates_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_coordinates planet_coordinates_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_coordinates
    ADD CONSTRAINT planet_coordinates_name_key UNIQUE (name);


--
-- Name: planet_coordinates planet_coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_coordinates
    ADD CONSTRAINT planet_coordinates_pkey PRIMARY KEY (planet_coordinates_id);


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
-- Name: planet_coordinates planet_coordinates_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_coordinates
    ADD CONSTRAINT planet_coordinates_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

