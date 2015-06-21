class CampaignPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.user == user
  end

  def show?
    user.admin? || record.publication_status == 'published'
  end

  def edit?
    update?
  end

  def update?
    user.admin? || record.user == user
  end

  def approve?
    user.admin?
  end

  def reject?
    user.admin?
  end
end
