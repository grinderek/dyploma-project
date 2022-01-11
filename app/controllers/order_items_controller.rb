# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    if @order.save
      flash[:notice] = "The #{ProductFinder.search(id: @order_item.product_id).first.name}
                        was successfully added to the cart"
      session[:order_id] = @order.id
      redirect_to session[:previous_page]
    else
      render 'products/index'
    end
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update(order_params)
      flash[:notice] = "The #{ProductFinder.search(id: @order_item.product_id).first.name}
                        was successfully added to the cart"
      redirect_to session[:previous_page]
    else
      render 'products/index'
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
