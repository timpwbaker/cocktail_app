# frozen_string_literal: true

class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :name, :thumb_url
end
