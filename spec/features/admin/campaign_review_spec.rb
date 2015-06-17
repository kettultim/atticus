require "rails_helper"

feature "Admin Campaign Review" do
  let(:admin)    { create(:admin_user) }
  let!(:campaign) { create(:campaign_in_review, user_id: admin.id) }

  background do
    login_as admin
    visit admin_dashboard_path

    click_link "Review Campaigns"
  end

  scenario "Admin approves a campaign" do
    within ".campaign-#{campaign.id}" do
      click_link "view"
    end

    expect(page.current_path).to eq(admin_campaign_path(campaign))
    expect(page).to have_content campaign.title

    save_and_open_page
  end
end
