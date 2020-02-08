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

ActiveRecord::Schema.define(version: 2020_02_08_191346) do

  create_table "cargos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "booking_id", null: false
    t.integer "booking_amount", null: false
    t.string "transport_status", null: false
    t.string "routing_status", null: false
    t.string "spec_origin_id"
    t.string "spec_destination_id"
    t.datetime "spec_arrival_deadline"
    t.string "origin_id"
    t.integer "handling_event_id"
    t.string "next_expected_location_id"
    t.string "next_expected_handling_event_type"
    t.string "next_expected_voyage_id"
    t.string "last_known_location_id"
    t.string "current_voyage_number"
    t.integer "last_handling_event_id"
    t.string "last_handling_event_type"
    t.string "last_handling_event_location"
    t.string "last_handling_event_voyage"
    t.index ["booking_id"], name: "index_cargos_on_booking_id", unique: true
  end

  create_table "legs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "load_time"
    t.datetime "unload_time"
    t.string "load_location_id"
    t.string "unload_location_id"
    t.string "voyage_number"
    t.bigint "cargo_id"
    t.index ["cargo_id"], name: "index_legs_on_cargo_id"
  end

end
