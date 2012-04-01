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

ActiveRecord::Schema.define(:version => 20120325224526) do

  create_table "beer_images", :force => true do |t|
    t.string   "credits"
    t.datetime "upload_date"
    t.string   "picture"
    t.integer  "beer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "beers", ["slug"], :name => "index_beers_on_slug", :unique => true

  create_table "drink_images", :force => true do |t|
    t.string   "credits"
    t.datetime "upload_date"
    t.string   "picture"
    t.integer  "drink_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "drinks", ["slug"], :name => "index_drinks_on_slug", :unique => true

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plate_parts", :force => true do |t|
    t.string   "name"
    t.integer  "plate_id"
    t.integer  "part_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plate_parts", ["part_id"], :name => "index_plate_parts_on_part_id"
  add_index "plate_parts", ["plate_id", "part_id"], :name => "index_plate_parts_on_plate_id_and_part_id"
  add_index "plate_parts", ["plate_id"], :name => "index_plate_parts_on_plate_id"

  create_table "plates", :force => true do |t|
    t.string   "name"
    t.datetime "datetime"
    t.integer  "precision"
    t.string   "tags"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "plate_id"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.integer  "plate_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
