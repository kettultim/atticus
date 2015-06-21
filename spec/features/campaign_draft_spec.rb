require 'rails_helper'

feature 'Campaigns' do
  let(:user) { create(:user) }
  let(:attrs) { build(:campaign) }

  background do
    login_as user
    visit new_campaign_path
  end

  scenario 'User creates a campaign draft' do
    fill_in 'Title', with: attrs.title
    fill_in 'Details', with: attrs.details
    attach_file 'Logo', fixture_image(:thumbnail)
    attach_file 'Banner', fixture_image(:wide)
    check 'campaign_allow_product_donations'
    click_button 'Create'

    campaign = Campaign.last
    expect(campaign.user).to eq(user)
    expect(campaign.title).to eq(attrs.title)
    expect(campaign.details.squish).to eq(attrs.details.squish)
    expect(campaign.logo).to exist
    expect(campaign.banner).to exist
    expect(campaign.allow_product_donations). to eq(true)
    expect(campaign.publication_status).to eq('draft')

    expect(page).to have_content(msg(:campaign_draft))

    expect(current_path).to eq(root_path)
  end
end
