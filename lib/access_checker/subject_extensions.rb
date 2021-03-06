module AccessChecker
  module SubjectExtensions

      # ------------------------------------------------------------------------------
      # has_role? -- returns true if subject has the given role
      # ------------------------------------------------------------------------------
      def has_role?(role_name)
        !get_role( role_name ).nil?
      end
 
      # ------------------------------------------------------------------------------
      # has_role! -- forces subject to have the given role
      # ------------------------------------------------------------------------------
      def has_role!(role_name)
        role = _auth_role_class.where( :name => role_name.to_s ).   # acts as the find part
               first_or_create( :name => role_name.to_s )           # acts as the create part
        role_objects << role unless self.role_objects.member?(role)
        role
      end

      # ------------------------------------------------------------------------------
      # remove_role! -- foreces subject to NOT have the given role
      # ------------------------------------------------------------------------------
      def remove_role!(role_name)
        role_objects.delete( get_role( role_name ) )
      end

      # ------------------------------------------------------------------------------
      # get_role -- returns a role obj for subject; else nil
      # EXCEPTION: EmptyRolesException if role_objects collection is empty
      # ------------------------------------------------------------------------------
      def get_role( role_name=nil )

        raise AccessChecker::EmptyRoles  if role_objects.empty?

        if role_name.nil?
           role_objects.first
        else
           role_objects.where( :name => role_name.to_s ).first
        end

      end

      protected

      # ------------------------------------------------------------------------------
      # _auth_role_class -- retuns the Klass for the Role model
      # ------------------------------------------------------------------------------
      def _auth_role_class
        self.class._auth_role_class_name.constantize
      end

      # ------------------------------------------------------------------------------
      # _auth_role_assoc -- returns the habtm symbol for the array of subject.roles
      # ------------------------------------------------------------------------------
      def _auth_role_assoc
        self.class._auth_role_assoc_name
      end

      # ------------------------------------------------------------------------------
      # role_objects -- returns the habtm array of roles for the subject
      # ------------------------------------------------------------------------------
      def role_objects
        send(self._auth_role_assoc)
      end

  end
end
