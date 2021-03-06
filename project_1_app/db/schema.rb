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

ActiveRecord::Schema.define(:version => 20140725175953) do

  create_table "comments", :force => true do |t|
    t.text     "comment_content"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "song_name"
    t.string   "image"
    t.string   "song_file"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "image"
    t.text     "bio"
    t.string   "user_background_style"
    t.string   "user_font_color_style"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
