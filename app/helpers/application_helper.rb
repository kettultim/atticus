module ApplicationHelper
  def money(dollars)
    Money.new(dollars * 100, 'USD').to_s
  end

  def expiration_message(object)
    ExpirationMessage.new(object.expires_at).to_s
  end

  def location(object)
    if object.city && object.state
      "#{object.city}, #{object.state}"
    else
      "#{object.zip_code}"
    end
  end

  def shipping_fee(object, method = :shipping_fee)
    if object.send(method) > 0
      money(object.send(method))
    else
      'FREE SHIPPING'
    end
  end
end
