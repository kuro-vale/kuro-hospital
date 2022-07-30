# frozen_string_literal: true

# Add patients consultations to doctors
class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :diagnosis
      t.string :procedure
      t.references :drug, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps null: true
    end
  end
end
