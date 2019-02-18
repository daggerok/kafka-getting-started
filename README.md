# kafka-getting-started
This repo is going to be removed in a future...

__requirements unix bash/zsh and at least installed jdk 8__

## console playgrounds

### hello world

```bash
# download and extract
bash ./download-and-start-kafka.sh
# create topic
/tmp/kafka_2.12-2.1.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
# listen messages
/tmp/kafka_2.12-2.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning &
# send messages
echo 'ololo\ntrololo' | bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
sleep 5s
# expected to see 2 lines from consumer:
# ololo
# trololo
```

## kafka streams example

[easy example already prepared here](https://kafka.apache.org/21/documentation/streams/quickstart#quickstart_streams_download)

### generate maven project

```bash
mvn -N io.takari:maven:wrapper -Dmaven=3.6.0

./mvnw archetype:generate -DarchetypeGroupId=org.apache.kafka \
                          -DarchetypeArtifactId=streams-quickstart-java \
                          -DarchetypeVersion=2.1.0 \
                          -DgroupId=com.github.daggerok \
                          -DartifactId=streams-quickstart-java \
                          -Dversion=1.0.0-SNAPSHOT \
                          -Dpackage=com.github.daggerok.kafka \
                          -B # non interactive
```

### fix generated project issue

_find line 47 of file ./streams-quickstart-java/src/main/java/com/github/daggerok/kafka/LineSplit.java_

```java
builder.stream("streams-plaintext-input")
```

_and update in to_

```java
builder.stream("streams-plaintext-input").mapValues(String::valueOf)
```

### build project 

```bash
./mvnw -f ./streams-quickstart-java/pom.xml clean package
```

### run examples

```bash
./mvnw -f ./streams-quickstart-java/pom.xml exec:java -Dexec.mainClass=com.github.daggerok.kafka.Pipe
./mvnw -f ./streams-quickstart-java/pom.xml exec:java -Dexec.mainClass=com.github.daggerok.kafka.WordCount
./mvnw -f ./streams-quickstart-java/pom.xml exec:java -Dexec.mainClass=com.github.daggerok.kafka.LineSplit
```

## read detailed about examples in these links:

- [Kafka streams tutorial](https://kafka.apache.org/21/documentation/streams/tutorial)
- [Play with streams application](https://kafka.apache.org/21/documentation/streams/quickstart)
