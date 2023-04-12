# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_12_233919) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.string "character_type", null: false
    t.string "character_race", default: "unknown"
    t.string "description", default: ""
    t.string "char_place_type"
    t.bigint "char_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["char_place_type", "char_place_id"], name: "index_characters_on_char_place"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "location_type", null: false
    t.string "description", default: ""
    t.bigint "campaign_id", null: false
    t.bigint "upper_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_locations_on_campaign_id"
    t.index ["upper_location_id"], name: "index_locations_on_upper_location_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "content", null: false
    t.string "note_place_type"
    t.bigint "note_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_place_type", "note_place_id"], name: "index_notes_on_note_place"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "locations", "campaigns"
end
