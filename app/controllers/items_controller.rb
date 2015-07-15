class ItemsController < ApplicationController
  before_filter :load_campaign_and_build_item

  def new; end

  def create
    if @item.save
      redirect_to campaign_path(@campaign), notice: msg(:item_create)
    else
      flash.now.alert = msg(:general_error)
      render :new
    end
  end

  private

  def load_campaign_and_build_item
    @campaign = Campaign.find(params[:campaign_id])

    @item = current_user.items.new_with_disclaimer(
      item_params.merge(campaign: @campaign)
    )

    authorize @item
  end

  def item_params
    return {} unless params[:item]

    params.require(:item).permit(
      :name, :description, :minimum_price, :shipping_fee, :payment_email,
      :disclaimer
    )
  end
end
