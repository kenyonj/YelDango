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

ActiveRecord::Schema.define(version: 20140408173924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "time"
    t.string   "location"
  end

  create_table "restaurants", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "rating",     precision: 2, scale: 1
  end

  create_table "suggestions", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "event_id"
    t.boolean  "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["event_id"], name: "index_suggestions_on_event_id", using: :btree
  add_index "suggestions", ["restaurant_id"], name: "index_suggestions_on_restaurant_id", using: :btree

end
