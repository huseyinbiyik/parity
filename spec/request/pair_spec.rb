# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Display Page', type: :request do
  describe 'GET /pairs' do
    it 'displays a list of pairs' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'Manage Page' do
    it 'displays a list of pairs' do
      get '/pairs/manage'
      expect(response).to have_http_status(:success)
    end
    it 'creates a new pair' do
      post '/pairs/create', params: { pair: { currency1_id: 1, currency2_id: 2 } }
      expect(response).to have_http_status(:redirect)
    end
  end
end
