class CampaignsController < ApplicationController
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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @campaign = current_user.campaigns.find(params[:id])
    authorize @campaign
  end

  def update
    @campaign = current_user.campaigns.find(params[:id])
    authorize @campaign

    @campaign.assign_attributes(campaign_params)

    if @campaign.valid?
      if params[:commit] == 'Publish'
        @campaign.submit_for_review!
        flash[:notice] = msg(:campaign_review)
        redirect_to dashboard_path
      else
        @campaign.save
        flash[:notice] = msg(:campaign_update)
        redirect_to edit_campaign_path(@campaign)
      end
    else
      render :edit
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :details, :allow_product_donations,
                                     :logo, :banner)
  end
end
