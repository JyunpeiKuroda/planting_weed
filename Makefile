proxy:
	docker run -d --name proxy \
	-v $(JSON_PATH):/config \
	-p $(PORT):3306 \
	gcr.io/cloudsql-docker/gce-proxy:1.16 \
	/cloud_sql_proxy -instances=$(CONN_NAME)=tcp:0.0.0.0:3306 -credential_file=/config

up:
	docker-compose up
	docker ps

down:
	docker-compose down
	docker ps
	docker ps -a