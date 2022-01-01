# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show]

  def new
    @product = Product.new
  end

  def edit; end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was created successfully'
      redirect_to '/admin'
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product was updated successfully'
      redirect_to '/admin'
    else
      @product.image.purge if @product.image.id.nil?
      render 'edit'
    end
  end

  private

  def product
    @product = ProductFinder.search(id: params[:id]).first
  end

  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image)
  end
end
