# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160316191518) do

  create_table "apis", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.string   "api_key"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "apis", ["user_id"], name: "index_apis_on_user_id"

  create_table "creators", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position_id"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schools", ["creator_id"], name: "index_schools_on_creator_id"
  add_index "schools", ["position_id"], name: "index_schools_on_position_id"

  create_table "schools_tags", force: :cascade do |t|
    t.integer "school_id"
    t.integer "tag_id"
  end

  add_index "schools_tags", ["school_id"], name: "index_schools_tags_on_school_id"
  add_index "schools_tags", ["tag_id"], name: "index_schools_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
