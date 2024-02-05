#!/bin/bash

#Better way (instead of killing) would be to register a JVM or SpringBoot Actuator shutdown hook
#for now, this wil do to demo DevOps auto deployment

# Find the process ID
pid=$(ps -ef | grep "spring-petclinic" | grep -v grep | awk '{print $2}')

# Check if the process ID exists
if [ -z "$pid" ]; then
    echo "No process found for 'spring-petclinic'. Exiting gracefully."
    exit 0
else
    echo "Found process ID $pid for 'spring-petclinic'. Killing the process..."
    sudo kill -9 "$pid"
    echo "Process killed successfully."
    exit 0
fi
