FROM python:3.10.1-alpine3.15

RUN apk add --no-cache build-base git leveldb-dev openssl && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing rocksdb-dev && \
    git clone -b 1.16.0 https://github.com/spesmilo/electrumx.git && \
    cd electrumx && \
    pip install --no-cache-dir uvloop . && \
    mkdir /data && \
    apk del build-base git

COPY ./scripts/start.sh /electrumx/

ENV ALLOW_ROOT 1
ENV COIN Bitcoin
ENV DB_DIRECTORY /data
ENV EVENT_LOOP_POLICY uvloop
ENV SSL_CERTFILE /electrumx/electrumx.crt
ENV SSL_KEYFILE /electrumx/electrumx.key
ENV SERVICES=tcp://:50001,ssl://:50002,wss://:50004,rpc://0.0.0.0:8000
ENV PEER_DISCOVERY SELF
ENV REQUEST_TIMEOUT 120
ENV MAX_SEND 100000000
ENV INITIAL_CONCURRENT 100000
ENV COST_SOFT_LIMIT 1000000
ENV COST_HARD_LIMIT 10000000

EXPOSE 50001 50002 50004 8000

CMD ["/electrumx/start.sh"]
