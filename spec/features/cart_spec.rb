# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show product[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    @product = Product.last
    visit user_product_path(@product)
    find('input[name="commit"]').click
    visit cart_path
  end

  scenario 'After add product show count of products' do
    expect do
      find('input[name="commit"]').click
    end.to change { current_cart.cart_items.first.quantity }.by(1)
  end
end