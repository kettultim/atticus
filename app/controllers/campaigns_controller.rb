class CampaignsController < ApplicationController

  def new
    @campaign = current_user.campaigns.new
    authorize @campaign
  end

  def create
    @campaign = current_user.campaigns.build(
      campaign_params.merge(publication_status: 'review'))

    authorize @campaign

    if @campaign.save
      flash[:notice] = %W{The campaign is under review. You will be notified when
      it is approved}

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :details, :allow_product_donations,
      :logo, :banner)
  end
end
