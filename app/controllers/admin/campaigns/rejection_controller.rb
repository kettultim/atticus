class Admin::Campaigns::RejectionController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    authorize campaign, :reject?

    campaign.update_attributes(publication_status: 'draft')

    redirect_to admin_campaign_path(campaign)
  end
end
