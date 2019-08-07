SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'platform' AND pid <> pg_backend_pid();
DROP DATABASE IF EXISTS platform;

SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'auth' AND pid <> pg_backend_pid();
DROP DATABASE IF EXISTS auth;

UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'app100';
UPDATE pg_database SET datallowconn = TRUE WHERE datname = 'app100';
DROP DATABASE IF EXISTS app100;