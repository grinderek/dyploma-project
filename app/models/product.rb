# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy

  validates :image, content_type: { in: %w[image/png image/jpg image/jpeg] }, size: { less_than: 100.megabytes }
  validates :name, presence: true, length: { minimum: 2, maximum: 500 }
  validates :code, presence: true, length: { minimum: 7, maximum: 7 }, format: { with: /\A[A-Za-z0-9]+\z/ }
  validates :price, presence: true, length: { minimum: 1, maximum: 7 }, numericality: true
  validates :description, length: { maximum: 5000 }
end
