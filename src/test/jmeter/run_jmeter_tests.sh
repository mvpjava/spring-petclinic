#!/bin/bash

echo "Starting $0"

JMETER_VERSION=5.6.3

#Example: apache-jmeter-5.6.3
JMETER_DOWNLOAD_BASE_FILENAME="apache-jmeter-$JMETER_VERSION"

#Example: apache-jmeter-5.6.3.tgz
JMETER_DOWNLOAD_FILENAME_TARBALL="$JMETER_DOWNLOAD_BASE_FILENAME.tgz"

# Set JMeter home, if pre-installed on the instance
export JMETER_HOME="/opt/$JMETER_DOWNLOAD_BASE_FILENAME"
export PATH=$JMETER_HOME/bin:$PATH

wget "https://downloads.apache.org//jmeter/binaries/$JMETER_DOWNLOAD_FILENAME_TARBALL"
tar xzf "$JMETER_DOWNLOAD_FILENAME_TARBALL"

# Run JMeter against the local application
jmeter -n -t /opt/petclinic_test_plan.jmx -l /tmp/results.jtl -JTARGET_URL=http://localhost:8080

# Check for errors in JMeter output and exit if any issues found
if grep -q "error" /tmp/results.jtl; then
  echo "JMeter tests encountered errors. Investigation needed"
  #Will not exit for demo sake
  #exit 1
fi

echo "Complete $0"
