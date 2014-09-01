require "rails_helper"

module Saaso

  # ---------------------------------------------------------
  # Instance Methods
  # ---------------------------------------------------------

  describe User, "#time" do

    it "should return a time object with the correct time zone" do
      user = build(:user)
      expect(user.time.name).to eq(user.time_zone)
    end

  end

  # ---------------------------------------------------------
  # Private Methods
  # ---------------------------------------------------------

  describe User, "#create_organization" do

    it "should create an organization with the same name and time zone as the user" do
      user = create(:user)
      organization = user.owned_organizations.first

      expect(organization.name).to eq(user.name)
      expect(organization.time_zone).to eq(user.time_zone)
    end

  end

end
