class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @drafts = current_user.campaigns.drafts
  end
end
