#!/bin/bash

start_opengrok(){
    # wait for tomcat startup
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    java -Djava.util.logging.config.file=/var/opengrok/logging.properties -jar /opengrok/lib/opengrok.jar -c /usr/local/bin/ctags -s /var/opengrok/src -d /var/opengrok/data -H -P -S -G -W /var/opengrok/etc/configuration.xml -U http://localhost:8080/source
}

service tomcat8 start
start_opengrok
service tomcat8 restart
tail -f /var/log/bootstrap.log
