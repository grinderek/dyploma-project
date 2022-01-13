# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show]
  before_action :pagination, only: %i[admin_index index]
  before_action :cart_item, only: %i[index show]
  before_action :previous_page, only: %i[index show]
  skip_forgery_protection

  MAX_PAGE = (Product.count / 10.0).ceil

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

  def cart_item
    @cart_item = current_cart.cart_items.new
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
