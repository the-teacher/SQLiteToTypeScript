
################################################
# SQLite
################################################

sqlite_up:
	docker-compose up -d sqlite

sqlite_down:
	docker-compose down sqlite

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

################################################
# Node
################################################

node_up:
	docker-compose up -d node

node_shell:
	docker-compose exec node sh

node_update_yarn:
	# yarn init -2
	docker-compose exec node yarn set version berry

node_down:
	docker-compose stop node

################################################
# Common
################################################

status:
	docker ps