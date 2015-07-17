require 'rails_helper'

describe Campaign do
  describe '#publish' do
    subject { create(:campaign, publication_status: 'approved') }
    let(:expires_at) { Time.now + subject.duration.days }

    before do
      Timecop.freeze
    end

    after do
      Timecop.return
    end

    it 'sets the published_at attribute' do
      subject.publish
      expect(subject.published_at).to eq Time.now
    end

    it 'publishes the campaign' do
      subject.publish
      expect_it.to be_published
    end

    it 'sets the expires_at attribute' do
      subject.publish
      expect(subject.expires_at).to eq expires_at
    end

    it 'schedules the expiration' do
      expect(CampaignExpirationWorker).to receive(:perform_at)
        .with(expires_at, subject.id)
      subject.publish
    end
  end
end
