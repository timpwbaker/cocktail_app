# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /drinks/list_options', type: :request do
  let(:endpoint) { '/drinks/list_options' }
  let(:categories) { create_list(:category, 10) }
  let(:alcoholic_types) { create_list(:alcoholic, 10) }
  let(:ingredients) { create_list(:ingredient, 10) }
  let(:glasses) { create_list(:glass, 10) }

  describe 'list all filter options' do
    before do
      categories
      alcoholic_types
      ingredients
      glasses

      get endpoint
    end

    it 'response body contains all the list options to filter a drink' do
      result = JSON.parse(response.body)
      expect(result['category']).to eq(categories.pluck(:name))
      expect(result['glass']).to eq(glasses.pluck(:name))
      expect(result['ingredient']).to eq(ingredients.pluck(:name))
      expect(result['alcoholic']).to eq(alcoholic_types.pluck(:name))
    end

    it 'responds with a status of 200 ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
