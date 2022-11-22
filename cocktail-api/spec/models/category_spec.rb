# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject(:category) { build(:category) }

    it 'has a factory that produces a valid instance' do
      expect(category).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
  end
end
