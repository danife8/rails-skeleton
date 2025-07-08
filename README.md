# Rails Skeleton
This Rails skeleton project was created to speed-up the development of assessments, challenges or maybe if you just want to try new things as a fullstack sandbox.

### Start
##### Requirements
- Copy `.env.example` file and rename it to `.env` for development environment.
- Docker Engine to run containers. eg: Docker Desktop or [Colima](https://github.com/abiosoft/colima?tab=readme-ov-file#installation)
```shell
colima start
```
- Install [docker-compose](https://formulae.brew.sh/formula/docker-compose)
```shell
docker-compose build
docker-compose up
```

## Features
- Ruby 3.4.2-alpine
- Rails 8.0.2
- Postgres 17-alpine

###### Frontend
- CSS: bootstrap
- JS: esbuilder
- Capybara tests

###### Test environment
- RSpec
- Capybara
- Faker
- Factory bot

###### Other features
- Rubocop
- Annotate
- Simplecov
