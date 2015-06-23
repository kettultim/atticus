require 'rails_helper'

feature 'Admin rejects a campaign' do
  let(:admin)    { create(:admin_user) }
  let(:notes)    { Faker::Lorem.sentence }
  let(:mail)     { double('mail', deliver_later: true) }
  let!(:campaign) { create(:campaign_in_review, user_id: admin.id) }

  background do
    expect(CampaignMailer).to receive(:rejection_notice)
      .with(campaign.id, notes).and_return(mail)

    login_as admin
    visit admin_dashboard_path
    click_link 'Review Campaigns'
    click_link 'view'
    fill_in 'Notes', with: notes
    click_button 'Reject'
  end

  scenario 'reverts the campaign to a draft' do
    campaign.reload
    expect(campaign.publication_status).to eq('draft')
  end

  scenario 'redirects to the admin campaign view' do
    expect(current_path).to eq admin_campaign_path(campaign)
  end
end
