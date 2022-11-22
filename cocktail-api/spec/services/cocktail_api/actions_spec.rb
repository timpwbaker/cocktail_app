# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CocktailApi::Actions do
  let(:cocktail_api_response) { described_class.get_cocktail(params) }

  let(:params) do
    ActionController::Parameters.new({ 'category' => 'Category 1',
                                       'glass_type' => 'Glass 1',
                                       'ingredients' => 'Ingredient 1',
                                       'alcoholic_type' => 'Alcoholic Type' }).permit(:category, :glass_type, :ingredients, :alcoholic_type)
  end

  let(:service_result) do
    OpenStruct.new(body: {
      'drinks': [{ 'strDrink' => 'Moscow Mule',
                   'strDrinkThumb' => 'https://www.url.com/cocktail',
                   'idDrink' => '2022' }]
    }.to_json)
  end

  describe 'requests cocktails from api' do
    before do
      allow(CocktailApi::Actions).to receive(:request_get).with(any_args).and_return(service_result)
    end

    it 'returns one cocktail with the name: Moscow Mule' do
      result = cocktail_api_response
      expect(result['strDrink']).to eq('Moscow Mule')
    end
  end
end
