# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Cart[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
  end

  scenario 'Visit empty cart' do
    visit cart_path
    expect(page).to have_content('The cart is empty')
  end

  scenario 'Show product when cart not empty', :js do
    visit user_product_path(@product)
    find('#add_11').click
    expect(page).to have_content("The #{@product.name} was successfully added to the cart")
    visit cart_path
    expect(page).to have_selector('#product_11')
  end

  scenario 'Increase product count', :js do
    visit user_product_path(@product)
    find('#add_11').click
    expect(page).to have_content("The #{@product.name} was successfully added to the cart")
    visit cart_path
    find('#add_11').click
    expect(page).to have_field('quantity', with: '2')
  end

  scenario 'Remove product from cart', :js do
    visit user_product_path(@product)
    find('#add_11').click
    expect(page).to have_content("The #{@product.name} was successfully added to the cart")
    visit cart_path
    find('#delete-products').click
    expect(page).to have_content('The cart is empty')
  end
end
