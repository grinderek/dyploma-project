# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show product[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
  end

  scenario 'Visit empty cart' do
    visit cart_path
    expect(page).to have_content('The cart is empty')
  end

  scenario 'Show product when cart not empty' do
    visit user_product_path(@product)
    find('input[name="commit"]').click
    visit cart_path
    expect(page).to have_selector('#product_11')
  end

  scenario 'Increase product count' do
    visit user_product_path(@product)
    find('input[name="commit"]').click
    visit cart_path
    find('input[name="commit"]').click
    expect(page).to have_selector('#count_11', text: '2')
  end
end
