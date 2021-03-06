# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :initialize_session

  private

  def initialize_session
    session[:cart] = SessionCart.new(session[:cart])
  end
end
