# docker-electrumx

electrumx server for Bitcoin

this is a docker-ified version of https://github.com/spesmilo/electrumx

run an instance with:
```
docker run -e DAEMON_URL=http://username:password@$BTC_NODE_IP_ADDRESS:8332 -d catsduck/electrumx
```

mount a volume or local directory to `/data` to persist the database and TLS cert
