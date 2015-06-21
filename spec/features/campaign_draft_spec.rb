require 'rails_helper'

feature 'User creates a campaign draft' do
  let(:user) { create(:user) }
  let(:attrs) { build(:campaign) }

  background do
    login_as user
    visit dashboard_path
    click_link 'New Campaign'

    fill_in 'Title', with: attrs.title
    fill_in 'Details', with: attrs.details
    attach_file 'Logo', fixture_image(:thumbnail)
    attach_file 'Banner', fixture_image(:wide)
    check 'campaign_allow_product_donations'
    click_button 'Create'
  end

  scenario 'It creates a campaign with the form values' do
    campaign = Campaign.last
    expect(campaign.user).to eq(user)
    expect(campaign.title).to eq(attrs.title)
    expect(campaign.details.squish).to eq(attrs.details.squish)
    expect(campaign.logo).to exist
    expect(campaign.banner).to exist
    expect(campaign.allow_product_donations). to eq(true)
    expect(campaign.publication_status).to eq('draft')
  end

  scenario 'It displays the campaign draft message' do
    expect(page).to have_content(msg(:campaign_draft))
  end

  scenario 'It redirects to the dashboard' do
    expect(current_path).to eq(dashboard_path)
  end
end
