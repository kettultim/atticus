class CampaignPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.user == user
  end

  def show?
    user.admin? || record.published?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || (record.user == user && !record.published?)
  end

  def approve?
    user.admin?
  end

  def reject?
    user.admin?
  end

  def submit_for_review?
    record.user == user
  end

  def launch?
    record.user == user && record.approved?
  end
end
