module ApplicationHelper
  def money(dollars)
    Money.new(dollars * 100, 'USD').to_s
  end
end
