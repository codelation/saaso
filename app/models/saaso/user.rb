module Saaso
  class User < ActiveRecord::Base
    include UserAuthorization

    # Relationships
    has_many :owned_organizations, class_name: "Saaso::Organization", inverse_of: :owner
    has_and_belongs_to_many :administered_organizations, class_name: "Saaso::Organization"

    # Callbacks
    after_create :create_organization, if: Proc.new { self.owned_organizations.empty? }

    # Returns a Time-like class with the user's selected time zone.
    # @return [ActiveSupport::TimeWithZone]
    def time
      Time.zone = self.time_zone
      Time.zone
    end

  private

    def create_organization
      self.owned_organizations.create(
        name:      self.name,
        time_zone: self.time_zone
      )
    end
  end
end
