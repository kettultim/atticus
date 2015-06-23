FactoryGirl.define do
  factory :campaign do
    user
    title Faker::Company.catch_phrase
    details Faker::Lorem.paragraphs.join("\n\n")
    publication_status 'published'
    duration 30
    funding_goal 2500

    factory :campaign_in_review do
      publication_status 'review'
    end
  end
end
