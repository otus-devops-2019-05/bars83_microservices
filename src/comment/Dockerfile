FROM alpine:3.2 

ENV APP_HOME /app
ENV OLD_BUNDLER_VERSION 1.16.1
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

RUN apk update \ 
    && apk upgrade \
    && apk add ruby ruby-json ruby-bundler ruby-dev build-base  \
    && apk add ca-certificates \
    && gem install bundler -v $OLD_BUNDLER_VERSION \
    && gem install json \
    && bundle install \
    && apk del build-base ruby-bundler ruby-dev \
    && rm -rf /var/cache/apk/*

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST reddit_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
