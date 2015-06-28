module ApplicationHelper
  def money(dollars)
    Money.new(dollars * 100, 'USD').to_s
  end

  def campaign_expiration_message(campaign)
    ExpirationMessage.new(campaign.expires_at).to_s
  end

  def campaign_location(campaign)
    if campaign.city && campaign.state
      "#{campaign.city}, #{campaign.state}"
    else
      "#{campaign.zip_code}"
    end
  end
end
