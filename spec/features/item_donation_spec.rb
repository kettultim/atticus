require 'rails_helper'

feature 'User donates an item' do
  let(:campaign) { create(:campaign, allow_product_donations: true) }
  let(:user) { create(:user) }
  let(:item) { campaign.items.last }

  background do
    login_as(user)
    visit campaign_path(campaign)
    click_link 'Donate Item'
    fill_in 'Name', with: 'The Elements of Style'
    fill_in 'Description', with: 'blah'
    fill_in 'Minimum price', with: '42'
    fill_in 'Shipping fee', with: '5'
    fill_in 'Payment email', with: 'joe@smith.com'
    check 'item_disclaimer'
    click_button 'Donate This Item'
  end

  specify { expect(item.user).to eq(user) }
  specify { expect(item.name).to eq('The Elements of Style') }
  specify { expect(item.description).to eq('blah') }
  specify { expect(item.minimum_price).to eq(42) }
  specify { expect(item.shipping_fee).to eq(5) }
  specify { expect(item.payment_email).to eq('joe@smith.com') }

  specify { expect(current_path).to eq(campaign_path(campaign)) }
  specify { expect(page).to have_content(Item.last.name) }
  specify { expect(page).to have_content msg(:item_create) }
end
