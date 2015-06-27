require 'rails_helper'

feature 'Viewing a campaign' do
  subject { page }
  let(:campaign) {
    create(
      :campaign,
      publication_status: 'published',
      expires_at: 3.days.from_now
    )
  }

  before do
    Timecop.freeze
    visit campaign_path(campaign)
  end

  after do
    Timecop.return
  end

  specify { expect_it.to have_content campaign.title }

  specify { expect_it.to have_content campaign.details }

  specify {
    expect_it.to have_content Money.new(campaign.funding_goal * 100, 'USD')
  }

  specify {
    expect(page).to have_content(ExpirationMessage.new(campaign.expires_at))
  }
end
