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

ActiveRecord::Schema.define(:version => 20170605005401) do

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "address"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "business_name"
    t.string   "business_slogan"
    t.string   "business_phone"
    t.string   "business_toll_free"
    t.string   "business_fax"
    t.string   "business_mobile"
    t.string   "business_email"
    t.string   "technician_email"
    t.string   "no_reply_email"
    t.string   "accountant_email"
    t.string   "service_email"
    t.string   "business_address"
    t.string   "business_city"
    t.string   "business_state"
    t.string   "business_zip_code"
    t.string   "business_country"
    t.string   "business_number"
    t.string   "meta_tags"
    t.string   "tax_type"
    t.decimal  "tax_rate",              :precision => 10, :scale => 0
    t.boolean  "logout_limit"
    t.integer  "idle_time"
    t.string   "version"
    t.string   "default_invoice_note"
    t.string   "default_invoice_terms"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "user_id"
    t.integer  "work_order_id"
    t.decimal  "sub_total",      :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "tax_total",      :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "total",          :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "tax_rate",       :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "shipping",       :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "discount",       :precision => 12, :scale => 2, :default => 0.0
    t.text     "invoice_note"
    t.boolean  "paid"
    t.boolean  "paid_partially"
    t.string   "created_by"
    t.string   "updated_by"
    t.date     "due_date"
    t.datetime "paid_date"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  create_table "page_categories", :force => true do |t|
    t.string "name"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.integer  "user_id"
    t.string   "page_category_id"
    t.boolean  "published"
    t.boolean  "private"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string "name"
    t.string "action"
    t.string "subject_class"
    t.string "subject_id"
  end

  create_table "permittables", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  create_table "priority_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.integer  "sub_category_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_invoice_lines", :force => true do |t|
    t.integer  "invoice_id",                                  :default => 0,   :null => false
    t.integer  "product_id",                                  :default => 0,   :null => false
    t.string   "sku",                                                          :null => false
    t.string   "description",                                                  :null => false
    t.decimal  "qty",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax_rate",     :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "price",        :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sub_total",    :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_price",  :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "line_comment"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "supplier_sku"
    t.string   "our_sku"
    t.string   "manufacturer"
    t.string   "description"
    t.string   "model"
    t.string   "product_category_id"
    t.integer  "child_category_id"
    t.string   "warranty_info"
    t.string   "warranty_length"
    t.string   "warranty_unit"
    t.boolean  "taxable"
    t.decimal  "tax_rate",            :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "cost_price",          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sell_price",          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "mark_up",             :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.boolean  "active"
    t.decimal  "weight",              :precision => 10, :scale => 3, :default => 0.0, :null => false
    t.boolean  "discountable"
    t.decimal  "disc_percent",        :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "disc_amount",         :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.decimal  "qty_on_hand",         :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "qty_allocated",       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "qty_available",       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "qty_ordered",         :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "stocking_qty",        :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.boolean  "stocked_product"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "work_order_id"
    t.text     "content"
    t.boolean  "private"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.integer  "list_position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "service_invoice_lines", :force => true do |t|
    t.integer  "invoice_id",                                  :default => 0,   :null => false
    t.integer  "service_id",                                  :default => 0,   :null => false
    t.string   "sku",                                                          :null => false
    t.string   "description",                                                  :null => false
    t.decimal  "qty",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax_rate",     :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "price",        :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sub_total",    :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_price",  :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "line_comment"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "service_rates", :force => true do |t|
    t.string   "sku"
    t.string   "description"
    t.decimal  "rate",        :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.boolean  "taxable"
    t.decimal  "tax_rate",    :precision => 12, :scale => 3
    t.boolean  "active"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "name",       :limit => 30, :default => "", :null => false
    t.text     "value"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company_name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "credit_terms"
    t.integer  "credit_amount"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.text     "notes"
    t.boolean  "active"
    t.datetime "date_created"
    t.datetime "date_updated"
    t.integer  "parts_leadtime_days"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "user_id"
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.string   "website"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "work_order_id"
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "calendar_id"
    t.boolean  "completed"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.string "username"
    t.string "password"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "role_id"
    t.boolean  "employee"
    t.boolean  "workorder_assignability"
    t.boolean  "client"
    t.integer  "login_count",             :default => 0,    :null => false
    t.integer  "failed_login_count",      :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.text     "notes"
    t.boolean  "active",                  :default => true
    t.datetime "edited_at"
    t.string   "edited_by"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "created_by"
    t.string   "company_name"
  end

  create_table "work_orders", :force => true do |t|
    t.string   "subject",                             :null => false
    t.text     "description",                         :null => false
    t.boolean  "closed"
    t.string   "closed_by"
    t.datetime "closed_date"
    t.text     "resolution"
    t.integer  "user_id",                             :null => false
    t.integer  "assigned_to_id"
    t.text     "assigned_to_username"
    t.integer  "priority_list_id"
    t.integer  "status_id",            :default => 1, :null => false
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "task_id"
    t.string   "purchase_order"
    t.string   "instructions"
    t.string   "building"
    t.string   "contact"
    t.string   "technical_notes"
    t.integer  "building_id"
    t.string   "job_number"
    t.string   "invoice_number"
  end

end
