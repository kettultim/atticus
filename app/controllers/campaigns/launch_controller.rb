class Campaigns::LaunchController < ApplicationController
  before_filter :authenticate_user!

  def create
    campaign = current_user.campaigns.find(params[:campaign_id])
    authorize campaign, :launch?

    if campaign.publish
      flash[:notice] = msg(:campaign_published)
    else
      flash[:alert] = msg(:general_error)
    end

    redirect_to campaign
  end
end
