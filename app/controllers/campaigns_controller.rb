class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.save
      flash[:notice] = %W{The campaign is under review. You will be notified when it
                       is approved}
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end
