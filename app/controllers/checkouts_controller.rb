# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :cart_items, only: %i[new create]

  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      flash[:notice] = 'Your order is accepted'
      AddProductsToOrder.new(current_cart, @checkout.id).add
      session[:cart] = nil
      redirect_to user_product_index_path
    else
      render 'new'
    end
  end

  def discount
    @promo_code = PromoCodeFinder.search(code: params[:code])
    current_cart.discount = @promo_code.first.percent if @promo_code != []
    cart_items
    respond_to do |format|
      format.js
    end
  end

  private

  def cart_items
    @cart_items = PageCart.new(session[:cart])
  end

  def checkout_params
    params.require(:checkout).permit(:name, :email, :delivery, :address, :total)
  end
end
