require 'rails_helper'

RSpec.describe Item, type: :model do
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

  describe 'Factories' do
    context 'Item with Images' do
      subject { create(:item_with_images) }
      specify { expect(subject.images.count).to eq 3 }
    end
  end
end
