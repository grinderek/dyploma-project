# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List of products', type: :feature do
  before(:each) do
    11.times do
      @product = build(:product)
      @product.save
    end
    Capybara.current_driver = :selenium_chrome
    visit products_path
  end

  after(:all) do
    Capybara.use_default_driver
  end

  scenario 'Delete button should be disabled when all products unchecked' do
    expect(page).to have_button('Delete Products', disabled: true)
  end

  scenario 'Delete button should be active when at least one product checked' do
    find(:css, '#check_1').set(true)
    expect(page).to have_button('Delete Products', disabled: false)
  end

  scenario 'Delete products when click on Delete Products button' do
    find(:css, '#check_1').set(true)
    expect do
      click_button 'Delete Products'
      click_button('Delete', exact: true)
      expect(page).to_not have_selector('#check_1')
    end.to change { Product.count }.by(-1)
  end

  scenario 'Select check_all checkbox and click Delete button' do
    find(:css, '#check_all').set(true)
    expect do
      click_button 'Delete Products'
      click_button('Delete', exact: true)
      expect(page).to have_selector('#check_11')
    end.to change { Product.count }.by(-10)
  end

  scenario 'Go to different page' do
    click_link('2', exact: true)
    expect(page).to have_selector('#check_11')
  end
end
