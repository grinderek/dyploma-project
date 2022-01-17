# frozen_string_literal: true

class CartsController < ApplicationController

  def show
    @cart_items = PageCart.new(session[:cart])
  end

end
