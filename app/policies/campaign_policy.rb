class CampaignPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.is_a? User
  end
end
