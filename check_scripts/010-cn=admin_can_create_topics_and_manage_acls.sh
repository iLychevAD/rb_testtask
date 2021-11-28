#!/bin/env bash
set -ex
COMMON_ARGS=' \
  --bootstrap-server kafka:9093 \
  --command-config /properties/admin.properties \
'
kafka-topics.sh --delete \
  --topic FeelTheFlow \
  ${COMMON_ARGS} || echo "Topic doesnt exist"

kafka-topics.sh --create \
  --replication-factor 1 --partitions 1 \
  --topic FeelTheFlow \
  ${COMMON_ARGS}

kafka-topics.sh --list \
  ${COMMON_ARGS}

kafka-acls.sh --list \
  --topic FeelTheFlow \
  ${COMMON_ARGS}

kafka-acls.sh --add \
  --allow-principal User:CN=bike \
  --operation WRITE \
  --topic FeelTheFlow \
  ${COMMON_ARGS}

kafka-acls.sh --add \
  --allow-principal User:CN=client \
  --operation READ \
  --topic FeelTheFlow \
  --group=* \
  ${COMMON_ARGS}

kafka-acls.sh --list \
  --topic FeelTheFlow \
  ${COMMON_ARGS}
