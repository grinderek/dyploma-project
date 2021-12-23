# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminController, type: :request do
  it 'renders the index template successfully' do
    get '/admin'
    expect(response.body).to include 'This is Admin page!'
    expect(response).to have_http_status(200)
  end
end
