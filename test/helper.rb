ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rails'
require 'active_support'
require 'active_record'
require 'action_controller'
require 'rails/test_help'
require 'shoulda'
require 'factory_bot'
require 'access_checker'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'test.sqlite3')
ActiveRecord::Base.send(:include, AccessChecker::Base)

require 'support/models.rb'

#Logger = ActiveRecord::Base.logger
load 'support/schema.rb'

class Test::Unit::TestCase
 
   FactoryBot.find_definitions
   include FactoryBot::Syntax::Methods
   include ActiveSupport::Testing::Assertions
   
end

#ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActionController::Base.logger = ActiveRecord::Base.logger

class ActiveSupport::TestCase

  # Add more helper methods to be used by all tests here...

end

