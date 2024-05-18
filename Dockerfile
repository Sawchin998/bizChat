FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client libxml2-dev libcurl4-openssl-dev nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.3.20

WORKDIR /bizchat

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

# copy the whole app
COPY . /bizchat

# precompile assets
RUN bundle exec rake assets:precompile --trace

