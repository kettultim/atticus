require 'rails_helper'

feature 'Completing the new campaign form' do
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
    select '30 days', from: 'Duration'
    fill_in 'Funding goal', with: '3500'
    click_button 'Create'
  end

  scenario 'creates a draft campaign with the submitted values' do
    campaign = Campaign.last
    expect(campaign.user).to eq(user)
    expect(campaign.title).to eq(attrs.title)
    expect(campaign.details.squish).to eq(attrs.details.squish)
    expect(campaign.logo).to exist
    expect(campaign.banner).to exist
    expect(campaign.allow_product_donations). to eq(true)
    expect(campaign.publication_status).to eq('draft')
    expect(campaign.duration).to eq(30)
    expect(campaign.funding_goal).to eq(3500)
  end

  scenario 'displays the campaign draft message' do
    expect(page).to have_content(msg(:campaign_draft))
  end

  scenario 'redirects to the dashboard' do
    expect(current_path).to eq(dashboard_path)
  end
end
