require 'rails_helper'

feature 'User login' do
  background do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'testing!'
    click_button 'Log in'
  end

  context 'regular user' do
    let(:user) { create(:user) }

    scenario 'It redirects to the dashboard' do
      expect(current_path).to eq(dashboard_path)
    end
  end

  context 'admin user' do
    let(:user) { create(:admin_user) }

    scenario 'It redirects to the dashboard' do
      expect(current_path).to eq(admin_dashboard_path)
    end
  end
end
