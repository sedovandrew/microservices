#!/bin/bash

docker run -d \
	--network=reddit \
	--network-alias=db_post \
	--network-alias=db_comment \
	-v reddit_db:/data/db \
	mongo:latest

docker run -d \
	--network=reddit \
	--network-alias=web_post \
	advu/post:2.2

docker run -d \
	--network=reddit \
	--network-alias=web_comment \
	advu/comment:2.2

docker run -d \
	--network=reddit \
	-p 9292:9292 \
	advu/ui:3.1

