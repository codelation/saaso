module Saaso
  class OrganizationRole < ActiveRecord::Base
    has_many :organization_memberships
  end
end
