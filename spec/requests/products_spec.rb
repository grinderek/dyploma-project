# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  subject do
    build(:product)
  end

  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe 'POST /products' do
    it 'create product successfully' do
      expect {
        post products_url, params: {product: attributes_for(:product)}
      }.to change { Product.count }
    end
  end
end
