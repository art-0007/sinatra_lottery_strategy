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

ActiveRecord::Schema.define(version: 2021_05_11_141100) do

  create_table "all_draws", force: :cascade do |t|
    t.json "draw"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "preference_num1"
    t.integer "preference_num2"
    t.integer "preference_num3"
    t.integer "preference_num4"
    t.integer "preference_num5"
    t.integer "preference_PB"
    t.date "LUCKY_DAY_1"
    t.date "LUCKY_DAY_2"
    t.date "LUCKY_DAY_3"
    t.string "result"
  end

  create_table "draws", force: :cascade do |t|
    t.date "draw_date"
    t.string "winning_numbers"
    t.string "multiplier"
  end

  create_table "numbers", force: :cascade do |t|
    t.date "draw_date"
    t.integer "num_1"
    t.integer "num_2"
    t.integer "num_3"
    t.integer "num_4"
    t.integer "num_5"
    t.integer "num_6"
    t.integer "num_7"
    t.integer "num_8"
    t.integer "num_9"
    t.integer "num_10"
    t.integer "num_11"
    t.integer "num_12"
    t.integer "num_13"
    t.integer "num_14"
    t.integer "num_15"
    t.integer "num_16"
    t.integer "num_17"
    t.integer "num_18"
    t.integer "num_19"
    t.integer "num_20"
    t.integer "num_21"
    t.integer "num_22"
    t.integer "num_23"
    t.integer "num_24"
    t.integer "num_25"
    t.integer "num_26"
    t.integer "num_27"
    t.integer "num_28"
    t.integer "num_29"
    t.integer "num_30"
    t.integer "num_31"
    t.integer "num_32"
    t.integer "num_33"
    t.integer "num_34"
    t.integer "num_35"
    t.integer "num_36"
    t.integer "num_37"
    t.integer "num_38"
    t.integer "num_39"
    t.integer "num_40"
    t.integer "num_41"
    t.integer "num_42"
    t.integer "num_43"
    t.integer "num_44"
    t.integer "num_45"
    t.integer "num_46"
    t.integer "num_47"
    t.integer "num_48"
    t.integer "num_49"
    t.integer "num_50"
    t.integer "num_51"
    t.integer "num_52"
    t.integer "num_53"
    t.integer "num_54"
    t.integer "num_55"
    t.integer "num_56"
    t.integer "num_57"
    t.integer "num_58"
    t.integer "num_59"
    t.integer "num_60"
    t.integer "num_61"
    t.integer "num_62"
    t.integer "num_63"
    t.integer "num_64"
    t.integer "num_65"
    t.integer "num_66"
    t.integer "num_67"
    t.integer "num_68"
    t.integer "num_69"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
  end

end
