source "https://rubygems.org"

################################
#
# General
#
################################

gem "rails", "~> 5.0.0"
gem "trailblazer", "~> 1.1"
gem "trailblazer-rails", "~> 0.4"
gem "pg", "~> 0.18"
gem "puma", "~> 3.6"
gem "dotenv-rails", "~> 2.1"
gem "kaminari", "~> 0.16"
gem "redis", "~> 3.0"
gem "turbolinks", "~> 5.0"
gem "devise", "~> 4.2"
gem "flutie", "~> 2.0"

################################
#
# File uploads
#
################################

gem "shrine", "~> 2.5"
gem "image_processing", "~> 0.4"
gem "mini_magick", "~> 4.5"
gem "fastimage", "~> 2.0"

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
gem "bootstrap", "= 4.0.0.alpha3.1"
gem "rails-timeago", "~> 2.14"
gem "font-awesome-sass", "~> 4.7"

source "https://rails-assets.org" do
  gem "rails-assets-tether", "~> 1.3"
end

################################
#
# Deployment
#
################################

gem "foreman", "~> 0.8"

group :development do
  gem "capistrano", "~> 3.6"
  gem "capistrano-rails", "~> 1.2"
  gem "capistrano-foreman", "~> 1.2"
  gem "capistrano-faster-assets", "~> 1.0"
end

group :production do
  gem "therubyracer", "~> 0.12"
end

################################
#
# Development
#
################################

group :development, :test do
  gem "byebug", platform: :mri
  gem "database_cleaner", "~> 1.5"
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
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
