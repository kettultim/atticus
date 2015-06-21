class Campaigns::SubmissionController < ApplicationController
  before_filter :authenticate_user!

  def create
    @campaign = current_user.campaigns.find(params[:campaign_id])
    authorize @campaign, :submit_for_review?

    if @campaign.submit_for_review!
      flash[:notice] = msg(:campaign_review)
    else
      flash[:alert] = msg(:campaign_publish_error)
    end

    redirect_to dashboard_path
  end
end
