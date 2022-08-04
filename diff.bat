@ECHO off;

SET MIGRATION_NAME=%1

ECHO Running migrations
docker compose up flyway

ECHO Running diff to %MIGRATION_NAME%.sql
pgmodeler-cli.exe --diff --save --input db/infrao.dbm --compare-to mm --conn-alias local-db --output db/migrations/%MIGRATION_NAME%.sql --pgsql-ver 13.0
