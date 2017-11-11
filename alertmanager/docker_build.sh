#!/bin/bash

ALERTMANAGER_VERSION=`cat VERSION`

docker build -t $USERNAME/alertmanager:$ALERTMANAGER_VERSION .
