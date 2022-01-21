# frozen_string_literal: true

class PromoCode < ApplicationRecord

  validates :code, presence: true, uniqueness: true
  validates :percent, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 100,
  }

end
