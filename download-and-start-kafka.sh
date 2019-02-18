#!/usr/bin/env bash
export SCALA_VERSION="2.12"
export KAFKA_VERSION="2.1.0"
export KAFKA_NAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}"
export KAFKA_HOME="/tmp/${KAFKA_NAME}"
if ! [[ -d "${KAFKA_HOME}" ]]; then
  wget -qO- https://www-eu.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_NAME}.tgz | tar xvz
  mv -f ${KAFKA_NAME} /tmp/
fi
${KAFKA_HOME}/bin/zookeeper-server-start.sh ${KAFKA_HOME}/config/zookeeper.properties &
sleep 3s
${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties &
#export KAFKA_HOME="/tmp/kafka_2.12-2.1.0" ; ${KAFKA_HOME}/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning
#  sleep 3s
#  ${KAFKA_HOME}/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2181 --replication-factor 1 --partitions 1 --topic test
