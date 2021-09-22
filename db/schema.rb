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

ActiveRecord::Schema.define(version: 2021_09_22_153608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "innings", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_innings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "inning_id"
    t.integer "week_one"
    t.integer "week_two"
    t.integer "week_three"
    t.integer "week_four"
    t.integer "week_five"
    t.string "notes"
    t.string "outcome"
    t.integer "module"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inning_id"], name: "index_student_innings_on_inning_id"
    t.index ["student_id"], name: "index_student_innings_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "program"
    t.boolean "has_concerns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "student_innings", "innings"
  add_foreign_key "student_innings", "students"
end
