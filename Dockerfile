# Rubyのバージョンを指定
ARG RUBY_VERSION=ruby:3.2.2

FROM $RUBY_VERSION

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Node.jsとYarnをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y yarn

# アプリケーションのディレクトリを設定
WORKDIR /app

# Rubyのbundlerをインストール
RUN gem install bundler

# Gemfileとyarn.lockをコピーして依存関係をインストール
COPY Gemfile Gemfile.lock yarn.lock /app/
RUN bundle install && yarn install

# アプリケーションのソースコードをコピー
COPY . /app