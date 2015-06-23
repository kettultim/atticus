require 'rails_helper'

feature 'Submitting the campaign edit form' do
  let!(:user) { create(:user) }
  let!(:campaign) { create(:campaign, user: user, publication_status: 'draft') }

  background do
    login_as user
    visit dashboard_path
    click_link 'edit'

    fill_in 'Title', with: 'New Title'
    click_button 'Update'

    campaign.reload
  end

  scenario 'maintains the draft state' do
    expect(campaign.publication_status).to eq('draft')
  end

  scenario 'updates the title' do
    expect(campaign.title).to eq('New Title')
  end

  scenario 'displays the campaign update message' do
    expect(page).to have_content(msg(:campaign_update))
  end

  scenario 'redirects to the edit form' do
    expect(current_path).to eq(edit_campaign_path(campaign))
  end
end
