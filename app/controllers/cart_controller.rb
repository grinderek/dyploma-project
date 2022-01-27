# frozen_string_literal: true

class CartController < ApplicationController
  def add_to_cart
    id = params[:id].to_i
    cart_item = SessionCartItem.new(id, 1)
    product = ProductFinder.search(id: id).first
    if current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash.now[:warning] = "The #{product.name} is already in the cart"
    else
      current_cart.items.push(cart_item)
      flash.now[:notice] = "The #{product.name} was successfully added to the cart"
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @id = params[:id].to_i
    current_cart.items = current_cart.items.map do |item|
      item.quantity = params[:quantity].to_i if item.product_id == @id
      item
    end
    @item = current_cart.items.find { |item| item.product_id == @id }
    respond_to do |format|
      format.js
    end
  end

  def remove_from_cart
    @id = params[:id].to_i
    current_cart.items = current_cart.items.reject { |item| item.product_id == @id }
    respond_to do |format|
      format.js
    end
  end

  def show
    @cart = current_cart
  end
end
