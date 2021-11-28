#!/bin/env bash
set -ex

kafka-console-producer.sh --topic FeelTheFlow \
  --bootstrap-server kafka:9093 \
  --producer.config /properties/bike.properties
