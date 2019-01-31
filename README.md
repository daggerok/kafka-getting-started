# kafka-getting-started
Kafka getting started ....again

__requirements unix bash/zsh and at least installed jdk 8__

## console playgrounds

### hello world

```bash
# download and extract
wget -qO- https://www-eu.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz | tar xvz
# run zookeper server
cd kafka_2.11-2.1.0
bin/zookeeper-server-start.sh config/zookeeper.properties &
# run kafka server
sleep 3s
bin/kafka-server-start.sh config/server.properties &
# create topic
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
# listen messages
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning &
# send messages
echo 'ololo\ntrololo' | bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
sleep 5s
# expected to see 2 lines from consumer:
# ololo
# trololo
```

### kafka streams

[easy example already prepared here](https://kafka.apache.org/21/documentation/streams/quickstart#quickstart_streams_download)
