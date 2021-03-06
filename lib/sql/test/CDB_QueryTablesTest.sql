
WITH inp AS ( select 'SELECT * FROM geometry_columns'::text as q )
 SELECT q, CDB_QueryTables(q) from inp;

WITH inp AS ( select 'SELECT a.attname FROM pg_class c JOIN pg_attribute a on (a.attrelid = c.oid)'::text as q )
 SELECT q, CDB_QueryTables(q) from inp;

WITH inp AS ( select $quote$CREATE table "my'tab;le" as select 1$quote$::text as q )
 SELECT q, CDB_QueryTables(q) from inp;

WITH inp AS ( select 'SELECT a.oid, b.oid FROM pg_class a, pg_class b'::text as q )
 SELECT q, CDB_QueryTables(q) from inp;

WITH inp AS ( select 'SELECT 1 as col1; select 2 as col2'::text as q )
 SELECT q, CDB_QueryTables(q) from inp;

-- Cannot automate this until I figure how to omit filename from the WARNING output..
--WITH inp AS ( select 'select 1 from nonexistent'::text as q )
-- SELECT q, CDB_QueryTables(q) from inp;
