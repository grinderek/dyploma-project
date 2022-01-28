# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List of products[User]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    visit user_product_index_path
  end

  scenario 'Number of products should be hide when equal to 0', :js do
    expect(page).to_not have_selector('#count_of_products')
  end

  scenario 'After add product show count of products', :js do
    find('#add_1').click
    expect(page).to have_content("The #{Product.first.name} was successfully added to the cart")
    find('.navbar-toggler').click
    expect(page).to have_selector('#count_of_products')
  end

  scenario 'After trying to add same product show error', :js do
    find('#add_1').click
    find('#add_1').click
    expect(page).to have_content("The #{Product.first.name} is already in the cart")
  end

  scenario 'Go to different page' do
    click_link('2', exact: true)
    expect(page).to_not have_selector('#product_1')
    expect(page).to have_selector('#product_11')
  end

  scenario 'If go to page that not exist render last page' do
    visit '/products?page=3'
    expect(page).to_not have_selector('#product_1')
    expect(page).to have_selector('#product_11')
  end
end
