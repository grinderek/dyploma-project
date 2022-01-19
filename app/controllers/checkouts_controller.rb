# frozen_string_literal: true

class CheckoutsController < ApplicationController

  def new
    cart_items
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      flash[:notice] = 'Your order is accepted'
      redirect_to user_product_index_path
    else
      cart_items
      render 'new'
    end
  end

  private

  def cart_items
    @cart_items = PageCart.new(session[:cart])
  end

  def checkout_params
    params.require(:checkout).permit(:name, :email, :delivery, :cart_id, :address)
  end
end
