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

ActiveRecord::Schema.define(version: 20140729161555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_genres", force: true do |t|
    t.integer  "game_id",    null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_genres", ["game_id"], name: "index_game_genres_on_game_id", using: :btree
  add_index "game_genres", ["genre_id", "game_id"], name: "index_game_genres_on_genre_id_and_game_id", unique: true, using: :btree
  add_index "game_genres", ["genre_id"], name: "index_game_genres_on_genre_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name",               null: false
    t.string   "game_type",          null: false
    t.integer  "year_released"
    t.integer  "min_players"
    t.integer  "max_players"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "games", ["game_type"], name: "index_games_on_game_type", using: :btree
  add_index "games", ["max_players"], name: "index_games_on_max_players", using: :btree
  add_index "games", ["min_players"], name: "index_games_on_min_players", using: :btree
  add_index "games", ["name"], name: "index_games_on_name", using: :btree
  add_index "games", ["year_released"], name: "index_games_on_year_released", using: :btree

  create_table "genres", force: true do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "review_votes", force: true do |t|
    t.integer "review_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "review_votes", ["review_id"], name: "index_review_votes_on_review_id", using: :btree
  add_index "review_votes", ["user_id", "review_id"], name: "index_review_votes_on_user_id_and_review_id", unique: true, using: :btree
  add_index "review_votes", ["user_id"], name: "index_review_votes_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "author_id",   null: false
    t.integer  "game_id",     null: false
    t.integer  "rating",      null: false
    t.text     "review_body", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["game_id", "author_id"], name: "index_reviews_on_game_id_and_author_id", unique: true, using: :btree
  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
