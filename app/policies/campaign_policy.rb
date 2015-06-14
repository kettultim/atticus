class CampaignPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.user == user
  end

  def show?
    user.admin? || record.publication_status == "published"
  end
end
