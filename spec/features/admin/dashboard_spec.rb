require 'rails_helper'

feature 'Admin dashboard' do
  context 'regular user' do
    let(:user) { create(:user) }

    background do
      login_as user
      visit admin_dashboard_path
    end

    scenario 'It redirects to the homepage' do
      expect(current_path).to eq(root_path)
    end

    scenario 'It displays an error' do
      expect(page).to have_content(msg(:unauthorized))
    end
  end
end
