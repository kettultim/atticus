require 'rails_helper'

feature 'campaign creation' do
  let(:user) { create(:user) }

  background do
    login_as user
    visit new_campaign_path
  end

  scenario 'user creating a campaign' do
    fill_in "Title", with: "Campaign 1"
    click_button "Create"

    expect(page.current_path).to eq(root_path)

    campaign = Campaign.last
    expect(campaign.title).to eq("Campaign 1")
    expect(campaign.user).to eq(user)
  end
end
