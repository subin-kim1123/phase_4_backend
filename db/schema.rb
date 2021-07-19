# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_18_170239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_goals_on_teacher_id"
  end

  create_table "student_goals", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "goal_id", null: false
    t.integer "star"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_student_goals_on_goal_id"
    t.index ["student_id"], name: "index_student_goals_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "name"
    t.integer "grade"
    t.string "hair_color"
    t.integer "sibling_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "goals", "teachers"
  add_foreign_key "student_goals", "goals"
  add_foreign_key "student_goals", "students"
  add_foreign_key "students", "teachers"
end
