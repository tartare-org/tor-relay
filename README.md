# Run tor in docker


Build the image:
```
$ make build
```

Forward port 9001 to the host system

Run the image:
```
$ docker run -d --init --name=tor-1 -v data:/var/lib/tor -v torrc: /etc/tor/torrc --restart=always -p :9001:9001 -t tartare/tor-relay
```

Monitor the logs to make sure the node bootstraps:
```
$ docker logs -f tor-1
```