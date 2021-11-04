FROM mariadb:10.6.3

RUN mkdir -p /home/mysql
RUN chown mysql /home/mysql
RUN chgrp mysql /home/mysql

COPY init.sh /docker-entrypoint-initdb.d/init.sh
COPY 50-client.cnf /etc/mysql/mariadb.conf.d/50-client.cnf

RUN echo "/docker-entrypoint-initdb.d/init.sh refresh" >> /usr/bin/refresh
