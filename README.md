# Run tor in docker


Build the image:
```
$ make build
```

Forward port 9001 to the host system

Run the image:
```
$ make run
```

Monitor the logs to make sure the node bootstraps:
```
$ docker logs -f tor-1
```