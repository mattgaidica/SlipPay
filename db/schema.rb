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

ActiveRecord::Schema.define(:version => 20130216193632) do

  create_table "credentials", :force => true do |t|
    t.string "key"
    t.string "value"
  end

  create_table "receipts", :force => true do |t|
    t.integer  "receipt_id"
    t.string   "store"
    t.string   "total"
    t.text     "note"
    t.datetime "sell_date"
    t.datetime "modified_date"
    t.datetime "created_date"
    t.string   "categories"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "tkn"
    t.string   "uname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "post_receipts", :default => false
  end

end
