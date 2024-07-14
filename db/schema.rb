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

ActiveRecord::Schema[7.1].define(version: 2024_07_14_031802) do
  create_table "budget_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_budget_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "budget_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "month"
    t.index ["budget_category_id"], name: "index_historical_budget_categories_on_budget_category_id"
  end

  create_table "historical_sub_categories", force: :cascade do |t|
    t.string "group_name"
    t.string "name"
    t.decimal "budgeted", precision: 10, scale: 2
    t.integer "historical_budget_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "month"
    t.index ["historical_budget_category_id"], name: "idx_on_historical_budget_category_id_0c07b46d44"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "group_name"
    t.string "name"
    t.float "budgeted"
    t.integer "budget_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "historical_sub_categories", "historical_budget_categories"
  add_foreign_key "sub_categories", "budget_categories"
end
