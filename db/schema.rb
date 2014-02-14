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

ActiveRecord::Schema.define(:version => 20140214085348) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["name"], :name => "index_clients_on_name"

  create_table "contact_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "client_id"
    t.integer  "contacttype_id"
    t.string   "value"
    t.integer  "employee_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"
  add_index "contacts", ["contacttype_id"], :name => "index_contacts_on_contacttype_id"
  add_index "contacts", ["employee_id"], :name => "index_contacts_on_employee_id"

  create_table "contacttypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "employees", ["client_id"], :name => "index_employees_on_client_id"

  create_table "messages", :force => true do |t|
    t.integer  "negotiation_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "messages", ["negotiation_id", "user_id"], :name => "index_messages_on_negotiation_id_and_user_id", :unique => true
  add_index "messages", ["negotiation_id"], :name => "index_messages_on_negotiation_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "negotiations", :force => true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "negotiations", ["client_id"], :name => "index_negotiations_on_client_id"
  add_index "negotiations", ["user_id"], :name => "index_negotiations_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["client_id"], :name => "index_relationships_on_client_id"
  add_index "relationships", ["user_id", "client_id"], :name => "index_relationships_on_user_id_and_client_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           :default => false
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
