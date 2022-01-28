# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[edit update show]
  before_action :pagination, only: %i[admin_index index]
  skip_forgery_protection

  PER_PAGE = 10

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
      @product.delete_image_if_necessary(params[:product][:delete_image_flag])
      flash[:notice] = 'Product was updated successfully'
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @products = ProductFinder.search({ deleted: false }, { id: params[:id] })
    @products.update_all(deleted: true)
    redirect_to products_path, status: 303
  end

  def undelete
    @product = ProductFinder.search({ deleted: true }, { id: params[:product_id] }).first
    @product.update(deleted: false)
    flash[:notice] = "The #{@product.name} no longer marked as deleted"
    redirect_to products_path
  end

  private

  def product
    @product = ProductFinder.search(check_if_admin? ? nil : { deleted: false }, { id: params[:id] }).first
  end

  def pagination
    all_products = check_if_admin? ? Product.all : ProductFinder.search({ deleted: false })
    max_page = (all_products.count / PER_PAGE.to_f).ceil
    @products = if params[:page].nil? || params[:page].to_i <= max_page
      all_products.paginate(page: params[:page], per_page: PER_PAGE)
    else
      all_products.paginate(page: max_page.to_s, per_page: PER_PAGE)
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image, :deleted)
  end
end
