require 'rails_helper'

describe CampaignMailer do
  let(:campaign) { create(:campaign) }

  describe "#approval_notice" do
    before do
      CampaignMailer.approval_notice(campaign.id).deliver_now
    end

    it "emails the creator of the campaign" do
      expect(last_email.to).to include(campaign.user_email)
    end

    it "includes the campaign title in the subject" do
      expect(last_email.subject).to include(campaign.title)
    end

    it "includes a link to the campaign" do
      expect(last_email.body).to have_content(campaign_url(campaign))
    end
  end

    describe "#rejection_notice" do
    before do
      CampaignMailer.rejection_notice(campaign.id, "notes").deliver_now
    end

    it "emails the creator of the campaign" do
      expect(last_email.to).to include(campaign.user_email)
    end

    it "includes the campaign title in the subject" do
      expect(last_email.subject).to include(campaign.title)
    end

    it "includes a link to edit the campaign" do
      expect(last_email.body).to have_content(edit_campaign_url(campaign))
    end

    it "includes the notes" do
      expect(last_email.body).to have_content("notes")
    end
  end
end
