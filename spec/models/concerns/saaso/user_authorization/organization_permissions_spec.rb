require "rails_helper"

module Saaso
  module UserAuthorization

    describe OrganizationPermissions do

      context "User owns the organization" do
        before(:each) do
          @organization = create(:organization)
          @user = @organization.owner
        end

        it "destroy is ALLOWED" do
          expect(@user.can?(:destroy, @organization)).to eq(true)
        end

        it "manage is ALLOWED" do
          expect(@user.can?(:manage, @organization)).to eq(true)
        end

        it "read is ALLOWED" do
          expect(@user.can?(:read, @organization)).to eq(true)
        end

        it "update is ALLOWED" do
          expect(@user.can?(:update, @organization)).to eq(true)
        end
      end

      context "User is a organization admin" do
        before(:each) do
          @user = create(:admin_user)
          @organization = @user.administered_organizations.first
        end

        it "destroy is DENIED" do
          expect(@user.can?(:destroy, @organization)).to eq(false)
        end

        it "manage is DENIED" do
          expect(@user.can?(:manage, @organization)).to eq(false)
        end

        it "read is ALLOWED" do
          expect(@user.can?(:read, @organization)).to eq(true)
        end

        it "update is DENIED" do
          expect(@user.can?(:update, @organization)).to eq(false)
        end
      end

      context "User is not part of the organization" do
        before(:each) do
          @organization = create(:organization)
          @user = create(:user)
        end

        it "destroy is DENIED" do
          expect(@user.can?(:destroy, @organization)).to eq(false)
        end

        it "manage is DENIED" do
          expect(@user.can?(:manage, @organization)).to eq(false)
        end

        it "read is DENIED" do
          expect(@user.can?(:read, @organization)).to eq(false)
        end

        it "update is DENIED" do
          expect(@user.can?(:update, @organization)).to eq(false)
        end
      end

    end

  end
end
