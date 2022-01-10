# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List of products[User]', type: :feature do
  before(:each) do
    11.times do
      @product = build(:product)
      @product.save
    end
    visit user_product_index_path
  end

  scenario 'Number of products should be hide when equal to 0' do
    expect(page).to_not have_selector('#count_of_products')
  end

  scenario 'After add product show count of products' do
    find('#add_1').click
    expect(page).to have_selector('#count_of_products')
  end

  scenario 'Go to different page' do
    click_link('2', exact: true)
    expect(page).to have_selector('#product_11')
  end
end
