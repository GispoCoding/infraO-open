
psql -p 5433 -d omaisuudenhallinta_db -U maamassa_admin -f .\docs\db\generate_docs.sql

"C:\Program Files\pgModeler\pgmodeler-cli.exe" --export-to-png --input .\db\infrao.dbm --output .\docs\db\schema.png
