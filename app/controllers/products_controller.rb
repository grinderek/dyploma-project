# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show destroy]
  before_action :pagination, only: %i[index]
  skip_forgery_protection

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
    @product.destroy
    redirect_to products_path, status: 303
  end

  private

  def product
    @product = ProductFinder.search(id: params[:id]).first
  end

  def pagination
    max_page = (Product.count / 10) + ((Product.count % 10).zero? ? 0 : 1)
    @products = if params[:page].nil? || params[:page].to_i <= max_page
      Product.paginate(page: params[:page], per_page: 10)
    else
      Product.paginate(page: max_page.to_s, per_page: 10)
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image)
  end
end
