MESSAGES = {}

MESSAGES[:campaign_draft] =  %{The campaign is now in draft mode. Submit it for
review when you are ready to get it approved.}

MESSAGES[:campaign_update] = 'The campaign has been updated!'

MESSAGES[:campaign_review] = %{The campaign has been submitted for review. You
will be notified when it is approved.}

MESSAGES[:campaign_published] = %{The campaign has been published!}

MESSAGES[:item_create] = 'Thanks! Your item has been donated.'

MESSAGES[:general_error] = 'An error has occurred!'

MESSAGES[:unauthorized] = 'Oops! You can\'t be here!'

def msg(key)
  raise Exceptions::NoMessageError unless MESSAGES.has_key?(key)
  MESSAGES[key]
end
