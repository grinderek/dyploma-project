# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show product[User]', type: :feature do
  before(:each) do
    build_list(:product, 11, &:save)
    @product = Product.last
    visit user_product_path(@product)
    find('input[name="commit"]').click
    visit cart_path
  end

  scenario 'After add product show count of products' do
    expect(page).to have_selector('#count_of_products')
  end
end