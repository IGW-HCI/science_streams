#!/usr/bin/env puma

threads 0, 4

bind "unix:///var/tmp/hotels.sock"
environment "production"
stdout_redirect "/var/www/science_streams/shared/log/puma.log"
preload_app!
