# frozen_string_literal: true

# Hospital patients
class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps null: true
    end
  end
end
