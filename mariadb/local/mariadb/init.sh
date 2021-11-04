#!/bin/bash

MYSQL_USER='devtester'
MYSQL_DEV_PASSWORD='devclosememo12#'
MYSQL_HOST='10.10.101.102'
MYSQL_PORT=33306

MYSQL_ROOT_PASSWORD='devclosememo12#'

MYSQL_CONN="-u${MYSQL_USER} -p${MYSQL_DEV_PASSWORD} -h ${MYSQL_HOST} -P ${MYSQL_PORT}"
EXCLUDE_DB='performance_schema\|mysql\|information_schema\|sys'

DBS=`mysql -s $MYSQL_CONN --execute="SHOW DATABASES;" | grep -v $EXCLUDE_DB | awk '{printf("%s ", $0)}'`

echo "Dump databases : { $DBS }"
mysqldump $MYSQL_CONN --databases $DBS > /home/mysql/dev.sql

if [ "$1" == "refresh" ]; then
  echo "Drop databases"

  for db in $DBS
  do
    echo "DELETE $db"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP DATABASE IF EXISTS $db; SELECT sleep(0.1);"
  done
fi

echo "Copy databases"
mysql -uroot -p$MYSQL_ROOT_PASSWORD < /home/mysql/dev.sql
