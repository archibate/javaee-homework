#!/bin/bash
set -e

docker stop pybjava_mysql > /dev/null 2>&1 || true
docker stop pybjava_tomcat > /dev/null 2>&1 || true
PORT=${1-8080}
IPADDR=`python -c 'import socket; print(socket.gethostbyname(socket.gethostname()))'`
docker run --name pybjava_mysql --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=ihatesql -dit mysql
docker run --name pybjava_tomcat --rm -p 8080:$PORT -v "`pwd`"/src/main/webapp:/usr/local/tomcat/webapps/ROOT -e MYSQL_ADDR=$IPADDR -dit tomcat
docker ps
echo "Now run init.sh then visit http://$IPADDR:$PORT"
