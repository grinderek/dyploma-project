# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'New product[Admin]', type: :feature do
  before(:each) do
    visit new_product_path
    find('#product_name_field').set(Faker::Hipster.word)
    find('#code_field').set(Faker::Alphanumeric.alphanumeric(number: 7))
    find('#price_field').set(Faker::Number.between(from: 1, to: 9_999_999))
    find('#description_field').set(Faker::Lorem.paragraph)
    page.attach_file("#{Rails.root}/spec/fixture_files/circleci.png") do
      page.find('#file_field').click
    end
  end

  scenario 'Create product with valid params', :js do
    expect do
      find('#submit_button').click
      expect(page).to have_content('Product was created successfully')
    end.to change { Product.count }.by(1)
  end

  scenario 'Show errors when create order without any params', :js do
    visit new_product_path
    find('#submit_button').click
    expect(page).to have_content('This field is required')
  end

  scenario 'Show error when create product with name shorter than 2 or longer than 500', :js do
    find('#product_name_field').set('a')
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 2. Max characters for this field is 500')
    find('#product_name_field').set('a' * 501)
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 2. Max characters for this field is 500')
  end
end
