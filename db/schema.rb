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

ActiveRecord::Schema.define(version: 2019_05_29_224115) do

  create_table "cards", force: :cascade do |t|
    t.string "suit"
    t.string "value"
    t.boolean "is_dealt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hand_cards", force: :cascade do |t|
    t.integer "card_id"
    t.integer "hand_id"
    t.index ["card_id"], name: "index_hand_cards_on_card_id"
    t.index ["hand_id"], name: "index_hand_cards_on_hand_id"
  end

  create_table "hands", force: :cascade do |t|
    t.integer "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_player_hand"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ante_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
