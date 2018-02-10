require 'access_checker'

ActiveRecord::Base.class_eval do
  include AccessChecker::Base
end
ActionController::Base.class_eval do
  include AccessChecker::Control
end
