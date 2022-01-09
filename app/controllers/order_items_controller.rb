# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    if @order.save
      flash[:notice] = 'Product was created successfully'
      session[:order_id] = @order.id
      redirect_to user_product_index_path
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
