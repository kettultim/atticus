require 'rails_helper'

RSpec.describe Item, type: :model do
  specify { expect(subject.image).to be_nil }
  specify { expect(subject.image_url).to be_nil }

  describe 'Relations' do
    specify { expect_it.to belong_to :user }
    specify { expect_it.to belong_to :campaign }
    specify { expect_it.to have_many :images }
  end

  describe 'Validations' do
    specify { expect_it.to validate_presence_of :name }
    specify { expect_it.to validate_presence_of :description }
    specify { expect_it.to validate_presence_of :minimum_price }
    specify { expect_it.to validate_presence_of :shipping_fee }
    specify { expect_it.to validate_presence_of :payment_email }
  end

  context 'With Disclaimer' do
    subject { Item.new_with_disclaimer }

    before do
      subject.valid?
    end

    specify { expect_it.to respond_to :disclaimer }
    specify { expect_it.to have(1).errors_on(:disclaimer) }
  end

  context 'Item with Images' do
    subject { create(:item_with_images) }

    specify { expect(subject.images.count).to eq 1 }
    specify { expect(subject.image).to eq(subject.images.first) }
    specify { expect(subject.image_url).to eq(subject.images.first.url) }
  end
end
