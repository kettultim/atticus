class Admin::Campaigns::ApprovalController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    authorize campaign, :approve?

    campaign.update_attributes(publication_status: 'approved')

    CampaignMailer.approval_notice(campaign.id).deliver_later

    redirect_to admin_dashboard_path
  end
end
