build:
	docker build . --no-cache --compress --tag tartare/tor-relay:latest

push:
	docker push tartare/tor-relay:latest

update: build push
