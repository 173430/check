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

ActiveRecord::Schema.define(version: 2020_01_10_051242) do

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.string "answer"
    t.string "picture"
    t.boolean "best"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.integer "grade"
    t.string "classname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
  end

  create_table "grades", force: :cascade do |t|
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupmembers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "user_id"
    t.boolean "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.string "group_id"
  end

  create_table "notecomments", force: :cascade do |t|
    t.integer "note_id"
    t.integer "user_id"
    t.string "comment"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notepictures", force: :cascade do |t|
    t.integer "note_id"
    t.string "picture"
    t.integer "disp_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "picture"
    t.string "coverpicture"
    t.integer "grade_id"
    t.integer "subject_id"
    t.string "extra"
    t.integer "good"
    t.boolean "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "grade_id"
    t.integer "subject_id"
    t.string "picture"
    t.boolean "nameless"
    t.boolean "solve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "schoolname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subjectname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "classroom_id"
    t.string "userid"
    t.string "name"
    t.string "icon"
    t.string "introduce"
    t.string "password"
    t.boolean "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
