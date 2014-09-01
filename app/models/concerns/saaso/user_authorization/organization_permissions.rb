module Saaso
  module UserAuthorization

    module OrganizationPermissions
      def can_destroy_saaso_organization?(organization)
        organization_owner?(organization)
      end

      def can_manage_saaso_organization?(organization)
        organization_owner?(organization)
      end

      def can_read_saaso_organization?(organization)
        organization_owner_or_admin?(organization)
      end

      def can_update_saaso_organization?(organization)
        organization_owner?(organization)
      end

    private

      def organization_admin?(organization)
        organization.admins.include?(self)
      end

      def organization_owner?(organization)
        organization.owner == self
      end

      def organization_owner_or_admin?(organization)
        organization_owner?(organization) || organization_admin?(organization)
      end
    end

  end
end
