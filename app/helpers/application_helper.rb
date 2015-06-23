module ApplicationHelper
  def campaign_expiration_message(expiration_timestamp)
    if expiration_timestamp.to_time > Time.now
      "Ends in #{(expiration_timestamp.to_date - Date.today).to_i} days"
    else
      "Ended on #{expiration_timestamp}"
    end
  end

  def money(dollars)
    Money.new(dollars * 100, 'USD').to_s
  end
end
