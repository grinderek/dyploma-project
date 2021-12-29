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
    it 'create product successfully with valid params' do
      expect do
        post products_url, params: { product: attributes_for(:product) }
      end.to(change { Product.count })
    end

    it 're-render new template when something went wrong' do
      post products_url, params: { product: { description: 'lorem' } }

      expect(response).to render_template(:new)
    end
  end
end
