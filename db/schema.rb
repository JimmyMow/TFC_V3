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

ActiveRecord::Schema.define(version: 20131118225303) do

  create_table "call_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "call_id"
    t.boolean  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", force: true do |t|
    t.string   "call_type"
    t.string   "quarter"
    t.string   "time"
    t.integer  "game_id"
    t.string   "description"
    t.integer  "commit_player_id"
    t.integer  "fouled_player_id"
    t.integer  "ref_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_comment_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_comment_id"
    t.boolean  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_comments", force: true do |t|
    t.text     "text"
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.boolean  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string   "call_type"
    t.string   "quarter"
    t.string   "time"
    t.integer  "game_id"
    t.string   "description"
    t.integer  "commit_player_id"
    t.integer  "fouled_player_id"
    t.integer  "ref_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.boolean  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "call_id"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_refs", force: true do |t|
    t.integer  "game_id"
    t.integer  "ref_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "img_url"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refs", force: true do |t|
    t.string   "name"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "coach"
    t.string   "name"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.integer  "iq"
    t.string   "password_digest"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
