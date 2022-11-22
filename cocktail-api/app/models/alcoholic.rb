# frozen_string_literal: true

class Alcoholic < ApplicationRecord
  validates :name, presence: true
end
