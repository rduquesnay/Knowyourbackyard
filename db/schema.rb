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

ActiveRecord::Schema.define(version: 20150707132851) do

  create_table "advertisers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "images", force: true do |t|
    t.string   "url",        default: ""
    t.integer  "trail_id"
    t.boolean  "accepted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["trail_id"], name: "index_images_on_trail_id"

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

  create_table "resolvedreviewdisputes", force: true do |t|
    t.integer  "trail_id"
    t.integer  "review_id"
    t.text     "name_review"
    t.text     "location_review"
    t.text     "rating_difficulty_review"
    t.text     "rating_duration_review"
    t.text     "season_review"
    t.text     "trailtype_review"
    t.text     "length_review"
    t.text     "gps_review"
    t.text     "traildirections_review"
    t.text     "finalcomments"
    t.integer  "review_user_id"
    t.text     "dispute_comment"
    t.string   "dispute_action"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resolvedreviewdisputes", ["trail_id"], name: "index_resolvedreviewdisputes_on_trail_id"

  create_table "resolvedrevisiondisputes", force: true do |t|
    t.integer  "trail_id"
    t.integer  "revision_id"
    t.string   "revisied_name"
    t.string   "revisied_location"
    t.string   "revisied_season"
    t.string   "revisied_trailtype"
    t.float    "revisied_latitude"
    t.float    "revisied_longitude"
    t.text     "revisied_traildirections"
    t.integer  "review_id"
    t.text     "name_review"
    t.text     "location_review"
    t.text     "length_review"
    t.text     "season_review"
    t.text     "trailtype_review"
    t.text     "gps_review"
    t.text     "traildirections_review"
    t.text     "finalcomments"
    t.text     "dispute_comment"
    t.string   "dispute_action"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "revisied_length"
    t.integer  "review_user_id"
  end

  add_index "resolvedrevisiondisputes", ["trail_id"], name: "index_resolvedrevisiondisputes_on_trail_id"

  create_table "reviewdisputes", force: true do |t|
    t.text     "comment"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviewdisputes", ["review_id"], name: "index_reviewdisputes_on_review_id"

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

  create_table "revisiondisputes", force: true do |t|
    t.text     "comment"
    t.integer  "revisionreview_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "revisiondisputes", ["revisionreview_id"], name: "index_revisiondisputes_on_revisionreview_id"

  create_table "revisionreviews", force: true do |t|
    t.text     "name_review"
    t.text     "location_review"
    t.text     "season_review"
    t.text     "trailtype_review"
    t.text     "gps_review"
    t.string   "traildirection_review"
    t.text     "finalcomments"
    t.integer  "user_id"
    t.integer  "revision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "length_review"
  end

  add_index "revisionreviews", ["revision_id"], name: "index_revisionreviews_on_revision_id"
  add_index "revisionreviews", ["user_id"], name: "index_revisionreviews_on_user_id"

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

  create_table "socials", force: true do |t|
    t.string   "facebook_link"
    t.string   "linkedin_link"
    t.string   "youtube_link"
    t.string   "instagram_link"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "socials", ["user_id"], name: "index_socials_on_user_id"

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
    t.integer  "avgdifficulty"
    t.integer  "avgduration"
    t.boolean  "viewbyguest",     default: false
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
    t.boolean  "original_trailblazer",   default: false
    t.boolean  "demoted",                default: false
    t.boolean  "videomaker",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "video_submissions", force: true do |t|
    t.integer  "trail_id"
    t.string   "demo_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_submissions", ["trail_id"], name: "index_video_submissions_on_trail_id"

  create_table "videomaker_submissions", force: true do |t|
    t.integer  "user_id"
    t.string   "demo_link"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videomaker_submissions", ["user_id"], name: "index_videomaker_submissions_on_user_id"

  create_table "videos", force: true do |t|
    t.string   "src"
    t.integer  "trail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["trail_id"], name: "index_videos_on_trail_id"

end
