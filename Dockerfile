FROM ruby:3.1.2

ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y build-essential libv8-dev
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle config set --local without 'development test'
RUN bundle install

COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
# すでにローカルでbootstrap等を含む依存関係を追加しているため、yarn installのみでOK
RUN yarn install

COPY . /myapp

# ここでbootstrapを含む任意のnpmパッケージをインストール
RUN yarn add bootstrap

# アセットのプリコンパイル
RUN RAILS_ENV=production bundle exec rake assets:precompile

COPY start.sh /start.sh
RUN chmod 744 /start.sh

CMD ["sh", "/start.sh"]