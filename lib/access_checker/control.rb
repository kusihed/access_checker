module AccessChecker
  module Control

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
       def access_control( role_control_hash, options = {} )
          before_action  AccessChecker::AccessControl.new( role_control_hash ), options
       end
    end 
  end 
end
