# frozen_string_literal: true

namespace :populate_filter_options do
  desc 'Task responsible from getting the options from the API and saving on the database'

  task run: :environment do
    options = %w[category glass ingredient alcoholic]
    options.each do |option|
      list = CocktailApi::Actions.get_filter_options(option)
      list.each do |item|
        option.capitalize.constantize.create(name: item)
      end
    end
  end
end
