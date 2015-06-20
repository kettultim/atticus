require 'rails_helper'

feature 'Admin Campaign Review' do
  let(:admin)    { create(:admin_user) }
  let(:notes)    { Faker::Lorem.sentence }
  let(:mail)     { double("mail", deliver_later: true) }
  let!(:campaign) { create(:campaign_in_review, user_id: admin.id) }

  background do
    login_as admin
    visit admin_dashboard_path

    click_link 'Review Campaigns'

    within ".campaign-#{campaign.id}" do
      click_link 'view'
    end
  end

  scenario 'Approving a campaign' do
    expect(CampaignMailer).to receive(:approval_notice)
      .with(campaign.id).and_return(mail)

    click_button 'Approve'

    campaign.reload
    expect(campaign.publication_status).to eq('published')

    expect(current_path).to eq admin_dashboard_path
  end

  scenario 'Denying a campaign with notes' do
    expect(CampaignMailer).to receive(:rejection_notice)
      .with(campaign.id, notes).and_return(mail)

    fill_in 'Notes', with: notes
    click_button 'Reject'

    campaign.reload
    expect(campaign.publication_status).to eq('draft')

    expect(current_path).to eq admin_campaign_path(campaign)
  end
end
