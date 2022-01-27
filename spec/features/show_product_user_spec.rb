# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show product[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
    visit user_product_path(@product)
  end

  scenario 'Number of products should be hide when equal to 0' do
    expect(page).to_not have_selector('#count_of_products')
  end

  scenario 'After add product show count of products', :js do
    find('#add_11').click
    expect(page).to have_content("The #{@product.name} was successfully added to the cart")
    find('.navbar-toggler').click
    expect(page).to have_selector('#count_of_products')
  end
end
