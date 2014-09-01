module Saaso
  module UserAuthorization
    extend ActiveSupport::Concern
    include OrganizationPermissions

    included do
      devise :database_authenticatable, :omniauthable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable
    end

    # Returns whether or not the user can perform
    # an action on a subject based on roles/permissions.
    # @param action [Symbol]
    # @param subject [Object]
    def can?(action, subject)
      if subject.class == Class
        raise ArgumentError, "Permissions cannot be determined from a class. Instead pass an instance of #{subject}."
      else
        self.send("can_#{action}_#{subject.class}?".underscore.gsub("/", "_"), subject)
      end
    end

  protected

    # Overrides the Devise method to allow users
    # to be created with an email address.
    # @return [Boolean] false
    def email_required?
      false
    end

    # Overrides the Devise method to allow
    # users to be created without a password.
    # @return [Boolean] false
    def password_required?
      false
    end
  end
end
