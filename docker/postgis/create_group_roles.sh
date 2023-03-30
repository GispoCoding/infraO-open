#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

#"${psql[@]}" <<- 'EOSQL'
psql <<- 'EOSQL'
\set gisdb infrao
\set viewers :gisdb '_viewers'
\set editors :gisdb '_editors'
\set admins :gisdb '_admins'
\set dbas :gisdb '_dbas'
-- *** DBAs
SELECT
	NOT EXISTS(SELECT 
		FROM pg_catalog.pg_roles 
		WHERE rolname = :'dbas' ) 
		AS no_role; \gset
\if :no_role
	\echo == Create role :dbas
	CREATE ROLE :dbas WITH
		NOINHERIT
		CREATEROLE
		CREATEDB
		NOLOGIN;
	\set role_comment 'DBAs group role for ':gisdb' database'
	COMMENT ON ROLE :dbas IS :'role_comment';
\endif
-- *** Admins
SELECT
	NOT EXISTS(SELECT 
		FROM pg_catalog.pg_roles 
		WHERE rolname = :'admins' ) 
		AS no_role; \gset
\if :no_role
	\echo == Create role :admins
	CREATE ROLE :admins WITH
		NOINHERIT
		NOLOGIN;
	\set role_comment 'Administration group role for ':gisdb' database'
	COMMENT ON ROLE :admins IS :'role_comment';
\endif
-- *** Editors
SELECT
	NOT EXISTS(SELECT 
		FROM pg_catalog.pg_roles 
		WHERE rolname = :'editors' ) 
		AS no_role; \gset
\if :no_role
	\echo == Create role :editors
	CREATE ROLE :editors WITH
		INHERIT
		NOLOGIN;
	\set role_comment 'Editor group role for ':gisdb' database'
	COMMENT ON ROLE :editors IS :'role_comment';
\endif
-- *** Viewers
SELECT
	NOT EXISTS(SELECT 
		FROM pg_catalog.pg_roles 
		WHERE rolname = :'viewers' ) 
		AS no_role; \gset
\if :no_role
	\echo == Create role :viewers
	CREATE ROLE :viewers WITH
		INHERIT
		NOLOGIN;
	\set role_comment 'Viewer group role for ':gisdb' database'
	COMMENT ON ROLE :viewers IS :'role_comment';
\endif
GRANT :viewers TO :editors ;
GRANT :editors TO :admins;
EOSQL