# frozen_string_literal: true

module ApplicationHelper
  def check_if_admin?
    url = request.path_info
    url.include?('/admin')
  end

  def current_cart
    if Cart.find_by_id(session[:cart_id]).nil?
      Cart.new
    else
      Cart.find_by_id(session[:cart_id])
    end
  end
end
