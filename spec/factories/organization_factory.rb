# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization, class: "Saaso::Organization" do
    association :owner, factory: :user

    name      { Faker::Company.name }
    time_zone { Faker::Address.time_zone }
  end
end
