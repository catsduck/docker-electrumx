#!/bin/sh

if [[ ! -f "${SSL_CERTFILE}" || ! -f "${SSL_KEYFILE}" ]]; then
  openssl req -x509 -nodes -days 3650 -sha256 -newkey rsa:2048 -subj "/CN=electrumx" -keyout "${SSL_CERTFILE}" -out "${SSL_KEYFILE}"
fi

/usr/local/bin/electrumx_server
