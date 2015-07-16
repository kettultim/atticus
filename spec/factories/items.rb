FactoryGirl.define do
  factory :item do
    campaign
    user
    name Faker::Company.catch_phrase
    description Faker::Lorem.paragraph
    minimum_price 10
    shipping_fee 5
    payment_email Faker::Internet.email

    factory :item_with_images do
      after :create do |item|
        create_list(:item_image, 1, item: item)
      end
    end
  end
end
