#!/bin/bash

start_opengrok(){
    # wait for tomcat startup
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    OpenGrok index /var/opengrok/src
}

service tomcat8 start
start_opengrok
service tomcat8 restart
tail -f /var/log/dmesg
