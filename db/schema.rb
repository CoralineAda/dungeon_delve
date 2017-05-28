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

ActiveRecord::Schema.define(version: 20170528021119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commands", force: :cascade do |t|
    t.string "name"
    t.text "synonyms"
    t.string "handler_class"
    t.string "handler_method"
    t.boolean "takes_arguments", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doors", id: :serial, force: :cascade do |t|
    t.string "from_coords"
    t.string "to_coords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generic_items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "is_magical", default: false
    t.integer "owner_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "light_sources", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "room_id"
    t.boolean "is_lit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", id: :serial, force: :cascade do |t|
    t.integer "current_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.string "handle", null: false
    t.string "twitter_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readables", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.integer "owner_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.text "description"
    t.string "coords"
    t.boolean "is_dark", default: false
    t.integer "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "is_magical", default: false
    t.integer "owner_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wearables", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "is_worn", default: false
    t.boolean "is_magical", default: false
    t.integer "owner_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
