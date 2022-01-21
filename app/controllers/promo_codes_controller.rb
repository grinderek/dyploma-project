# frozen_string_literal: true

class PromoCodesController < ApplicationController

  def new
    @promocode = PromoCode.new
  end
end
