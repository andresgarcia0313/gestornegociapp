

docker exec -t gestordeproyectos-db-1 pg_dumpall -c -U postgres > copiadb.sql
type copiadb.sql | docker exec -i gestordeproyectos-db-1 psql -U postgres -d dbgestionapp


https://simplebackups.com/blog/docker-postgres-backup-restore-guide-with-examples/

cat copiadb.sql | docker exec -i gestordeproyectos-db-1 psql -U postgres -d dbgestionapp













Backup Database
generate sql:

docker exec -t your-db-container pg_dumpall -c -U your-db-user > dump_$(date +%Y-%m-%d_%H_%M_%S).sql
to reduce the size of the sql you can generate a compress:

docker exec -t your-db-container pg_dumpall -c -U your-db-user | gzip > ./dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
Restore Database
cat your_dump.sql | docker exec -i your-db-container psql -U your-db-user -d your-db-name
to restore a compressed sql:

gunzip < your_dump.sql.gz | docker exec -i your-db-container psql -U your-db-user -d your-db-name