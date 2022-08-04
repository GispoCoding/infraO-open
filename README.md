# Tampereen maamassarekisteri

## Set up a dev environment

1. Copy .env.template to .env 

```bash
docker-compose up -d
docker-compose up flyway
```

## Handling database model changes
The diff operation in pgModeler is quite fragile and not recommended used directly.

We use Flyway (for now) to generate database migrations. Flyway is a SQL file based migration system.
PgModeler is used to generate diff SQL files and then apply Flyway migration.


### Creating incremental migrations
1. Verify db is up to date by running `docker-compose up flyway`
2. Modify the pgmodeler model
3. Run `pgmodeler-cli.exe --diff --save --input jkr.dbm --compare-to jkr --conn-alias local-db --output migrations/V2__add_sailio_table.sql --pgsql-ver 13.0`
4. Validate and modify the migration file
5. Migrate by running `docker-compose up flyway`

Or alternatively use `./diff.bat`  
```bash
./diff.bat V2__description
```
### Running migrations to a spesific version
`docker-compose run --rm flyway migrate -target="1.1.0"`

### Running migrations against different platform
`docker-compose run --rm -e FLYWAY_USER=maamassa_admin -e FLYWAY_PASSWORD=<password> -e FLYWAY_URL=jdbc:postgresql://trepx-paikka1.tre.t.verkko:5432/omaisuudenhallinta_test_db flyway migrate`

## Exporting database documentation:

```
psql -p 5433 -d omaisuudenhallinta_db -U maamassa_admin -f .\docs\db\generate_docs.sql
```
## Export db model to png
```
& 'C:\Program Files\pgModeler\pgmodeler-cli.exe' --export-to-png --input .\db\maamassa.dbm --output .\docs\db\schema.png
```
