CREATE TEMP VIEW table_docs AS
SELECT
  n.nspname "Skeeman nimi",
  c.relname "Taulun nimi",
  obj_description(c.oid) "Kommentti"
FROM
  pg_class c
  LEFT JOIN pg_namespace n
    ON n.oid = c.relnamespace
WHERE
  n.nspname in ('mm', 'mm_koodistot')
  and relkind = 'r'
  and relname <> 'flyway_schema_history'
order by 1, 2;
\COPY (select * from table_docs) TO './docs/db/taulut.csv' WITH CSV DELIMITER ';' HEADER ENCODING 'WIN1252';


CREATE TEMP VIEW views_docs AS
SELECT
  n.nspname "Skeeman nimi",
  c.relname "Näkymän nimi",
  obj_description(c.oid) "Kommentti"
FROM
  pg_class c
  LEFT JOIN pg_namespace n
    ON n.oid = c.relnamespace
WHERE
  n.nspname in ('mm', 'mm_koodistot')
  and relkind = 'v'
order by 1, 2;
\COPY (select * from views_docs) TO './docs/db/nakymat.csv' WITH CSV DELIMITER ';' HEADER ENCODING 'WIN1252';

CREATE TEMP VIEW columns_docs AS
SELECT
  ns.nspname "Skeema",
  c.relname "Taulu",
  a.attname as "Attribuutti",
  pg_catalog.format_type(a.atttypid, a.atttypmod) "Datatyyppi",
  (
    SELECT pg_catalog.pg_get_expr(d.adbin, d.adrelid, true)
    FROM pg_catalog.pg_attrdef d
    WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum AND a.atthasdef
  ) as "Oletusarvo",
  CASE WHEN a.attnotnull THEN 'x' ELSE '' END "NOT NULL",
  pg_catalog.col_description(a.attrelid, a.attnum) as "Kommentti"
FROM
  pg_catalog.pg_class c
  LEFT JOIN pg_catalog.pg_namespace ns
    ON ns.oid = c.relnamespace
  LEFT JOIN pg_catalog.pg_attribute a
    ON c.oid = a.attrelid
WHERE
  ns.nspname in ('mm', 'mm_koodistot')
  AND c.relkind in ('r')
  and relname <> 'flyway_schema_history'
  AND a.attnum > 0
  AND NOT a.attisdropped
ORDER BY ns.nspname, c.relname, a.attnum;

\COPY (select * from columns_docs) TO './docs/db/attribuutit.csv' WITH CSV DELIMITER ';' HEADER ENCODING 'WIN1252';



CREATE TEMP VIEW trigger_docs AS
SELECT 
  c.relnamespace::regnamespace::text as "Skeema", 
  c.relname                  as "Taulu",
  t.tgname                           as "Triggerin nimi", 
  COALESCE(
    CASE WHEN (tgtype::int::bit(7) & b'0000010')::int = 0 THEN NULL ELSE 'BEFORE' END,
    CASE WHEN (tgtype::int::bit(7) & b'0000010')::int = 0 THEN 'AFTER' ELSE NULL END,
    CASE WHEN (tgtype::int::bit(7) & b'1000000')::int = 0 THEN NULL ELSE 'INSTEAD' END,
    ''
  )::text as "Ajoitus", 
    array_to_string(array_remove(ARRAY[CASE WHEN (tgtype::int::bit(7) & b'0000100')::int = 0 THEN null ELSE 'INSERT' END,
    CASE WHEN (tgtype::int::bit(7) & b'0001000')::int = 0 THEN null ELSE 'DELETE' END,
    CASE WHEN (tgtype::int::bit(7) & b'0010000')::int = 0 THEN null ELSE 'UPDATE' END,
    CASE WHEN (tgtype::int::bit(7) & b'0100000')::int = 0 THEN null ELSE 'TRUNCATE' END], null), ', ')
  as "Operaatio",
  proname as "Kutusttava funktio",
  obj_description(t.oid, 'pg_trigger') "Kommentti"
FROM
  pg_trigger t
  JOIN pg_proc p
    ON t.tgfoid = p.oid
  JOIN pg_class c
    ON c.oid = t.tgrelid
WHERE 
    NOT t.tgisinternal
    OR (t.tgisinternal AND t.tgenabled = 'D')
    OR EXISTS (
      SELECT 1
      FROM pg_catalog.pg_depend
      WHERE objid = t.oid AND refclassid = 'pg_catalog.pg_trigger'::pg_catalog.regclass
    )
order by 1,2,3;
\COPY (select * from trigger_docs) TO './docs/db/triggerit.csv' WITH CSV DELIMITER ';' HEADER ENCODING 'WIN1252';


CREATE TEMP VIEW functions_docs AS
SELECT
  n.nspname as "Skeema",
  p.proname as "Funktio",
  pg_catalog.pg_get_function_arguments(p.oid) as "Argument data types",
  pg_catalog.pg_get_function_result(p.oid) as "Result data type",
  obj_description(p.oid, 'pg_proc') "Kommentti"
FROM
  pg_catalog.pg_proc p
  LEFT JOIN pg_catalog.pg_namespace n
    ON n.oid = p.pronamespace
WHERE
  n.nspname in ('mm', 'mm_koodistot')
ORDER BY 1, 2;
\COPY (select * from functions_docs) TO './docs/db/funktiot.csv' WITH CSV DELIMITER ';' HEADER ENCODING 'WIN1252';
