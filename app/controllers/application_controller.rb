class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.admin_only!
    before_filter :redirect_non_admins
  end

  def redirect_non_admins
    unless current_user.admin?
      flash[:alert] = "Sorry, but you can't be here!"
      redirect_to root_path
    end
  end

  def current_user
    super || NullUser.new
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_dashboard_path
    else
      super user
    end
  end
end
