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

ActiveRecord::Schema.define(version: 20150602004309) do

  create_table "chats", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.integer  "contact_id"
    t.integer  "admin_id"
  end

  create_table "comments", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trail_id"
    t.integer  "user_id"
  end

  add_index "comments", ["trail_id"], name: "index_comments_on_trail_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contacts", force: true do |t|
    t.string   "subject"
    t.text     "message"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.integer  "from_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  create_table "messages", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "notifications", force: true do |t|
    t.string   "message"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "ratings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trail_id"
    t.integer  "user_id"
    t.boolean  "favourite",     default: false
    t.integer  "difficulty",    default: 0
    t.integer  "durationinsec", default: 0
  end

  add_index "ratings", ["trail_id"], name: "index_ratings_on_trail_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "name_review"
    t.text     "location_review"
    t.text     "rating_difficulty_review"
    t.text     "rating_duration_review"
    t.text     "season_review"
    t.text     "trailtype_review"
    t.text     "gps_review"
    t.text     "traildirections_review"
    t.text     "finalcomments"
    t.integer  "trail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "length_review"
  end

  add_index "reviews", ["trail_id"], name: "index_reviews_on_trail_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "revisions", force: true do |t|
    t.integer  "trail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.string   "location"
    t.string   "season"
    t.string   "trailtype"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "traildirections"
    t.float    "length"
  end

  add_index "revisions", ["trail_id"], name: "index_revisions_on_trail_id"
  add_index "revisions", ["user_id"], name: "index_revisions_on_user_id"

  create_table "sponsors", force: true do |t|
    t.string   "companyname"
    t.text     "about"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trails", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "season"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "traildirections"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "trailtype"
    t.string   "status",          default: "To be reviewed"
    t.float    "length",          default: 0.0
  end

  add_index "trails", ["user_id"], name: "index_trails_on_user_id"

  create_table "trailupdates", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trail_id"
    t.integer  "user_id"
  end

  add_index "trailupdates", ["trail_id"], name: "index_trailupdates_on_trail_id"
  add_index "trailupdates", ["user_id"], name: "index_trailupdates_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "country"
    t.string   "city"
    t.string   "province"
    t.text     "about"
    t.boolean  "admin",                  default: false
    t.boolean  "trailblazer",            default: false
    t.integer  "points",                 default: 0
    t.boolean  "owner",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
