#!/usr/bin/env puma

threads 0, 4

bind "unix:///var/tmp/science_streams.sock"
environment "production"
stdout_redirect "/var/www/science_streams/shared/log/puma.log"
preload_app!
