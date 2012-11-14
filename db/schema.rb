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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121113164416) do

  create_table "addresses", :force => true do |t|
    t.string   "firstname",  :null => false
    t.string   "lastname",   :null => false
    t.string   "address1",   :null => false
    t.string   "address2"
    t.string   "city",       :null => false
    t.string   "state_id",   :null => false
    t.string   "zip",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "adjustments", :force => true do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "buyable_giftcerts", :force => true do |t|
  end

  create_table "countries", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.boolean "active_shipping", :default => false
    t.boolean "active_billing",  :default => false
  end

  create_table "coupon_applications", :force => true do |t|
    t.integer "line_item_id"
    t.integer "coupon_id"
  end

  create_table "coupons", :force => true do |t|
    t.string  "code",                                                :null => false
    t.decimal "amount",               :precision => 10, :scale => 2, :null => false
    t.string  "discount_type",                                       :null => false
    t.decimal "min_cart_total",       :precision => 10, :scale => 2, :null => false
    t.date    "expiration_date"
    t.integer "allowed_applications"
  end

  create_table "credits", :id => false, :force => true do |t|
    t.integer  "id",          :null => false
    t.integer  "order_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frames", :force => true do |t|
    t.string   "title",             :null => false
    t.string   "slug",              :null => false
    t.text     "description"
    t.string   "main_file_name"
    t.string   "main_content_type"
    t.string   "main_file_size"
    t.datetime "main_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "giftcert_applications", :force => true do |t|
    t.integer  "line_item_id"
    t.integer  "giftcert_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "giftcerts", :force => true do |t|
    t.string   "code",            :null => false
    t.decimal  "amount",          :null => false
    t.date     "expiration_date"
    t.integer  "order_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title",                                   :null => false
    t.string   "slug",                                    :null => false
    t.text     "description"
    t.integer  "user_id",                                 :null => false
    t.string   "gallery_file_name"
    t.string   "gallery_content_type"
    t.string   "gallery_file_size"
    t.datetime "gallery_updated_at"
    t.string   "main_file_name"
    t.string   "main_content_type"
    t.string   "main_file_size"
    t.datetime "main_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_featured",          :default => false, :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id",                                                              :null => false
    t.integer  "quantity",                                                              :null => false
    t.integer  "sellable_id"
    t.decimal  "price",          :precision => 10, :scale => 2
    t.decimal  "unit_price",     :precision => 10, :scale => 2, :default => 0.0,        :null => false
    t.string   "description",                                   :default => "",         :null => false
    t.string   "line_item_type",                                :default => "sellable", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navigation_nodes", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "position"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "navigation_nodes", ["ancestry"], :name => "index_navigation_nodes_on_ancestry"

  create_table "option_configurations", :force => true do |t|
    t.string   "klass",      :null => false
    t.integer  "option_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "option_values", :force => true do |t|
    t.integer  "option_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "option_values_variants", :id => false, :force => true do |t|
    t.integer "option_value_id"
    t.integer "variant_id"
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_notes", :force => true do |t|
    t.integer  "order_id",   :null => false
    t.integer  "user_id",    :null => false
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "billing_address_id",                                                    :null => false
    t.integer  "shipping_address_id",                                                   :null => false
    t.integer  "user_id"
    t.string   "email",                                                                 :null => false
    t.string   "phone",                                                                 :null => false
    t.decimal  "total",               :precision => 10, :scale => 2,                    :null => false
    t.decimal  "total_due",           :precision => 10, :scale => 2,                    :null => false
    t.string   "status",                                                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
    t.string   "user_agent"
    t.boolean  "to_be_cancelled",                                    :default => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_method_values", :force => true do |t|
    t.integer "payment_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "description",                    :null => false
    t.string   "klass",                          :null => false
    t.boolean  "active",      :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "payment_method_id"
    t.string   "status",            :default => "paid", :null => false
    t.integer  "month"
    t.integer  "year"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "masked_number"
    t.integer  "line_item_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "slug",       :null => false
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sellable_taxonomies", :force => true do |t|
    t.integer "navigation_node_id",                :null => false
    t.integer "sellable_id",                       :null => false
    t.integer "sort",               :default => 0, :null => false
  end

  create_table "sellables", :force => true do |t|
    t.string  "sku",                                                                   :null => false
    t.string  "description",                                                           :null => false
    t.decimal "price",               :precision => 10, :scale => 2,                    :null => false
    t.integer "quantity",                                           :default => 0,     :null => false
    t.integer "item_id",                                                               :null => false
    t.string  "item_type",                                                             :null => false
    t.boolean "active",                                             :default => false, :null => false
    t.boolean "unlimited_inventory",                                :default => false, :null => false
  end

  create_table "shipments", :force => true do |t|
    t.integer  "shipping_method_id",                    :null => false
    t.string   "status",             :default => "new", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_item_id"
  end

  create_table "shipping_method_values", :force => true do |t|
    t.integer "shipping_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "shipping_methods", :force => true do |t|
    t.string  "description",                    :null => false
    t.string  "klass",                          :null => false
    t.boolean "active",      :default => false, :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "abbr"
    t.string  "name"
    t.integer "country_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tax_method_values", :force => true do |t|
    t.integer "tax_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "tax_methods", :force => true do |t|
    t.string  "description",                    :null => false
    t.string  "klass",                          :null => false
    t.boolean "active",      :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "display_name",                                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "variants", :force => true do |t|
    t.integer  "item_id",    :null => false
    t.string   "item_type",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
