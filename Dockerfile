# DEV CONTAINER VSCODE
FROM ruby:3.1.2-alpine3.16

ENV PROD_DATABASE_URL="postgres://username:password@host:port/prod-database"
ENV DEV_DATABASE_URL="postgres://username:password@host:port/dev-database"
ENV TEST_DATABASE_URL="postgres://username:password@host:port/test-database"
ENV HMAC_SECRET="JWT_SECRET"

RUN apk -U upgrade && \
apk add --no-cache \
# Base libs
build-base \
git \
tzdata \
# Mysql libs
mysql-dev \
# Utils
nano

RUN gem install bundler \
&& gem install rails \
&& bundle install \
&& rails db:create \
&& rails db:migrate
