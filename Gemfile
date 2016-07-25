source "https://rubygems.org"

################################
#
# General
#
################################

gem "rails", "~> 5.0.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "dotenv-rails", "~> 2.1"
gem "kaminari", "~> 0.16"
gem "redis", "~> 3.0"
gem "foreman", "~> 0.78"
gem "turbolinks", "~> 5.0"
gem "devise", "~> 4.2"

################################
#
# API
#
################################

gem "jbuilder", "~> 2.5"

################################
#
# Assets Management
#
################################

gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "coffee-rails", "~> 4.2"
gem "uglifier", ">= 1.3.0"

################################
#
# Development
#
################################

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "rack-mini-profiler", "~> 0.9", require: false
  gem "better_errors", "~> 2.1"
  gem "binding_of_caller", "~> 0.7"
  gem "bullet", "~> 5.0"
  gem "web-console"
  gem "listen", "~> 3.1"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "database_cleaner", "~> 1.5"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
