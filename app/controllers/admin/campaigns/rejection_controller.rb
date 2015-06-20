class Admin::Campaigns::RejectionController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    authorize campaign, :reject?

    campaign.update_attributes(publication_status: 'draft')

    CampaignMailer.rejection_notice(campaign.id, params[:notes]).deliver_later

    redirect_to admin_campaign_path(campaign)
  end
end
