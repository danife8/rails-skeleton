# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.7
FROM ruby:$RUBY_VERSION-alpine

# Rails app lives here
WORKDIR /rails

# Install base packages
RUN apk add --no-cache \
    bash \
    curl \
    jemalloc \
    vips \
    postgresql-client \
    tzdata \
    yaml \
    yaml-dev \
    git \
    nodejs \
    npm \
    build-base \
    libpq \
    libpq-dev \
    python3

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT=""

# Install JavaScript dependencies
ARG NODE_VERSION=22.11.0
ARG YARN_VERSION=1.22.22
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Install node modules
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy entrypoint
COPY bin/docker-entrypoint /rails/bin/
RUN chmod +x /rails/bin/docker-entrypoint

# Run and own only the runtime files as a non-root user for security
RUN addgroup -S rails && adduser -S rails -G rails \
    && mkdir -p db log storage tmp \
    && chown -R rails:rails db log storage tmp
USER rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
