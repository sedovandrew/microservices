#!/bin/bash

PROMETHEUS_VERSION=`cat VERSION`

docker build -t $USERNAME/prometheus:$PROMETHEUS_VERSION .
