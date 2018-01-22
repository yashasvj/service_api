source 'https://rubygems.org'

# Declare your gem's dependencies in service_api.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'redis-objects'
gem 'redis-namespace', '>=1.5.2'

# Configuration
gem 'config', '1.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  # gem 'factory_girl_rails'
  # gem 'awesome_print'
  gem 'pry-rails'
  gem 'rspec_api_documentation'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'

  gem 'mock_redis'
end
