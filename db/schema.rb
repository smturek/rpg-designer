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

ActiveRecord::Schema.define(version: 20150110190147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: true do |t|
    t.integer "hero_id"
    t.integer "monster_id"
  end

  create_table "heros", force: true do |t|
    t.integer "current_health"
    t.integer "current_attack"
    t.string  "name"
    t.integer "base_health"
    t.integer "max_health"
    t.integer "base_attack"
    t.integer "max_attack"
    t.integer "experience"
    t.integer "level",          default: 1
  end

  create_table "items", force: true do |t|
    t.string  "name"
    t.string  "item_type"
    t.integer "attack"
    t.integer "health"
    t.integer "hero_id"
  end

  create_table "monsters", force: true do |t|
    t.string  "name"
    t.integer "current_health"
    t.integer "current_attack"
    t.integer "base_health"
    t.integer "max_health"
    t.integer "base_attack"
    t.integer "max_attack"
  end

  create_table "skills", force: true do |t|
    t.text    "name"
    t.integer "cost"
    t.integer "hero_id"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
