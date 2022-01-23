# frozen_string_literal: true

class PromoCodesController < ApplicationController

  def new
    @promo_code = PromoCode.new
  end

  def create
    @promo_code = PromoCode.new(promo_code_params)
    if @promo_code.save
      flash[:notice] = 'Promo code was created successfully'
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

  def promo_code_params
    params.require(:promo_code).permit(:code, :percent)
  end
end
