FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /echo

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9292"]