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

ActiveRecord::Schema.define(:version => 20130505234127) do

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetups", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "date"
    t.string   "venue"
    t.string   "message"
    t.integer  "accept_status"
    t.integer  "prev_meetup_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "meetup_id"
    t.integer  "reviewee_id"
    t.integer  "reviewer_id"
    t.boolean  "positive"
    t.string   "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.string   "name"
    t.string   "owner"
    t.string   "image_url"
    t.integer  "age"
    t.string   "breed"
    t.string   "size"
    t.string   "location"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "overall_rating"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
