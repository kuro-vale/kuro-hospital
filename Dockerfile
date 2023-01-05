FROM ruby:3.1.2-alpine3.16

EXPOSE 3000

ENV HMAC_SECRET=SUPERSECRET
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=enabled
ENV RAILS_SERVE_STATIC_FILES=enabled
ENV SECRET_KEY_BASE=a61bca52b0959b3c45af3f643a90d8f9bcd494e159d1e2f83ef18cbe453f3c840935d020f66805649a7f5633b8190ef3403c97189b7b3fc518849a4f83838047

RUN apk -U upgrade && \
apk add --no-cache \
build-base \
git \
tzdata \
sqlite \
# sqlite libs
sqlite-libs

WORKDIR /kuro-hospital
COPY . .

RUN gem install bundler \
&& gem install rails

RUN bundle install

RUN bundle exec rails db:migrate
RUN sqlite3 db/production.sqlite3 < seed.sql

CMD [ "bundle", "exec", "rails", "server" ]