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

ActiveRecord::Schema.define(version: 20180521111903) do

  create_table "champions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                     null: false
    t.text     "key",        limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_champions_on_name", using: :btree
  end

  create_table "skins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "skin_num",    null: false
    t.integer  "skin_id",     null: false
    t.string   "name",        null: false
    t.string   "type"
    t.integer  "price"
    t.integer  "champion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["champion_id"], name: "index_skins_on_champion_id", using: :btree
    t.index ["skin_num"], name: "index_skins_on_skin_num", using: :btree
  end

  add_foreign_key "skins", "champions"
end
