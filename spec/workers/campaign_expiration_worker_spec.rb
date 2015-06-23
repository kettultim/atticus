require 'rails_helper'
require 'ostruct'

describe CampaignExpirationWorker do
  describe '#perform' do
    let(:campaign) { OpenStruct.new(id: 1, save: true) }

    before do
      Campaign.stub(find: campaign)
    end

    it "loads the campaign" do
      expect(Campaign).to receive(:find).with(campaign.id).and_return(campaign)
      subject.perform(campaign.id)
    end

    it "sets the status to expired" do
      subject.perform(campaign.id)
      expect(campaign.publication_status).to eq('expired')
    end

    it "saves the campaign" do
      expect(campaign).to receive(:save).and_return(true)
      subject.perform(campaign.id)
    end

    it "notifies the creator"
  end
end
