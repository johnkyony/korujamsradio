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

ActiveRecord::Schema.define(version: 20170915152450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.bigint "blog_id"
    t.string "uuid"
    t.string "title"
    t.string "artwork"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_musics_on_blog_id"
  end

  create_table "playlist_songs", force: :cascade do |t|
    t.bigint "playlist_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_playlist_songs_on_music_id"
    t.index ["playlist_id"], name: "index_playlist_songs_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "musics", "blogs"
  add_foreign_key "playlist_songs", "musics"
  add_foreign_key "playlist_songs", "playlists"
  add_foreign_key "playlists", "users"
  add_foreign_key "users", "roles"
end
