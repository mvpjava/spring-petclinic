#!/bin/bash

#Better way (instead of killing) would be to register a JVM or SpringBoot Actuator shutdown hook
#for now, this wil do to demo DevOps auto deployment
ps -ef | grep "spring-petclinic" | grep -v grep | cut -d' ' -f2 | xargs kill -9
mv /tmp/spring-petclinic-3.2.0-SNAPSHOT.jar /tmp/spring-petclinic-3.2.0-SNAPSHOT.jar.prev
