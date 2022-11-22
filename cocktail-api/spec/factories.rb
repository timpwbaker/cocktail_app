# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :alcoholic do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :glass do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :ingredient do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :drink do
    sequence(:name) { |n| "Title #{n}" }
    sequence(:api_id) { |n| n }
    sequence(:thumb_url) { |n| "URL #{n}" }
  end
end
