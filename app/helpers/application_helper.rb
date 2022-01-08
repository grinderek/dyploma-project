# frozen_string_literal: true

module ApplicationHelper
  def check_if_admin?
    url = request.path_info
    url.include?('/admin')
  end

  def current_order
    if Order.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end
end
