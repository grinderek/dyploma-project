# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    delivery_method { 'Delivery address' }
    delivery_address { Faker::Address.full_address }
    discount { Faker::Number.between(from: 1, to: 100) }

    after(:create) do |order|
      count_of_products = Faker::Number.between(from: 1, to: 5)
      FactoryBot.create_list(:product, count_of_products).each do |product|
        OrderProduct.create(
          product_id: product.id,
          order_id: order.id,
          quantity: Faker::Number.between(from: 1, to: 5),
          item_price: product.price,
        )
      end
    end
  end
end
