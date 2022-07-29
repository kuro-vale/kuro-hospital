# frozen_string_literal: true

# Hospital drugs
class CreateDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :drugs do |t|
      t.string :brand_name, index: { unique: true }
      t.string :generic_name, index: { unique: true }
      t.string :laboratory

      t.timestamps null: true
    end
  end
end
