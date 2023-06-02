# Municipal asset inventory (Finland) 

## Database model

![docs/db/schema.png](docs/db/schema.png)
[docs/db/schema.png](docs/db/schema.png)


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
3. Modify accordingly and run `pgmodeler-cli.exe --diff --save --input infrao.dbm --compare-to infrao --conn-alias local-db --output migrations/V2__add_viheralue_table.sql --pgsql-ver 14.0`
4. Validate and modify the migration file
5. Migrate by running `docker-compose up flyway`

Or alternatively use `./diff.bat`  
```bash
./diff.bat V2__description
```
### Running migrations to a spesific version
`docker-compose run --rm flyway migrate -target="1.1.0"`

### Running migrations against different platform
`docker-compose run --rm -e FLYWAY_USER=infrao_admin -e FLYWAY_PASSWORD=<password> -e FLYWAY_URL=jdbc:postgresql://trepx-paikka1.tre.t.verkko:5432/omaisuudenhallinta_test_db flyway migrate`

## Exporting database documentation:

```
psql -p 5434 -d infrao -U infrao_admin -f .\docs\db\generate_docs.sql
```
## Export db model to png
```
& 'C:\Program Files\pgModeler\pgmodeler-cli.exe' --export-to-png --input .\db\infrao.dbm --output .\docs\db\schema.png
```
Or in Linux, accordingly:
```
/opt/pgModeler/pgmodeler-cli --export-to-png --input db/infrao.dbm --output docs/db/schema.png
```

# Editing documentation

The documentation materials are written using R Markdown and rendered to HTML using [Bookdown](https://bookdown.org).
Once .Rmd files have been edited, they should be rendered locally with Docker using the [render.sh](render.sh)
([render.ps1](render.ps1) on Windows) script.

For Windows, you may need to enable script support first.
Open Powershell as an administrator and run the command `Set-ExecutionPolicy RemoteSigned`.

## Rendering

The [index.Rmd](src/index.Rmd) file is a special file that always gets rendered first
Other Rmd files get rendered in alphabetic order to separate pages.
Use the YAML header section (separated by `---`) of index.Rmd to define a author, title, and abstract for the materials.

The HTML is rendered using custom HTML and CSS templates defined in the index.Rmd YAML header.
By default, these are [src/custom.html](src/custom.html) and [src/custom.css](src/custom.css).
Edit the template files to change the layout and appearance of the output.

Always preview the affect of changes to template files before committing changes.
This can be done by rendering the output HTML locally using [render.sh](render.sh).
After rendering, navigate to the out directory, start a http server (`python -m http.server`), and open [http://localhost:8000](http://localhost:8000).