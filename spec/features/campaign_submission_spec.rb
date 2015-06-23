require 'rails_helper'

feature 'Submitting a campaign for review' do
  let!(:user) { create(:user) }
  let!(:campaign) { create(:campaign, user: user, publication_status: 'draft') }

  background do
    login_as user
    visit dashboard_path
    click_link 'submit for approval'
  end

  scenario 'updates the publication_status to "review"' do
    campaign.reload
    expect(campaign.publication_status).to eq('review')
  end

  scenario 'displays the campaign review message' do
    expect(page).to have_content(msg(:campaign_review))
  end

  scenario 'redirects to the dashboard' do
    expect(current_path).to eq(dashboard_path)
  end
end
