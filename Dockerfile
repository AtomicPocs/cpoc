FROM ruby:2.6-alpine3.7


ENV APP_DIR=/appC

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY . $APP_DIR

RUN gem install bundler
RUN bundle install --without development test

EXPOSE 4567

CMD ["rackup"]