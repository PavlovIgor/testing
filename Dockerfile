FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /testing_app
WORKDIR /testing_app
ADD Gemfile /testing_app/Gemfile
ADD Gemfile.lock /testing_app/Gemfile.lock
RUN bundle
ADD . /testing_app