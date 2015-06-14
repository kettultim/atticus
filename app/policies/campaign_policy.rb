class CampaignPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.user == user
  end
end
