class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def edit

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product was created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :code, :price)
  end

end
