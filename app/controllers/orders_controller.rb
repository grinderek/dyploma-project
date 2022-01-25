# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(checkout_params)
    if @order.save
      flash[:notice] = 'Your order is accepted'
      AddProductsToOrder.new(current_cart, @order.id).add
      session[:cart] = nil
      redirect_to user_product_index_path
    else
      render 'new'
    end
  end

  def discount
    @promo_code = PromoCodeFinder.search(code: params[:code])
    current_cart.discount = @promo_code.first.percent if @promo_code != []
    respond_to do |format|
      format.js
    end
  end

  private

  def checkout_params
    params.require(:order).permit(:customer_name, :email, :delivery_method, :delivery_address, :total)
  end
end
