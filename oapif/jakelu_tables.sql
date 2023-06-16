CREATE SCHEMA jakelu;

ALTER SCHEMA jakelu OWNER TO infrao_admin;

--infrao:Liikennemerkki

DROP TABLE IF EXISTS jakelu.liikennemerkki_ogc;

CREATE TABLE jakelu.liikennemerkki_ogc AS
SELECT
	liikennemerkki.fid,
	liikennemerkki.identifier,
	liikennemerkki.valmistumisvuosi,
	liikennemerkki.perusparannusvuosi,
	liikennemerkki.alkuhetki,
	liikennemerkki.loppuhetki,
	liikennemerkki.malli,
	liikennemerkki.suunta,
	liikennemerkki.valmistaja,
	liikennemerkki.omistaja,
	liikennemerkki.haltija,
	liikennemerkki.kunnossapitaja,
	liikennemerkki.meta_datanluoja,
	liikennemerkki.meta_muokkaaja,
	liikennemerkki.meta_muokkauspvm,
	liikennemerkki.meta_omistaja,
	liikennemerkki.meta_lahteenpvm,
	liikennemerkki.meta_mittausera,
	liikennemerkki.meta_lisatietolinkki,
	liikennemerkki.geom_point,
	liikennemerkki.geom_poly,
	liikennemerkki.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	liikennemerkki.fid_osoite,
	CASE
		WHEN liikennemerkki.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN liikennemerkki.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN liikennemerkki.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN liikennemerkki.cid_liikennemerkkityyppi = -1 THEN NULL
		ELSE liikennemerkkityyppi.selite
	END AS cid_liikennemerkkityyppi,
	CASE
		WHEN liikennemerkki.cid_liikennemerkkityyppi2020 = -1 THEN NULL
		ELSE liikennemerkkityyppi2020.selite
	END AS cid_liikennemerkkityyppi2020,
	liikennemerkki.teksti
FROM
	varusteet.liikennemerkki
LEFT JOIN
	koodistot.liikennemerkkityyppi ON liikennemerkki.cid_liikennemerkkityyppi = liikennemerkkityyppi.cid
LEFT JOIN
	koodistot.liikennemerkkityyppi2020 ON liikennemerkki.cid_liikennemerkkityyppi2020 = liikennemerkkityyppi2020.cid
LEFT JOIN
	koodistot.varustemateriaali ON liikennemerkki.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON liikennemerkki.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON liikennemerkki.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON liikennemerkki.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON liikennemerkki.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.liikennemerkki_ogc
ADD PRIMARY KEY (fid);

--infrao:Jate

DROP TABLE IF EXISTS jakelu.jate_ogc;

CREATE TABLE jakelu.jate_ogc AS
SELECT
	jate.fid,
	jate.identifier,
	jate.valmistumisvuosi,
	jate.perusparannusvuosi,
	jate.alkuhetki,
	jate.loppuhetki,
	jate.malli,
	jate.suunta,
	jate.valmistaja,
	jate.omistaja,
	jate.haltija,
	jate.kunnossapitaja,
	jate.meta_datanluoja,
	jate.meta_muokkaaja,
	jate.meta_muokkauspvm,
	jate.meta_omistaja,
	jate.meta_lahteenpvm,
	jate.meta_mittausera,
	jate.meta_lisatietolinkki,
	jate.geom_point,
	jate.geom_poly,
	jate.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	jate.fid_osoite,
	CASE
		WHEN jate.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN jate.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN jate.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN jate.cid_jatetyyppi = -1 THEN NULL
		ELSE jatetyyppi.selite
	END AS cid_jatetyyppi,
	jate.putkikeraysjarjestelma_kytkin,
	jate.sijaintimaanpinnalla_kytkin,
	jate.vaarallistenjateastia_kytkin,
	jate.koko
FROM
	varusteet.jate
LEFT JOIN
	koodistot.jatetyyppi ON jate.cid_jatetyyppi = jatetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON jate.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON jate.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON jate.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON jate.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON jate.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.jate_ogc
ADD PRIMARY KEY (fid);

--infrao:Suunnitelmalinkki

DROP TABLE IF EXISTS jakelu.suunnitelmalinkki_ogc;

CREATE TABLE jakelu.suunnitelmalinkki_ogc AS
SELECT
	suunnitelmalinkki.fid,
	suunnitelmalinkki.suunnitelmakohdeid,
	suunnitelmalinkki.fid_liite,
	suunnitelmalinkki.fid_liikennemerkki,
	suunnitelmalinkki.fid_leikkivaline,
	suunnitelmalinkki.fid_muuvaruste,
	suunnitelmalinkki.fid_kaluste,
	suunnitelmalinkki.fid_melukohde,
	suunnitelmalinkki.fid_opaste,
	suunnitelmalinkki.fid_liikunta,
	suunnitelmalinkki.fid_jate,
	suunnitelmalinkki.fid_ajoratamerkinta,
	suunnitelmalinkki.fid_hulevesi,
	suunnitelmalinkki.fid_katualueenosa,
	suunnitelmalinkki.fid_ymparistotaide,
	suunnitelmalinkki.fid_pysakointiruutu,
	suunnitelmalinkki.fid_rakenne,
	suunnitelmalinkki.fid_viheralueenosa
FROM
	linkit.suunnitelmalinkki;

ALTER TABLE jakelu.suunnitelmalinkki_ogc
ADD PRIMARY KEY (fid);

--infrao:Liite

DROP TABLE IF EXISTS jakelu.liite_ogc;

CREATE TABLE jakelu.liite_ogc AS
SELECT
	liite.fid,
	liite.kuvaus,
	liite.linkkiliitteeseen,
	liite.muokkaushetki,
	liite.versionumero,
	liite.id_paatos
FROM
	linkit.liite;

ALTER TABLE jakelu.liite_ogc
ADD PRIMARY KEY (fid);

--infrao:Paatos

DROP TABLE IF EXISTS jakelu.paatos_ogc;

CREATE TABLE jakelu.paatos_ogc AS
SELECT
	paatos.id,
	paatos.kuvaus,
	paatos.paivamaarapvm,
	paatos.fid_katualueenosa
FROM
	linkit.paatos;

ALTER TABLE jakelu.paatos_ogc
ADD PRIMARY KEY (id);

--infrao:MuuKasvi

DROP TABLE IF EXISTS jakelu.muukasvi_ogc;

CREATE TABLE jakelu.muukasvi_ogc AS
SELECT
	muukasvi.fid,
	muukasvi.identifier,
	muukasvi.alkuhetki,
	muukasvi.loppuhetki,
	muukasvi.omistaja,
	muukasvi.haltija,
	muukasvi.kunnossapitaja,
	muukasvi.meta_datanluoja,
	muukasvi.meta_muokkaaja,
	muukasvi.meta_muokkauspvm,
	muukasvi.meta_omistaja,
	muukasvi.meta_lahteenpvm,
	muukasvi.meta_mittausera,
	muukasvi.meta_lisatietolinkki,
	muukasvi.geom_point,
	muukasvi.geom_poly,
	muukasvi.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	muukasvi.fid_osoite,
	CASE
		WHEN muukasvi.cid_kasviryhmatyyppi = -1 THEN NULL
		ELSE kasviryhmatyyppi.selite
	END AS cid_kasviryhmatyyppi,
	CASE
		WHEN muukasvi.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN muukasvi.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN muukasvi.cid_kasvilaji = -1 THEN NULL
		ELSE kasvilaji.selite
	END AS cid_kasvilaji
FROM
	kasvillisuus.muukasvi
LEFT JOIN
	koodistot.kasvilaji ON muukasvi.cid_kasvilaji = kasvilaji.cid
LEFT JOIN
	koodistot.kasviryhmatyyppi ON muukasvi.cid_kasviryhmatyyppi = kasviryhmatyyppi.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON muukasvi.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON muukasvi.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON muukasvi.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON muukasvi.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.muukasvi_ogc
ADD PRIMARY KEY (fid);

--infrao:Puu

DROP TABLE IF EXISTS jakelu.puu_ogc;

CREATE TABLE jakelu.puu_ogc AS
SELECT
	puu.fid,
	puu.identifier,
	puu.alkuhetki,
	puu.loppuhetki,
	puu.omistaja,
	puu.haltija,
	puu.kunnossapitaja,
	puu.meta_datanluoja,
	puu.meta_muokkaaja,
	puu.meta_muokkauspvm,
	puu.meta_omistaja,
	puu.meta_lahteenpvm,
	puu.meta_mittausera,
	puu.meta_lisatietolinkki,
	puu.geom_point,
	puu.geom_poly,
	puu.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	puu.fid_osoite,
	CASE
		WHEN puu.cid_puutyyppi = -1 THEN NULL
		ELSE puutyyppi.selite
	END AS cid_puutyyppi,
	CASE
		WHEN puu.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN puu.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN puu.cid_puulaji = -1 THEN NULL
		ELSE puulaji.selite
	END AS cid_puulaji,
	korkeus,
	ymparys
FROM
	kasvillisuus.puu
LEFT JOIN
	koodistot.puulaji ON puu.cid_puulaji = puulaji.cid
LEFT JOIN
	koodistot.puutyyppi ON puu.cid_puutyyppi = puutyyppi.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON puu.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON puu.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON puu.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON puu.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.puu_ogc
ADD PRIMARY KEY (fid);

--infrao:Viheralue

DROP TABLE IF EXISTS jakelu.viheralue_ogc;

CREATE TABLE jakelu.viheralue_ogc AS
SELECT
	viheralue.fid,
	viheralue.identifier,
	viheralue.alkuhetki,
	viheralue.loppuhetki,
	viheralue.nimi,
	viheralue.meta_datanluoja,
	viheralue.meta_muokkaaja,
	viheralue.meta_muokkauspvm,
	viheralue.meta_omistaja,
	viheralue.meta_lahteenpvm,
	viheralue.meta_mittausera,
	viheralue.meta_lisatietolinkki
FROM
	viheralue.viheralue;

ALTER TABLE jakelu.viheralue_ogc
ADD PRIMARY KEY (fid);

--infrao:Katualue

DROP TABLE IF EXISTS jakelu.katualue_ogc;

CREATE TABLE jakelu.katualue_ogc AS
SELECT
	katualue.fid,
	katualue.identifier,
	katualue.alkuhetki,
	katualue.loppuhetki,
	katualue.nimi,
	katualue.meta_datanluoja,
	katualue.meta_muokkaaja,
	katualue.meta_muokkauspvm,
	katualue.meta_omistaja,
	katualue.meta_lahteenpvm,
	katualue.meta_mittausera,
	katualue.meta_lisatietolinkki
FROM
	katualue.katualue;

ALTER TABLE jakelu.katualue_ogc
ADD PRIMARY KEY (fid);

--infrao:Keskilinja

DROP TABLE IF EXISTS jakelu.keskilinja_ogc;

CREATE TABLE jakelu.keskilinja_ogc AS
SELECT
	keskilinja.fid,
	keskilinja.identifier,
	keskilinja.alkuhetki,
	keskilinja.loppuhetki,
	keskilinja.digiroadid,
	keskilinja.meta_datanluoja,
	keskilinja.meta_muokkaaja,
	keskilinja.meta_muokkauspvm,
	keskilinja.meta_omistaja,
	keskilinja.meta_lahteenpvm,
	keskilinja.meta_mittausera,
	keskilinja.meta_lisatietolinkki,
	keskilinja.geom,
	katualueenosa.identifier AS fid_katualueenosa
FROM
	katualue.keskilinja
LEFT JOIN
	katualue.katualueenosa ON keskilinja.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.keskilinja_ogc
ADD PRIMARY KEY (fid);

--infrao:KatualueenOsa

DROP TABLE IF EXISTS jakelu.katualueenosa_ogc;

CREATE TABLE jakelu.katualueenosa_ogc AS
SELECT
	katualueenosa.fid,
	katualueenosa.identifier,
	katualueenosa.alkuhetki,
	katualueenosa.loppuhetki,
	katualueenosa.omistaja,
	katualueenosa.haltija,
	katualueenosa.kunnossapitaja,
	katualueenosa.kunnossapito,
	katualueenosa.leveys,
	katualueenosa.perusparannusvuosi,
	katualueenosa.pinta_ala,
	katualueenosa.pituus,
	katualueenosa.puhtaanapito,
	katualueenosa.talvikunnossapito,
	katualueenosa.valmistumisvuosi,
	katualueenosa.meta_datanluoja,
	katualueenosa.meta_muokkaaja,
	katualueenosa.meta_muokkauspvm,
	katualueenosa.meta_omistaja,
	katualueenosa.meta_lahteenpvm,
	katualueenosa.meta_mittausera,
	katualueenosa.meta_lisatietolinkki,
	katualueenosa.geom,
	katualue.identifier AS fid_katualue,
	katualueenosa.fid_osoite,
	CASE
		WHEN katualueenosa.cid_toiminnallinenluokka = -1 THEN NULL
		ELSE toiminnallinenluokka.selite
	END AS cid_toiminnallinenluokka,
	CASE
		WHEN katualueenosa.cid_katuosanlaji = -1 THEN NULL
		ELSE katuosanlaji.selite
	END AS cid_katuosanlaji,
	CASE
		WHEN katualueenosa.cid_viherosanlajityyppi = -1 THEN NULL
		ELSE viherosanlajityyppi.selite
	END AS cid_viherosanlajityyppi,
	CASE
		WHEN katualueenosa.cid_pintamateriaali = -1 THEN NULL
		ELSE pintamateriaali.selite
	END AS cid_pintamateriaali,
	CASE
		WHEN katualueenosa.cid_hoitoluokkatyyppi = -1 THEN NULL
		ELSE hoitoluokkatyyppi.selite
	END AS cid_hoitoluokkatyyppi,
	CASE
		WHEN katualueenosa.cid_talvihoidonluokka = -1 THEN NULL
		ELSE talvihoidonluokka.selite
	END AS cid_talvihoidonluokka,
	CASE
		WHEN katualueenosa.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN katualueenosa.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi
FROM
	katualue.katualueenosa
LEFT JOIN
	koodistot.toiminnallinenluokka ON katualueenosa.cid_toiminnallinenluokka = toiminnallinenluokka.cid
LEFT JOIN
	koodistot.katuosanlaji ON katualueenosa.cid_katuosanlaji = katuosanlaji.cid
LEFT JOIN
	koodistot.viherosanlajityyppi ON katualueenosa.cid_viherosanlajityyppi = viherosanlajityyppi.cid
LEFT JOIN
	koodistot.pintamateriaali ON katualueenosa.cid_pintamateriaali = pintamateriaali.cid
LEFT JOIN
	koodistot.hoitoluokkatyyppi ON katualueenosa.cid_hoitoluokkatyyppi = hoitoluokkatyyppi.cid
LEFT JOIN
	koodistot.talvihoidonluokka ON katualueenosa.cid_talvihoidonluokka = talvihoidonluokka.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON katualueenosa.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON katualueenosa.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	katualue.katualue ON katualueenosa.fid_katualue = katualue.fid;

ALTER TABLE jakelu.katualueenosa_ogc
ADD PRIMARY KEY (fid);

--infrao:ViheralueenOsa

DROP TABLE IF EXISTS jakelu.viheralueenosa_ogc;

CREATE TABLE jakelu.viheralueenosa_ogc AS
SELECT
	viheralueenosa.fid,
	viheralueenosa.identifier,
	viheralueenosa.alkuhetki,
	viheralueenosa.loppuhetki,
	viheralueenosa.omistaja,
	viheralueenosa.haltija,
	viheralueenosa.kunnossapitaja,
	viheralueenosa.perusparannusvuosi,
	viheralueenosa.valmistumisvuosi,
	viheralueenosa.suojelualuekytkin,
	viheralueenosa.meta_datanluoja,
	viheralueenosa.meta_muokkaaja,
	viheralueenosa.meta_muokkauspvm,
	viheralueenosa.meta_omistaja,
	viheralueenosa.meta_lahteenpvm,
	viheralueenosa.meta_mittausera,
	viheralueenosa.meta_lisatietolinkki,
	viheralueenosa.geom,
	viheralue.identifier AS fid_viheralue,
	viheralueenosa.fid_osoite,
	CASE
		WHEN viheralueenosa.cid_viheralueenkayttotarkoitus = -1 THEN NULL
		ELSE viheralueenkayttotarkoitus.selite
	END AS cid_viheralueenkayttotarkoitus,
	CASE
		WHEN viheralueenosa.cid_viherosanlajityyppi = -1 THEN NULL
		ELSE viherosanlajityyppi.selite
	END AS cid_viherosanlajityyppi,
	CASE
		WHEN viheralueenosa.cid_hoitoluokkatyyppi = -1 THEN NULL
		ELSE hoitoluokkatyyppi.selite
	END AS cid_hoitoluokkatyyppi,
	CASE
		WHEN viheralueenosa.cid_katuosanlaji = -1 THEN NULL
		ELSE katuosanlaji.selite
	END AS cid_katuosanlaji,
	CASE
		WHEN viheralueenosa.cid_talvihoidonluokka = -1 THEN NULL
		ELSE talvihoidonluokka.selite
	END AS cid_talvihoidonluokka,
	CASE
		WHEN viheralueenosa.cid_puhtaanapitoluokkatyyppi = -1 THEN NULL
		ELSE puhtaanapitoluokkatyyppi.selite
	END AS cid_puhtaanapitoluokkatyyppi,
	CASE
		WHEN viheralueenosa.cid_muutoshoitoluokkatyyppi = -1 THEN NULL
		ELSE muutoshoitoluokkatyyppi.selite
	END AS cid_muutoshoitoluokkatyyppi,
	CASE
		WHEN viheralueenosa.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN viheralueenosa.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi
FROM
	viheralue.viheralueenosa
LEFT JOIN
	koodistot.viheralueenkayttotarkoitus ON viheralueenosa.cid_viheralueenkayttotarkoitus = viheralueenkayttotarkoitus.cid
LEFT JOIN
	koodistot.viherosanlajityyppi ON viheralueenosa.cid_viherosanlajityyppi = viherosanlajityyppi.cid
LEFT JOIN
	koodistot.hoitoluokkatyyppi ON viheralueenosa.cid_hoitoluokkatyyppi = hoitoluokkatyyppi.cid
LEFT JOIN
	koodistot.katuosanlaji ON viheralueenosa.cid_katuosanlaji = katuosanlaji.cid
LEFT JOIN
	koodistot.talvihoidonluokka ON viheralueenosa.cid_talvihoidonluokka = talvihoidonluokka.cid
LEFT JOIN
	koodistot.puhtaanapitoluokkatyyppi ON viheralueenosa.cid_puhtaanapitoluokkatyyppi = puhtaanapitoluokkatyyppi.cid
LEFT JOIN
	koodistot.muutoshoitoluokkatyyppi ON viheralueenosa.cid_muutoshoitoluokkatyyppi = muutoshoitoluokkatyyppi.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON viheralueenosa.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON viheralueenosa.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralue ON viheralueenosa.fid_viheralue = viheralue.fid;

ALTER TABLE jakelu.viheralueenosa_ogc
ADD PRIMARY KEY (fid);

--infrao:ErikoisrakenneKerros

DROP TABLE IF EXISTS jakelu.erikoisrakennekerros_ogc;

CREATE TABLE jakelu.erikoisrakennekerros_ogc AS
SELECT
	erikoisrakennekerros.fid,
	erikoisrakennekerros.identifier,
	erikoisrakennekerros.alkuhetki,
	erikoisrakennekerros.loppuhetki,
	erikoisrakennekerros.omistaja,
	erikoisrakennekerros.haltija,
	erikoisrakennekerros.kunnossapitaja,
	erikoisrakennekerros.erk_selite,
	erikoisrakennekerros.materiaali,
	erikoisrakennekerros.meta_datanluoja,
	erikoisrakennekerros.meta_muokkaaja,
	erikoisrakennekerros.meta_muokkauspvm,
	erikoisrakennekerros.meta_omistaja,
	erikoisrakennekerros.meta_lahteenpvm,
	erikoisrakennekerros.meta_mittausera,
	erikoisrakennekerros.meta_lisatietolinkki,
	erikoisrakennekerros.geom_poly,
	erikoisrakennekerros.geom_line,
	erikoisrakennekerros.geom_point,
	erikoisrakennekerros.fid_osoite,
	CASE
		WHEN erikoisrakennekerros.cid_erikoisrakennekerrosmateriaalityyppi = -1 THEN NULL
		ELSE erikoisrakennekerrosmateriaalityyppi.selite
	END AS cid_erikoisrakennekerrosmateriaalityyppi,
	CASE
		WHEN erikoisrakennekerros.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN erikoisrakennekerros.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi
FROM
	kohteet.erikoisrakennekerros
LEFT JOIN
	koodistot.erikoisrakennekerrosmateriaalityyppi ON erikoisrakennekerros.cid_erikoisrakennekerrosmateriaalityyppi = erikoisrakennekerrosmateriaalityyppi.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON erikoisrakennekerros.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON erikoisrakennekerros.cid_luontitapatyyppi = luontitapatyyppi.cid;

ALTER TABLE jakelu.erikoisrakennekerros_ogc
ADD PRIMARY KEY (fid);

--infrao:Osoite

DROP TABLE IF EXISTS jakelu.osoite_ogc;

CREATE TABLE jakelu.osoite_ogc AS
SELECT
	osoite.fid,
	osoite.kunta,
	osoite.osoitenumero,
	osoite.osoitenumero2,
	osoite.jakokirjain,
	osoite.jakokirjain2,
	osoite.porras,
	osoite.huoneisto,
	osoite.huoneistojakokirjain,
	osoite.postinumero,
	osoite.postitoimipaikannimi,
	osoite.viitesijaintialue,
	osoite.nimitieto,
	osoite.geom_poly,
	osoite.geom_line,
	osoite.geom_point
FROM
	osoite.osoite;

ALTER TABLE jakelu.osoite_ogc
ADD PRIMARY KEY (fid);

--infrao:Rakenne

DROP TABLE IF EXISTS jakelu.rakenne_ogc;

CREATE TABLE jakelu.rakenne_ogc AS
SELECT
	rakenne.fid,
	rakenne.identifier,
	rakenne.valmistumisvuosi,
	rakenne.perusparannusvuosi,
	rakenne.alkuhetki,
	rakenne.loppuhetki,
	rakenne.malli,
	rakenne.suunta,
	rakenne.valmistaja,
	rakenne.omistaja,
	rakenne.haltija,
	rakenne.kunnossapitaja,
	rakenne.meta_datanluoja,
	rakenne.meta_muokkaaja,
	rakenne.meta_muokkauspvm,
	rakenne.meta_omistaja,
	rakenne.meta_lahteenpvm,
	rakenne.meta_mittausera,
	rakenne.meta_lisatietolinkki,
	rakenne.geom_point,
	rakenne.geom_poly,
	rakenne.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	rakenne.fid_osoite,
	CASE
		WHEN rakenne.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN rakenne.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN rakenne.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN rakenne.cid_rakennetyyppi = -1 THEN NULL
		ELSE rakennetyyppi.selite
	END AS cid_rakennetyyppi
FROM
	kohteet.rakenne
LEFT JOIN
	koodistot.rakennetyyppi ON rakenne.cid_rakennetyyppi = rakennetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON rakenne.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON rakenne.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON rakenne.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON rakenne.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON rakenne.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.rakenne_ogc
ADD PRIMARY KEY (fid);

--infrao:Hulevesi

DROP TABLE IF EXISTS jakelu.hulevesi_ogc;

CREATE TABLE jakelu.hulevesi_ogc AS
SELECT
	hulevesi.fid,
	hulevesi.identifier,
	hulevesi.valmistumisvuosi,
	hulevesi.perusparannusvuosi,
	hulevesi.alkuhetki,
	hulevesi.loppuhetki,
	hulevesi.malli,
	hulevesi.suunta,
	hulevesi.valmistaja,
	hulevesi.omistaja,
	hulevesi.haltija,
	hulevesi.kunnossapitaja,
	hulevesi.meta_datanluoja,
	hulevesi.meta_muokkaaja,
	hulevesi.meta_muokkauspvm,
	hulevesi.meta_omistaja,
	hulevesi.meta_lahteenpvm,
	hulevesi.meta_mittausera,
	hulevesi.meta_lisatietolinkki,
	hulevesi.geom_point,
	hulevesi.geom_poly,
	hulevesi.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	hulevesi.fid_osoite,
	CASE
		WHEN hulevesi.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN hulevesi.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN hulevesi.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN hulevesi.cid_hulevesityyppi = -1 THEN NULL
		ELSE hulevesityyppi.selite
	END AS cid_hulevesityyppi
FROM
	kohteet.hulevesi
LEFT JOIN
	koodistot.hulevesityyppi ON hulevesi.cid_hulevesityyppi = hulevesityyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON hulevesi.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON hulevesi.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON hulevesi.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON hulevesi.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON hulevesi.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.hulevesi_ogc
ADD PRIMARY KEY (fid);

--infrao:Ymparistotaide

DROP TABLE IF EXISTS jakelu.ymparistotaide_ogc;

CREATE TABLE jakelu.ymparistotaide_ogc AS
SELECT
	ymparistotaide.fid,
	ymparistotaide.identifier,
	ymparistotaide.valmistumisvuosi,
	ymparistotaide.perusparannusvuosi,
	ymparistotaide.alkuhetki,
	ymparistotaide.loppuhetki,
	ymparistotaide.malli,
	ymparistotaide.suunta,
	ymparistotaide.valmistaja,
	ymparistotaide.omistaja,
	ymparistotaide.haltija,
	ymparistotaide.kunnossapitaja,
	ymparistotaide.meta_datanluoja,
	ymparistotaide.meta_muokkaaja,
	ymparistotaide.meta_muokkauspvm,
	ymparistotaide.meta_omistaja,
	ymparistotaide.meta_lahteenpvm,
	ymparistotaide.meta_mittausera,
	ymparistotaide.meta_lisatietolinkki,
	ymparistotaide.geom_point,
	ymparistotaide.geom_poly,
	ymparistotaide.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	ymparistotaide.fid_osoite,
	CASE
		WHEN ymparistotaide.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN ymparistotaide.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN ymparistotaide.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN ymparistotaide.cid_ymparistotaidetyyppi = -1 THEN NULL
		ELSE ymparistotaidetyyppi.selite
	END AS cid_ymparistotaidetyyppi
FROM
	kohteet.ymparistotaide
LEFT JOIN
	koodistot.ymparistotaidetyyppi ON ymparistotaide.cid_ymparistotaidetyyppi = ymparistotaidetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON ymparistotaide.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON ymparistotaide.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON ymparistotaide.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON ymparistotaide.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON ymparistotaide.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.ymparistotaide_ogc
ADD PRIMARY KEY (fid);

--infrao:Pysakointiruutu

DROP TABLE IF EXISTS jakelu.pysakointiruutu_ogc;

CREATE TABLE jakelu.pysakointiruutu_ogc AS
SELECT
	pysakointiruutu.fid,
	pysakointiruutu.identifier,
	pysakointiruutu.valmistumisvuosi,
	pysakointiruutu.perusparannusvuosi,
	pysakointiruutu.alkuhetki,
	pysakointiruutu.loppuhetki,
	pysakointiruutu.malli,
	pysakointiruutu.suunta,
	pysakointiruutu.valmistaja,
	pysakointiruutu.omistaja,
	pysakointiruutu.haltija,
	pysakointiruutu.kunnossapitaja,
	pysakointiruutu.meta_datanluoja,
	pysakointiruutu.meta_muokkaaja,
	pysakointiruutu.meta_muokkauspvm,
	pysakointiruutu.meta_omistaja,
	pysakointiruutu.meta_lahteenpvm,
	pysakointiruutu.meta_mittausera,
	pysakointiruutu.meta_lisatietolinkki,
	pysakointiruutu.geom_point,
	pysakointiruutu.geom_poly,
	pysakointiruutu.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	pysakointiruutu.fid_osoite,
	CASE
		WHEN pysakointiruutu.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN pysakointiruutu.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN pysakointiruutu.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	pysakointiruutu.latauspiste_kytkin
FROM
	kohteet.pysakointiruutu
LEFT JOIN
	koodistot.varustemateriaali ON pysakointiruutu.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON pysakointiruutu.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON pysakointiruutu.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON pysakointiruutu.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON pysakointiruutu.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.pysakointiruutu_ogc
ADD PRIMARY KEY (fid);

--infrao:Ajoratamerkinta

DROP TABLE IF EXISTS jakelu.ajoratamerkinta_ogc;

CREATE TABLE jakelu.ajoratamerkinta_ogc AS
SELECT
	ajoratamerkinta.fid,
	ajoratamerkinta.identifier,
	ajoratamerkinta.valmistumisvuosi,
	ajoratamerkinta.perusparannusvuosi,
	ajoratamerkinta.alkuhetki,
	ajoratamerkinta.loppuhetki,
	ajoratamerkinta.malli,
	ajoratamerkinta.suunta,
	ajoratamerkinta.valmistaja,
	ajoratamerkinta.omistaja,
	ajoratamerkinta.haltija,
	ajoratamerkinta.kunnossapitaja,
	ajoratamerkinta.meta_datanluoja,
	ajoratamerkinta.meta_muokkaaja,
	ajoratamerkinta.meta_muokkauspvm,
	ajoratamerkinta.meta_omistaja,
	ajoratamerkinta.meta_lahteenpvm,
	ajoratamerkinta.meta_mittausera,
	ajoratamerkinta.meta_lisatietolinkki,
	ajoratamerkinta.geom_point,
	ajoratamerkinta.geom_poly,
	ajoratamerkinta.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	ajoratamerkinta.fid_osoite,
	CASE
		WHEN ajoratamerkinta.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN ajoratamerkinta.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN ajoratamerkinta.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN ajoratamerkinta.cid_ajoratamerkintatyyppi = -1 THEN NULL
		ELSE ajoratamerkintatyyppi.selite
	END AS cid_ajoratamerkintatyyppi,
	ajoratamerkinta.jyrsittypinta_kytkin
FROM
	katualue.ajoratamerkinta
LEFT JOIN
	koodistot.ajoratamerkintatyyppi ON ajoratamerkinta.cid_ajoratamerkintatyyppi = ajoratamerkintatyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON ajoratamerkinta.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON ajoratamerkinta.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON ajoratamerkinta.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON ajoratamerkinta.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON ajoratamerkinta.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.ajoratamerkinta_ogc
ADD PRIMARY KEY (fid);

--infrao:Leikkivaline

DROP TABLE IF EXISTS jakelu.leikkivaline_ogc;

CREATE TABLE jakelu.leikkivaline_ogc AS
SELECT
	leikkivaline.fid,
	leikkivaline.identifier,
	leikkivaline.valmistumisvuosi,
	leikkivaline.perusparannusvuosi,
	leikkivaline.alkuhetki,
	leikkivaline.loppuhetki,
	leikkivaline.malli,
	leikkivaline.suunta,
	leikkivaline.valmistaja,
	leikkivaline.omistaja,
	leikkivaline.haltija,
	leikkivaline.kunnossapitaja,
	leikkivaline.meta_datanluoja,
	leikkivaline.meta_muokkaaja,
	leikkivaline.meta_muokkauspvm,
	leikkivaline.meta_omistaja,
	leikkivaline.meta_lahteenpvm,
	leikkivaline.meta_mittausera,
	leikkivaline.meta_lisatietolinkki,
	leikkivaline.geom_point,
	leikkivaline.geom_poly,
	leikkivaline.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	leikkivaline.fid_osoite,
	CASE
		WHEN leikkivaline.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN leikkivaline.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN leikkivaline.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN leikkivaline.cid_leikkivalinetyyppi = -1 THEN NULL
		ELSE leikkivalinetyyppi.selite
	END AS cid_leikkivalinetyyppi,
	leikkivaline.toiminnallinentarkastus_pvm,
	leikkivaline.vuositarkastus_pvm
FROM
	varusteet.leikkivaline
LEFT JOIN
	koodistot.leikkivalinetyyppi ON leikkivaline.cid_leikkivalinetyyppi = leikkivalinetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON leikkivaline.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON leikkivaline.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON leikkivaline.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON leikkivaline.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON leikkivaline.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.leikkivaline_ogc
ADD PRIMARY KEY (fid);

--infrao:MuuVaruste

DROP TABLE IF EXISTS jakelu.muuvaruste_ogc;

CREATE TABLE jakelu.muuvaruste_ogc AS
SELECT
	muuvaruste.fid,
	muuvaruste.identifier,
	muuvaruste.valmistumisvuosi,
	muuvaruste.perusparannusvuosi,
	muuvaruste.alkuhetki,
	muuvaruste.loppuhetki,
	muuvaruste.malli,
	muuvaruste.suunta,
	muuvaruste.valmistaja,
	muuvaruste.omistaja,
	muuvaruste.haltija,
	muuvaruste.kunnossapitaja,
	muuvaruste.meta_datanluoja,
	muuvaruste.meta_muokkaaja,
	muuvaruste.meta_muokkauspvm,
	muuvaruste.meta_omistaja,
	muuvaruste.meta_lahteenpvm,
	muuvaruste.meta_mittausera,
	muuvaruste.meta_lisatietolinkki,
	muuvaruste.geom_point,
	muuvaruste.geom_poly,
	muuvaruste.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	muuvaruste.fid_osoite,
	CASE
		WHEN muuvaruste.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN muuvaruste.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN muuvaruste.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN muuvaruste.cid_muuvarustetyyppi = -1 THEN NULL
		ELSE muuvarustetyyppi.selite
	END AS cid_muuvarustetyyppi
FROM
	varusteet.muuvaruste
LEFT JOIN
	koodistot.muuvarustetyyppi ON muuvaruste.cid_muuvarustetyyppi = muuvarustetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON muuvaruste.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON muuvaruste.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON muuvaruste.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON muuvaruste.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON muuvaruste.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.muuvaruste_ogc
ADD PRIMARY KEY (fid);

--infrao:Kaluste

DROP TABLE IF EXISTS jakelu.kaluste_ogc;

CREATE TABLE jakelu.kaluste_ogc AS
SELECT
	kaluste.fid,
	kaluste.identifier,
	kaluste.valmistumisvuosi,
	kaluste.perusparannusvuosi,
	kaluste.alkuhetki,
	kaluste.loppuhetki,
	kaluste.malli,
	kaluste.suunta,
	kaluste.valmistaja,
	kaluste.omistaja,
	kaluste.haltija,
	kaluste.kunnossapitaja,
	kaluste.meta_datanluoja,
	kaluste.meta_muokkaaja,
	kaluste.meta_muokkauspvm,
	kaluste.meta_omistaja,
	kaluste.meta_lahteenpvm,
	kaluste.meta_mittausera,
	kaluste.meta_lisatietolinkki,
	kaluste.geom_point,
	kaluste.geom_poly,
	kaluste.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	kaluste.fid_osoite,
	CASE
		WHEN kaluste.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN kaluste.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN kaluste.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN kaluste.cid_kalustetyyppi = -1 THEN NULL
		ELSE kalustetyyppi.selite
	END AS cid_kalustetyyppi
FROM
	varusteet.kaluste
LEFT JOIN
	koodistot.kalustetyyppi ON kaluste.cid_kalustetyyppi = kalustetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON kaluste.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON kaluste.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON kaluste.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON kaluste.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON kaluste.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.kaluste_ogc
ADD PRIMARY KEY (fid);

--infrao:Melu

DROP TABLE IF EXISTS jakelu.melukohde_ogc;

CREATE TABLE jakelu.melukohde_ogc AS
SELECT
	melukohde.fid,
	melukohde.identifier,
	melukohde.valmistumisvuosi,
	melukohde.perusparannusvuosi,
	melukohde.alkuhetki,
	melukohde.loppuhetki,
	melukohde.malli,
	melukohde.suunta,
	melukohde.valmistaja,
	melukohde.omistaja,
	melukohde.haltija,
	melukohde.kunnossapitaja,
	melukohde.meta_datanluoja,
	melukohde.meta_muokkaaja,
	melukohde.meta_muokkauspvm,
	melukohde.meta_omistaja,
	melukohde.meta_lahteenpvm,
	melukohde.meta_mittausera,
	melukohde.meta_lisatietolinkki,
	melukohde.geom_point,
	melukohde.geom_poly,
	melukohde.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	melukohde.fid_osoite,
	CASE
		WHEN melukohde.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN melukohde.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN melukohde.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN melukohde.cid_melutyyppi = -1 THEN NULL
		ELSE melutyyppi.selite
	END AS cid_melutyyppi
FROM
	varusteet.melukohde
LEFT JOIN
	koodistot.melutyyppi ON melukohde.cid_melutyyppi = melutyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON melukohde.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON melukohde.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON melukohde.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON melukohde.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON melukohde.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.melukohde_ogc
ADD PRIMARY KEY (fid);

--infrao:Liikunta

DROP TABLE IF EXISTS jakelu.liikunta_ogc;

CREATE TABLE jakelu.liikunta_ogc AS
SELECT
	liikunta.fid,
	liikunta.identifier,
	liikunta.valmistumisvuosi,
	liikunta.perusparannusvuosi,
	liikunta.alkuhetki,
	liikunta.loppuhetki,
	liikunta.malli,
	liikunta.suunta,
	liikunta.valmistaja,
	liikunta.omistaja,
	liikunta.haltija,
	liikunta.kunnossapitaja,
	liikunta.meta_datanluoja,
	liikunta.meta_muokkaaja,
	liikunta.meta_muokkauspvm,
	liikunta.meta_omistaja,
	liikunta.meta_lahteenpvm,
	liikunta.meta_mittausera,
	liikunta.meta_lisatietolinkki,
	liikunta.geom_point,
	liikunta.geom_poly,
	liikunta.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	liikunta.fid_osoite,
	CASE
		WHEN liikunta.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN liikunta.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN liikunta.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN liikunta.cid_liikuntatyyppi = -1 THEN NULL
		ELSE liikuntatyyppi.selite
	END AS cid_liikuntatyyppi
FROM
	varusteet.liikunta
LEFT JOIN
	koodistot.liikuntatyyppi ON liikunta.cid_liikuntatyyppi = liikuntatyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON liikunta.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON liikunta.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON liikunta.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON liikunta.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON liikunta.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.liikunta_ogc
ADD PRIMARY KEY (fid);

--infrao:Opaste

DROP TABLE IF EXISTS jakelu.opaste_ogc;

CREATE TABLE jakelu.opaste_ogc AS
SELECT
	opaste.fid,
	opaste.identifier,
	opaste.valmistumisvuosi,
	opaste.perusparannusvuosi,
	opaste.alkuhetki,
	opaste.loppuhetki,
	opaste.malli,
	opaste.suunta,
	opaste.valmistaja,
	opaste.omistaja,
	opaste.haltija,
	opaste.kunnossapitaja,
	opaste.meta_datanluoja,
	opaste.meta_muokkaaja,
	opaste.meta_muokkauspvm,
	opaste.meta_omistaja,
	opaste.meta_lahteenpvm,
	opaste.meta_mittausera,
	opaste.meta_lisatietolinkki,
	opaste.geom_point,
	opaste.geom_poly,
	opaste.geom_line,
	viheralueenosa.identifier AS fid_viheralueenosa,
	katualueenosa.identifier AS fid_katualueenosa,
	opaste.fid_osoite,
	CASE
		WHEN opaste.cid_varustemateriaali = -1 THEN NULL
		ELSE varustemateriaali.selite
	END AS cid_varustemateriaali,
	CASE
		WHEN opaste.cid_sijaintiepavarmuustyyppi = -1 THEN NULL
		ELSE sijaintiepavarmuustyyppi.selite
	END AS cid_sijaintiepavarmuustyyppi,
	CASE
		WHEN opaste.cid_luontitapatyyppi = -1 THEN NULL
		ELSE luontitapatyyppi.selite
	END AS cid_luontitapatyyppi,
	CASE
		WHEN opaste.cid_opastetyyppi = -1 THEN NULL
		ELSE opastetyyppi.selite
	END AS cid_opastetyyppi
FROM
	varusteet.opaste
LEFT JOIN
	koodistot.opastetyyppi ON opaste.cid_opastetyyppi = opastetyyppi.cid
LEFT JOIN
	koodistot.varustemateriaali ON opaste.cid_varustemateriaali = varustemateriaali.cid
LEFT JOIN
	koodistot.sijaintiepavarmuustyyppi ON opaste.cid_sijaintiepavarmuustyyppi = sijaintiepavarmuustyyppi.cid
LEFT JOIN
	koodistot.luontitapatyyppi ON opaste.cid_luontitapatyyppi = luontitapatyyppi.cid
LEFT JOIN
	viheralue.viheralueenosa ON opaste.fid_viheralueenosa = viheralueenosa.fid
LEFT JOIN
	katualue.katualueenosa ON opaste.fid_katualueenosa = katualueenosa.fid;

ALTER TABLE jakelu.opaste_ogc
ADD PRIMARY KEY (fid);