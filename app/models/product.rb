# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :image, content_type: {
    in: %w[image/png image/jpg image/jpeg],
    message: 'This format is not allowed. Allowed formats are jpg, jpeg, png',
  },
                    size: {
                      less_than: 100.megabytes,
                      message: 'File size is too big. Max allowed size is 100 Mb.',
                    }

  validates_presence_of :name, message: 'This field is required'
  validates_length_of :name, minimum: 2, maximum: 500, message: 'Min characters for this field is 2. Max characters for this field is 500'

  validates_presence_of :code, message: 'This field is required'
  validates_length_of :code, minimum: 7, maximum: 7, message: 'Min characters for this field is 7. Max characters for this field is 7'
  validates_format_of :code, with: /\A[A-Za-z0-9]+\z/, message: 'Only alphanumeric characters are allowed'

  validates_presence_of :price, message: 'This field is required'
  validates_numericality_of :price, message: 'Only numbers are allowed'
  validates_length_of :price, minimum: 1, maximum: 7, message: 'Min characters for this field is 1. Max characters for this field is 7'

  validates_length_of :description, maximum: 5000, message: 'Min characters for this field is 1. Max characters for this field is 5000'
end
