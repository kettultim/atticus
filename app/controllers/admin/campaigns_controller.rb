class Admin::CampaignsController < ApplicationController
  admin_only!

  before_filter :load_filters_from_params, only: [:index]

  def index
    @campaigns = Campaign

    if !@filters.empty?
      @campaigns = @campaigns.where(@filters)
    else
      @campaigns = @campaigns.all
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  private

  def load_filters_from_params
    @filters = {}

    return unless Campaign.valid_publication_status? params[:publication_status]

    @filters[:publication_status] = params[:publication_status]
  end
end
