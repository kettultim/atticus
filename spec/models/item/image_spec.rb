require 'rails_helper'

describe Item::Image do
  describe '#url' do
    subject { create(:item_image) }
    specify {
      expect(subject.url).to eq(subject.attachment.url)
    }
  end
end
