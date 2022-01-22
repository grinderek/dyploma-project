# frozen_string_literal: true

class PromoCodeFinder < BaseFinder
  model PromoCode

  def search(code = nil)
    promo_codes = from_code(code) if code
    promo_codes
  end

  def from_code(code)
    scope.where(code)
  end
end
