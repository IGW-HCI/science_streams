# config valid only for current version of Capistrano
lock "3.6.1"

set :application, "science_streams"
set :repo_url, "git@github.com:IGW-HCI/science_streams.git"

append :linked_files, ".env"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/uploads"

# after "deploy:finished", "foreman:export"
# after "deploy:finished", "foreman:restart"
