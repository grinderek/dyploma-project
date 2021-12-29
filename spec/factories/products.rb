# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Cucumber' }
    price { 500 }
    code { 'asd12sx' }
    description { 'Great' }

    after(:build) do |product|
      product.image.attach(
        io: File.open(Rails.root.join('spec', 'fixture_files', 'circleci.png')),
        filename: 'circleci.png',
        content_type: 'image/png',
      )
    end
  end
end
