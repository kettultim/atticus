require 'rails_helper'

feature 'Publishing a campaign' do
  let!(:user) { create(:user) }
  let!(:campaign) { create(:campaign, user: user, publication_status: 'draft') }

  background do
    login_as user

    visit dashboard_path

    within '.drafts' do
      click_link campaign.title
    end
  end

  scenario 'User publishes a campaign' do
    click_button 'Publish'

    campaign.reload
    expect(campaign.publication_status).to eq('review')

    expect(page).to have_content(msg(:campaign_review))
    expect(current_path).to eq(dashboard_path)
  end
end
