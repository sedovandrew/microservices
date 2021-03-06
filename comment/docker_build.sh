#!/bin/bash

COMMENT_VERSION=`cat VERSION`

echo `git show --format="%h" HEAD | head -1` > build_info.txt
echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt

docker build -t $USERNAME/comment:$COMMENT_VERSION .
