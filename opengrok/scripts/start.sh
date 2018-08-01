#!/bin/bash

start_opengrok(){
    # wait for tomcat startup
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    /opengrok/bin/indexer.py -C -J=-Djava.util.logging.config.file=/var/opengrok/logging.properties \
    -a /opengrok/lib/opengrok.jar -- \
    -s /var/opengrok/src -d /var/opengrok/data -H -P -S -G \
    -W /var/opengrok/etc/configuration.xml \
    -U http://localhost:8080
}

service tomcat8 start
start_opengrok
service tomcat8 restart
tail -f /var/log/dmesg
