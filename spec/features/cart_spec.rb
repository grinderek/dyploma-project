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

  scenario 'Increase product count' do
    find('input[name="commit"]').click
    expect(page).to have_selector('#count_11', text: '2')
  end
end
