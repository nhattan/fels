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

ActiveRecord::Schema.define(version: 20140226085534) do

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "word_id"
    t.integer  "correct",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "des"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_words", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
  end

  create_table "lessons", force: true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "role"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "words", force: true do |t|
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meaning"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id"

end
