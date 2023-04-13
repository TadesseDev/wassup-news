# Use the official Ruby image as the base image
FROM ruby:3.1.2

# Install system dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Redis 7
RUN wget http://download.redis.io/releases/redis-7.0.0.tar.gz && \
    tar xzf redis-7.0.0.tar.gz && \
    cd redis-7.0.0 && \
    make && \
    make install && \
    cd .. && \
    rm -rf redis-7.0.0 redis-7.0.0.tar.gz

# Set the working directory in the container
WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.2.28 && bundle install --jobs 4 --retry 3

# Copy the Rails app into the container
COPY . .

# Set environment variables
ENV RAILS_ENV=production
ENV DATABASE_URL=postgres://postgres@db:5432/wassup_news_production
ENV REDIS_URL=redis://redis:6379/0

# Compile assets and precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start Redis server and the Rails server
CMD ["sh", "-c", "redis-server & bundle exec rails server -b 0.0.0.0"]
