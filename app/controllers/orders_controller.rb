# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :pagination, only: [:index]

  PER_PAGE = 10

  def index; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(checkout_params)
    if @order.save
      flash[:notice] = 'Your order is accepted'
      AddProductsToOrderService.new(current_cart, @order.id).add
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

  def pagination
    max_page = (Order.count / PER_PAGE.to_f).ceil
    @orders = if params[:page].nil? || params[:page].to_i <= max_page
      Order.paginate(page: params[:page], per_page: PER_PAGE)
    else
      Order.paginate(page: max_page.to_s, per_page: PER_PAGE)
    end
  end

  def checkout_params
    params.require(:order).permit(:customer_name, :email, :delivery_method, :delivery_address, :total)
  end
end
