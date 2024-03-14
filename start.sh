#!/bin/bash

# データベースのマイグレーション
echo "Running database migrations..."
bundle exec rake db:migrate

# データベースに初期データをロード
echo "Seeding database..."
bundle exec rake db:seed

# Railsサーバーを起動
echo "Starting Rails server..."
bundle exec rails s -p 3000 -b '0.0.0.0'