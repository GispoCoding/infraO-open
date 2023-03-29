-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.2
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- object: infrao_admin | type: ROLE --
-- DROP ROLE IF EXISTS infrao_admin;
CREATE ROLE infrao_admin WITH 
	CREATEROLE
	LOGIN;
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: infrao | type: DATABASE --
-- DROP DATABASE IF EXISTS infrao;
CREATE DATABASE infrao
	TABLESPACE = pg_default
	OWNER = infrao_admin;
-- ddl-end --


-- object: koodistot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS koodistot CASCADE;
CREATE SCHEMA koodistot;
-- ddl-end --
ALTER SCHEMA koodistot OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet | type: SCHEMA --
-- DROP SCHEMA IF EXISTS kohteet CASCADE;
CREATE SCHEMA kohteet;
-- ddl-end --
ALTER SCHEMA kohteet OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit | type: SCHEMA --
-- DROP SCHEMA IF EXISTS abstraktit CASCADE;
CREATE SCHEMA abstraktit;
-- ddl-end --
ALTER SCHEMA abstraktit OWNER TO infrao_admin;
-- ddl-end --

-- object: meta | type: SCHEMA --
-- DROP SCHEMA IF EXISTS meta CASCADE;
CREATE SCHEMA meta;
-- ddl-end --
ALTER SCHEMA meta OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet | type: SCHEMA --
-- DROP SCHEMA IF EXISTS varusteet CASCADE;
CREATE SCHEMA varusteet;
-- ddl-end --
ALTER SCHEMA varusteet OWNER TO infrao_admin;
-- ddl-end --

-- object: katualue | type: SCHEMA --
-- DROP SCHEMA IF EXISTS katualue CASCADE;
CREATE SCHEMA katualue;
-- ddl-end --

-- object: viheralue | type: SCHEMA --
-- DROP SCHEMA IF EXISTS viheralue CASCADE;
CREATE SCHEMA viheralue;
-- ddl-end --

-- object: kasvillisuus | type: SCHEMA --
-- DROP SCHEMA IF EXISTS kasvillisuus CASCADE;
CREATE SCHEMA kasvillisuus;
-- ddl-end --

-- object: osoite | type: SCHEMA --
-- DROP SCHEMA IF EXISTS osoite CASCADE;
CREATE SCHEMA osoite;
-- ddl-end --
ALTER SCHEMA osoite OWNER TO infrao_admin;
-- ddl-end --
COMMENT ON SCHEMA osoite IS E'Sisältää kohteiden osoitetietoja.\nRatkottava: kuinka tämä tieto populoidaan jostain muualta? Digitransit API? OpenStreetMap? Kunnan oma osoitetietokanta?';
-- ddl-end --

SET search_path TO pg_catalog,public,koodistot,kohteet,abstraktit,meta,varusteet,katualue,viheralue,kasvillisuus,osoite;
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
ALTER SEQUENCE koodistot.viheralueen_kayttotarkoitus_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.viheralueenkayttotarkoitus | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.viheralueenkayttotarkoitus CASCADE;
CREATE TABLE koodistot.viheralueenkayttotarkoitus (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT viheralueen_kayttotarkoitus_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.viheralueenkayttotarkoitus OWNER TO infrao_admin;
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
ALTER SEQUENCE koodistot.varuste_materiaali_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.varustemateriaali | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.varustemateriaali CASCADE;
CREATE TABLE koodistot.varustemateriaali (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT varuste_materiaali_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.varustemateriaali OWNER TO infrao_admin;
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
ALTER SEQUENCE koodistot.hoitoluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.hoitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.hoitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.hoitoluokkatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT hoitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.hoitoluokkatyyppi OWNER TO infrao_admin;
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
ALTER SEQUENCE public.viheralue_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
CREATE EXTENSION postgis
WITH SCHEMA public;
-- ddl-end --

-- object: kohteet.viheralueenosa_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS kohteet.viheralueenosa_id_seq CASCADE;
CREATE SEQUENCE kohteet.viheralueenosa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE kohteet.viheralueenosa_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: viheralue.viheralue | type: TABLE --
-- DROP TABLE IF EXISTS viheralue.viheralue CASCADE;
CREATE TABLE viheralue.viheralue (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	geom geometry(MULTIPOLYGONZ, 3067),
	CONSTRAINT viheralue_pk PRIMARY KEY (fid)
);
-- ddl-end --
COMMENT ON TABLE viheralue.viheralue IS E'TODO: need other attributes?';
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
ALTER SEQUENCE koodistot.katuosanlaji_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.katuosanlaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.katuosanlaji CASCADE;
CREATE TABLE koodistot.katuosanlaji (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT katuosanlaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.katuosanlaji OWNER TO infrao_admin;
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
ALTER SEQUENCE koodistot.talvihoidonluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.talvihoidonluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.talvihoidonluokka CASCADE;
CREATE TABLE koodistot.talvihoidonluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT talvihoidonluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.talvihoidonluokka OWNER TO infrao_admin;
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
ALTER SEQUENCE public.katualue_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: katualue.katualue | type: TABLE --
-- DROP TABLE IF EXISTS katualue.katualue CASCADE;
CREATE TABLE katualue.katualue (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	geom geometry(MULTIPOLYGONZ, 3067),
	CONSTRAINT katualue_fid_pk PRIMARY KEY (fid)
);
-- ddl-end --
COMMENT ON TABLE katualue.katualue IS E'TODO: other attributes?';
-- ddl-end --
ALTER TABLE katualue.katualue OWNER TO infrao_admin;
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
ALTER SEQUENCE public.katualueenosa_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: viheralue.viheralueenosa | type: TABLE --
-- DROP TABLE IF EXISTS viheralue.viheralueenosa CASCADE;
CREATE TABLE viheralue.viheralueenosa (
	fid bigint NOT NULL,
	omistaja varchar(255),
	haltija varchar(255),
	kunnossapitaja varchar(255),
	perusparannusvuosi smallint,
	valmistumisvuosi smallint,
	suojelualuekytkin boolean,
	kayttotarkoitus_id integer,
	laji_id integer,
	hoitoluokka_id integer,
	katualueenlaji_id integer,
	suunnitelmalinkkitieto_id integer,
	talvihoidonluokka_id integer,
	puhtaanapitoluokka_id integer,
	muutoshoitoluokka_id integer,
	sisaltaakasvillisuus integer,
	sisaltaavaruste integer,
	geom geometry(MULTIPOLYGON, 3067),
	fid_viheralue bigint,
	CONSTRAINT viheralueenosa_fid_pk PRIMARY KEY (fid)
);
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
ALTER SEQUENCE public.melu_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.abstractvaruste | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractvaruste CASCADE;
CREATE TABLE abstraktit.abstractvaruste (
	id serial NOT NULL,
	malli text,
	perusparannusvuosi smallint,
	suunta text,
	valmistaja text,
	valmistumisvuosi smallint,
	kuuluuviheralueenosaan integer,
	kuuluukatualueenosaan integer,
	materiaali_id integer,
	suunnitelmalinkkitieto integer,
	geom_poly geometry(POLYGONZ, 3067),
	geom_piste geometry(POINTZ, 3067),
	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT abstractvaruste_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.abstractvaruste OWNER TO infrao_admin;
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
ALTER SEQUENCE public.liikunta_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: katualue.katualueenosa | type: TABLE --
-- DROP TABLE IF EXISTS katualue.katualueenosa CASCADE;
CREATE TABLE katualue.katualueenosa (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	paatostieto_id integer,
	kunnossapito varchar(255),
	leveys double precision,
	perusparannusvuosi integer,
	pinta_ala double precision,
	pituus double precision,
	puhtaanapito varchar(255),
	talvikunnossapito varchar(255),
	kuuluukatualueeseen_id integer,
	sisaltaakeskilinja_id integer,
	luokka_id integer,
	kunnossapitoluokka_id integer,
	katuosanlaji_id integer,
	pintamateriaali_id integer,
	viherosanlajityypi_id integer,
	suunnitelmalinkkitieto_id integer,
	talvihoidonluokka_id integer,
	sisaltaakasvillisuus_id integer,
	geom geometry(MULTIPOLYGONZ, 3067),
	fid_katualue bigint,
	CONSTRAINT katualueenosa_pk PRIMARY KEY (fid)
);
-- ddl-end --
COMMENT ON COLUMN katualue.katualueenosa.geom IS E'sijaintitieto';
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
ALTER SEQUENCE public.ymparistotaide_id_seq OWNER TO infrao_admin;
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
ALTER SEQUENCE koodistot.liikuntatyyppi_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.liikuntatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikuntatyyppi CASCADE;
CREATE TABLE koodistot.liikuntatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT liikuntatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikuntatyyppi OWNER TO infrao_admin;
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
ALTER SEQUENCE public.kaluste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.melukohde | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.melukohde CASCADE;
CREATE TABLE varusteet.melukohde (
	id serial NOT NULL,
	melutyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT melu_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE varusteet.melukohde OWNER TO infrao_admin;
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
ALTER SEQUENCE public.valaistus_id_seq OWNER TO infrao_admin;
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
ALTER SEQUENCE public.hulevesi_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.liikunta | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.liikunta CASCADE;
CREATE TABLE varusteet.liikunta (
	id serial NOT NULL,
	liikuntatyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT liikunta_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE varusteet.liikunta OWNER TO infrao_admin;
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
ALTER SEQUENCE public.jate_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.jate | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.jate CASCADE;
CREATE TABLE varusteet.jate (
	id serial NOT NULL,
	jatetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT jate_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
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
ALTER SEQUENCE public.opaste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.opaste | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.opaste CASCADE;
CREATE TABLE varusteet.opaste (
	id serial NOT NULL,
	opastetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT opaste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
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
ALTER SEQUENCE public.rakenne_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.rakenne | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.rakenne CASCADE;
CREATE TABLE kohteet.rakenne (
	id serial NOT NULL,
	rakennetyyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT rakenne_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.rakenne OWNER TO infrao_admin;
-- ddl-end --

-- object: public.ajoratamerkinta_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.ajoratamerkinta_id_seq CASCADE;
CREATE SEQUENCE public.ajoratamerkinta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.ajoratamerkinta_id_seq OWNER TO infrao_admin;
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
ALTER SEQUENCE public.liikennemerkki_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.liikennemerkki | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.liikennemerkki CASCADE;
CREATE TABLE varusteet.liikennemerkki (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	nimi varchar,
	identifier uuid GENERATED ALWAYS AS (gen_random_uuid()) STORED,
	liikennemerkkityyppi_id integer,
	liikennemerkkityyppi2020_id integer,
	wkb_geometry geometry(POINT, 3067),
	CONSTRAINT liikennemerkki_pk PRIMARY KEY (fid)
);
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
ALTER SEQUENCE public.leikkivaline_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.leikkivaline | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.leikkivaline CASCADE;
CREATE TABLE varusteet.leikkivaline (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	leikkivalinetyyppi_id integer,
	wkb_geometry geometry(POINT, 3067),
	CONSTRAINT leikkivaline_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE varusteet.leikkivaline OWNER TO infrao_admin;
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
ALTER SEQUENCE public.muuvaruste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: varusteet.muuvaruste | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.muuvaruste CASCADE;
CREATE TABLE varusteet.muuvaruste (
	id serial NOT NULL,
	muuvarustetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT muuvaruste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE varusteet.muuvaruste OWNER TO infrao_admin;
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
ALTER SEQUENCE public.liikennevalo_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: katualue.liikennevalo | type: TABLE --
-- DROP TABLE IF EXISTS katualue.liikennevalo CASCADE;
CREATE TABLE katualue.liikennevalo (
	id serial NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT liikennevalo_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
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
ALTER SEQUENCE koodistot.kunnossapitoluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kunnossapitoluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kunnossapitoluokka CASCADE;
CREATE TABLE koodistot.kunnossapitoluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT kunnossapitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kunnossapitoluokka OWNER TO infrao_admin;
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
ALTER SEQUENCE public.abstrakti_varuste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.melutyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.melutyyppi CASCADE;
CREATE TABLE koodistot.melutyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT melutyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.melutyyppi OWNER TO infrao_admin;
-- ddl-end --








-- object: abstraktit.abstractpaikkatietopalvelukohde | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractpaikkatietopalvelukohde CASCADE;
CREATE TABLE abstraktit.abstractpaikkatietopalvelukohde (
	id serial NOT NULL,
	name text,
	abstract boolean,
	metatieto text,
	yksilointitieto text,
	alkuhetki date,
	loppuhetki date,
	CONSTRAINT abstractpaikkatietopalvelukohde_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.alkuhetki IS E'Kohteen luontipäivämäärä';
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.loppuhetki IS E'Milloin kohde on poistettu. Tämän avulla voidaan tunnistaa poistetut kohteet, jos järjestelmät tukevat historiatietojen tallentamista';
-- ddl-end --
ALTER TABLE abstraktit.abstractpaikkatietopalvelukohde OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kalustetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kalustetyyppi CASCADE;
CREATE TABLE koodistot.kalustetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kalustetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kalustetyyppi OWNER TO infrao_admin;
-- ddl-end --











-- object: koodistot.opastetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.opastetyyppi CASCADE;
CREATE TABLE koodistot.opastetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT opastetyyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.opastetyyppi OWNER TO infrao_admin;
-- ddl-end --







-- object: koodistot.jatetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.jatetyyppi CASCADE;
CREATE TABLE koodistot.jatetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT jatetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.jatetyyppi OWNER TO infrao_admin;
-- ddl-end --







-- object: koodistot.pintamateriaali | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.pintamateriaali CASCADE;
CREATE TABLE koodistot.pintamateriaali (
	id serial NOT NULL,
	selite text,
	CONSTRAINT pintamateriaali_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.pintamateriaali OWNER TO infrao_admin;
-- ddl-end --





















-- object: koodistot.hulevesityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.hulevesityyppi CASCADE;
CREATE TABLE koodistot.hulevesityyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT hulevesityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.hulevesityyppi OWNER TO infrao_admin;
-- ddl-end --



























-- object: koodistot.ajoratamerkintatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ajoratamerkintatyyppi CASCADE;
CREATE TABLE koodistot.ajoratamerkintatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT ajoramerkintatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.ajoratamerkintatyyppi OWNER TO infrao_admin;
-- ddl-end --







-- object: koodistot.puutyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puutyyppi CASCADE;
CREATE TABLE koodistot.puutyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT puutyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.puutyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'1', E'havupuu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'2', E'lehtipuu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'3', E'muu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'4', E'ei tiedossa');
-- ddl-end --

-- object: abstraktit.abstractkasvillisuus | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractkasvillisuus CASCADE;
CREATE TABLE abstraktit.abstractkasvillisuus (
	id serial NOT NULL,
	omistaja varchar(255),
	haltija varchar(255),
	kunnossapitaja varchar(255),
	korkeusmitta smallint,
	ymparysmitta smallint,
	puutyyppi_id integer,
	puulaji_id integer,
	sijaintitieto geometry(POLYGON, 3067),
	kuuluuviheralueenosaan integer,
	kuuluukatualueenosaan integer,
	CONSTRAINT abstractkasvillisuus_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.abstractkasvillisuus OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.puulaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puulaji CASCADE;
CREATE TABLE koodistot.puulaji (
	id serial NOT NULL,
	selite text,
	CONSTRAINT puulaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.puulaji OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.puulaji (id, selite) VALUES (E'1', E'Abies amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'2', E'Abies balsamea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'3', E'Abies concolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'4', E'Abies fraseri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'5', E'Abies grandis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'6', E'Abies holophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'7', E'Abies homolepis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'8', E'Abies koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'9', E'Abies lasiocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'10', E'Abies lasiocarpa var. arizonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'11', E'Abies mariesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'12', E'Abies nephrolepis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'13', E'Abies nordmanniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'14', E'Abies procera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'15', E'Abies sachalinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'16', E'Abies sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'17', E'Abies sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'18', E'Abies veitchii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'19', E'Acanthopanax senticosus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'20', E'Acer barbinerve');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'21', E'Acer campestre');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'22', E'Acer circinatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'23', E'Acer japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'24', E'Acer mono');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'25', E'Acer negundo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'26', E'Acer palmatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'27', E'Acer pensylvanicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'28', E'Acer platanoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'29', E'Acer platanoides ''Reitenbachii''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'30', E'Acer platanoides ''Schwedleri''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'31', E'Acer pseudoplatanus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'32', E'Acer pseudosieboldianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'33', E'Acer rubrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'34', E'Acer saccharinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'35', E'Acer saccharum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'36', E'Acer sieboldianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'37', E'Acer sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'38', E'Acer spicatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'39', E'Acer tataricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'40', E'Acer tataricum subsp. ginnala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'41', E'Acer tataricum subsp. semenowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'42', E'Acer tataricum subsp. tataricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'43', E'Acer tegmentosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'44', E'Acer triflorum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'45', E'Acer ukurunduense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'46', E'Actinidia arguta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'47', E'Actinidia kolomikta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'48', E'Aesculus hippocastanum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'49', E'Aesculus octandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'50', E'Alnus glutinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'51', E'Alnus glutinosa f. quercifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'52', E'Alnus incana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'53', E'Alnus incana f. gibberosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'54', E'Alnus incana f. laciniata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'55', E'Alnus incana subsp. kolaënsis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'56', E'Alnus mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'57', E'Alnus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'58', E'Alnus viridis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'59', E'Amelanchier alnifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'60', E'Amelanchier laevis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'61', E'Amelanchier lamarckii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'62', E'Amelanchier sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'63', E'Amelanchier spicata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'64', E'Andromeda polifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'65', E'Aralia elata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'66', E'Arctostaphylos alpinus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'67', E'Arctostaphylos uva-ursi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'68', E'Aristolochia macrophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'69', E'Aronia ×prunifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'70', E'Aronia arbutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'71', E'Aronia melanocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'72', E'Aronia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'73', E'Artemisia abronatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'74', E'Berberis koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'75', E'Berberis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'76', E'Berberis thunbergii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'77', E'Berberis vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'78', E'Betula alleghaniensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'79', E'Betula ermanii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'80', E'Betula fruticosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'81', E'Betula lenta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'82', E'Betula nana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'83', E'Betula papyrifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'84', E'Betula pendula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'85', E'Betula pendula ''Dalecarlica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'86', E'Betula pendula f. bircalensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'87', E'Betula pendula f. crispa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'88', E'Betula pendula f. palmeri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'89', E'Betula pendula f. tristis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'90', E'Betula pendula var. carelica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'91', E'Betula pendula ''Youngii''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'92', E'Betula pubescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'93', E'Betula pubescens f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'94', E'Betula pubescens f. rubra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'95', E'Betula pubescens subsp. czerepanovii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'96', E'Betula sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'97', E'Buddleja davidii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'98', E'Buxus sempervirens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'99', E'Calluna vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'100', E'Caragana arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'101', E'Caragana aurantiaca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'102', E'Caragana frutex');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'103', E'Carpinus betulus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'104', E'Cassiope hypnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'105', E'Cassiope tetragona');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'106', E'Celastrus orbiculatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'107', E'Celastrus scandens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'108', E'Cercidiphyllum japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'109', E'Cercidiphyllum magnificum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'110', E'Chaenomeles japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'111', E'Chamaecyparis lawsoniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'112', E'Chamaecyparis nootkatensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'113', E'Chamaecyparis pisifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'114', E'Chamaecyparis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'115', E'Chamaedaphne calyculata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'116', E'Chimaphila umbellata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'117', E'Cladrastis kentukea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'118', E'Clematis alpina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'119', E'Clematis ochotensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'120', E'Clematis sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'121', E'Clematis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'122', E'Clematis tangutica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'123', E'Clematis vitalba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'124', E'Clematis viticella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'125', E'Colutea arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'126', E'Cornus alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'127', E'Cornus alba ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'128', E'Cornus alba subsp. alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'129', E'Cornus alba subsp. stolonifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'130', E'Cornus mas');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'131', E'Cornus sanguinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'132', E'Cornus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'133', E'Corylus avellana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'134', E'Corylus colurna');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'135', E'Corylus cornuta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'136', E'Corylus maxima ''Purpurea''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'137', E'Corylus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'138', E'Cotoneaster dammeri ');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'139', E'Cotoneaster dammeri var. radicans');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'140', E'Cotoneaster divaricatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'141', E'Cotoneaster horizontalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'142', E'Cotoneaster integerrimus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'143', E'Cotoneaster lucidus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'144', E'Cotoneaster nanshan');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'145', E'Cotoneaster niger');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'146', E'Cotoneaster ''Skogholm''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'147', E'Cotoneaster sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'148', E'Crataegus ×mordenensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'149', E'Crataegus chlorosarca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'150', E'Crataegus douglasii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'151', E'Crataegus flabellata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'152', E'Crataegus grayana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'153', E'Crataegus intricata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'154', E'Crataegus korolkovii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'155', E'Crataegus laevigata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'156', E'Crataegus macracantha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'157', E'Crataegus monogyna');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'158', E'Crataegus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'159', E'Crataegus rhipidophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'160', E'Crataegus sanguinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'161', E'Crataegus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'162', E'Crataegus submollis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'163', E'Cytisus ×versicolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'164', E'Cytisus decumbens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'165', E'Cytisus glaber');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'166', E'Cytisus purpureus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'167', E'Cytisus scoparius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'168', E'Cytisus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'169', E'Daphne blagayana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'170', E'Daphne cneorum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'171', E'Daphne mezereum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'172', E'Daphne sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'173', E'Deutzia amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'174', E'Deutzia scabra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'175', E'Diapensia lapponica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'176', E'Diervilla lonicera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'177', E'Diervilla sessilifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'178', E'Dryas octopetala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'179', E'Elaeagnus commutata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'180', E'Empetrum nigrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'181', E'Erica herbacea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'182', E'Erica tetralix');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'183', E'Euonymus alatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'184', E'Euonymus europaeus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'185', E'Euonymus fortunei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'186', E'Euonymus hamiltonianus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'187', E'Euonymus nanus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'188', E'Euonymus planipes');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'189', E'Euonymus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'190', E'Exochorda racemosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'191', E'Fagus grandifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'192', E'Fagus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'193', E'Fagus sylvatica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'194', E'Fagus sylvatica f. purpurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'195', E'Forsythia ovata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'196', E'Fothergilla major');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'197', E'Fraxinus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'198', E'Fraxinus excelsior');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'199', E'Fraxinus mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'200', E'Fraxinus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'201', E'Fraxinus pennsylvanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'202', E'Fraxinus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'203', E'Genista tinctoria');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'204', E'Ginkgo biloba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'205', E'Gleditsia triacanthos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'206', E'Halesia carolina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'207', E'Hamamelis virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'208', E'Hedera helix');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'209', E'Hippophaë rhamnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'210', E'Holodiscus discolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'211', E'Hydrangea anomala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'212', E'Hydrangea anomala subsp. petiolaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'213', E'Hydrangea arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'214', E'Hydrangea heteromalla ''Bretschneideri''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'215', E'Hydrangea paniculata ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'216', E'Hydrangea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'217', E'Ilex verticillata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'218', E'Jamesia americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'219', E'Juglans ailanthifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'220', E'Juglans cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'221', E'Juglans mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'222', E'Juglans nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'223', E'Juglans sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'224', E'Juniperus chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'225', E'Juniperus communis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'226', E'Juniperus communis subsp. alpina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'227', E'Juniperus horizontalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'228', E'Juniperus sabina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'229', E'Juniperus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'230', E'Juniperus squamata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'231', E'Juniperus virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'232', E'Kalmia angustifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'233', E'Kalmia latifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'234', E'Kalmia polifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'235', E'Kalmia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'236', E'Kerria japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'237', E'Kolkwitzia amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'238', E'Laburnum ×watereri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'239', E'Laburnum alpinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'240', E'Larix ×marschlinsii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'241', E'Larix decidua');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'242', E'Larix decidua subsp. polonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'243', E'Larix gmelinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'244', E'Larix gmelinii var. gmelinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'245', E'Larix gmelinii var. japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'246', E'Larix gmelinii var. olgensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'247', E'Larix gmelinii var. principis-rupprechtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'248', E'Larix kaempferi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'249', E'Larix laricina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'250', E'Larix lyallii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'251', E'Larix occidentalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'252', E'Larix sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'253', E'Larix sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'254', E'Ledum palustre');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'255', E'Ligustrum vulgare');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'256', E'Linnaea borealis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'257', E'Liquidambar styraciflua');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'258', E'Liriodendron tulipifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'259', E'Loiseleuria procumbens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'260', E'Lonicera ×bella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'261', E'Lonicera ×brownii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'262', E'Lonicera ×notha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'263', E'Lonicera ×xylosteoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'264', E'Lonicera albertii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'265', E'Lonicera alpigena');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'266', E'Lonicera caerulea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'267', E'Lonicera caprifolium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'268', E'Lonicera caucasica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'269', E'Lonicera chrysantha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'270', E'Lonicera involucrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'271', E'Lonicera maackii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'272', E'Lonicera nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'273', E'Lonicera periclymenum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'274', E'Lonicera sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'275', E'Lonicera tatarica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'276', E'Lonicera xylosteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'277', E'Maackia amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'278', E'Magnolia acuminata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'279', E'Magnolia kobus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'280', E'Magnolia sieboldii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'281', E'Magnolia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'282', E'Mahonia aquifolium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'283', E'Malus baccata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'284', E'Malus domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'285', E'Malus prunifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'286', E'Malus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'287', E'Malus sylvestris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'288', E'Malus toringo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'289', E'Malus toringo var. sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'290', E'Menispermum canadense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'291', E'Menispermum dauricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'292', E'Metasequoia glyptostroboides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'293', E'Microbiota decussata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'294', E'Myrica gale');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'295', E'Myricaria germanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'296', E'Oplopanax horridus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'297', E'Ostrya carpinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'298', E'Pachysandra terminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'299', E'Parthenocissus inserta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'300', E'Parthenocissus quinquefolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'301', E'Paxistima myrtifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'302', E'Phellodendron amurense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'303', E'Philadelphus ×lemoinei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'304', E'Philadelphus ×virginalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'305', E'Philadelphus coronarius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'306', E'Philadelphus lewisii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'307', E'Philadelphus lewisii var. gordonianus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'308', E'Philadelphus pubescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'309', E'Philadelphus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'310', E'Phyllodoce caerulea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'311', E'Physocarpus opulifolius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'312', E'Picea ×lutzii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'313', E'Picea abies');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'314', E'Picea abies f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'315', E'Picea abies f. condensata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'316', E'Picea abies f. cruenta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'317', E'Picea abies f. globosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'318', E'Picea abies f. nana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'319', E'Picea abies f. nidiformis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'320', E'Picea abies f. pendula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'321', E'Picea abies f. tabulaeformis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'322', E'Picea abies f. variegata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'323', E'Picea abies f. viminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'324', E'Picea abies f. virgata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'325', E'Picea abies subsp. abies');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'326', E'Picea abies subsp. obovata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'327', E'Picea asperata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'328', E'Picea engelmannii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'329', E'Picea glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'330', E'Picea glauca var. albertiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'331', E'Picea glehnii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'332', E'Picea jezoënsis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'333', E'Picea koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'334', E'Picea likiangensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'335', E'Picea mariana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'336', E'Picea omorika');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'337', E'Picea pungens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'338', E'Picea retroflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'339', E'Picea rubens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'340', E'Picea schrenkiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'341', E'Picea sitchensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'342', E'Picea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'343', E'Pieris floribunda');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'344', E'Pinus banksiana ');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'345', E'Pinus cembra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'346', E'Pinus cembra subsp. cembra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'347', E'Pinus cembra subsp. sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'348', E'Pinus contorta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'349', E'Pinus contorta var. contorta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'350', E'Pinus contorta var. latifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'351', E'Pinus koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'352', E'Pinus monticola');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'353', E'Pinus mugo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'354', E'Pinus mugo subsp. uncinata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'355', E'Pinus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'356', E'Pinus peuce');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'357', E'Pinus ponderosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'358', E'Pinus pumila');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'359', E'Pinus resinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'360', E'Pinus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'361', E'Pinus strobus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'362', E'Pinus sylvestris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'363', E'Pinus sylvestris f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'364', E'Pinus sylvestris f. condensata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'365', E'Pinus sylvestris f. globosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'366', E'Pinus sylvestris f. virgata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'367', E'Pinus sylvestris ''Globosa''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'368', E'Populus ×canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'369', E'Populus ×jackii ''Gileadensis''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'370', E'Populus ×wettsteinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'371', E'Populus alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'372', E'Populus balsamifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'373', E'Populus balsamifera ''Tristis''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'374', E'Populus canescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'375', E'Populus deltoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'376', E'Populus koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'377', E'Populus laurifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'378', E'Populus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'379', E'Populus ''Rasumowskiana''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'380', E'Populus simonii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'381', E'Populus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'382', E'Populus suaveolens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'383', E'Populus tremula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'384', E'Populus tremuloides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'385', E'Populus trichocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'386', E'Populus wilsonii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'387', E'Potentilla fruticosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'388', E'Prunus avium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'389', E'Prunus cerasifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'390', E'Prunus cerasus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'391', E'Prunus domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'392', E'Prunus domestica subsp. domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'393', E'Prunus domestica subsp. insititia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'394', E'Prunus laurocerasus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'395', E'Prunus maackii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'396', E'Prunus maximowiczii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'397', E'Prunus padus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'398', E'Prunus pensylvanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'399', E'Prunus prostrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'400', E'Prunus pumila');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'401', E'Prunus sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'402', E'Prunus serotina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'403', E'Prunus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'404', E'Prunus spinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'405', E'Prunus tenella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'406', E'Prunus tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'407', E'Prunus triloba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'408', E'Prunus virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'409', E'Pseudolarix amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'410', E'Pseudotsuga menziesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'411', E'Pseudotsuga menziesii var. glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'412', E'Pterocarya pterocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'413', E'Pterocarya rhoifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'414', E'Pyrus communis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'415', E'Pyrus ussuriensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'416', E'Quercus coccinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'417', E'Quercus petraea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'418', E'Quercus robur');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'419', E'Quercus rubra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'420', E'Rhamnus cathartica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'421', E'Rhamnus frangula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'422', E'Rhododendron ×fraseri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'423', E'Rhododendron aureum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'424', E'Rhododendron brachycarpum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'425', E'Rhododendron brachycarpum subsp. tigerstedtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'426', E'Rhododendron canadense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'427', E'Rhododendron Catawbiense -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'428', E'Rhododendron ''Cunningham''s White''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'429', E'Rhododendron dauricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'430', E'Rhododendron ferrugineum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'431', E'Rhododendron Kosterianum -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'432', E'Rhododendron lapponicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'433', E'Rhododendron luteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'434', E'Rhododendron molle');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'435', E'Rhododendron molle subsp. japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'436', E'Rhododendron schlippenbachii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'437', E'Rhododendron smirnowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'438', E'Rhododendron sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'439', E'Rhododendron Tigerstedtii -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'440', E'Rhus hirta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'441', E'Ribes alpinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'442', E'Ribes nigrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'443', E'Ribes rubrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'444', E'Ribes spicatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'445', E'Ribes uva-crispa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'446', E'Robinia pseudoacacia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'447', E'Rosa acicularis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'448', E'Rosa canina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'449', E'Rosa dumalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'450', E'Rosa majalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'451', E'Rosa mollis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'452', E'Rosa pimpinellifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'453', E'Rosa rugosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'454', E'Rosa sherardii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'455', E'Rosa sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'456', E'Rubus caesius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'457', E'Rubus idaeus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'458', E'Rubus odoratus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'459', E'Rubus parviflorus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'460', E'Rubus pruinosus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'461', E'Rubus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'462', E'Salix alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'463', E'Salix arbutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'464', E'Salix aurita');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'465', E'Salix borealis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'466', E'Salix caprea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'467', E'Salix cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'468', E'Salix daphnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'469', E'Salix daphnoides subsp. acutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'470', E'Salix daphnoides subsp. daphnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'471', E'Salix fragilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'472', E'Salix fragilis ''Bullata''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'473', E'Salix glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'474', E'Salix hastata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'475', E'Salix herbacea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'476', E'Salix lanata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'477', E'Salix lapponum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'478', E'Salix lucida');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'479', E'Salix myrsinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'480', E'Salix myrsinites');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'481', E'Salix myrtilloides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'482', E'Salix pentandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'483', E'Salix phylicifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'484', E'Salix polaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'485', E'Salix purpurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'486', E'Salix pyrolifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'487', E'Salix repens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'488', E'Salix reticulata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'489', E'Salix rosmarinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'490', E'Salix ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'491', E'Salix sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'492', E'Salix starkeana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'493', E'Salix triandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'494', E'Salix viminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'495', E'Sambucus canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'496', E'Sambucus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'497', E'Sambucus racemosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'498', E'Sambucus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'499', E'Schisandra chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'500', E'Sequoia sempervirens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'501', E'Sequoiadendron giganteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'502', E'Solanum dulcamara');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'503', E'Sorbaria grandiflora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'504', E'Sorbaria sorbifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'505', E'Sorbaria sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'506', E'Sorbus ×thuringiaca ''Fastigiata''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'507', E'Sorbus alnifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'508', E'Sorbus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'509', E'Sorbus aria');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'510', E'Sorbus aucuparia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'511', E'Sorbus commixta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'512', E'Sorbus hybrida');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'513', E'Sorbus intermedia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'514', E'Sorbus koehneana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'515', E'Sorbus prattii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'516', E'Sorbus scopulina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'517', E'Sorbus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'518', E'Sorbus teodori');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'519', E'Sorbus torminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'520', E'Spiraea ×cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'521', E'Spiraea ×multiflora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'522', E'Spiraea ×rosalba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'523', E'Spiraea ×sanssouciana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'524', E'Spiraea ×vanhouttei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'525', E'Spiraea alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'526', E'Spiraea ''Arguta''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'527', E'Spiraea betulifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'528', E'Spiraea Billiardii -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'529', E'Spiraea cana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'530', E'Spiraea chamaedryfolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'531', E'Spiraea douglasii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'532', E'Spiraea fritschiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'533', E'Spiraea ''Grefsheim''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'534', E'Spiraea hypericifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'535', E'Spiraea japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'536', E'Spiraea ''Margaritae''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'537', E'Spiraea media');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'538', E'Spiraea nipponica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'539', E'Spiraea rosthornii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'540', E'Spiraea salicifolia ');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'541', E'Spiraea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'542', E'Spiraea tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'543', E'Spiraea trichocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'544', E'Spiraea trilobata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'545', E'Stephanandra incisa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'546', E'Symphoricarpos albus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'547', E'Symphoricarpos albus var. laevigatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'548', E'Syringa ×chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'549', E'Syringa ×henryi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'550', E'Syringa ×josiflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'551', E'Syringa ×nanceana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'552', E'Syringa ×swegiflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'553', E'Syringa josikaea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'554', E'Syringa Preston -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'555', E'Syringa reflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'556', E'Syringa reticulata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'557', E'Syringa sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'558', E'Syringa sweginowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'559', E'Syringa tigerstedtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'560', E'Syringa tomentella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'561', E'Syringa villosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'562', E'Syringa wolfii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'563', E'Syringa vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'564', E'Tamarix pentandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'565', E'Taxus ×media');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'566', E'Taxus baccata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'567', E'Taxus brevifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'568', E'Taxus cuspidata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'569', E'Taxus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'570', E'Thuja koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'571', E'Thuja occidentalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'572', E'Thuja plicata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'573', E'Thuja sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'574', E'Thuja standishii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'575', E'Thujopsis dolabrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'576', E'Tilia ×moltkei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'577', E'Tilia ×vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'578', E'Tilia americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'579', E'Tilia cordata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'580', E'Tilia euchlora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'581', E'Tilia japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'582', E'Tilia mongolica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'583', E'Tilia platyphyllos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'584', E'Tilia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'585', E'Tilia tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'586', E'Tripterygium regelii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'587', E'Tsuga canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'588', E'Tsuga caroliniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'589', E'Tsuga diversifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'590', E'Tsuga heterophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'591', E'Tsuga mertensiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'592', E'Tsuga sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'593', E'Ulmus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'594', E'Ulmus glabra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'595', E'Ulmus laevis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'596', E'Ulmus minor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'597', E'Ulmus pumila ');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'598', E'Ulmus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'599', E'Vaccinium corymbosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'600', E'Vaccinium microcarpum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'601', E'Vaccinium myrtillus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'602', E'Vaccinium oxycoccos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'603', E'Vaccinium sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'604', E'Vaccinium uliginosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'605', E'Vaccinium vitis-idaea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'606', E'Weigela Florida -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'607', E'Weigela middendorffiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'608', E'Weigela praecox');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'609', E'Weigela sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'610', E'Viburnum carlesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'611', E'Viburnum cassinoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'612', E'Viburnum dentatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'613', E'Viburnum dentatum var. lucidum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'614', E'Viburnum lantana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'615', E'Viburnum lentago');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'616', E'Viburnum opulus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'617', E'Viburnum rafinesquianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'618', E'Viburnum sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'619', E'Viburnum sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'620', E'Vinca minor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'621', E'Vitis amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'622', E'Vitis riparia');
-- ddl-end --

-- object: koodistot.ymparistotaidetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ymparistotaidetyyppi CASCADE;
CREATE TABLE koodistot.ymparistotaidetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT ymparistotaidetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.ymparistotaidetyyppi OWNER TO infrao_admin;
-- ddl-end --










-- object: varusteet.kaluste | type: TABLE --
-- DROP TABLE IF EXISTS varusteet.kaluste CASCADE;
CREATE TABLE varusteet.kaluste (
	id serial NOT NULL,
	kalustetyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT kaluste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE varusteet.kaluste OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kantavuusluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kantavuusluokkatyyppi CASCADE;
CREATE TABLE koodistot.kantavuusluokkatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kantavuusluokkatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kantavuusluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --









-- object: koodistot.kasvilaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kasvilaji CASCADE;
CREATE TABLE koodistot.kasvilaji (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kasvilaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kasvilaji OWNER TO infrao_admin;
-- ddl-end --

















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































-- object: koodistot.kasviryhmatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kasviryhmatyyppi CASCADE;
CREATE TABLE koodistot.kasviryhmatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kasviryhmatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kasviryhmatyyppi OWNER TO infrao_admin;
-- ddl-end --













-- object: koodistot.leikkivalinetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.leikkivalinetyyppi CASCADE;
CREATE TABLE koodistot.leikkivalinetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT leikkivalinetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.leikkivalinetyyppi OWNER TO infrao_admin;
-- ddl-end --



















-- object: koodistot.liikennemerkkityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi CASCADE;
CREATE TABLE koodistot.liikennemerkkityyppi (
	cid integer NOT NULL,
	selite text,
	CONSTRAINT liikennemerkkityyppi_pk PRIMARY KEY (cid)
);
-- ddl-end --
COMMENT ON TABLE koodistot.liikennemerkkityyppi IS E'TODO: add selite in other languages (sv, en)?';
-- ddl-end --
ALTER TABLE koodistot.liikennemerkkityyppi OWNER TO infrao_admin;
-- ddl-end --



















































































































































































































































































-- object: koodistot.liikennemerkkityyppi2020 | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi2020 CASCADE;
CREATE TABLE koodistot.liikennemerkkityyppi2020 (
	id serial NOT NULL,
	selite text,
	CONSTRAINT liikennemerkkityyppi2020_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikennemerkkityyppi2020 OWNER TO infrao_admin;
-- ddl-end --
















































































































































































































































































































































































































































































































































































































































-- object: koodistot.muutoshoitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.muutoshoitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.muutoshoitoluokkatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT muutoshoitoluokkatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.muutoshoitoluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --
















-- object: koodistot.muuvarustetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.muuvarustetyyppi CASCADE;
CREATE TABLE koodistot.muuvarustetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT muuvarustetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.muuvarustetyyppi OWNER TO infrao_admin;
-- ddl-end --



















-- object: koodistot.toiminnallinenluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.toiminnallinenluokka CASCADE;
CREATE TABLE koodistot.toiminnallinenluokka (
	id serial NOT NULL,
	selite text,
	CONSTRAINT toiminnallinenluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.toiminnallinenluokka OWNER TO infrao_admin;
-- ddl-end --















-- object: kohteet.hulevesi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.hulevesi CASCADE;
CREATE TABLE kohteet.hulevesi (
	id serial NOT NULL,
	hulevesityyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT hulevesi_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.hulevesi OWNER TO infrao_admin;
-- ddl-end --

-- object: katualue.ajoratamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS katualue.ajoratamerkinta CASCADE;
CREATE TABLE katualue.ajoratamerkinta (
	id serial NOT NULL,
	ajoratamerkintatyyppi_id integer,
	jyrsittypintakytkin boolean,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT ajoratamerkinta_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --

-- object: kohteet.ymparistotaide | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.ymparistotaide CASCADE;
CREATE TABLE kohteet.ymparistotaide (
	id serial NOT NULL,
	ymparistotaidetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT ymparistotaide_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.ymparistotaide OWNER TO infrao_admin;
-- ddl-end --

-- object: meta.aineistotoimituksentiedot | type: TABLE --
-- DROP TABLE IF EXISTS meta.aineistotoimituksentiedot CASCADE;
CREATE TABLE meta.aineistotoimituksentiedot (
	id serial,
	toimitus_id integer,
	aineistonnimi text,
	aineistotoimittaja text,
	tila text,
	toimituspvm date,
	kuntakoodi text,
	kielitieto text,
	metatietotunniste text,
	metatietoxmlurl text,
	metatietourl text,
	tietotuoteurl text

);
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.aineistonnimi IS E'Aineistoa kuvaava nimi,';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.aineistotoimittaja IS E'Kuka on tehnyt kyseisen siirtotiedoston, yhteyshenkilö';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.tila IS E'Aineiston valmiustila; onko kokonaan valmis, luonnos, demo';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.toimituspvm IS E'Milloin kyseinen siirtotiedosto on tehty';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.kielitieto IS E'Kunnan kieli tai kielitieto';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietotunniste IS E'Paikkatietohakemistossa aineiston yksilöivä metatietotunniste. Muita nimityksiä: UUID, tiedostotunniste, resurssitunniste, aineiston ID. Esim: 924a68ba-665f-4ea0-a830- 26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietoxmlurl IS E'URL, joka palauttaa aineiston metatiedot XML tiedostona ISO 19139 skeeman mukaisesti. Esim: http://geonetwork.nls.fi/geonetwork/srv/fi/iso19139.xml?uuid=924a68ba-665f-4ea0-a830-26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietourl IS E'URL www-sivulle, josta aineiston metatiedot ovat luettavissa ”selkokielisenä”. Esim: http://www.paikkatietoikkuna.fi/web/fi/paikkatietoaineisto?inspireMetadat aUIID=924a68ba-665f-4ea0-a830-26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.tietotuoteurl IS E'URL, josta saadaan aineistoon liittyvän tietotuotteen tiedot';
-- ddl-end --
ALTER TABLE meta.aineistotoimituksentiedot OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.aineistotilatype | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.aineistotilatype CASCADE;
CREATE TABLE koodistot.aineistotilatype (
	id serial NOT NULL,
	selite text,
	CONSTRAINT aineistotilatype_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.aineistotilatype OWNER TO infrao_admin;
-- ddl-end --






-- object: meta.infraokohteet | type: TABLE --
-- DROP TABLE IF EXISTS meta.infraokohteet CASCADE;
CREATE TABLE meta.infraokohteet (
	id serial NOT NULL,
	CONSTRAINT infraokohteet_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE meta.infraokohteet IS E'Skeeman juurielementti';
-- ddl-end --
ALTER TABLE meta.infraokohteet OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.abstractinfraomaisuuskohde | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractinfraomaisuuskohde CASCADE;
CREATE TABLE abstraktit.abstractinfraomaisuuskohde (
	id serial NOT NULL,
	CONSTRAINT abstractinfraomaisuuskohde_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.abstractinfraomaisuuskohde OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.liite | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.liite CASCADE;
CREATE TABLE abstraktit.liite (
	id serial NOT NULL,
	linkkiliitteeseen varchar(255),
	muokkaushetki timestamptz,
	versionumero text,
	kuvaus varchar(2000),
	CONSTRAINT liite_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.liite.kuvaus IS E'Liitteen sisältöä kuvaava teksti';
-- ddl-end --
ALTER TABLE abstraktit.liite OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.nimi | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.nimi CASCADE;
CREATE TABLE abstraktit.nimi (
	id serial NOT NULL,
	teksti text,
	lang varchar(10) DEFAULT 'fi',
	CONSTRAINT nimi_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.nimi IS E'Voidaan käyttää esim. nimistö tai osoitekohteessa';
-- ddl-end --
ALTER TABLE abstraktit.nimi OWNER TO infrao_admin;
-- ddl-end --

-- object: osoite.osoite | type: TABLE --
-- DROP TABLE IF EXISTS osoite.osoite CASCADE;
CREATE TABLE osoite.osoite (
	id integer NOT NULL,
	kunta varchar(255),
	osoitenumero integer,
	osoitenumero2 integer,
	jakokirjain varchar(255),
	jakokirjain2 varchar(255),
	porras varchar(255),
	huoneisto integer,
	huoneistojakokirjain varchar(255),
	postinmero varchar(5),
	postitoimipaikannimi varchar(255),
	geom_point geometry(POINT, 3067),
	geom_poly geometry(POLYGON, 3067),
	geom_line geometry(LINESTRING, 3067),
	viitesijaintialue varchar(255),
	CONSTRAINT osoite_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE osoite.osoite IS E'Viitesijaintialue: oma taulu, jossa suuralueet tms.?';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.osoitenumero IS E'Yksi osoitenumero esim. "24"';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.osoitenumero2 IS E'Osoitenumeroväli esimerkiksi 35-37 jälikimmäinen numero';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.jakokirjain IS E'numeron perään tuleva pieni kirjain';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.jakokirjain2 IS E'Jakokirjainvälin jälkimmäinen osa';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.huoneistojakokirjain IS E'Huoneistonumeron perään tuleva pieni kirjain';
-- ddl-end --
COMMENT ON COLUMN osoite.osoite.viitesijaintialue IS E'Esim. Korso, Tikkurila';
-- ddl-end --

-- object: kohteet.pysakointiruutu | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.pysakointiruutu CASCADE;
CREATE TABLE kohteet.pysakointiruutu (
	id serial NOT NULL,
	latauspistekytkin boolean,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGONZ, 3067),
-- 	geom_piste geometry(POINTZ, 3067),
-- 	geom_line geometry(LINESTRINGZ, 3067),
	CONSTRAINT pysakointiruutu_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.pysakointiruutu OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.rakennetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.rakennetyyppi CASCADE;
CREATE TABLE koodistot.rakennetyyppi (
	id serial NOT NULL,
	CONSTRAINT rakennetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.rakennetyyppi OWNER TO infrao_admin;
-- ddl-end --










































-- object: koodistot.viherosanlajityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.viherosanlajityyppi CASCADE;
CREATE TABLE koodistot.viherosanlajityyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT viherosanlajityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.viherosanlajityyppi OWNER TO infrao_admin;
-- ddl-end --
































































-- object: abstraktit.keskilinja | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.keskilinja CASCADE;
CREATE TABLE abstraktit.keskilinja (
	id serial NOT NULL,
	digiroadid varchar(255),
	geom geometry(LINESTRING, 3067),
	CONSTRAINT keskilinja_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.keskilinja.geom IS E'sijainti';
-- ddl-end --
ALTER TABLE abstraktit.keskilinja OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.sijainti | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.sijainti CASCADE;
CREATE TABLE abstraktit.sijainti (
	id serial NOT NULL,
	alue geometry(POLYGON, 3067),
	piste geometry(POINT, 3067),
	viiva geometry(LINESTRING, 3067),
	luontitapa varchar(255),
	osoitetieto_id integer,
	sijaintiepavarmuus_id integer,
	CONSTRAINT sijainti_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.sijainti IS E'TODO: tarvitaanko? Jos tarve on pelkästään tallentaa tietoa luontitavasta ja/tai sijaintiepävarmuudesta niin voisi olla kohteen metatiedoissa?';
-- ddl-end --
ALTER TABLE abstraktit.sijainti OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.sijaintiepavarmuustyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.sijaintiepavarmuustyyppi CASCADE;
CREATE TABLE koodistot.sijaintiepavarmuustyyppi (
	id serial NOT NULL,
	selite varchar(255),
	CONSTRAINT sijaintiepavarmuustyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.sijaintiepavarmuustyyppi OWNER TO infrao_admin;
-- ddl-end --















-- object: kohteet.erikoisrakennekerros | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.erikoisrakennekerros CASCADE;
CREATE TABLE kohteet.erikoisrakennekerros (
	id serial NOT NULL,
	erikoisrakennekerrosmateriaalityyppi_id integer,
	omistaja varchar(255),
	haltija varchar(255),
	kunnossapitaja varchar(255),
	selite varchar(255),
	materiaali varchar(255),
	geom geometry(POLYGON, 3067),
	CONSTRAINT erikoisrakennekerros_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN kohteet.erikoisrakennekerros.geom IS E'sijainti';
-- ddl-end --
ALTER TABLE kohteet.erikoisrakennekerros OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.erikoisrakennekerrosmateriaalityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.erikoisrakennekerrosmateriaalityyppi CASCADE;
CREATE TABLE koodistot.erikoisrakennekerrosmateriaalityyppi (
	id serial NOT NULL,
	selite varchar(255),
	CONSTRAINT erikoisrakennekerrosmateriaalityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE koodistot.erikoisrakennekerrosmateriaalityyppi IS E'TODO: id name as cid (codelist id) and move type integer. Change data: Selite is only text';
-- ddl-end --
ALTER TABLE koodistot.erikoisrakennekerrosmateriaalityyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'1', E'paalulaatat ja -hatut');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'2', E'vahvistetut maarakenteet');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'3', E'roudan- ja lämmöneristykset');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'4', E'kevennetyt penkereet');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'5', E'maapadot');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'6', E'kantava kasvualusta');
-- ddl-end --

-- object: abstraktit.suunnitelma | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.suunnitelma CASCADE;
CREATE TABLE abstraktit.suunnitelma (
	id serial NOT NULL,
	kuvaus varchar(2000),
	paivamaarapvm date,
	CONSTRAINT suunnitelma_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.suunnitelma IS E'Päätöksen tiedot';
-- ddl-end --
ALTER TABLE abstraktit.suunnitelma OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.suunnitelmalinkki | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.suunnitelmalinkki CASCADE;
CREATE TABLE abstraktit.suunnitelmalinkki (
	id serial NOT NULL,
	suunnitelmakohdeid integer,
	liitetieto_id integer,
	CONSTRAINT suunnitelmalinkki_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.suunnitelmalinkki OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.liitetieto | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.liitetieto CASCADE;
CREATE TABLE abstraktit.liitetieto (
	id serial NOT NULL,
	tiedot varchar(1000),
	suunnitelma_id integer,
	CONSTRAINT liitetieto_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.liitetieto OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.puhtaanapitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puhtaanapitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.puhtaanapitoluokkatyyppi (
	cid integer NOT NULL,
	selite varchar(255),
	CONSTRAINT puhtaanapitoluokkatyyppi_pk PRIMARY KEY (cid)
);
-- ddl-end --
ALTER TABLE koodistot.puhtaanapitoluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --









-- object: abstraktit.paatos | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.paatos CASCADE;
CREATE TABLE abstraktit.paatos (
	id serial NOT NULL,
	liitetieto_id integer,
	kuvaus varchar(2000),
	paivamaarapvm date,
	CONSTRAINT paatos_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.paatos IS E'Päätöksen tiedot';
-- ddl-end --
ALTER TABLE abstraktit.paatos OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.template_table | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.template_table CASCADE;
CREATE TABLE abstraktit.template_table (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	identifier uuid DEFAULT gen_random_uuid(),
	nimi text,
	valmistumisvuosi smallint,
	perusparannusvuosi smallint,
	alkuhetki timestamptz,
	loppuhetki timestamptz,
	malli text,
	suunta float,
	valmistaja text,
	metatieto text,
	geom_poly geometry(POLYGONZ, 3067),
	geom_line geometry(LINESTRINGZ, 3067),
	geom_point geometry(POINTZ, 3067),
	CONSTRAINT template_table_pk PRIMARY KEY (fid)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.template_table.alkuhetki IS E'Kohteen luontipäivämäärä';
-- ddl-end --
COMMENT ON COLUMN abstraktit.template_table.loppuhetki IS E'Milloin kohde on poistettu. Tämän avulla voidaan tunnistaa poistetut kohteet, jos järjestelmät tukevat historiatietojen tallentamista';
-- ddl-end --

-- object: katualue_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS katualue_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT katualue_fk FOREIGN KEY (fid_katualue)
REFERENCES katualue.katualue (fid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: viheralue_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS viheralue_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT viheralue_fk FOREIGN KEY (fid_viheralue)
REFERENCES viheralue.viheralue (fid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kasvillisuus.puu | type: TABLE --
-- DROP TABLE IF EXISTS kasvillisuus.puu CASCADE;
CREATE TABLE kasvillisuus.puu (
	fid bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	identifier uuid DEFAULT gen_random_uuid(),
	nimi text,
	valmistumisvuosi smallint,
	perusparannusvuosi smallint,
	alkuhetki timestamptz,
	loppuhetki timestamptz,
	kunnossapitaja text,
	haltija text,
	omistaja text,
	metatieto text,
	korkeus float,
	ymparys float,
	geom_point geometry(POINTZ, 3067),
	geom_line geometry(LINESTRINGZ, 3067),
	geom_poly geometry(POLYGONZ, 3067),
	fid_katualueenosa bigint,
	fid_viheralueenosa bigint,
	id_puutyyppi integer,
	id_puulaji integer,
	CONSTRAINT puu_fid_pk PRIMARY KEY (fid)
);
-- ddl-end --
COMMENT ON TABLE kasvillisuus.puu IS E'TODO: metatieto';
-- ddl-end --
COMMENT ON COLUMN kasvillisuus.puu.alkuhetki IS E'Kohteen luontipäivämäärä';
-- ddl-end --
COMMENT ON COLUMN kasvillisuus.puu.loppuhetki IS E'Milloin kohde on poistettu. Tämän avulla voidaan tunnistaa poistetut kohteet, jos järjestelmät tukevat historiatietojen tallentamista';
-- ddl-end --
COMMENT ON COLUMN kasvillisuus.puu.kunnossapitaja IS E'Kunnossapitäjä';
-- ddl-end --
COMMENT ON COLUMN kasvillisuus.puu.korkeus IS E'Puun korkeus metreinä';
-- ddl-end --
COMMENT ON COLUMN kasvillisuus.puu.ymparys IS E'Puun ympärysmitta metreissä';
-- ddl-end --

-- object: katualueenosa_fk | type: CONSTRAINT --
-- ALTER TABLE kasvillisuus.puu DROP CONSTRAINT IF EXISTS katualueenosa_fk CASCADE;
ALTER TABLE kasvillisuus.puu ADD CONSTRAINT katualueenosa_fk FOREIGN KEY (fid_katualueenosa)
REFERENCES katualue.katualueenosa (fid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: viheralueenosa_fk | type: CONSTRAINT --
-- ALTER TABLE kasvillisuus.puu DROP CONSTRAINT IF EXISTS viheralueenosa_fk CASCADE;
ALTER TABLE kasvillisuus.puu ADD CONSTRAINT viheralueenosa_fk FOREIGN KEY (fid_viheralueenosa)
REFERENCES viheralue.viheralueenosa (fid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: puutyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kasvillisuus.puu DROP CONSTRAINT IF EXISTS puutyyppi_fk CASCADE;
ALTER TABLE kasvillisuus.puu ADD CONSTRAINT puutyyppi_fk FOREIGN KEY (id_puutyyppi)
REFERENCES koodistot.puutyyppi (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: puulaji_fk | type: CONSTRAINT --
-- ALTER TABLE kasvillisuus.puu DROP CONSTRAINT IF EXISTS puulaji_fk CASCADE;
ALTER TABLE kasvillisuus.puu ADD CONSTRAINT puulaji_fk FOREIGN KEY (id_puulaji)
REFERENCES koodistot.puulaji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: talvihoidonluokka_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS talvihoidonluokka_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT talvihoidonluokka_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: hoitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS hoitoluokka_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT hoitoluokka_fk FOREIGN KEY (hoitoluokka_id)
REFERENCES koodistot.hoitoluokkatyyppi (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kayttotarkoitus_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS kayttotarkoitus_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT kayttotarkoitus_fk FOREIGN KEY (kayttotarkoitus_id)
REFERENCES koodistot.viheralueenkayttotarkoitus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laji_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS laji_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT laji_fk FOREIGN KEY (laji_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: katualueenlaji_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS katualueenlaji_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT katualueenlaji_fk FOREIGN KEY (katualueenlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: suunnitelmalinkkitieto_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS suunnitelmalinkkitieto_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT suunnitelmalinkkitieto_fk FOREIGN KEY (suunnitelmalinkkitieto_id)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: puhtaanapitoluokkatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS puhtaanapitoluokkatyyppi_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT puhtaanapitoluokkatyyppi_fk FOREIGN KEY (puhtaanapitoluokka_id)
REFERENCES koodistot.puhtaanapitoluokkatyyppi (cid) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: muutoshoitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE viheralue.viheralueenosa DROP CONSTRAINT IF EXISTS muutoshoitoluokka_fk CASCADE;
ALTER TABLE viheralue.viheralueenosa ADD CONSTRAINT muutoshoitoluokka_fk FOREIGN KEY (muutoshoitoluokka_id)
REFERENCES koodistot.muutoshoitoluokkatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: materiaali_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.abstractvaruste DROP CONSTRAINT IF EXISTS materiaali_fk CASCADE;
ALTER TABLE abstraktit.abstractvaruste ADD CONSTRAINT materiaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kunnossapitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS kunnossapitoluokka_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT kunnossapitoluokka_fk FOREIGN KEY (kunnossapitoluokka_id)
REFERENCES koodistot.kunnossapitoluokka (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: katuosanlaji_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS katuosanlaji_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT katuosanlaji_fk FOREIGN KEY (katuosanlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: talvihoidonluokka_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS talvihoidonluokka_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT talvihoidonluokka_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pintamateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS pintamateriaali_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT pintamateriaali_fk FOREIGN KEY (pintamateriaali_id)
REFERENCES koodistot.pintamateriaali (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: toiminnallinenluokka_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS toiminnallinenluokka_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT toiminnallinenluokka_fk FOREIGN KEY (luokka_id)
REFERENCES koodistot.toiminnallinenluokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: viherosanlajityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS viherosanlajityyppi_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT viherosanlajityyppi_fk FOREIGN KEY (viherosanlajityypi_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: paatostieto_id | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS paatostieto_id CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT paatostieto_id FOREIGN KEY (paatostieto_id)
REFERENCES abstraktit.paatos (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: suunnitelmalinkkitieto_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.katualueenosa DROP CONSTRAINT IF EXISTS suunnitelmalinkkitieto_fk CASCADE;
ALTER TABLE katualue.katualueenosa ADD CONSTRAINT suunnitelmalinkkitieto_fk FOREIGN KEY (suunnitelmalinkkitieto_id)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: melutyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.melukohde DROP CONSTRAINT IF EXISTS melutyyppi_fk CASCADE;
ALTER TABLE varusteet.melukohde ADD CONSTRAINT melutyyppi_fk FOREIGN KEY (melutyyppi_id)
REFERENCES koodistot.melutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.melukohde DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.melukohde ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.melutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikuntatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.liikunta DROP CONSTRAINT IF EXISTS liikuntatyyppi_fk CASCADE;
ALTER TABLE varusteet.liikunta ADD CONSTRAINT liikuntatyyppi_fk FOREIGN KEY (liikuntatyyppi_id)
REFERENCES koodistot.liikuntatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.liikunta DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.liikunta ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: jatetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.jate DROP CONSTRAINT IF EXISTS jatetyyppi_fk CASCADE;
ALTER TABLE varusteet.jate ADD CONSTRAINT jatetyyppi_fk FOREIGN KEY (jatetyyppi_id)
REFERENCES koodistot.jatetyyppi (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.jate DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.jate ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: opastetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.opaste DROP CONSTRAINT IF EXISTS opastetyyppi_fk CASCADE;
ALTER TABLE varusteet.opaste ADD CONSTRAINT opastetyyppi_fk FOREIGN KEY (opastetyyppi_id)
REFERENCES koodistot.opastetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.opaste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.opaste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: rakennetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.rakenne DROP CONSTRAINT IF EXISTS rakennetyyppi_fk CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakennetyyppi_fk FOREIGN KEY (rakennetyyyppi_id)
REFERENCES koodistot.rakennetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.rakenne DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikennemerkkityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.liikennemerkki DROP CONSTRAINT IF EXISTS liikennemerkkityyppi_fk CASCADE;
ALTER TABLE varusteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi_fk FOREIGN KEY (liikennemerkkityyppi_id)
REFERENCES koodistot.liikennemerkkityyppi (cid) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikennemerkkityyppi2020_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.liikennemerkki DROP CONSTRAINT IF EXISTS liikennemerkkityyppi2020_fk CASCADE;
ALTER TABLE varusteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi2020_fk FOREIGN KEY (liikennemerkkityyppi2020_id)
REFERENCES koodistot.liikennemerkkityyppi2020 (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: leikkivaline_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.leikkivaline DROP CONSTRAINT IF EXISTS leikkivaline_fk CASCADE;
ALTER TABLE varusteet.leikkivaline ADD CONSTRAINT leikkivaline_fk FOREIGN KEY (id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: leikkivalinetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.leikkivaline DROP CONSTRAINT IF EXISTS leikkivalinetyyppi_fk CASCADE;
ALTER TABLE varusteet.leikkivaline ADD CONSTRAINT leikkivalinetyyppi_fk FOREIGN KEY (leikkivalinetyyppi_id)
REFERENCES koodistot.leikkivalinetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: muuvarustetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.muuvaruste DROP CONSTRAINT IF EXISTS muuvarustetyyppi_fk CASCADE;
ALTER TABLE varusteet.muuvaruste ADD CONSTRAINT muuvarustetyyppi_fk FOREIGN KEY (muuvarustetyyppi_id)
REFERENCES koodistot.muuvarustetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.muuvaruste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.muuvaruste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.liikennevalo DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE katualue.liikennevalo ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --

-- object: puulaji_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.abstractkasvillisuus DROP CONSTRAINT IF EXISTS puulaji_fk CASCADE;
ALTER TABLE abstraktit.abstractkasvillisuus ADD CONSTRAINT puulaji_fk FOREIGN KEY (puulaji_id)
REFERENCES koodistot.puulaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: puutyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.abstractkasvillisuus DROP CONSTRAINT IF EXISTS puutyyppi_fk CASCADE;
ALTER TABLE abstraktit.abstractkasvillisuus ADD CONSTRAINT puutyyppi_fk FOREIGN KEY (puutyyppi_id)
REFERENCES koodistot.puutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kalustetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.kaluste DROP CONSTRAINT IF EXISTS kalustetyyppi_fk CASCADE;
ALTER TABLE varusteet.kaluste ADD CONSTRAINT kalustetyyppi_fk FOREIGN KEY (kalustetyyppi_id)
REFERENCES koodistot.kalustetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE varusteet.kaluste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE varusteet.kaluste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: hulevesityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.hulevesi DROP CONSTRAINT IF EXISTS hulevesityyppi_fk CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesityyppi_fk FOREIGN KEY (hulevesityyppi_id)
REFERENCES koodistot.hulevesityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.hulevesi DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ajoratamerkintatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE katualue.ajoratamerkinta DROP CONSTRAINT IF EXISTS ajoratamerkintatyyppi_fk CASCADE;
ALTER TABLE katualue.ajoratamerkinta ADD CONSTRAINT ajoratamerkintatyyppi_fk FOREIGN KEY (ajoratamerkintatyyppi_id)
REFERENCES koodistot.ajoratamerkintatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ymparistotaidetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT IF EXISTS ymparistotaidetyyppi_fk CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaidetyyppi_fk FOREIGN KEY (ymparistotaidetyyppi_id)
REFERENCES koodistot.ymparistotaidetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: infraokohteet_fk | type: CONSTRAINT --
-- ALTER TABLE meta.aineistotoimituksentiedot DROP CONSTRAINT IF EXISTS infraokohteet_fk CASCADE;
ALTER TABLE meta.aineistotoimituksentiedot ADD CONSTRAINT infraokohteet_fk FOREIGN KEY (toimitus_id)
REFERENCES meta.infraokohteet (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.pysakointiruutu DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sijaintiepavarmuustyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.sijainti DROP CONSTRAINT IF EXISTS sijaintiepavarmuustyyppi_fk CASCADE;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT sijaintiepavarmuustyyppi_fk FOREIGN KEY (sijaintiepavarmuus_id)
REFERENCES koodistot.sijaintiepavarmuustyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: osoitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.sijainti DROP CONSTRAINT IF EXISTS osoitetieto_fk CASCADE;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT osoitetieto_fk FOREIGN KEY (osoitetieto_id)
REFERENCES osoite.osoite (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: erikoisrakennekerrosmateriaalityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.erikoisrakennekerros DROP CONSTRAINT IF EXISTS erikoisrakennekerrosmateriaalityyppi_fk CASCADE;
ALTER TABLE kohteet.erikoisrakennekerros ADD CONSTRAINT erikoisrakennekerrosmateriaalityyppi_fk FOREIGN KEY (erikoisrakennekerrosmateriaalityyppi_id)
REFERENCES koodistot.erikoisrakennekerrosmateriaalityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.suunnitelmalinkki DROP CONSTRAINT IF EXISTS liitetieto_fk CASCADE;
ALTER TABLE abstraktit.suunnitelmalinkki ADD CONSTRAINT liitetieto_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liite (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: suunnitelma_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.liitetieto DROP CONSTRAINT IF EXISTS suunnitelma_fk CASCADE;
ALTER TABLE abstraktit.liitetieto ADD CONSTRAINT suunnitelma_fk FOREIGN KEY (suunnitelma_id)
REFERENCES abstraktit.suunnitelma (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.paatos DROP CONSTRAINT IF EXISTS liitetieto_fk CASCADE;
ALTER TABLE abstraktit.paatos ADD CONSTRAINT liitetieto_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liitetieto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "grant_CcT_46eefe8046" | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE infrao
   TO infrao_admin;
-- ddl-end --


