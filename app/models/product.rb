class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2, maximum: 500 }
  validates :image, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..(100.megabytes) }
  validates :code, presence: true, length: { minimum: 7, maximum: 7 }, format: { with: /\A[A-Za-z0-9]+\z/, message: "Only alphanumeric characters are allowed" }
  validates :price, presence: true, numericality: { in: 1..9999999 }
  validates :description, length: { maximum: 5000 }
end
