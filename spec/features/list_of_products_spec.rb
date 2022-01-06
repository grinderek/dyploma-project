require 'rails_helper'

RSpec.feature "List of products", type: :feature do
  before(:each) do
    10.times do
      @product = build(:product)
      @product.save
    end
    @product = build(:product)
    @product.save
    visit products_path
  end

  scenario "Delete button should be disabled when all products unchecked" do
    expect(page).to have_button('Delete Products', disabled: true)
  end

  scenario "Delete button should be active when at least one product checked" do
    find(:css, "#check_1").set(true)
    expect(page).to have_button('Delete Products', disabled: false)
  end
end