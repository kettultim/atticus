require 'rails_helper'

describe Campaign do
  specify { expect_it.to validate_presence_of :title }
  specify { expect_it.to validate_presence_of :details }
  specify { expect_it.to validate_presence_of :duration }
  specify { expect_it.to validate_presence_of :funding_goal }
  specify { expect_it.to validate_presence_of :zip_code }
  specify { expect_it.to belong_to :user }

  describe '#publish!' do
    subject { create(:campaign, publication_status: 'approved') }
    let(:expires_at) { Time.now + subject.duration.days }

    before do
      Timecop.freeze
    end

    after do
      Timecop.return
    end

    it 'sets the published_at attribute' do
      subject.publish!
      expect(subject.published_at).to eq Time.now
    end

    it 'publishes the campaign' do
      subject.publish!
      expect_it.to be_published
    end

    it 'sets the expires_at attribute' do
      subject.publish!
      expect(subject.expires_at).to eq expires_at
    end

    it 'schedules the expiration' do
      expect(CampaignExpirationWorker).to receive(:perform_at)
        .with(expires_at, subject.id)
      subject.publish!
    end
  end

  context 'validations' do
    subject {
      described_class.new(
        publication_status: 'boiled',
        duration: 42,
        funding_goal: -10,
        zip_code: 'bama'
      )
    }

    before do
      subject.valid?
    end

    it 'requires certain publication_status values' do
      expect_it.to have(1).errors_on(:publication_status)
    end

    it 'requires certain duration values' do
      expect_it.to have(1).errors_on(:duration)
    end

    it 'must have a positive funding goal' do
      expect_it.to have(1).errors_on(:funding_goal)
    end

    specify { expect_it.to have(1).errors_on(:zip_code) }
  end
end
