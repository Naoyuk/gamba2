# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_04_082714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.bigint "crag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crag_id"], name: "index_areas_on_crag_id"
    t.index ["region_id"], name: "index_areas_on_region_id"
  end

  create_table "crags", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_crags_on_region_id"
  end

  create_table "favs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favs_on_post_id"
    t.index ["user_id", "post_id"], name: "index_favs_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_favs_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.date "day"
    t.string "result"
    t.text "caption"
    t.bigint "user_id"
    t.bigint "region_id"
    t.bigint "crag_id"
    t.bigint "area_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "favs_count"
    t.index ["area_id"], name: "index_posts_on_area_id"
    t.index ["crag_id"], name: "index_posts_on_crag_id"
    t.index ["region_id"], name: "index_posts_on_region_id"
    t.index ["route_id"], name: "index_posts_on_route_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.boolean "able", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.integer "style"
    t.integer "rate"
    t.bigint "region_id"
    t.bigint "crag_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_routes_on_area_id"
    t.index ["crag_id"], name: "index_routes_on_crag_id"
    t.index ["region_id"], name: "index_routes_on_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "areas", "crags"
  add_foreign_key "areas", "regions"
  add_foreign_key "crags", "regions"
  add_foreign_key "posts", "areas"
  add_foreign_key "posts", "crags"
  add_foreign_key "posts", "regions"
  add_foreign_key "posts", "routes"
  add_foreign_key "posts", "users"
  add_foreign_key "routes", "areas"
  add_foreign_key "routes", "crags"
  add_foreign_key "routes", "regions"
end
