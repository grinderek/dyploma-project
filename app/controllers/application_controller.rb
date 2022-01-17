# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :initialize_session

  private

  def previous_page
    session[:previous_page] = request.original_url.to_s
  end

  def initialize_session
    session[:cart] = Cart.new(session[:cart])
  end
end
