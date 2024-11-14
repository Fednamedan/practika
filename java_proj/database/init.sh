#!/bin/bash

set -e


while ! mysqladmin ping -h"localhost" -P"3306" --silent; do
  echo "Waiting for MySQL to be ready..."
  sleep 2
done


mysql -uroot -ptest < /data/application/create_database.sql
mysql -uroot -ptest testt < /data/application/create_tables.sql
mysql -uroot -ptest testt < /data/application/insert_data.sql
mysql -uroot -ptest testt < /data/application/create_triggers.sql
mysql -uroot -ptest testt < /data/application/create_procedures.sql