# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    delivery_method { 'Delivery address' }
    delivery_address { Faker::Address.full_address }
    total { 0 }
    discount { Faker::Number.between(from: 1, to: 100) }

    after(:create) do |order|
      FactoryBot.create_list(:product, 2).each do |product|
        OrderProduct.create(product_id: product.id, order_id: order.id, quantity: Faker::Number.between(from: 1, to: 5))
        order.total += product.price *
          OrderProductFinder.search(order.id, product.id).first.quantity
        order.save
      end
    end
  end
end
