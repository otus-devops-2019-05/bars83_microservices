FROM alpine:3.2 

ENV APP_HOME /app
ENV OLD_BUNDLER_VERSION 1.16.1
WORKDIR $APP_HOME
RUN apk --no-cache update && apk add --no-cache ruby-full=2.5.7-r0 ruby-dev=2.5.7-r0 build-base=0.5-r1 \
    && gem install bundler:1.17.2 --no-ri --no-rdoc \
    && bundle install \
    && apk del build-base ruby-bundler ruby-dev \
    && rm -rf /var/cache/apk/*

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST reddit_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
