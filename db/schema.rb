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

ActiveRecord::Schema.define(version: 20170109045921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "event_start"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["group_id"], name: "index_events_on_group_id", using: :btree
    t.index ["restaurant_id"], name: "index_events_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_members_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_members_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.text     "yelp_id"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "street"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "review_content"
    t.integer  "stars"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "groups"
  add_foreign_key "events", "restaurants"
  add_foreign_key "events", "users"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
