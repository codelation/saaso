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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140829215633) do

  create_table "saaso_admin_invitations", force: true do |t|
    t.datetime "accepted_at"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saaso_admin_invitations", ["token"], name: "index_saaso_admin_invitations_on_token", unique: true

  create_table "saaso_organizations", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saaso_organizations_users", force: true do |t|
    t.integer "organization_id"
    t.integer "user_id"
  end

  add_index "saaso_organizations_users", ["organization_id"], name: "index_saaso_organizations_users_on_organization_id"
  add_index "saaso_organizations_users", ["user_id"], name: "index_saaso_organizations_users_on_user_id"

  create_table "saaso_users", force: true do |t|
    t.string   "name"
    t.string   "time_zone"
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saaso_users", ["email"], name: "index_saaso_users_on_email"
  add_index "saaso_users", ["reset_password_token"], name: "index_saaso_users_on_reset_password_token", unique: true

end
