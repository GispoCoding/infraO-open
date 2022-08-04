-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: infrao | type: DATABASE --
-- DROP DATABASE IF EXISTS infrao;
CREATE DATABASE infrao
	ENCODING = 'UTF8'
	LC_COLLATE = 'en_US.UTF-8'
	LC_CTYPE = 'en_US.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --


-- object: koodistot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS koodistot CASCADE;
CREATE SCHEMA koodistot;
-- ddl-end --
ALTER SCHEMA koodistot OWNER TO postgres;
-- ddl-end --

-- object: kohteet | type: SCHEMA --
-- DROP SCHEMA IF EXISTS kohteet CASCADE;
CREATE SCHEMA kohteet;
-- ddl-end --
ALTER SCHEMA kohteet OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,koodistot,kohteet;
-- ddl-end --

-- object: koodistot.viheralueen_kayttotarkoitus_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.viheralueen_kayttotarkoitus_id_seq CASCADE;
CREATE SEQUENCE koodistot.viheralueen_kayttotarkoitus_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.viheralueen_kayttotarkoitus_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.viheralueen_kayttotarkoitus | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.viheralueen_kayttotarkoitus CASCADE;
CREATE TABLE koodistot.viheralueen_kayttotarkoitus (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT viheralueen_kayttotarkoitus_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.viheralueen_kayttotarkoitus OWNER TO postgres;
-- ddl-end --

-- object: koodistot.varuste_materiaali_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.varuste_materiaali_id_seq CASCADE;
CREATE SEQUENCE koodistot.varuste_materiaali_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.varuste_materiaali_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.varuste_materiaali | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.varuste_materiaali CASCADE;
CREATE TABLE koodistot.varuste_materiaali (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT varuste_materiaali_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.varuste_materiaali OWNER TO postgres;
-- ddl-end --

-- object: koodistot.hoitoluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.hoitoluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.hoitoluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.hoitoluokka_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.hoitoluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.hoitoluokka CASCADE;
CREATE TABLE koodistot.hoitoluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT hoitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.hoitoluokka OWNER TO postgres;
-- ddl-end --

-- object: public.viheralue_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.viheralue_id_seq CASCADE;
CREATE SEQUENCE public.viheralue_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.viheralue_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.viheralue | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.viheralue CASCADE;
CREATE TABLE kohteet.viheralue (
	id serial NOT NULL,
	CONSTRAINT viheralue_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.viheralue OWNER TO postgres;
-- ddl-end --

-- object: public.viheralueenosa_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.viheralueenosa_id_seq CASCADE;
CREATE SEQUENCE public.viheralueenosa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.viheralueenosa_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.viheralueenosa | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.viheralueenosa CASCADE;
CREATE TABLE kohteet.viheralueenosa (
	id serial NOT NULL,
	CONSTRAINT viheralueenosa_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.viheralueenosa OWNER TO postgres;
-- ddl-end --

-- object: koodistot.katuosanlaji_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.katuosanlaji_id_seq CASCADE;
CREATE SEQUENCE koodistot.katuosanlaji_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.katuosanlaji_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.katuosanlaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.katuosanlaji CASCADE;
CREATE TABLE koodistot.katuosanlaji (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT katuosanlaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.katuosanlaji OWNER TO postgres;
-- ddl-end --

-- object: koodistot.talvihoidonluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.talvihoidonluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.talvihoidonluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.talvihoidonluokka_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.talvihoidonluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.talvihoidonluokka CASCADE;
CREATE TABLE koodistot.talvihoidonluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT talvihoidonluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.talvihoidonluokka OWNER TO postgres;
-- ddl-end --

-- object: public.katualue_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.katualue_id_seq CASCADE;
CREATE SEQUENCE public.katualue_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.katualue_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.katualue | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.katualue CASCADE;
CREATE TABLE kohteet.katualue (
	id serial NOT NULL,
	CONSTRAINT katualue_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.katualue OWNER TO postgres;
-- ddl-end --

-- object: public.katualueenosa_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.katualueenosa_id_seq CASCADE;
CREATE SEQUENCE public.katualueenosa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.katualueenosa_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.katualueenosa | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.katualueenosa CASCADE;
CREATE TABLE kohteet.katualueenosa (
	id serial NOT NULL,
	CONSTRAINT katualueenosa_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.katualueenosa OWNER TO postgres;
-- ddl-end --

-- object: public.melu_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.melu_id_seq CASCADE;
CREATE SEQUENCE public.melu_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.melu_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.melu | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.melu CASCADE;
CREATE TABLE kohteet.melu (
	id serial NOT NULL,
	melutyyppi_id integer NOT NULL,
	CONSTRAINT melu_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.melu OWNER TO postgres;
-- ddl-end --

-- object: public.liikunta_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikunta_id_seq CASCADE;
CREATE SEQUENCE public.liikunta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikunta_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.liikunta | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikunta CASCADE;
CREATE TABLE kohteet.liikunta (
	id serial NOT NULL,
	liikuntatyyppi_id integer NOT NULL,
	CONSTRAINT liikunta_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.liikunta OWNER TO postgres;
-- ddl-end --

-- object: public.ymparistotaide_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.ymparistotaide_id_seq CASCADE;
CREATE SEQUENCE public.ymparistotaide_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.ymparistotaide_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.ymparistotaide | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.ymparistotaide CASCADE;
CREATE TABLE kohteet.ymparistotaide (
	id serial NOT NULL,
	ymparistotaidetyyppi_id integer,
	CONSTRAINT ymparistotaide_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.ymparistotaide OWNER TO postgres;
-- ddl-end --

-- object: koodistot.liikuntatyyppi_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.liikuntatyyppi_id_seq CASCADE;
CREATE SEQUENCE koodistot.liikuntatyyppi_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.liikuntatyyppi_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.liikuntatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikuntatyyppi CASCADE;
CREATE TABLE koodistot.liikuntatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT liikuntatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikuntatyyppi OWNER TO postgres;
-- ddl-end --

-- object: public.kaluste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.kaluste_id_seq CASCADE;
CREATE SEQUENCE public.kaluste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.kaluste_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.kaluste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.kaluste CASCADE;
CREATE TABLE kohteet.kaluste (
	id serial NOT NULL,
	kalustetyyppi_id integer NOT NULL,
	CONSTRAINT kaluste_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.kaluste OWNER TO postgres;
-- ddl-end --

-- object: public.valaistus_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.valaistus_id_seq CASCADE;
CREATE SEQUENCE public.valaistus_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.valaistus_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.valaistus | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.valaistus CASCADE;
CREATE TABLE kohteet.valaistus (
	id serial NOT NULL,
	CONSTRAINT valaistus_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.valaistus OWNER TO postgres;
-- ddl-end --

-- object: public.hulevesi_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.hulevesi_id_seq CASCADE;
CREATE SEQUENCE public.hulevesi_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.hulevesi_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.hulevesi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.hulevesi CASCADE;
CREATE TABLE kohteet.hulevesi (
	id serial NOT NULL,
	CONSTRAINT hulevesi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.hulevesi OWNER TO postgres;
-- ddl-end --

-- object: public.jate_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.jate_id_seq CASCADE;
CREATE SEQUENCE public.jate_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.jate_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.jate | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.jate CASCADE;
CREATE TABLE kohteet.jate (
	id serial NOT NULL,
	CONSTRAINT jate_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.jate OWNER TO postgres;
-- ddl-end --

-- object: public.opaste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.opaste_id_seq CASCADE;
CREATE SEQUENCE public.opaste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.opaste_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.opaste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.opaste CASCADE;
CREATE TABLE kohteet.opaste (
	id serial NOT NULL,
	CONSTRAINT opaste_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.opaste OWNER TO postgres;
-- ddl-end --

-- object: public.rakenne_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.rakenne_id_seq CASCADE;
CREATE SEQUENCE public.rakenne_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.rakenne_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.rakenne | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.rakenne CASCADE;
CREATE TABLE kohteet.rakenne (
	id serial NOT NULL,
	CONSTRAINT rakenne_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.rakenne OWNER TO postgres;
-- ddl-end --

-- object: public.ajaratamerkinta_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.ajaratamerkinta_id_seq CASCADE;
CREATE SEQUENCE public.ajaratamerkinta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.ajaratamerkinta_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.ajaratamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.ajaratamerkinta CASCADE;
CREATE TABLE kohteet.ajaratamerkinta (
	id serial NOT NULL,
	CONSTRAINT ajoratamerkinta_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.ajaratamerkinta OWNER TO postgres;
-- ddl-end --

-- object: public.liikennemerkki_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikennemerkki_id_seq CASCADE;
CREATE SEQUENCE public.liikennemerkki_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikennemerkki_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.liikennemerkki | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikennemerkki CASCADE;
CREATE TABLE kohteet.liikennemerkki (
	id serial NOT NULL,
	CONSTRAINT liikennemerkki_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.liikennemerkki OWNER TO postgres;
-- ddl-end --

-- object: public.leikkivaline_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.leikkivaline_id_seq CASCADE;
CREATE SEQUENCE public.leikkivaline_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.leikkivaline_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.leikkivaline | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.leikkivaline CASCADE;
CREATE TABLE kohteet.leikkivaline (
	id serial NOT NULL,
	CONSTRAINT leikkivaline_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.leikkivaline OWNER TO postgres;
-- ddl-end --

-- object: public.muuvaruste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.muuvaruste_id_seq CASCADE;
CREATE SEQUENCE public.muuvaruste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.muuvaruste_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.muuvaruste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.muuvaruste CASCADE;
CREATE TABLE kohteet.muuvaruste (
	id serial NOT NULL,
	CONSTRAINT muuvaruste_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.muuvaruste OWNER TO postgres;
-- ddl-end --

-- object: public.liikennevalo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikennevalo_id_seq CASCADE;
CREATE SEQUENCE public.liikennevalo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikennevalo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.liikennevalo | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikennevalo CASCADE;
CREATE TABLE kohteet.liikennevalo (
	id serial NOT NULL,
	CONSTRAINT liikennevalo_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.liikennevalo OWNER TO postgres;
-- ddl-end --

-- object: koodistot.kunnossapitoluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.kunnossapitoluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.kunnossapitoluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.kunnossapitoluokka_id_seq OWNER TO postgres;
-- ddl-end --

-- object: koodistot.kunnossapitoluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kunnossapitoluokka CASCADE;
CREATE TABLE koodistot.kunnossapitoluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT kunnossapitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kunnossapitoluokka OWNER TO postgres;
-- ddl-end --

INSERT INTO koodistot.kunnossapitoluokka (selite) VALUES (E'ajoradat, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (selite) VALUES (E'ajoradat, luokka II');
-- ddl-end --

-- object: public.abstrakti_varuste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.abstrakti_varuste_id_seq CASCADE;
CREATE SEQUENCE public.abstrakti_varuste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.abstrakti_varuste_id_seq OWNER TO postgres;
-- ddl-end --

-- object: kohteet.abstrakti_varuste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.abstrakti_varuste CASCADE;
CREATE TABLE kohteet.abstrakti_varuste (
	id serial NOT NULL,
	CONSTRAINT abstrakti_varuste_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.abstrakti_varuste OWNER TO postgres;
-- ddl-end --

-- object: koodistot.melutyyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.melutyyyppi CASCADE;
CREATE TABLE koodistot.melutyyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT melutyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.melutyyyppi OWNER TO postgres;
-- ddl-end --

INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'meluaita');
-- ddl-end --
INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'melueste');
-- ddl-end --
INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'melumuuri');
-- ddl-end --
INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'meluvalli');
-- ddl-end --
INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'muu');
-- ddl-end --
INSERT INTO koodistot.melutyyyppi (id, selite) VALUES (DEFAULT, E'ei tiedossa');
-- ddl-end --

-- object: "PostGIS" | type: EXTENSION --
-- DROP EXTENSION IF EXISTS "PostGIS" CASCADE;
CREATE EXTENSION "PostGIS"
WITH SCHEMA public;
-- ddl-end --

-- object: "grant_CU_eb94f049ac" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO postgres;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


