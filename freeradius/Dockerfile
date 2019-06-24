FROM alpine:3.9
MAINTAINER Antonio Novaes <antonionovaesjr@gmail.com>
RUN apk add --no-cache --update freeradius freeradius-postgresql freeradius-radclient freeradius-rest openssl-dev postgresql-client && chgrp radius  /usr/sbin/radiusd && chmod g+rwx /usr/sbin/radiusd
RUN mkdir -p /opt/raddb && cp -apvR /etc/raddb/* /opt/raddb/ && rm -rf /etc/raddb/* 
ADD radiusd.conf /opt/raddb/radiusd.conf
ADD clients.conf /opt/raddb/clients.conf
ADD default /opt/raddb/sites-available/default
ADD schema.sql /opt/raddb/mods-config/sql/main/postgresql/schema.sql
ADD sql /opt/raddb/mods-available/sql
ADD user-test.sql /tmp/user-test.sql
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENV DB_HOST localhost
ENV DB_USER radius
ENV DB_PASS radius
ENV DB_NAME radius
ENV DB_PORT 5432
EXPOSE 1812/udp
EXPOSE 1813/udp
VOLUME /etc/raddb/
ENTRYPOINT ["/docker-entrypoint.sh"]

