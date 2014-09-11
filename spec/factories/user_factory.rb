# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: "Saaso::User" do
    email     { Faker::Internet.email }
    name      { Faker::Name.first_name }
    password  "password123"
    time_zone { Faker::Address.time_zone }

    plan_id { create(:plan).id }

    trait :with_organization_name do
      organization_name "Super Awesome Organization Name, LLC."
    end
  end
end
