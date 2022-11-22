# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /drinks/filter_by', type: :request do
  let(:endpoint) { '/drinks/filter_by' }
  let(:drinks) { create_list(:drink, 10) }
  let(:service_result) do
    {
      'strDrink' => 'Cocktail Name',
      'strDrinkThumb' => 'https://www.url.com/cocktail',
      'idDrink' => '2022'
    }
  end

  let(:params) do
    { 'category' => 'Category 1',
      'glass_type' => 'Glass 1',
      'ingredients' => 'Ingredient 1',
      'alcoholic_type' => 'Alcoholic Type' }
  end

  describe 'filter cocktails ' do
    context 'with valid params' do
      before do
        allow(CocktailApi::Actions).to receive(:get_cocktail).with(params).and_return(service_result)
        drinks
        get endpoint, params: params
      end

      it 'responds with a status of 200 ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'response body has the same size has the drinks created' do
        result = JSON.parse(response.body)
        expect(result['name']).to eq(service_result['strDrink'])
      end

      it 'it was created a record with the filtered cocktail' do
        expect(Drink.find_by(name: service_result['strDrink'])).not_to be(nil)
      end
    end
  end
end
