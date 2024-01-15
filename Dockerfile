# Rubyのバージョンを指定
ARG RUBY_VERSION=ruby:3.2.2
# Node.jsのバージョンを指定
ARG NODE_VERSION=19

FROM $RUBY_VERSION

ARG RUBY_VERSION
ARG NODE_VERSION

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.jsをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs

# Yarnをインストール
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y yarn

# アプリケーションのディレクトリを設定
RUN mkdir /app
WORKDIR /app

# Rubyのbundlerをインストール
RUN gem install bundler

# Gemfileをコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# yarn.lockをコピー
COPY yarn.lock /app/yarn.lock

# BundlerとYarnで依存関係をインストール
RUN bundle install
RUN yarn install

# アプリケーションのソースコードをコピー
COPY . /app