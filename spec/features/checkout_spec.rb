# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Checkout[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
    visit user_product_path(@product)
    find('#add_11').click
    @checkout = PromoCode.create(code: 'halyava', percent: 10)
    visit new_order_path
  end

  scenario 'Show product when cart not empty' do
    expect(page).to have_selector('#product_11')
  end

  scenario 'Create order with valid params', :js do
    expect do
      find('#order_name').set(Faker::Name.first_name)
      find('#order_email').set(Faker::Internet.email)
      find('#submit_order').click
      expect(page).to have_content('Your order is accepted')
    end.to change { Order.count }.by(1)
  end

  scenario 'Show errors when create order without any params', :js do
    find('#submit_order').click
    expect(page).to have_content('This field is required')
  end

  scenario 'Show error when create order with name longer than 20', :js do
    find('#order_name').set('a' * 21)
    find('#submit_order').click
    expect(page).to have_content('Min characters for this field is 1. Max characters for this field is 20')
  end

  scenario 'Show error when create order with invalid email', :js do
    find('#order_email').set('asd')
    find('#submit_order').click
    expect(page).to have_content('Your email is in a not correct format')
    find('#order_email').set('asd@')
    find('#submit_order').click
    expect(page).to have_content('Your email is in a not correct format')
    find('#order_email').set('asd@gmail')
    find('#submit_order').click
    expect(page).to have_content('Your email is in a not correct format')
    find('#order_email').set('asd@gmail.')
    find('#submit_order').click
    expect(page).to have_content('Your email is in a not correct format')
  end

  scenario 'Show error when create order with invalid address', :js do
    find('#order_delivery_delivery_address').click
    find('#submit_order').click
    expect(page).to have_content('This field is required')
    find('#address_field').set('a')
    expect(page).to have_content('Min characters for this field is 20')
  end

  scenario 'Confirm promo code', :js do
    find('#code').set('halyava')
    find('#submit_promo_code').click
    expect(page).to_not have_selector('#submit_promo_code')
    expect(page).to have_content('(- 10 %)')
  end

  scenario 'Show error when promo code not exist', :js do
    find('#code').set('halva')
    find('#submit_promo_code').click
    expect(page).to have_content('Sorry your promo code is incorrect or not valid anymore.')
  end
end
