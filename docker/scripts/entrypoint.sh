#!/bin/sh
set -e

bundle check || bundle install

bundle exec rails db:create db:migrate

rm -f tmp/pids/server.pid

exec "$@"
