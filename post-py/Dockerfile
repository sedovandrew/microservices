FROM alpine

RUN apk add -U python3 \
    && rm -rf /var/cache/apk/*

WORKDIR /app
ADD requirements.txt /app
RUN pip3 install --no-cache-dir -r requirements.txt
ADD . /app

ENV POST_DATABASE_HOST db_post
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
