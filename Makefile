sqlite_up:
	docker-compose up -d sqlite

sqlite_shell:
	docker-compose exec sqlite sh

sqlite_delete_db:
	docker-compose exec sqlite sh -c "rm -f /data/test_database.db"
	
sqlite_open_db:
	docker-compose exec sqlite sqlite3 /data/test_database.db

sqlite_load_data:
	docker-compose exec sqlite sh -c "sqlite3 /data/test_database.db < /data/test_data.sql"

sqlite_dump_schema:
	echo ".output /data/schema.sql\n.schema\n.output stdout" | docker-compose exec -T sqlite sqlite3 /data/test_database.db

status:
	docker ps