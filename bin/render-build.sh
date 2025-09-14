set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# bundle exec rails db:migrate ←コメントアウト
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset # ←追記