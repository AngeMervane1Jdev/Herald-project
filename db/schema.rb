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

ActiveRecord::Schema.define(version: 2021_11_25_224541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrateurs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nom"
    t.string "prenoms"
    t.string "contact"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_administrateurs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrateurs_on_reset_password_token", unique: true
  end

  create_table "assistants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nom"
    t.string "prenoms"
    t.string "contact"
    t.boolean "assistant_fiscale", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_assistants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_assistants_on_reset_password_token", unique: true
  end

  create_table "commentaires", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "send_by"
    t.bigint "discussion_id"
    t.index ["discussion_id"], name: "index_commentaires_on_discussion_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "category"
    t.string "titre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "assistant_id"
    t.index ["assistant_id"], name: "index_discussions_on_assistant_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "pmes", force: :cascade do |t|
    t.string "designation"
    t.text "raison"
    t.string "sector"
    t.string "email"
    t.string "address"
    t.string "state"
    t.string "status"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["designation"], name: "index_pmes_on_designation", unique: true
    t.index ["email"], name: "index_pmes_on_email", unique: true
    t.index ["user_id"], name: "index_pmes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "tel", null: false
    t.string "position"
    t.string "name"
    t.string "surname"
    t.string "lieu"
    t.date "birthday"
    t.string "address"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commentaires", "discussions"
  add_foreign_key "discussions", "assistants"
  add_foreign_key "discussions", "users"
  add_foreign_key "pmes", "users"
end
