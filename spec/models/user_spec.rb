require 'rails_helper'

describe User, type: :model do
  describe '#admin?' do
    specify { expect_it.to_not be_admin }

    context 'user has admin role' do
      subject { create(:user, role: :admin) }

      specify { expect_it.to be_admin }
    end
  end
end
