#!/bin/env bash
set -ex

kafka-console-consumer.sh --topic FeelTheFlow \
  --bootstrap-server kafka:9093 \
  --consumer.config /properties/bike.properties
