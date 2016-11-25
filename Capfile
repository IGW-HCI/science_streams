# Load DSL and set up stages
require "capistrano/setup"

# Include deployment tasks
require "capistrano/deploy"
require "capistrano/rails"
require "capistrano/faster_assets"
require "capistrano/foreman"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
