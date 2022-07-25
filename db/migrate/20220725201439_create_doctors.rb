# frozen_string_literal: true

# Create doctor basic model
class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :university

      t.timestamps null: true
    end
  end
end
