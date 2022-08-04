GRANT SELECT ON ALL TABLES IN SCHEMA mm TO maamassa_ro;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA mm TO maamassa_rw;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA mm TO maamassa_rw;

GRANT SELECT ON ALL TABLES IN SCHEMA mm_koodistot TO maamassa_ro;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA mm_koodistot TO maamassa_rw;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA mm_koodistot TO maamassa_rw;

ALTER TABLE mm.qgis_projects ENABLE ROW LEVEL SECURITY;

CREATE POLICY kaikki_luettavissa ON mm.qgis_projects
    FOR SELECT
    USING (true);

CREATE POLICY muut_paitsi_master_muokattavissa ON mm.qgis_projects
    FOR ALL
    USING (name <> 'Maamassakoordinointi [master]');
