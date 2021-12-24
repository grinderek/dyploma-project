# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :request do
  it 'renders the index template successfully if you user' do
    get '/'
    expect(response.body).to include 'This is User page!'
    expect(response).to have_http_status(200)
  end

  it 'renders the index template successfully if you admin' do
    get '/admin'
    expect(response.body).to include 'This is Admin page!'
    expect(response).to have_http_status(200)
  end
end
