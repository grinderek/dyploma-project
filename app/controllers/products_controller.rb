# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show]
  before_action :pagination, only: %i[admin_index index]
  skip_forgery_protection

  MAX_PAGE = (Product.count / 10.0).ceil

  def add_to_cart
    id = params[:id].to_i
    cart_item = CartItem.new(id, 1)
    product = ProductFinder.search(id: id).first
    if current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:notice] = "The #{product.name} already in the cart"
    else
      current_cart.items << cart_item unless current_cart.items.any? { |item| item.product_id == cart_item.product_id }
      flash[:notice] = "The #{product.name} was successfully added to the cart"
    end
    redirect_to user_product_index_path
  end

  def admin_index
    render 'products/index'
  end

  def index; end

  def new
    @product = Product.new
  end

  def edit; end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was created successfully'
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product was updated successfully'
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @products = ProductFinder.search(id: params[:id])
    @products.destroy_all
    redirect_to products_path, status: 303
  end

  private

  def product
    @product = ProductFinder.search(id: params[:id]).first
  end

  def pagination
    @products = if params[:page].nil? || params[:page].to_i <= MAX_PAGE
      Product.paginate(page: params[:page], per_page: 10)
    else
      Product.paginate(page: MAX_PAGE.to_s, per_page: 10)
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image)
  end
end
