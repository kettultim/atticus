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
        file = File.open(fixture_image(:thumbnail))

        3.times { item.images.create(attachment: file) }
      end
    end
  end
end
