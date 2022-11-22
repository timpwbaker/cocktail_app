# frozen_string_literal: true

class DrinksController < ApplicationController
  def filter_by
    cocktail = CocktailApi::Actions.get_cocktail(permitted_params)
    drink = create_drink(cocktail)

    render status: :ok, json: drink
  end

  def list_options
    options = {
      category: Category.all.pluck(:name),
      glass: Glass.all.pluck(:name),
      ingredient: Ingredient.all.pluck(:name),
      alcoholic: Alcoholic.all.pluck(:name)
    }

    render status: :ok, json: options
  end

  def index
    render status: :ok, json: Drink.order(id: :desc).last(10)
  end

  private

  def create_drink(drink)
    drink_record = %i[name thumb_url api_id].zip(drink.values).to_h
    Drink.create(drink_record)
  end

  def permitted_params
    params.permit(:category, :glass_type, :ingredients, :alcoholic_type)
  end
end
