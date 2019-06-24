#!/bin/sh
sleep 15
TEST_RADIUS_EXIST=$(su - postgres -c "psql -lqt"|grep $DB_RADIUS_NAME|wc -l)

if [ $TEST_RADIUS_EXIST -gt 0 ]; then
        echo "Base $DB_RADIUS_NAME existe"
else

	sed -i "s/USUARIO/$DB_RADIUS_USER/g" /opt/radius-db.sql
	sed -i "s/SENHA/$DB_RADIUS_PASS/g" /opt/radius-db.sql
	sed -i "s/BANCO/$DB_RADIUS_NAME/g" /opt/radius-db.sql
	su - postgres -c "psql < /opt/radius-db.sql"

fi
