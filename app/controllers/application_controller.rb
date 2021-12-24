# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :check_if_admin?

  private

  def check_if_admin?
    url = request.path_info
    if url.include?('/admin')
      true
    else
      false
    end
  end
end
