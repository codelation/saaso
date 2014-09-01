# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: "Saaso::User" do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    password  "hello world"
    time_zone { Faker::Address.time_zone }

    # Company Admin
    factory :admin_user do
      after(:create) do |user|
        user.administered_organizations = [create(:organization)]
      end
    end
  end
end
