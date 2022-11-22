# frozen_string_literal: true

class Glass < ApplicationRecord
  validates :name, presence: true
end
