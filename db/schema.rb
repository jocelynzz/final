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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "date"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "mappings", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "mappings", ["category_id"], name: "index_mappings_on_category_id"
  add_index "mappings", ["post_id"], name: "index_mappings_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "date"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relations", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
  end

  add_index "relations", ["follower_id"], name: "index_relations_on_follower_id"
  add_index "relations", ["following_id"], name: "index_relations_on_following_id"

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.text   "photo_url"
    t.text   "intro"
    t.string "user_name"
    t.string "email"
  end

end
