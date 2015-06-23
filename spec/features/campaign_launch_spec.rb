require 'rails_helper'

feature 'Launching an approved campaign' do
  let!(:user) { create(:user) }

  let!(:campaign) {
    create(:campaign, user: user, publication_status: 'approved')
  }

  background do
    login_as user
    visit dashboard_path
    click_link 'launch'
  end

  scenario 'updates the publication_status to "published"' do
    campaign.reload
    expect(campaign).to be_published
  end

  scenario 'displays the campaign review message' do
    expect(page).to have_content msg(:campaign_published)
  end

  scenario 'redirects to the campaign page' do
    expect(current_path).to eq campaign_path(campaign)
  end
end
