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

ActiveRecord::Schema.define(version: 20150730171059) do

  create_table "development_plans", force: true do |t|
    t.string   "plan_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "development_skills", force: true do |t|
    t.string   "skill_name"
    t.string   "desired_skill_level"
    t.text     "notes"
    t.boolean  "completed"
    t.float    "percent_complete"
    t.string   "current_skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "development_tasks", force: true do |t|
    t.string   "test_name"
    t.text     "details"
    t.date     "start_date"
    t.date     "completion_date"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_levels", force: true do |t|
    t.string   "level"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
