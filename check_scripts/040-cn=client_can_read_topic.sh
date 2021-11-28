#!/bin/env bash
set -ex

kafka-console-consumer.sh --topic FeelTheFlow \
  --from-beginning \
  --bootstrap-server kafka:9093 \
  --consumer.config /properties/client.properties
