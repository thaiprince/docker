build:
	docker compose build --no-cache --force-rm
stop:
	docker compose stop
clean:
	docker compose down --rmi all --volumes --remove-orphans
up:
	docker compose up -d
bash:
	docker exec -it anhnt-web bash
permission:
    # Set permissions for storage folder in docker container
	docker exec -it --user root anhnt-web chmod -R 777 storage
	docker exec -it --user root anhnt-web chmod -R 777 bootstrap/cache
win:
	@echo "Runing on Windows"
	@.\mkcert\mkcert-v1.4.4-windows-amd64.exe -install
	@.\mkcert\mkcert-v1.4.4-windows-amd64.exe --key-file .\cert\my-key.pem  --cert-file .\cert\my-cert.pem *.ex.lc localhost 127.0.0.1 ::1
ifeq ($(server),apache)
	@copy  .\server\Apache.Dockerfile  .\Dockerfile
	@copy  .\server\docker-compose-apache.yml  .\docker-compose.yml
else
	@copy  .\server\Nginx.Dockerfile  .\Dockerfile
	@copy  .\server\docker-compose-nginx.yml  .\docker-compose.yml
endif
	@make build
	@make up
linux:
	@echo "Runing on Linux"
	@sudo chmod +x ./mkcert/mkcert-v1.4.4-linux-amd64
	@sudo apt install libnss3-tools
	@./mkcert/mkcert-v1.4.4-linux-amd64 -install
	@./mkcert/mkcert-v1.4.4-linux-amd64 --key-file ./cert/my-key.pem  --cert-file ./cert/my-cert.pem *.ex.lc localhost 127.0.0.1 ::1
ifeq ($(server),apache)
	@cp  ./server/Apache.Dockerfile  ./Dockerfile
	@cp  ./server/docker-compose-apache.yml  ./docker-compose.yml
else
	@cp  ./server/Nginx.Dockerfile  ./Dockerfile
	@cp  ./server/docker-compose-nginx.yml  ./docker-compose.yml
endif
	@make build
	@make up