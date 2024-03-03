# Rubyのバージョンを指定
ARG RUBY_VERSION=ruby:3.2.2

FROM $RUBY_VERSION

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.jsのバージョンを指定
ARG NODE_VERSION=20.x

# Node.jsをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs


# Yarnをインストール
RUN npm install -g yarn@1.22.x

# アプリケーションのディレクトリを設定
WORKDIR /app

# Rubyのbundlerをインストール
RUN gem install bundler

# Gemfileとyarn.lockをコピーして依存関係をインストール
COPY Gemfile Gemfile.lock yarn.lock /app/
RUN bundle install && yarn install

# アプリケーションのソースコードをコピー
COPY . /app