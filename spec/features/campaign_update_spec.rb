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
    fill_in 'Title', with: 'New Title'
    click_button 'Update'

    campaign.reload
    expect(campaign.publication_status).to eq('draft')
    expect(campaign.title).to eq('New Title')

    expect(page).to have_content(msg(:campaign_update))
    expect(current_path).to eq(edit_campaign_path(campaign))
  end
end
