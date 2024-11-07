#!/bin/bash

echo "Starting $0"

JMETER_VERSION=5.6.3

#Example: apache-jmeter-5.6.3
JMETER_DOWNLOAD_BASE_FILENAME="apache-jmeter-$JMETER_VERSION"

#Example: apache-jmeter-5.6.3.tgz
JMETER_DOWNLOAD_FILENAME_TARBALL="$JMETER_DOWNLOAD_BASE_FILENAME.tgz"

wget "https://downloads.apache.org//jmeter/binaries/$JMETER_DOWNLOAD_FILENAME_TARBALL"
tar xzf "$JMETER_DOWNLOAD_FILENAME_TARBALL" -C /opt

# Run JMeter against the local application
/opt/$JMETER_DOWNLOAD_BASE_FILENAME/bin/jmeter -n -t /tmp/petclinic_test_plan.jmx -l /tmp/results.jtl -JTARGET_URL=http://localhost:8080

# Check for errors in JMeter output and exit if any issues found.
# Sending possible grep output to /dev/null as not interested in seeing it when executed manually
if grep -E 'Non HTTP response message|Connection refused|Timeout|Internal Server Error' /tmp/results.jtl >/dev/null; then
  echo "JMeter tests encountered errors. Investigation needed"
  #Will not exit for demo sake. Also best to use CloudWatch
  #exit 1
fi

echo "Complete $0"
