# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_26_163220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "family_name"
    t.text "family_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "family_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "date_of_birth"
    t.string "place_of_birth"
    t.bigint "family_id", null: false
    t.string "date_of_death"
    t.index ["family_id"], name: "index_family_members_on_family_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "family_id"
    t.bigint "family_member_1_id"
    t.bigint "family_member_2_id"
    t.string "family_member_1_relationship_to_2"
    t.string "family_member_2_relationship_to_1"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_relationships_on_family_id"
    t.index ["family_member_1_id"], name: "index_relationships_on_family_member_1_id"
    t.index ["family_member_2_id"], name: "index_relationships_on_family_member_2_id"
  end

  add_foreign_key "family_members", "families"
  add_foreign_key "relationships", "families"
  add_foreign_key "relationships", "family_members", column: "family_member_1_id"
  add_foreign_key "relationships", "family_members", column: "family_member_2_id"
end
