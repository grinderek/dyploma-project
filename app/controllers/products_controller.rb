# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show destroy]
  skip_forgery_protection

  def admin_index
    @products = Product.paginate(page: params[:page], per_page: 10)
    render 'products/index'
  end

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

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
    @product.destroy
    redirect_to products_path, status: 303
  end

  private

  def product
    @product = ProductFinder.search(id: params[:id]).first
  end

  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image)
  end
end
