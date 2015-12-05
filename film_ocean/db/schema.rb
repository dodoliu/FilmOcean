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

ActiveRecord::Schema.define(version: 20151205161853) do

  create_table "file_logos", force: :cascade do |t|
    t.string   "logo_url",   limit: 500
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "film_actors", force: :cascade do |t|
    t.string   "actor",      limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "film_actors", ["actor"], name: "index_film_actors_on_actor", unique: true, using: :btree

  create_table "film_areas", force: :cascade do |t|
    t.string   "area",       limit: 15
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "film_areas", ["area"], name: "index_film_areas_on_area", unique: true, using: :btree

  create_table "film_categories", force: :cascade do |t|
    t.string   "categoy",    limit: 10
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "film_categories", ["categoy"], name: "index_film_categories_on_categoy", unique: true, using: :btree

  create_table "film_directors", force: :cascade do |t|
    t.string   "director",   limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "film_directors", ["director"], name: "index_film_directors_on_director", unique: true, using: :btree

  create_table "film_downloads", force: :cascade do |t|
    t.string   "download_url",         limit: 500
    t.string   "download_contact_url", limit: 500
    t.string   "expand",               limit: 50
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "film_introductions", force: :cascade do |t|
    t.string   "introduction", limit: 20
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "film_sources", force: :cascade do |t|
    t.string   "source",     limit: 255
    t.string   "source_url", limit: 500
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "film_sources", ["source"], name: "index_film_sources_on_source", unique: true, using: :btree

  create_table "film_titles", force: :cascade do |t|
    t.string   "chinese_name", limit: 255
    t.string   "english_name", limit: 255
    t.boolean  "status",       limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "film_titles", ["chinese_name", "english_name"], name: "index_film_titles_on_chinese_name_and_english_name", unique: true, using: :btree

  create_table "films", force: :cascade do |t|
    t.integer  "film_title_id",        limit: 4
    t.string   "chinese_name",         limit: 255
    t.string   "english_name",         limit: 255
    t.integer  "film_logo_id",         limit: 4
    t.integer  "film_area_id",         limit: 4
    t.integer  "film_director_id",     limit: 4
    t.integer  "film_category_id",     limit: 4
    t.integer  "film_introduction_id", limit: 4
    t.integer  "film_source_id",       limit: 4
    t.integer  "film_download__id",    limit: 4
    t.integer  "film_actor_id",        limit: 4
    t.integer  "film_language",        limit: 4
    t.datetime "make_date"
    t.integer  "show_type",            limit: 4
    t.integer  "click_rate",           limit: 4
    t.integer  "grade",                limit: 4
    t.string   "duration",             limit: 20
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "films", ["chinese_name", "english_name"], name: "index_films_on_chinese_name_and_english_name", unique: true, using: :btree

end
