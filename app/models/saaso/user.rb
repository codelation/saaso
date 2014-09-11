module Saaso
  class User < ActiveRecord::Base
    # Devise Modules
    devise :database_authenticatable, :omniauthable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Relationships
    has_many :owned_organizations, class_name: "Saaso::Organization", inverse_of: :owner, foreign_key: :owner_id
    has_many :organization_memberships

    # Validations
    validates_presence_of :name, :plan_id

    # Callbacks
    after_create :generate_owned_organization, :subscribe_owned_organization_to_plan

    attr_accessor :organization_name, :plan_id

    # Returns whether or not the user can perform
    # an action on a subject based on roles/permissions.
    # @param action [Symbol]
    # @param subject [Object]
    def can?(action, subject, *args)
      ability = Saaso::Ability.new(self)
      ability.can?(action, subject, *args)
    end

    # Returns a Time-like class with the user's selected time zone.
    # @return [ActiveSupport::TimeWithZone]
    def time
      Time.zone = self.time_zone
      Time.zone
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

  private

    # Generates the owned organization for a user.
    def generate_owned_organization
      return if self.owned_organizations.length > 0

      self.organization_name ||= self.name
      self.owned_organizations << Organization.new(name: self.organization_name)
    end

    # Subscribes the owned organization of a user to the selected plan.
    def subscribe_owned_organization_to_plan
      organization = self.owned_organizations.first

      if organization.current_subscription.nil? && self.plan_id
        plan = Saaso::Plan.find(self.plan_id)
        organization.subscribe_to_plan(plan)
      end
    end
  end
end
