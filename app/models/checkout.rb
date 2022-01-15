# frozen_string_literal: true

class Checkout < ApplicationRecord
  has_one :cart, dependent: :destroy
end
