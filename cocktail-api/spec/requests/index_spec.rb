# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /drinks', type: :request do
  let(:endpoint) { '/drinks' }
  let(:drinks) { create_list(:drink, 10) }

  describe 'list drinks' do
    context 'with valid params' do
      before do
        drinks
        get endpoint
      end

      it 'responds with a status of 200 ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'response body has the same size has the drinks created' do
        expect(JSON.parse(response.body).size).to eq(drinks.size)
      end
    end
  end
end
