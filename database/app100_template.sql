SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'app100' AND pid <> pg_backend_pid();
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'app100';
UPDATE pg_database SET datallowconn = FALSE WHERE datname = 'app100';