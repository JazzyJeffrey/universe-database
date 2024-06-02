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
-- Name: dwarf_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_galaxy (
    dwarf_galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer NOT NULL,
    number_of_planets integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    description text,
    has_black_hole boolean NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.dwarf_galaxy OWNER TO freecodecamp;

--
-- Name: dwarf_galaxy_dwarf_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_galaxy_dwarf_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_galaxy_dwarf_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_galaxy_dwarf_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_galaxy_dwarf_galaxy_id_seq OWNED BY public.dwarf_galaxy.dwarf_galaxy_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer NOT NULL,
    number_of_planets integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    description text,
    has_black_hole boolean NOT NULL,
    is_visible boolean NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    orbital_period integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    description text,
    has_water boolean NOT NULL,
    is_inhabited boolean NOT NULL
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    distance_from_star integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    atmosphere text,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    temperature integer NOT NULL,
    age integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    description text,
    is_main_sequence boolean NOT NULL,
    has_planets boolean NOT NULL
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
-- Name: dwarf_galaxy dwarf_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_galaxy ALTER COLUMN dwarf_galaxy_id SET DEFAULT nextval('public.dwarf_galaxy_dwarf_galaxy_id_seq'::regclass);


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
-- Data for Name: dwarf_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_galaxy VALUES (1, 'Small Magellanic Cloud', 100000, 5000, 500.00, 'Irregular dwarf galaxy', false, true);
INSERT INTO public.dwarf_galaxy VALUES (2, 'Large Magellanic Cloud', 200000, 10000, 600.00, 'Dwarf galaxy in orbit around the Milky Way', false, true);
INSERT INTO public.dwarf_galaxy VALUES (3, 'Sagittarius Dwarf Spheroidal Galaxy', 30000, 2000, 300.00, 'Satellite galaxy of the Milky Way', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, 100000, 1000.00, 'Our galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2000000, 200000, 1200.00, 'Nearest spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 300000, 30000, 500.00, 'Third largest galaxy in our local group', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400000, 40000, 800.00, 'Interacting grand-design spiral galaxy', true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, 5000, 600.00, 'Notable for its bright nucleus', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 6000000, 600000, 1500.00, 'Supermassive black hole', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 3475, 27, 0.01, 'Earth''s only natural satellite', true, false);
INSERT INTO public.moon VALUES (2, 1, 'Phobos', 22, 0, 0.00, 'Larger and closer moon of Mars', false, false);
INSERT INTO public.moon VALUES (3, 1, 'Deimos', 12, 1, 0.00, 'Smaller and outermost moon of Mars', false, false);
INSERT INTO public.moon VALUES (4, 2, 'Ganymede', 5268, 7, 0.03, 'Largest moon of Jupiter', true, false);
INSERT INTO public.moon VALUES (5, 2, 'Europa', 3122, 4, 0.01, 'Smoothest surface of any known solid object', true, false);
INSERT INTO public.moon VALUES (6, 2, 'Io', 3643, 2, 0.02, 'Most geologically active object in the Solar System', false, false);
INSERT INTO public.moon VALUES (7, 3, 'Titania', 1578, 9, 0.00, 'Largest moon of Uranus', false, false);
INSERT INTO public.moon VALUES (8, 3, 'Oberon', 1523, 13, 0.00, 'Second-largest moon of Uranus', false, false);
INSERT INTO public.moon VALUES (9, 3, 'Umbriel', 1169, 4, 0.00, 'Darker and slightly smaller moon of Uranus', false, false);
INSERT INTO public.moon VALUES (10, 4, 'Triton', 2706, -6, 0.00, 'Largest moon of Neptune', true, false);
INSERT INTO public.moon VALUES (11, 4, 'Nereid', 340, 360, 0.00, 'Third-largest moon of Neptune', false, false);
INSERT INTO public.moon VALUES (12, 5, 'Charon', 1212, 6, 0.01, 'Largest moon of Pluto', true, false);
INSERT INTO public.moon VALUES (13, 6, 'Earth I', 1737, 6, 0.07, 'Largest moon of Kepler-22b', true, false);
INSERT INTO public.moon VALUES (14, 6, 'Earth II', 1356, 12, 0.03, 'Smaller moon of Kepler-22b', false, false);
INSERT INTO public.moon VALUES (15, 7, 'Proxima I', 2234, 8, 0.01, 'Largest moon of Proxima Centauri b', false, false);
INSERT INTO public.moon VALUES (16, 7, 'Proxima II', 1756, 14, 0.01, 'Smaller moon of Proxima Centauri b', false, false);
INSERT INTO public.moon VALUES (17, 8, 'TRAPPIST-1 I', 2567, 5, 0.02, 'Largest moon of TRAPPIST-1e', true, false);
INSERT INTO public.moon VALUES (18, 8, 'TRAPPIST-1 II', 1934, 10, 0.02, 'Smaller moon of TRAPPIST-1e', false, false);
INSERT INTO public.moon VALUES (19, 9, 'Moon A', 2910, 15, 0.03, 'Moon A of Kepler-186f', false, false);
INSERT INTO public.moon VALUES (20, 9, 'Moon B', 1780, 9, 0.02, 'Moon B of Kepler-186f', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 4879, 57910, 0.06, 'Thin atmosphere of trace gases', false, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 12104, 108200, 0.82, 'Thick carbon dioxide atmosphere', false, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 12756, 149600, 1.00, 'Nitrogen-oxygen atmosphere', true, true);
INSERT INTO public.planet VALUES (4, 2, 'Mars', 6792, 227900, 0.11, 'Thin atmosphere mostly carbon dioxide', false, false);
INSERT INTO public.planet VALUES (5, 2, 'Jupiter', 139820, 778500, 317.80, 'Primarily hydrogen and helium', false, false);
INSERT INTO public.planet VALUES (6, 2, 'Saturn', 116460, 1434000, 95.20, 'Primarily hydrogen and helium', false, false);
INSERT INTO public.planet VALUES (7, 3, 'Uranus', 50724, 2871000, 14.50, 'Primarily hydrogen and helium', false, false);
INSERT INTO public.planet VALUES (8, 3, 'Neptune', 49244, 4495000, 17.10, 'Primarily hydrogen and helium', false, false);
INSERT INTO public.planet VALUES (9, 4, 'Kepler-22b', 37856, 210000, 6.40, 'Unknown', false, false);
INSERT INTO public.planet VALUES (10, 4, 'Kepler-186f', 11486, 52500, 1.45, 'Unknown', false, false);
INSERT INTO public.planet VALUES (11, 5, 'Proxima Centauri b', 12628, 7000, 1.17, 'Unknown', false, false);
INSERT INTO public.planet VALUES (12, 5, 'TRAPPIST-1e', 9984, 15100, 0.77, 'Unknown', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 578, 4603000, 1.00, 'Our star', true, true);
INSERT INTO public.star VALUES (2, 2, 'Proxima Centauri', 304, 4800000, 0.12, 'Closest known star to the Sun', true, true);
INSERT INTO public.star VALUES (3, 3, 'Sirius', 994, 242000, 2.02, 'Brightest star in the night sky', true, true);
INSERT INTO public.star VALUES (4, 4, 'Betelgeuse', 350, 87000, 18.00, 'Red supergiant star', false, true);
INSERT INTO public.star VALUES (5, 5, 'Rigel', 1210, 86000, 21.00, 'Blue supergiant', false, true);
INSERT INTO public.star VALUES (6, 6, 'Vega', 960, 455000, 2.14, 'Bright star in the constellation Lyra', true, true);


--
-- Name: dwarf_galaxy_dwarf_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_galaxy_dwarf_galaxy_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_galaxy dwarf_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_galaxy
    ADD CONSTRAINT dwarf_galaxy_name_key UNIQUE (name);


--
-- Name: dwarf_galaxy dwarf_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_galaxy
    ADD CONSTRAINT dwarf_galaxy_pkey PRIMARY KEY (dwarf_galaxy_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

