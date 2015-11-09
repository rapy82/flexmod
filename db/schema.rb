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

ActiveRecord::Schema.define(version: 20140325090457) do

  create_table "alarm_conditions", force: true do |t|
    t.string   "command"
    t.float    "value"
    t.string   "comparator"
    t.integer  "alarm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alarm_conditions", ["alarm_id"], name: "index_alarm_conditions_on_alarm_id"

  create_table "alarms", force: true do |t|
    t.string   "name"
    t.text     "message"
    t.text     "mails"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
    t.boolean  "suspended"
  end

  create_table "configuration_keys", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "description"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
