# frozen_string_literal: true

class CartController < ApplicationController
  before_action :cart_items, only: [:show]

  def add_to_cart
    id = params[:id].to_i
    cart_item = SessionCartItem.new(id, 1)
    product = ProductFinder.search(id: id).first
    if current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:warning] = "The #{product.name} is already in the cart"
    else
      current_cart.items.push(cart_item) unless current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:notice] = "The #{product.name} was successfully added to the cart"
    end
    redirect_to user_product_index_path
  end

  def update
    @id = params[:id].to_i
    session[:cart].items.map! do |item|
      item.quantity = params[:quantity].to_i if item.product_id == @id
      item
    end
    cart_items
    @item = @cart_items.items.find { |item| item.product.id == @id }
    respond_to do |format|
      format.js
    end
  end

  def remove_from_cart
    @id = params[:id].to_i
    session[:cart].items.reject! { |item| item.product_id == @id }
    cart_items
    respond_to do |format|
      format.js
    end
  end

  def show; end

  private

  def cart_items
    @cart_items = PageCart.new(session[:cart])
  end
end
