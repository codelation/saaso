# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_invitation, class: Saaso::AdminInvitation do
    email { Faker::Internet.email }
  end
end
