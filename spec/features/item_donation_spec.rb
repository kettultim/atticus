require 'rails_helper'

feature 'User donates an item' do
  let(:campaign) { create(:campaign, allow_product_donations: true) }
  let(:user) { create(:user) }

  background do
    login_as(user)
    visit campaign_path(campaign)
    click_link 'Donate Item'
    fill_in 'Name', with: 'The Elements of Style'
    click_button 'Donate This Item'
  end

  scenario 'the item is created' do
    item = campaign.items.last
    expect(item.user).to eq(user)
    expect(item.name).to eq('The Elements of Style')
  end

  scenario 'the user is redirected to the campaign' do
    expect(current_path).to eq(campaign_path(campaign))
  end

  scenario 'the item is displayed under the campaign' do
    expect(page).to have_content(Item.last.name)
  end

  scenario 'message' do
    expect(page).to have_content msg(:item_create)
  end
end
