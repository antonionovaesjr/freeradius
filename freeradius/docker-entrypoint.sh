#!/bin/sh
sleep 10
DIR_EMPTY=$(ls -1 /etc/raddb/|wc -l)


if [ $DIR_EMPTY -eq 0  ]; then

cp -Rpav /opt/raddb/* /etc/raddb/
touch ~/.pgpass && chmod 0600 ~/.pgpass && echo "server:port:database:username:password" > ~/.pgpass
sed -i "s/database/$DB_NAME/g"  ~/.pgpass 
sed -i "s/username/$DB_USER/g"  ~/.pgpass 
sed -i "s/password/$DB_PASS/g"  ~/.pgpass 
sed -i "s/server/$DB_HOST/g"  ~/.pgpass 
sed -i "s/port/$DB_PORT/g"  ~/.pgpass 
psql -h $DB_HOST -U $DB_USER -p $DB_PORT -d $DB_NAME < /etc/raddb/mods-config/sql/main/postgresql/schema.sql
psql -h $DB_HOST -U $DB_USER -p $DB_PORT -d $DB_NAME < /tmp/user-test.sql
sed -i "s/SERVIDOR/$DB_HOST/g" /etc/raddb/mods-available/sql
sed -i "s/PORTA/$DB_PORT/g" /etc/raddb/mods-available/sql
sed -i "s/BANCO/$DB_NAME/g" /etc/raddb/mods-available/sql
sed -i "s/USUARIO/$DB_USER/g" /etc/raddb/mods-available/sql
sed -i "s/SENHA/$DB_PASS/g" /etc/raddb/mods-available/sql
ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql

fi


radiusd -X -f
