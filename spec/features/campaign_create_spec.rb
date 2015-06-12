require 'rails_helper'

feature 'campaign creation' do
  let(:user) { create(:user) }

  background do
    login_as user
  end

  scenario 'user creating a campaign' do
    visit new_campaign_path

    fill_in "Title", with: "Campaign 1"

    click_button "Create"

    expect(page.current_path).to eq(root_path)

    campaign = user.campaigns.last
    expect(campaign.title).to eq("Campaign 1")
  end
end
