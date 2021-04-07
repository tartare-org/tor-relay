# Run tor in docker


Build the image:
```
$ docker build -t local/tor .
```

Forward port 9001 to the host system

Run the image:
```
$ docker run -d --init --name=tor-1 -e TOR_NICKNAME=MyNickname -v data:/var/lib/tor --restart=always -p :9001:9001 -t local/tor
```

Monitor the logs to make sure the node bootstraps:
```
$ docker logs -f tor-1
```

If we need to upgade the node (ie theres a new tor release on ubuntu 21.04), run something like:
```
$ docker build --no-cache -t local/tor .
$ docker stop tor-1
$ docker container rm tor-1
$ docker run -d --init --name=tor-1 -e TOR_NICKNAME=MyNickname -v data:/var/lib/tor --restart=always -p :9001:9001 -t local/tor
```
