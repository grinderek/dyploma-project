# frozen_string_literal: true

module ApplicationHelper
  def check_if_admin?
    url = request.path_info
    url.include?('/admin')
  end

  def current_cart
    session[:cart]
  end
end
