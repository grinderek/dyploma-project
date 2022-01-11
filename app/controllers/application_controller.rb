# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def previous_page
    session[:previous_page] = request.original_url.to_s
  end
end
