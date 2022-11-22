# frozen_string_literal: true

class CreateGlasses < ActiveRecord::Migration[5.2]
  def change
    create_table :glasses do |t|
      t.timestamps
      t.string :name
    end
  end
end
