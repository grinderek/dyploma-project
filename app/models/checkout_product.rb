# frozen_string_literal: true

class CheckoutProduct < ApplicationRecord
  belongs_to :product
  belongs_to :checkout
end
