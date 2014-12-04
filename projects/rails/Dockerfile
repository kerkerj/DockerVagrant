FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD webapp/Gemfile /myapp/Gemfile
RUN bundle install
ADD webapp/ /myapp