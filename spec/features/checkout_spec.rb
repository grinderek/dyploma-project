# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Checkout[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
    visit user_product_path(@product)
    find('#add_11').click
    visit new_checkout_path
  end

  scenario 'Show product when cart not empty' do
    expect(page).to have_selector('#product_11')
  end

  scenario 'Increase product count', :js do
    visit user_product_path(@product)
    find('#add_11').click
    visit cart_path
    find('#add_11').click
    expect(page).to have_field('quantity', with: '2')
  end
end
