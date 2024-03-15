#!/bin/bash

# データベースのマイグレーション
echo "Running database migrations..."
bundle exec rake db:migrate

# データベースに初期データをロード
echo "Seeding database..."
bundle exec rake db:seed

# Railsサーバーを起動
# Herokuの動的に割り当てられた$PORT環境変数を使用
echo "Starting Rails server..."
bundle exec rails s -p $PORT -b '0.0.0.0'