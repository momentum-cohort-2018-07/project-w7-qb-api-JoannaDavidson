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

ActiveRecord::Schema.define(version: 2018_09_16_045637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.bigint "whiner_id"
    t.bigint "whine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["whine_id"], name: "index_answers_on_whine_id"
    t.index ["whiner_id"], name: "index_answers_on_whiner_id"
  end

  create_table "clarifiers", force: :cascade do |t|
    t.text "body"
    t.bigint "whiner_id"
    t.bigint "whine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["whine_id"], name: "index_clarifiers_on_whine_id"
    t.index ["whiner_id"], name: "index_clarifiers_on_whiner_id"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  create_table "whiners", force: :cascade do |t|
    t.string "name", limit: 32
    t.string "username", limit: 32
    t.string "email"
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_whiners_on_auth_token", unique: true
    t.index ["email"], name: "index_whiners_on_email", unique: true
    t.index ["username"], name: "index_whiners_on_username", unique: true
  end

  create_table "whines", force: :cascade do |t|
    t.string "title", limit: 80
    t.text "body"
    t.bigint "whiner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["whiner_id"], name: "index_whines_on_whiner_id"
  end

  add_foreign_key "answers", "whiners"
  add_foreign_key "answers", "whines"
  add_foreign_key "clarifiers", "whiners"
  add_foreign_key "clarifiers", "whines"
  add_foreign_key "whines", "whiners"
end
