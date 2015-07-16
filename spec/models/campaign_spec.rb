require 'rails_helper'

describe Campaign do
  describe 'Associations' do
    specify { expect_it.to belong_to :user }
  end

  describe 'Validations' do
    specify { expect_it.to validate_presence_of :title }
    specify { expect_it.to validate_presence_of :details }
    specify { expect_it.to validate_presence_of :duration }
    specify { expect_it.to validate_presence_of :funding_goal }
    specify { expect_it.to validate_presence_of :zip_code }

    subject {
      Campaign.new(
        publication_status: 'boiled',
        duration: 42,
        funding_goal: -10,
        zip_code: 'bama'
      )
    }

    before do
      subject.valid?
    end

    it 'requires certain publication_status values' do
      expect_it.to have(1).errors_on(:publication_status)
    end

    it 'requires certain duration values' do
      expect_it.to have(1).errors_on(:duration)
    end

    it 'must have a positive funding goal' do
      expect_it.to have(1).errors_on(:funding_goal)
    end

    it 'must have a numeric zip code' do
      expect_it.to have(1).errors_on(:zip_code)
    end
  end

  describe 'Factories' do
    context 'campaign_with_items' do
      subject { create(:campaign_with_items) }
      specify { expect(subject).to have(3).items }
    end
  end
end
