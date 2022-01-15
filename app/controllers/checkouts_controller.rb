# frozen_string_literal: true

class CheckoutsController < ApplicationController

  def new
    @checkout = Checkout.new
  end
end
