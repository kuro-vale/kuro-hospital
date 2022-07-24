# DEV CONTAINER VSCODE
FROM ruby:3.1.2-alpine3.16

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
&& gem install rails
