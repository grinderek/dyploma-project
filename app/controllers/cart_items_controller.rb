# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @cart_item = @cart.cart_items.new(cart_params)
    if @cart.save
      flash[:notice] = "The #{ProductFinder.search(id: @cart_item.product_id).first.name}
                        was successfully added to the carts"
      session[:cart_id] = @cart.id
      redirect_to session[:previous_page]
    else
      render 'products/index'
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update(cart_params)
      flash[:notice] = "The #{ProductFinder.search(id: @cart_item.product_id).first.name}
                        was successfully added to the carts"
      redirect_to session[:previous_page]
    else
      render 'products/index'
    end
  end

  private

  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def set_cart
    @cart = current_cart
  end
end
