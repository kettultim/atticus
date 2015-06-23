require 'rails_helper'

feature 'Visiting the admin dashboard' do
  context 'as a regular user' do
    let(:user) { create(:user) }

    background do
      login_as user
      visit admin_dashboard_path
    end

    scenario 'redirects to the homepage' do
      expect(current_path).to eq(root_path)
    end

    scenario 'displays an error' do
      expect(page).to have_content(msg(:unauthorized))
    end
  end
end
