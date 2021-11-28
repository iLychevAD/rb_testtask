#!/bin/env bash
set -ex
COMMON_ARGS=' \
  --bootstrap-server kafka:9093 \
  --command-config /properties/car.properties \
'

kafka-topics.sh --create \
  --replication-factor 1 --partitions 1 \
  --topic CarsTopic \
  ${COMMON_ARGS} || echo "Cannot create topic!"

kafka-topics.sh --list \
  ${COMMON_ARGS} || echo "Cannot list topics!"

kafka-acls.sh --add \
  --allow-principal User:CN=bike \
  --operation WRITE \
  --topic FeelTheFlow \
  ${COMMON_ARGS} || echo "Cannot manage ACL!"

kafka-console-producer.sh --topic FeelTheFlow \
  --bootstrap-server kafka:9093 \
  --producer.config /properties/car.properties || echo "Cannot write to topic!"

kafka-console-consumer.sh --topic FeelTheFlow \
  --from-beginning \
  --bootstrap-server kafka:9093 \
  --consumer.config /properties/car.properties || echo "Cannot even read the topic! Why am I so deprived of rights ?!"

