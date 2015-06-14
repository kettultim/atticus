require "rails_helper"

feature "campaign creation" do
  let(:user) { create(:user) }

  background do
    login_as user
    visit new_campaign_path
  end

  scenario "user creates a campaign" do
    attrs = build(:campaign)

    fill_in "Title", with: attrs.title
    fill_in "Details", with: attrs.details
    attach_file "Logo", fixture_image(:thumbnail)
    attach_file "Banner", fixture_image(:wide)
    check "campaign_allow_product_donations"
    click_button "Create"

    expect(page.current_path).to eq(root_path)

    campaign = Campaign.last
    expect(campaign.user).to eq(user)
    expect(campaign.title).to eq(attrs.title)
    expect(campaign.details.squish).to eq(attrs.details.squish)
    expect(campaign.logo).to exist
    expect(campaign.banner).to exist
    expect(campaign.allow_product_donations). to eq(true)
    expect(campaign.publication_status).to eq("review")
  end
end
