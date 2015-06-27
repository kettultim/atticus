require 'rails_helper'
require 'ostruct'

describe CampaignExpirationWorker do
  describe '#perform' do
    let(:mail)     { double('mail', deliver_later: true) }
    let(:campaign) { OpenStruct.new(id: 1, save: true) }

    before do
      allow(CampaignMailer).to receive(:expiration_notice)
        .with(campaign.id).and_return(mail)

      allow(Campaign).to receive(:find).and_return(campaign)
    end

    it 'loads the campaign' do
      expect(Campaign).to receive(:find).with(campaign.id).and_return(campaign)
      subject.perform(campaign.id)
    end

    it 'sets the status to expired' do
      subject.perform(campaign.id)
      expect(campaign.publication_status).to eq('expired')
    end

    it 'saves the campaign' do
      expect(campaign).to receive(:save).and_return(true)
      subject.perform(campaign.id)
    end

    it 'notifies the creator' do
      expect(CampaignMailer).to receive(:expiration_notice)
        .with(campaign.id).and_return(mail)
      subject.perform(campaign.id)
    end
  end
end
