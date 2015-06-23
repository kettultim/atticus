require 'rails_helper'

feature 'Admin approves a campaign' do
  let(:admin)    { create(:admin_user) }
  let(:mail)     { double('mail', deliver_later: true) }
  let!(:campaign) { create(:campaign_in_review, user_id: admin.id) }

  background do
    expect(CampaignMailer).to receive(:approval_notice)
      .with(campaign.id).and_return(mail)

    login_as admin
    visit admin_dashboard_path
    click_link 'Review Campaigns'
    click_link 'view'
    click_button 'Approve'

    campaign.reload
  end

  scenario 'updates the publication_status to "approved"' do
    expect(campaign.publication_status).to eq('approved')
  end

  scenario 'redirects to the admin dashboard' do
    expect(current_path).to eq admin_dashboard_path
  end
end
