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

ActiveRecord::Schema.define(version: 20170217142305) do

  create_table "state_changes", force: :cascade do |t|
    t.datetime "changed_at"
    t.string   "changed_values"
    t.integer  "store_resource_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["store_resource_id"], name: "index_state_changes_on_store_resource_id"
  end

  create_table "store_resources", force: :cascade do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_id"], name: "index_store_resources_on_resource_id"
    t.index ["resource_type"], name: "index_store_resources_on_resource_type"
  end

end
