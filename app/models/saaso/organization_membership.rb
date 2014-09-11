module Saaso
  class OrganizationMembership < ActiveRecord::Base
    belongs_to :organization
    belongs_to :user
    belongs_to :role, class_name: "Saaso::OrganizationRole"
  end
end
