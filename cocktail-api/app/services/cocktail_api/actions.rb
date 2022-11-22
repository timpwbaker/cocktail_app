# frozen_string_literal: true

module CocktailApi
  class Actions
    class << self
      include HTTParty
      API_URL = 'http://thecocktaildb.com/api/json/v1/1'
      FILTER = '/filter.php?'
      LIST = '/list.php?'

      def get_cocktail(params)
        filters = build_filter_params(params.to_h)
        response = request_get(API_URL + FILTER + filters)

        if response.body.present?
          JSON.parse(response.body)['drinks'].sample
        else
          []
        end
      end

      def get_filter_options(option)
        response = request_get(API_URL + LIST + "#{option[0]}=list")
        parse_list(response.body, option)
      end

      private

      def request_get(url)
        HTTParty.get(url)
      end

      def parse_list(data, option)
        option = option == 'ingredient' ? 'ingredient1' : option
        JSON.parse(data)['drinks'].map { |record| record["str#{option.capitalize}"] }
      end

      def build_filter_params(params)
        params.reduce('') do |string, (key, value)|
          next if value.nil?

          string + "#{key.to_s[0]}=#{value.parameterize(separator: '_')}&"
        end
      end
    end
  end
end
