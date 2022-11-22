# frozen_string_literal: true

class Drink < ApplicationRecord
  validates :name, presence: true
end
