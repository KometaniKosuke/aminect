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

ActiveRecord::Schema.define(version: 2022_09_09_194330) do

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

  create_table "announces", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "automails", force: :cascade do |t|
    t.integer "user_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_automails_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.datetime "date"
    t.integer "user_id"
    t.integer "room_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "mon1", default: 0
    t.integer "mon2", default: 0
    t.integer "mon3", default: 0
    t.integer "mon4", default: 0
    t.integer "mon5", default: 0
    t.integer "tue1", default: 0
    t.integer "tue2", default: 0
    t.integer "tue3", default: 0
    t.integer "tue4", default: 0
    t.integer "tue5", default: 0
    t.integer "wed1", default: 0
    t.integer "wed2", default: 0
    t.integer "wed3", default: 0
    t.integer "wed4", default: 0
    t.integer "wed5", default: 0
    t.integer "thu1", default: 0
    t.integer "thu2", default: 0
    t.integer "thu3", default: 0
    t.integer "thu4", default: 0
    t.integer "thu5", default: 0
    t.integer "fri1", default: 0
    t.integer "fri2", default: 0
    t.integer "fri3", default: 0
    t.integer "fri4", default: 0
    t.integer "fri5", default: 0
    t.index ["user_id"], name: "index_timetables_on_user_id"
  end

  create_table "user_rooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "uid"
    t.string "name"
    t.integer "sex"
    t.string "birthplace"
    t.string "undergraduate"
    t.string "comment"
    t.string "twitter"
    t.string "instagram"
    t.string "tiktok"
    t.string "password_digest"
    t.string "image"
  end

end
