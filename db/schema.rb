# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_30_003145) do
  create_table "consultations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "diagnosis"
    t.string "procedure"
    t.bigint "drug_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["doctor_id"], name: "index_consultations_on_doctor_id"
    t.index ["drug_id"], name: "index_consultations_on_drug_id"
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
  end

  create_table "doctors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "university"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "username"
    t.string "password_digest"
    t.index ["username"], name: "index_doctors_on_username", unique: true
  end

  create_table "drugs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "brand_name"
    t.string "generic_name"
    t.string "laboratory"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["brand_name"], name: "index_drugs_on_brand_name", unique: true
    t.index ["generic_name"], name: "index_drugs_on_generic_name", unique: true
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "consultations", "doctors"
  add_foreign_key "consultations", "drugs"
  add_foreign_key "consultations", "patients"
end
