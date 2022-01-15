# frozen_string_literal: true

class Cart < ApplicationRecord
  has_one :cart, dependent: :destroy
end
