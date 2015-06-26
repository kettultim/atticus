class CampaignExpirationMessage
  attr_reader :campaign

  def initialize(campaign)
    @campaign = campaign
  end

  def duration
    @duration ||= Duration.new(campaign.expires_at.to_time - Time.now)
  end

  def to_s
    return ended if duration.negative?
    return seconds if duration.total_minutes == 0
    return minutes if duration.total_hours == 0
    return hours if duration.total_days == 0
    days
  end

  private

  def ended
    "Ended on #{campaign.expires_at.strftime('%B %e, %Y')}"
  end

  def seconds
    'Ends in under a minute'
  end

  def minutes
    "Ends in #{duration.minutes} minutes and #{duration.seconds} seconds"
  end

  def hours
    "Ends in #{duration.total_hours} hours"
  end

  def days
    "Ends in #{duration.total_days} days"
  end
end
