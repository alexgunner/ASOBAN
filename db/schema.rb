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

ActiveRecord::Schema.define(version: 20171101133506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"
  enable_extension "unaccent"

  create_table "abouts", force: :cascade do |t|
    t.text     "mission"
    t.text     "vision"
    t.string   "document_title"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "statute_pdf_file_name"
    t.string   "statute_pdf_content_type"
    t.integer  "statute_pdf_file_size"
    t.datetime "statute_pdf_updated_at"
    t.text     "history"
    t.text     "philosophy"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "can_manage_contact"
    t.boolean  "can_manage_faq"
    t.boolean  "can_manage_about"
    t.boolean  "can_manage_articles"
    t.boolean  "can_manage_events"
    t.boolean  "can_manage_links"
    t.boolean  "can_manage_multimedia"
    t.boolean  "can_manage_carousel"
    t.boolean  "can_manage_newsletter"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "can_manage_admins"
    t.boolean  "can_manage_boxes"
    t.boolean  "can_manage_messages"
    t.boolean  "can_manage_categories"
  end

  create_table "agenda_entries", force: :cascade do |t|
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "title"
    t.index ["event_id"], name: "index_agenda_entries_on_event_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
  end

  create_table "boxes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cards", force: :cascade do |t|
    t.boolean  "twitter"
    t.boolean  "certifications"
    t.boolean  "newsfeed"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "carousels", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
    t.string   "pic2_file_name"
    t.string   "pic2_content_type"
    t.integer  "pic2_file_size"
    t.datetime "pic2_updated_at"
    t.string   "pic3_file_name"
    t.string   "pic3_content_type"
    t.integer  "pic3_file_size"
    t.datetime "pic3_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "descroption"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "ci"
    t.string   "email"
    t.string   "city"
    t.string   "institution_name"
    t.string   "nit"
    t.string   "phone"
    t.string   "legal_address"
    t.string   "charge"
    t.date     "start_date"
    t.string   "observations"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "state"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "address"
    t.string   "emails"
    t.string   "phone_numbers"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "city"
    t.string   "fax"
    t.string   "mailbox"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "registration_image_file_name"
    t.string   "registration_image_content_type"
    t.integer  "registration_image_file_size"
    t.datetime "registration_image_updated_at"
    t.string   "registration_pdf_file_name"
    t.string   "registration_pdf_content_type"
    t.integer  "registration_pdf_file_size"
    t.datetime "registration_pdf_updated_at"
    t.string   "agenda_title",                    default: "Agenda"
    t.string   "speakers_title",                  default: "Conferencistas"
    t.string   "sponsors_title",                  default: "Auspiciadores"
    t.string   "registration_title",              default: "Registro"
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["event_id"], name: "index_speakers_on_event_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["event_id"], name: "index_sponsors_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "admin_id"
    t.index ["admin_id"], name: "index_users_on_admin_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "agenda_entries", "events"
  add_foreign_key "articles", "categories"
  add_foreign_key "speakers", "events"
  add_foreign_key "sponsors", "events"
  add_foreign_key "users", "admins"
end
