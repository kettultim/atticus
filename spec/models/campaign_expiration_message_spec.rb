require 'rails_helper'

describe CampaignExpirationMessage do
  subject { described_class.new(campaign) }

  before do
    Timecop.freeze(Time.local(2015, 01, 01))
  end

  after do
    Timecop.return
  end

  context 'campaign has ended already' do
    let(:campaign) {
      double('campaign', expires_at: Date.new(2001, 03, 25))
    }

    specify {
      expect(subject.to_s).to include 'March 25, 2001'
    }
  end

  context 'campaign ends in days' do
    let(:campaign) {
      double('campaign', expires_at: 3.days.from_now)
    }

    specify {
      expect(subject.to_s).to include '3 days'
    }
  end

  context 'campaign ends in hours' do
    let(:campaign) {
      double('campaign', expires_at: 21.hours.from_now)
    }

    specify {
      expect(subject.to_s).to include '21 hours'
    }
  end

  context 'campaign ends in minutes' do
    let(:campaign) {
      double('campaign', expires_at: 45.minutes.from_now)
    }

    specify {
      expect(subject.to_s).to include '45 minutes'
    }
  end

  context 'campaign ends in seconds' do
    let(:campaign) {
      double('campaign', expires_at: 45.seconds.from_now)
    }

    specify {
      expect(subject.to_s).to include 'under a minute'
    }
  end
end
