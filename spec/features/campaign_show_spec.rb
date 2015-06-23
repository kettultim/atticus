require 'rails_helper'

feature 'Viewing a campaign' do
  let(:campaign) {
    create(
      :campaign,
      publication_status: 'published',
      expires_at: 3.days.from_now
    )
  }

  before do
    visit campaign_path(campaign)
  end

  scenario 'it displays all the fields' do
    expect(page).to have_content campaign.title
    expect(page).to have_content campaign.details
    expect(page).to have_content Money.new(campaign.funding_goal * 100, 'USD')
    expect(page).to have_content '3 days'
  end
end
