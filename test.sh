#!/usr/bin/env bash
set -e
useradd -ms /bin/bash postgres
rm -rf /home/postgres/pgdata/
mkdir /home/postgres/pgdata/
chown postgres:postgres /home/postgres/pgdata/
chown postgres:postgres /home/postgres/

su postgres
cd
/usr/local/pgsql/bin/pg_ctl initdb --pgdata=/home/postgres/pgdata/
/usr/local/pgsql/bin/pg_ctl -D /home/postgres/pgdata -l logfile start

/usr/local/pgsql/bin/psql -C "alter system set superuser_reserved_connections = 10; alter system set max_connections = 5;"

/usr/local/pgsql/bin/pg_ctl stop -D /home/postgres/pgdata





"2019-09-20 02:34:22.507 UTC [16307] LOG:  starting PostgreSQL 13devel on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
2019-09-20 02:34:22.507 UTC [16307] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2019-09-20 02:34:22.512 UTC [16307] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2019-09-20 02:34:22.520 UTC [16308] LOG:  database system was shut down at 2019-09-20 02:34:17 UTC
2019-09-20 02:34:22.525 UTC [16307] LOG:  database system is ready to accept connections
2019-09-20 02:36:31.974 UTC [16316] ERROR:  0 is outside the valid range for parameter "max_connections" (1 .. 262143)
2019-09-20 02:36:31.974 UTC [16316] STATEMENT:  ALTER SYSTEM SET max_connections = 0;
2019-09-20 02:38:53.979 UTC [16307] LOG:  received fast shutdown request
2019-09-20 02:38:53.983 UTC [16307] LOG:  aborting any active transactions
2019-09-20 02:38:53.984 UTC [16307] LOG:  background worker "logical replication launcher" (PID 16314) exited with exit code 1
2019-09-20 02:38:53.984 UTC [16309] LOG:  shutting down
2019-09-20 02:38:54.012 UTC [16307] LOG:  database system is shut down
postgres: superuser_reserved_connections (10) must be less than max_connections (5)"