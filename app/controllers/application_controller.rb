class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def self.admin_only!
    before_filter :redirect_non_admins
  end

  def redirect_non_admins
    return if current_user.admin?

    flash[:alert] = msg(:unauthorized)
    redirect_to root_path
  end

  def current_user
    super || NullUser.new
  end

  def user_signed_in?
    User === current_user
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end
end
