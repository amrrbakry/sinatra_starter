# sinatra_starter
A template project for starting quickly with Sinatra and Sequel.

## What's included
### Project Dependencies
- [Sinatra](https://github.com/sinatra/sinatra) - using [Puma](https://github.com/puma/puma) as the app server
- [Sequel](https://github.com/jeremyevans/sequel) - using the Postgres adapter
- [Dry-validation](https://github.com/dry-rb/dry-validation)

### Test and Development Dependencies
- [RSpec](https://github.com/rspec/rspec)
- [Rubocop](https://github.com/rubocop/rubocop)
- [Factory Bot](https://github.com/thoughtbot/factory_bot)
- [Rake](https://github.com/ruby/rake)
- [Rake Test](https://github.com/rack/rack-test)
- [Byebug](https://github.com/deivid-rodriguez/byebug)

### Docker
To run the project with **Docker**:
- Update database config in _config/database.yml_:
```
development:
  :adapter: postgres
  :encoding: unicode
  :pool: 5
  :database: sinatra_starter_dev
  :host: db
  :user: postgres
  :password: password
```
- build and start the containers:
```
$ docker-compose up
```
