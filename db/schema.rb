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

ActiveRecord::Schema.define(:version => 20110125101518) do

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "authors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_bought",  :default => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "is_admin",   :default => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "direction"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
