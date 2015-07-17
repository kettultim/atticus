require 'rails_helper'

feature 'Viewing a campaign' do
  include ApplicationHelper

  subject { page }
  let(:campaign) { create :campaign_with_items }

  around do |example|
    Timecop.freeze
    visit campaign_path campaign
    example.run
    Timecop.return
  end

  specify { expect_it.to have_content campaign.title }
  specify { expect_it.to have_content campaign.details }
  specify { expect_it.to have_content location campaign }
  specify { expect_it.to have_content money campaign.funding_goal }
  specify { expect_it.to have_content expiration_message campaign }

  it 'displays all items' do
    campaign.items.each do |item|
      expect_it.to have_image item.image_url(:medium)
      expect_it.to have_content item.name
      expect_it.to have_content item.description
      expect_it.to have_content money item.minimum_price
      expect_it.to have_content shipping_fee item
    end
  end
end
