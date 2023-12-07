#!/bin/sh -e
echo "---------------------"
CLUSTER_UUID=`/opt/kafka/bin/kafka-storage.sh random-uuid`
echo $CLUSTER_UUID


/opt/kafka/bin/kafka-storage.sh format -t ${CLUSTER_UUID} -c /opt/kafka/config/server.properties --ignore-formatted

ls /kafka/logs -la

cat /opt/kafka/config/server.properties | grep "node.id"  > /kafka/logs/meta.properties
echo "version=1" >> /kafka/logs/meta.properties
echo "cluster.id=qslQSDSqdjhd" >> /kafka/logs/meta.properties


cat /kafka/logs/meta.properties

sleep 5;
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties