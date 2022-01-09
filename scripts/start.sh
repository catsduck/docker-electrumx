#!/bin/sh

openssl req -x509 -nodes -days 3650 -sha256 -newkey rsa:2048 -subj "/CN=electrumx" -keyout /electrumx/electrumx.key -out /electrumx/electrumx.crt

/electrumx/electrumx_server
