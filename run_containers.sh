#!/bin/bash

VOLUME_DB=reddit_db
NETWORK_FRONT=front_net
NETWORK_BACK=back_net

docker volume ls -q | grep $VOLUME_DB > /dev/null \
	|| docker volume create $VOLUME_DB

docker network ls | grep $NETWORK_BACK > /dev/null \
	|| docker network create $NETWORK_BACK --subnet=10.0.2.0/24

docker network ls | grep $NETWORK_FRONT > /dev/null \
	|| docker network create $NETWORK_FRONT --subnet=10.0.1.0/24

docker run -d \
	--network=$NETWORK_BACK \
	--network-alias=db_post \
	--network-alias=db_comment \
	-v $VOLUME_DB:/data/db \
	--name mongo_db \
	mongo:latest

docker run -d \
	--network=$NETWORK_BACK \
	--name post \
	advu/post:2.2

docker run -d \
	--network=$NETWORK_BACK \
	--name comment \
	advu/comment:2.2

docker run -d \
	--network=$NETWORK_FRONT \
	-p 9292:9292 \
	--name ui \
	advu/ui:3.1

docker network connect --alias=web_comment $NETWORK_FRONT comment
docker network connect --alias=web_post $NETWORK_FRONT post
