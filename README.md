# README

## Prereqs

- Ruby 3.2.2
- Rails 7.1.2
- Redis server 7.2.3

## Create and seed db:

1. bin/rails db:drop db:create db:migrate
2. bin/rails db:seed

## Startup

1. redis-server
2. bin/dev

## Test

- bin/rails test:all

## Console access

- bin/rails console

---

### Followed https://www.hotrails.dev/turbo-rails to achieve most of this work
