# encoding: utf-8
require "bundler/gem_tasks"
require 'bundler'

  begin
    Bundler.setup(:default, :development)
  rescue Bundler::BundlerError => e
    $stderr.puts e.message
    $stderr.puts "Run `bundle install` to install missing gems"
    exit e.status_code
  end

require 'rake'

# ------------------------------------------------------------------------
# don't use normal Rake test routine because of double factory_bot
# ------------------------------------------------------------------------
task :test do
   ruby '-I test "test/test_access_checker.rb"'
end # test task

task :default => :test


