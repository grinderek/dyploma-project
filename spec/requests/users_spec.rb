# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'renders the index template successfully' do
    get '/'
    expect(response.body).to include 'This is User page!'
    expect(response).to have_http_status(200)
  end
end
