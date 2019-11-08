FROM ruby:2.6.5

ENV BUNDLE_PATH=/bundle
ENV GEM_HOME=/bundle

RUN mkdir -p /bundle
RUN mkdir -p /api

WORKDIR /api

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

COPY Gemfile* ./

RUN bundle install

COPY . ./

EXPOSE 3000
