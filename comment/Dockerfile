FROM alpine

RUN apk update && \
    apk add ruby-dev ruby-json ruby-bundler g++ make tzdata

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN bundle install

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST db_comment
ENV COMMENT_DATABASE comment

CMD ["puma"]
