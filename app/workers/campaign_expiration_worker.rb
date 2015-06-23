class CampaignExpirationWorker
  include Sidekiq::Worker
  attr_reader :campaign

  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)

    campaign.publication_status = 'expired'
    campaign.save
  end
end
