module Saaso
  class Organization < ActiveRecord::Base
    belongs_to :owner,
      class_name:  "Saaso::User",
      foreign_key: :user_id

    has_and_belongs_to_many :admins,
      class_name: "Saaso::User"

    has_many :admin_invitations

    # Returns a Time-like class with the
    # organization's selected time zone.
    # @return [ActiveSupport::TimeWithZone]
    def time
      Time.zone = self.time_zone
      Time.zone
    end
  end
end
