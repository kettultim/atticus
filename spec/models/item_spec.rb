require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relations' do
    specify { expect_it.to belong_to :user }
    specify { expect_it.to belong_to :campaign }
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
end
