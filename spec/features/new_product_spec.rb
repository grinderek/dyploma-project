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

  scenario 'Show errors when create product without any params', :js do
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

  scenario 'Show error when create product with code shorter or longer than 7', :js do
    find('#code_field').set('a' * 6)
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 7. Max characters for this field is 7')
    find('#code_field').set('a' * 8)
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 7. Max characters for this field is 7')
  end

  scenario 'Show error when create product with not alphanumeric code', :js do
    find('#code_field').set('aaaaaa.')
    find('#submit_button').click
    expect(page).to have_content('Only alphanumeric characters are allowed')
  end

  scenario 'Show error when create product with price longer than 7', :js do
    find('#price_field').set('1' * 8)
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 1. Max characters for this field is 7')
  end

  scenario 'Show error when create product with description longer than 5000', :js do
    find('#description_field').set('a' * 5001)
    find('#submit_button').click
    expect(page).to have_content('Min characters for this field is 1. Max characters for this field is 5000')
  end

  scenario 'Show error when create product with not image file', :js do
    page.attach_file("#{Rails.root}/spec/fixture_files/sample.pdf") do
      page.find('#file_field').click
    end
    find('#submit_button').click
    expect(page).to have_content('This format is not allowed. Allowed formats are jpg, jpeg, png')
  end

  scenario 'After submit form with errors image still stay in form', :js do
    find('#product_name_field').set('a')
    find('#submit_button').click
    expect(page).to have_selector('#preview_image')
  end
end
