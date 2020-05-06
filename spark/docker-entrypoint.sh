#!/bin/bash
set -e

source ~/.bashrc

echo "Starting sshd service..."
/etc/init.d/ssh start

if [ "${nodeType}" == 'master' ]; then
  echo "Start Spark master"
  /opt/spark/sbin/start-master.sh -h spark-master
else
  echo "Start Spark slave"
  /opt/spark/sbin/start-slave.sh spark://spark-master:7077 -m 1024m -c 2
fi

while true;
do
  sleep 30;
done;
