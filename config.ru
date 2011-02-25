Gem.clear_paths
ENV['GEM_HOME'] = '/home/username/.gems'
ENV['GEM_PATH'] = File.expand_path('~/.gems') + ':/usr/lib/ruby/gems/1.8'
require 'rubygems'
require 'bundler'
require 'main-app'
set :environment, :production
run Sinatra::Application