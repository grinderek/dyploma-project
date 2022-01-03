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
      expect(response).to have_http_status(302)
    end

    it 're-render new template when trying to save with invalid params' do
      post products_url, params: { product: { description: 'lorem' } }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /products/:id' do
    it 'renders a successful response' do
      subject.save
      get product_url(subject)
      expect(response).to be_successful
    end

    it 'show empty if description empty' do
      subject.description = nil
      subject.save
      get product_url(subject)
      expect(response.body).to include 'Empty'
    end

    it 'show placeholder if image not attached' do
      subject.save
      subject.image.purge
      get product_url(subject)
      expect(subject.image.attached?).to_not be_truthy
      expect(response.body).to include '/assets/placeholder'
    end

    it 'show image if attached' do
      subject.save
      get product_url(subject)
      expect(subject.image.attached?).to be_truthy
      expect(response.body).to include 'active_storage/blobs/redirect/'
    end
  end

  describe 'DELETE /products/:id' do
    before(:each) do
      @product = build(:product)
      @product2 = build(:product)
      @product.save
      @product2.save
      delete "/admin/products/#{@product.id}"
    end

    it 'should return status 302(Redirect to /admin)' do
      expect(response.status).to eq 302
    end

    it 'should delete the product' do
      expect(Product.all.size).to eq 1
      expect(Product.all.first).to eq @product2
    end
  end
end
