# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :previous_page

  def show
    @cart_items = current_cart.cart_items
  end

end
