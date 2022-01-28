# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Show order[User]', type: :feature do
  before(:each) do
    create_list(:order, 2)
    @order = Order.last
    visit admin_order_path(@order)
  end

  scenario 'Show information about order' do
    expect(page).to have_content(@order.id)
    expect(page).to have_content(ActionController::Base.helpers.number_to_currency(@order.total))
    expect(page).to have_content(@order.customer_name)
    expect(page).to have_content(@order.email)
    expect(page).to have_content(@order.delivery_method)
    expect(page).to have_content(@order.delivery_address)
  end

  scenario 'If delivery method is self-pickup do not show delivery address' do
    @order.delivery_method = 'Self-pickup'
    @order.save
    visit admin_order_path(@order)
    expect(page).to_not have_selector('#delivery_address_2')
  end

  scenario 'Show all products of cart' do
    @order.products.each { |product| expect(page).to have_selector("#product_#{product.id}") }
  end

  scenario 'Show discount if not zero' do
    expect(page).to have_selector('#discount_2')
  end

  scenario 'Do not show discount if zero' do
    @order.discount = 0
    @order.save
    visit admin_order_path(@order)
    expect(page).to_not have_selector('#discount_2')
  end
end
