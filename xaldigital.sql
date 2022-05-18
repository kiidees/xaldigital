--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: aerolineas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aerolineas (
    id_aerolinea integer NOT NULL,
    nombre_aerolinea character varying
);


ALTER TABLE public.aerolineas OWNER TO postgres;

--
-- Name: aeropuertos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeropuertos (
    id_aeropuerto integer NOT NULL,
    nombre_aeropuerto character varying NOT NULL
);


ALTER TABLE public.aeropuertos OWNER TO postgres;

--
-- Name: movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos (
    id_movimiento integer NOT NULL,
    descripcion character varying NOT NULL
);


ALTER TABLE public.movimientos OWNER TO postgres;

--
-- Name: vuelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelos (
    id_aerolinea integer,
    id_aeropuerto integer,
    id_movimiento integer,
    dia date,
    id_vuelo integer NOT NULL
);


ALTER TABLE public.vuelos OWNER TO postgres;

--
-- Data for Name: aerolineas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aerolineas (id_aerolinea, nombre_aerolinea) FROM stdin;
1	Volaris
2	Aeromar
3	Interjet
4	Aeromexico
\.


--
-- Data for Name: aeropuertos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeropuertos (id_aeropuerto, nombre_aeropuerto) FROM stdin;
1	Benito Juarez
2	Guanajuato
3	La paz
4	Oaxaca
\.


--
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos (id_movimiento, descripcion) FROM stdin;
1	Salida
2	Llegada
\.


--
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelos (id_aerolinea, id_aeropuerto, id_movimiento, dia, id_vuelo) FROM stdin;
1	1	1	2021-05-02	1
2	1	1	2021-05-02	2
3	2	2	2021-05-02	3
4	3	2	2021-05-02	4
1	3	2	2021-05-02	5
2	1	1	2021-05-02	6
2	3	1	2021-05-04	7
3	4	1	2021-05-04	8
3	4	1	2021-05-04	9
\.


--
-- Name: aerolineas aerolineas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerolineas
    ADD CONSTRAINT aerolineas_pkey PRIMARY KEY (id_aerolinea);


--
-- Name: aeropuertos aeropuertos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeropuertos
    ADD CONSTRAINT aeropuertos_pkey PRIMARY KEY (id_aeropuerto);


--
-- Name: movimientos movimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT movimientos_pkey PRIMARY KEY (id_movimiento);


--
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (id_vuelo);


--
-- Name: vuelos fk_aerolinea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT fk_aerolinea FOREIGN KEY (id_aerolinea) REFERENCES public.aerolineas(id_aerolinea) NOT VALID;


--
-- Name: vuelos fk_aeropuerto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT fk_aeropuerto FOREIGN KEY (id_aeropuerto) REFERENCES public.aeropuertos(id_aeropuerto) NOT VALID;


--
-- Name: vuelos fk_movimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT fk_movimiento FOREIGN KEY (id_movimiento) REFERENCES public.movimientos(id_movimiento) NOT VALID;


--
-- PostgreSQL database dump complete
--

