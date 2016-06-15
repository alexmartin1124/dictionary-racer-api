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

ActiveRecord::Schema.define(version: 20160615205759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "word"
    t.text     "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puzzle_entries", force: :cascade do |t|
    t.integer  "puzzle_id"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_puzzle_entries_on_entry_id", using: :btree
    t.index ["puzzle_id"], name: "index_puzzle_entries_on_puzzle_id", using: :btree
  end

  create_table "puzzles", force: :cascade do |t|
    t.string   "start_word"
    t.string   "end_word"
    t.string   "difficulty"
    t.string   "best_path",               array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_puzzles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_user_puzzles_on_puzzle_id", using: :btree
    t.index ["user_id"], name: "index_user_puzzles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "puzzle_entries", "entries"
  add_foreign_key "puzzle_entries", "puzzles"
  add_foreign_key "user_puzzles", "puzzles"
  add_foreign_key "user_puzzles", "users"
end
