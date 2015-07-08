class ItemPolicy < ApplicationPolicy
  def create?
    record.campaign.allow_product_donations? && record.campaign.published?
  end
end
