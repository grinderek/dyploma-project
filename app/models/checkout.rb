# frozen_string_literal: true

class Checkout < ApplicationRecord
  has_one :cart, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/ }
  validates :address, presence: true, length: { minimum: 20 }
end
