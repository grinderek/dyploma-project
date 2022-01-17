# frozen_string_literal: true

class CheckoutsController < ApplicationController
  
  def new
    @cart_items = PageCart.new(session[:cart])
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      flash[:notice] = 'Your order is accepted'
      redirect_to user_product_index_path
    else
      render 'new'
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:name, :email, :delivery, :cart_id, :address)
  end
end
