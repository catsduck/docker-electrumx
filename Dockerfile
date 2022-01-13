FROM python:3.10.1-alpine3.15

RUN apk add --no-cache build-base leveldb-dev openssl && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing rocksdb-dev && \
    pip install --no-cache-dir uvloop e-x==1.16.0 && \
    chmod +x /usr/local/bin/electrumx_* && \
    dos2unix /usr/local/bin/electrumx_* && \
    mkdir /data && \
    mkdir /electrumx && \
    apk del build-base

COPY ./scripts/start.sh /electrumx/

ENV ALLOW_ROOT 1
ENV COIN Bitcoin
ENV DB_DIRECTORY /data
ENV EVENT_LOOP_POLICY uvloop
ENV SSL_CERTFILE /electrumx/electrumx.crt
ENV SSL_KEYFILE /electrumx/electrumx.key
ENV SERVICES=tcp://:50001,ssl://:50002,wss://:50004,rpc://0.0.0.0:8000
ENV PEER_DISCOVERY SELF

EXPOSE 50001 50002 50004 8000

CMD ["/electrumx/start.sh"]
