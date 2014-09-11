# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization_membership, class: Saaso::OrganizationMembership do
    organization
    user

    trait :with_admin_role do
      association :role, factory: :admin_organization_role
    end
  end
end
