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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121231134443) do

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["room_id"], :name => "index_reviews_on_room_id"
  add_index "reviews", ["user_id", "room_id"], :name => "index_reviews_on_user_id_and_room_id", :unique => true
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.integer  "reviews_count"
  end

  add_index "rooms", ["user_id"], :name => "index_rooms_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.time     "confirmed_at"
    t.string   "confirmation_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
