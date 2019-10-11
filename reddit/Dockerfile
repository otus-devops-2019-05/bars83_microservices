FROM ruby:2.2

RUN apt-get update && apt-get install -y build-essential

ENV APP_HOME /app
COPY . /app

WORKDIR $APP_HOME
RUN bundle install
ENV DATABASE_URL mongodb://mongo
EXPOSE 9292

CMD ["puma"]