FROM docker.io/bitnami/kafka:3.0.0
USER root
RUN apt update && apt install -y -q libfaketime && apt clean all && rm -rf /var/lib/apt/lists/*
USER 1001
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1
ENV FAKETIME_NO_CACHE=1
ENV FAKETIME='@2021-04-20 7:50:00'

