# frozen_string_literal: true

class PromoCodesController < ApplicationController

  def new
    @promo_code = PromoCode.new
  end
end
