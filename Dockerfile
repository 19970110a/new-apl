FROM ruby:3.1.2

ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y build-essential libv8-dev
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

WORKDIR /myapp

# Bundlerのバージョンを指定してインストール
RUN gem install bundler:2.5.4

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle config set --local without 'development test'

# Bundlerのバージョンを更新
RUN bundle update --bundler
RUN bundle install

COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN yarn install

COPY . /myapp

RUN yarn add bootstrap

# アセットのプリコンパイル
RUN RAILS_ENV=production bundle exec rake assets:precompile

COPY start.sh /start.sh
RUN chmod 744 /start.sh

CMD ["sh", "/start.sh"]