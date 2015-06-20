class CampaignMailer < ApplicationMailer
  def approval_notice(campaign_id)
    @campaign = Campaign.find(campaign_id)
    @url = campaign_url(@campaign)

    subject = "Your campaign #{@campaign.title} has been approved!"

    mail to: @campaign.user_email, subject: subject
  end

  def rejection_notice(campaign_id, notes)
    @campaign = Campaign.find(campaign_id)
    @url = edit_campaign_url(@campaign)
    @notes = notes

    subject = "Your campaign #{@campaign.title} was not approved"

    mail to: @campaign.user_email, subject: subject
  end
end
