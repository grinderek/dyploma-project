# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List of orders[Admin]', type: :feature do
  before(:each) do
    create_list(:order, 11)
    @order1 = Order.first
    @order2 = Order.second
    @order2.delivery_method = 'Self-pickup'
    @order2.save
    @order11 = Order.last
    visit admin_orders_path
  end

  scenario 'Data of order on page is correct' do
    expect(page).to have_content(@order1.email)
    expect(page).to have_content(@order1.customer_name)
    expect(page).to have_content(ActionController::Base.helpers.number_to_currency(@order1.total))
    expect(page).to have_content(@order1.delivery_method)
    expect(page).to have_content(@order1.delivery_address)
  end

  scenario 'If delivery method is self-pickup do not show delivery address' do
    expect(page).to_not have_selector('#delivery_address_2')
  end

  scenario 'If delivery method is delivery address show delivery address' do
    expect(page).to have_selector('#delivery_address_1')
  end

  scenario 'Go to different page' do
    click_link('2', exact: true)
    expect(page).to_not have_selector('#order_1')
    expect(page).to have_selector('#order_11')
  end

  scenario 'If go to page that not exist render last page' do
    visit '/admin/orders?page=3'
    expect(page).to_not have_selector('#order_1')
    expect(page).to have_selector('#order_11')
  end
end
