MESSAGES = {}

MESSAGES[:campaign_draft] =  %w(The campaign is now in draft mode. Submit it for
review when you are ready to publish it.)

MESSAGES[:campaign_review] = %w(The campaign has been submitted for review. You
will be notified when it is published.)

MESSAGES[:campaign_update] = %w(The campaign has been updated!)

def msg(key)
  raise Exceptions::NoMessageError unless MESSAGES.has_key?(key)
  MESSAGES[key]
end
