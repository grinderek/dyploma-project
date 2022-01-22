# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, 'valid_email_2/email': true
  validates :address, presence: true, length: { minimum: 20 }
end
