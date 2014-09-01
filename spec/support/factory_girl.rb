FactoryGirl.define do
  sequence(:random_date)        { Date.today.advance(days: rand(-100..100)) }
  sequence(:random_future_date) { rand(1..100).days.from_now }
  sequence(:random_past_date)   { rand(1..100).days.ago }
end

Dir["#{File.dirname(__FILE__)}/../factories/**/*.rb"].each { |f| require f }
