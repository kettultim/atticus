FactoryGirl.define do
  factory :campaign do
    title   Faker::Company.catch_phrase
    details Faker::Lorem.paragraphs.join("\n\n")
  end

end
