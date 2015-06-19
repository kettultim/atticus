class Admin::Campaigns::ApprovalController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    authorize campaign, :approve?

    campaign.update_attributes(publication_status: 'published')

    redirect_to admin_dashboard_path
  end
end
