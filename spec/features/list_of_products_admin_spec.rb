# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List of products[Admin]', type: :feature do
  before(:each) do
    create_list(:product, 11)
    visit products_path
  end

  scenario 'Delete button should be disabled when all products unchecked' do
    expect(page).to have_button('Delete Products', disabled: true)
  end

  scenario 'Delete button should be active when at least one product checked', :js do
    find(:css, '#check_1').set(true)
    expect(page).to have_button('Delete Products', disabled: false)
  end

  scenario 'Delete products when click on Delete Products button', :js do
    find(:css, '#check_1').set(true)
    expect do
      click_button 'Delete Products'
      click_button('Delete', exact: true)
      expect(page).to_not have_selector('#check_1')
      expect(page).to have_selector('#check_11')
    end.to change { Product.count }.by(-1)
  end

  scenario 'Select check_all checkbox and click Delete button', :js do
    find(:css, '#check_all').set(true)
    expect do
      click_button 'Delete Products'
      click_button('Delete', exact: true)
      expect(page).to have_selector('#check_11')
    end.to change { Product.count }.by(-10)
  end

  scenario 'Go to different page' do
    click_link('2', exact: true)
    expect(page).to_not have_selector('#order_1')
    expect(page).to have_selector('#check_11')
  end

  scenario 'If go to page that not exist render last page' do
    visit '/admin/products?page=3'
    expect(page).to_not have_selector('#product_1')
    expect(page).to have_selector('#product_11')
  end
end
