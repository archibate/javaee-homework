#!/bin/bash
set -e
mvn install
mkdir -p src/main/webapp/WEB-INF/lib
cp target/pyb-1.0-SNAPSHOT.jar src/main/webapp/WEB-INF/lib/pyb.jar
PORT=${1-8080}
docker stop pybjava_tomcat > /dev/null 2>&1 || true
IPADDR=`python -c 'import socket; print(socket.gethostbyname(socket.gethostname()))'`
docker run --name pybjava_tomcat --rm -p 8080:$PORT -v "`pwd`"/src/main/webapp:/usr/local/tomcat/webapps/ROOT -e MYSQL_ADDR=$IPADDR -dit tomcat
