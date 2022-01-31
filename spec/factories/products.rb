# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Hipster.word }
    price { Faker::Number.between(from: 1, to: 9_999_999) }
    code { Faker::Alphanumeric.alphanumeric(number: 7) }
    description { Faker::Lorem.paragraph }
    deleted { false }

    after(:build) do |product|
      product.image.attach(
        io: Down.download(Faker::LoremFlickr.image),
        filename: Faker::File.file_name(ext: 'jpg'),
      )
    end
  end
end
