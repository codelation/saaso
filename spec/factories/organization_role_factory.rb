# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization_role, class: Saaso::OrganizationRole do
    name "member"

    factory :admin_organization_role do
      name "admin"
    end
  end
end
