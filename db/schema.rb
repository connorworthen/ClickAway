# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_17_020306) do

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.integer "established"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "manufacturer_id", null: false
    t.index ["manufacturer_id"], name: "index_manufacturers_users_on_manufacturer_id"
    t.index ["user_id"], name: "index_manufacturers_users_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "stock"
    t.float "price"
    t.text "description"
    t.integer "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
