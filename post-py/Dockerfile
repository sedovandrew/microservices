FROM alpine

RUN apk add -U python3

RUN pip3 install flask pymongo

WORKDIR /app
ADD . /app

ENV POST_DATABASE_HOST db_post
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
