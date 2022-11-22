# frozen_string_literal: true

class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.timestamps
      t.string :name
      t.integer :api_id
      t.string :thumb_url
    end
  end
end
