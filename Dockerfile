# 本番環境用
FROM ruby:2.5.3-alpine

RUN mkdir /weedock

ENV ROOT="/weedock"
WORKDIR ${ROOT}

# 必要なパッケージのインストール
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                imagemagick\
                                mysql-client \
                                mysql-dev \
                                nodejs \
                                tzdata\
                                openssh \
                                libxml2-dev \
                                libxslt-dev \
                                yarn \
                                curl-dev

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
RUN bundle install
COPY . ${ROOT}

# -------------------------本番環境用に追加部分-------------------------
COPY gcs.json gcs.json
ENV GOOGLE_APPLICATION_CREDENTIALS /weedock/gcs.json
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
RUN rails assets:precompile
CMD sh -c "rails db:create && rails db:migrate && rails s -b '0.0.0.0'"