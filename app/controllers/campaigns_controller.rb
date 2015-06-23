class CampaignsController < ApplicationController
  before_filter :load_and_authorize_campaign, only: [:edit, :update]
  skip_before_filter :authenticate_user!, only: [:show]

  def new
    @campaign = current_user.campaigns.new
    authorize @campaign
  end

  def create
    @campaign = current_user.campaigns.build(
      campaign_params.merge(publication_status: 'draft'))

    authorize @campaign

    if @campaign.save
      flash[:notice] = msg(:campaign_draft)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @campaign.update_attributes(campaign_params)
      flash[:notice] = msg(:campaign_update)
      redirect_to edit_campaign_path(@campaign)
    else
      render :edit
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  private

  def load_and_authorize_campaign
    @campaign = current_user.campaigns.find(params[:id])
    authorize @campaign
  end

  def campaign_params
    params.require(:campaign).permit(:title, :details, :allow_product_donations,
                                     :logo, :banner, :duration, :funding_goal)
  end
end
