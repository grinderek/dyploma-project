# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  subject do
    build(:product)
  end

  describe 'POST /products' do
    it 'create product successfully with valid params' do
      expect do
        post products_url, params: { product: attributes_for(:product) }
      end.to(change { Product.count })
    end

    it 're-render new template when trying to save with invalid params' do
      post products_url, params: { product: { description: 'lorem' } }

      expect(response).to render_template(:new)
    end
  end
end
