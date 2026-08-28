#!/bin/bash

java -jar /tmp/spring-petclinic-3.2.0-SNAPSHOT.jar > /tmp/petclinic.log 2>&1 &

#give some time for app to start up
sleep 30
