build:
	docker build . --no-cache --compress --tag tartare/tor-relay:latest

push:
	docker push tartare/tor-relay:latest

update: build push

run:
	docker run -d --init --name=tor-1 -v ${PWD}/data:/var/lib/tor -v ${PWD}/torrc:/etc/tor/torrc --restart=always -p :9001:9001 tartare/tor-relay