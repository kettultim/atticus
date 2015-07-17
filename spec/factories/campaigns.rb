FactoryGirl.define do
  factory :campaign do
    user
    title Faker::Company.catch_phrase
    details Faker::Lorem.paragraphs.join("\n\n")
    publication_status 'published'
    duration 30
    funding_goal 2500
    zip_code '18512'
    published_at Time.now
    expires_at 28.days.from_now

    factory :campaign_in_review do
      publication_status 'review'
    end

    factory :campaign_with_items do
      after :create do |campaign|
        create_list(:item_with_images, 3, campaign: campaign)
      end
    end
  end
end
