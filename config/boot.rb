ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
ENV['EXECJS_RUNTIME'] = 'Node'
ENV['NLS_LANG'] = 'AMERICAN_AMERICA.UTF8'
require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
