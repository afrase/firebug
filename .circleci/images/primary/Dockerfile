FROM ruby:2.6-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    default-libmysqlclient-dev \
    git \
    libmcrypt-dev \
    file \
    sudo \
    libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*
