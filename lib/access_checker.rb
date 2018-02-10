require File.dirname(__FILE__) + '/access_checker/base'
require File.dirname(__FILE__) + '/access_checker/control'
require File.dirname(__FILE__) + '/access_checker/subject_extensions'
require File.dirname(__FILE__) + '/access_checker/access_control'

module AccessChecker
  @@configurator = {
    :default_role_class_name        => 'Role',
    :default_subject_class_name     => 'User',
    :default_subject_method         => :current_user,
    :default_roles_collection_name  => :roles,
    :default_users_collection_name  => :users,
    :default_join_table_name        => "roles_users"
  }

  mattr_reader :configurator

    class AccessDenied < SecurityError; end
    class EmptyRoles   < RuntimeError; end
    class SyntaxError  < ArgumentError; end
end


