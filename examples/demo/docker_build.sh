#!/bin/bash -xe

DATETIME=$(date -u +%Y-%m-%d-%H%M)

# Build aurproxy
PACKAGE_VERSION=20150430.0; docker build -t docker.mydomain.com/demo/aurproxy:$PACKAGE_VERSION .
docker push docker.mydomain.com/demo/aurproxy:$PACKAGE_VERSION

# Build example app (supervisord-flask-nginx) Dockerfile
docker build -t docker.mydomain.com/demo/supervisord-flask:latest .
docker push docker.mydomain.com/demo/supervisord-flask:latest

# Build aurproxy tagged with DATETIME
# docker build -t docker.mydomain.com/library/aurproxy:$DATETIME .
# docker tag -f docker.mydomain.com/library/aurproxy:$DATETIME docker.mydomain.com/library/aurproxy:latest
# docker push docker.mydomain.com/library/aurproxy:$DATETIME
# docker push docker.mydomain.com/library/aurproxy:latest
