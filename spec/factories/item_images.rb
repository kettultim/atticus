FactoryGirl.define do
  factory :item_image, class: Item::Image do
    item
    attachment { File.new(fixture_image(:thumbnail)) }
  end
end
