require 'rails_helper'

feature 'Visiting the homepage' do
  background do
    visit root_path
  end

  specify { expect(page).to have_content('Welcome to Atticus!') }
end
