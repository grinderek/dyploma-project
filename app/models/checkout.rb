# frozen_string_literal: true

class Checkout < ApplicationRecord
  has_one :cart, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, 'valid_email_2/email': true
  validates :address, presence: true, length: { minimum: 20 }
end
