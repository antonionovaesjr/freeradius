FROM postgres:9.6.13-alpine
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ADD radius-db.sql /opt/radius-db.sql
ADD create-db-radius.sh /create-db-radius.sh
ENV DB_RADIUS_PASS=radius123
ENV DB_RADIUS_USER=radius
ENV DB_RADIUS_NAME=radius

