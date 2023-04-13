# Use a lightweight Ruby image
FROM ruby:3.1.2-alpine

# Set the working directory
WORKDIR /app

# Install the required packages
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata

# Install the app dependencies
COPY Gemfile* /app/
RUN bundle install

# Copy the app code
COPY . /app/

# Precompile the assets
RUN bundle exec rake assets:precompile

# Set the Rails environment
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

# Start the app server
RUN bundle exec rake db:migrate
RUN bundle exec rake db:prepare
RUN bundle exec sidekiq
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
