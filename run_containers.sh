#!/bin/bash

docker run -d \
	--network=reddit \
	--network-alias=post_db \
	--network-alias=comment_db \
	-v reddit_db:/data/db \
	mongo:latest

docker run -d \
	--network=reddit \
	--network-alias=post \
	advu/post:2.0

docker run -d \
	--network=reddit \
	--network-alias=comment \
	advu/comment:2.1

docker run -d \
	--network=reddit \
	-p 9292:9292 \
	advu/ui:3.0

