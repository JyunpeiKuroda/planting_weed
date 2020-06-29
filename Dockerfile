# 本番環境用
FROM ruby:2.5.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                        libpq-dev

# nodejsのバージョンをup
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# 作業ディレクトリの作成、設定
RUN mkdir /weedock
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /weedock
WORKDIR $APP_ROOT

# ホスト側のGemfileを追加する
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
# ソースコード追加
COPY . $APP_ROOT

# productionでのイメージように追加
ENV RAILS_ENV production
# 静的ファイル配信をpumaに設定
ENV RAILS_SERVE_STATIC_FILES true
# ログを標準出力に設定
ENV RAILS_LOG_TO_STDOUT true
RUN rails assets:precompile

CMD bash -c "rails db:create && rails db:migrate && rails s -b '0.0.0.0'"