FROM alpine:3.10
ENV APP_HOME /app
COPY Gemfile* $APP_HOME/
WORKDIR $APP_HOME
RUN apk --no-cache update && apk add --no-cache ruby-full=2.5.5-r0 ruby-dev=2.5.5-r0 build-base=0.5-r1 \
    && gem install bundler:1.17.2 --no-ri --no-rdoc \
    && bundle install \
    && apk del ruby-dev build-base
COPY . $APP_HOME
ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
