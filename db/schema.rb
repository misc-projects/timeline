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

ActiveRecord::Schema.define(version: 20160119022354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arc_events", force: :cascade do |t|
    t.integer  "arc_id"
    t.integer  "event_id"
    t.integer  "event_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "arc_events", ["arc_id"], name: "index_arc_events_on_arc_id", using: :btree
  add_index "arc_events", ["event_id"], name: "index_arc_events_on_event_id", using: :btree

  create_table "arcs", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "arcs", ["line_id"], name: "index_arcs_on_line_id", using: :btree

  create_table "calendars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "abbrev"
    t.string   "name"
    t.boolean  "leap"
    t.integer  "leap_year_num"
    t.integer  "months_in_year"
    t.integer  "hours_in_day"
    t.integer  "week_length"
    t.text     "days_in_week",                array: true
    t.decimal  "year_length"
    t.integer  "global_anchor"
    t.integer  "global_scale"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "calendars", ["abbrev", "user_id"], name: "index_calendars_on_abbrev_and_user_id", using: :btree
  add_index "calendars", ["abbrev"], name: "index_calendars_on_abbrev", using: :btree
  add_index "calendars", ["name", "user_id"], name: "index_calendars_on_name_and_user_id", using: :btree
  add_index "calendars", ["name"], name: "index_calendars_on_name", using: :btree
  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entities", ["line_id"], name: "index_entities_on_line_id", using: :btree
  add_index "entities", ["name"], name: "index_entities_on_name", using: :btree
  add_index "entities", ["type"], name: "index_entities_on_type", using: :btree

  create_table "entity_events", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entity_events", ["entity_id"], name: "index_entity_events_on_entity_id", using: :btree
  add_index "entity_events", ["event_id"], name: "index_entity_events_on_event_id", using: :btree

  create_table "eras", force: :cascade do |t|
    t.string   "abbrev"
    t.string   "name"
    t.integer  "number"
    t.boolean  "direction"
    t.integer  "anchor"
    t.integer  "calendar_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "eras", ["abbrev"], name: "index_eras_on_abbrev", using: :btree
  add_index "eras", ["calendar_id"], name: "index_eras_on_calendar_id", using: :btree

  create_table "event_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_tags", ["event_id"], name: "index_event_tags_on_event_id", using: :btree
  add_index "event_tags", ["tag_id"], name: "index_event_tags_on_tag_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "name"
    t.integer  "start_era"
    t.integer  "start_year"
    t.integer  "end_year"
    t.integer  "start_month"
    t.integer  "end_month"
    t.integer  "start_date"
    t.integer  "end_date"
    t.integer  "day"
    t.decimal  "hour",        precision: 5, scale: 2
    t.text     "summary"
    t.text     "detail"
    t.integer  "level"
    t.string   "type"
    t.boolean  "complete"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "events", ["line_id"], name: "index_events_on_line_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.integer  "calendar_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lines", ["calendar_id"], name: "index_lines_on_calendar_id", using: :btree
  add_index "lines", ["user_id"], name: "index_lines_on_user_id", using: :btree

  create_table "months", force: :cascade do |t|
    t.integer  "number"
    t.string   "abbrev"
    t.string   "name"
    t.integer  "days_normal"
    t.integer  "days_leap"
    t.integer  "calendar_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "months", ["calendar_id"], name: "index_months_on_calendar_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["line_id"], name: "index_tags_on_line_id", using: :btree
  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "arc_events", "arcs"
  add_foreign_key "arc_events", "events"
  add_foreign_key "arcs", "lines"
  add_foreign_key "calendars", "users"
  add_foreign_key "entities", "lines"
  add_foreign_key "entity_events", "entities"
  add_foreign_key "entity_events", "events"
  add_foreign_key "eras", "calendars"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
  add_foreign_key "events", "lines"
  add_foreign_key "lines", "calendars"
  add_foreign_key "lines", "users"
  add_foreign_key "months", "calendars"
  add_foreign_key "tags", "lines"
end
