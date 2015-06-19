require 'rails_helper'

describe User, type: :model do
  describe '#admin?' do
    specify { expect(subject.admin?).to eq(false) }

    context 'user has admin role' do
      let(:user) { create(:user, role: :admin) }

      specify { expect(user.admin?).to eq(true) }
    end
  end
end
