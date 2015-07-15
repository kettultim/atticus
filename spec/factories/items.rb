FactoryGirl.define do
  factory :item do
    campaign_id 1
    user_id 1
    name Faker::Company.catch_phrase
    description Faker::Lorem.paragraph
    minimum_price 10
    shipping_fee 5
    payment_email Faker::Internet.email
  end
end
