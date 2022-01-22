# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Order[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
    visit user_product_path(@product)
    find('#add_11').click
    @checkout = PromoCode.create(code: "halyava", percent: 10)
    visit new_order_path
  end

  scenario 'Show product when cart not empty' do
    expect(page).to have_selector('#product_11')
  end

  scenario 'Create checkout with valid params', :js do
    expect do
      find('#checkout_name').set(Faker::Name.first_name)
      find('#checkout_email').set(Faker::Internet.email)
      find('#submit_checkout').click
      expect(page).to have_selector('#product_1')
    end.to change { Order.count }.by(1)
  end

  scenario 'Show errors when create checkout with unvalid params', :js do
    find('#submit_checkout').click
    expect(page).to have_content('This field is required')
  end

  scenario 'Show error when promo code not exist', :js do
    find('#code').set("halva")
    find('#submit_promo_code').click
    expect(page).to have_content('Sorry your promo code is incorrect or not valid anymore.')
  end
end
