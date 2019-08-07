UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'app100';
UPDATE pg_database SET datallowconn = TRUE WHERE datname = 'app100';
DROP DATABASE IF EXISTS app100;