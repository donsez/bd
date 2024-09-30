
-- From http://laetitia-avrot.blogspot.com/2011/04/liste-et-taille-des-bases-des-schemas.html

-- Liste et taille des bases d'une intance
SELECT datname as Nom, 
pg_database_size(datname) as Taille_en_Octets, 
pg_size_pretty(pg_database_size(datname)) as Taille
FROM pg_database
ORDER BY Taille_en_Octets DESC;

--  Liste et taille des tables d'une base de données
SELECT table_name, 
pg_relation_size(table_schema || '.' || table_name) As Taille_donnees,
pg_total_relation_size(table_schema || '.' || table_name) As Taille_totale
FROM information_schema.tables
ORDER BY Taille_totale DESC;

--  Liste et taille des schémas d'une base de données
SELECT table_schema, 
SUM(pg_relation_size(table_schema || '.' || table_name)) As Taille_donnees,
SUM(pg_total_relation_size(table_schema || '.' || table_name)) As Taille_totale
FROM information_schema.tables
GROUP BY table_schema
ORDER BY Taille_totale DESC;
