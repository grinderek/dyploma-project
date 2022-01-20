# frozen_string_literal: true

class CartController < ApplicationController

  def add_to_cart
    id = params[:id].to_i
    cart_item = SessionCartItem.new(id, 1)
    product = ProductFinder.search(id: id).first
    if current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:warning] = "The #{product.name} is already in the cart"
    else
      current_cart.items << cart_item unless current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:notice] = "The #{product.name} was successfully added to the cart"
    end
    redirect_to user_product_index_path
  end

  def update_cart
    id = params[:id].to_i
    session[:cart].items.map! do |item|
      item.quantity = item.quantity + 1 if item.product_id == id
      item
    end
    redirect_to cart_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].items.reject! { |item| item.product_id == id }
    redirect_to cart_path
  end

  def show
    @cart_items = PageCart.new(session[:cart])
  end

end
