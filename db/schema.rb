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

ActiveRecord::Schema.define(:version => 20171115133848) do

# Could not dump table "announcements" because of following StandardError
#   Unknown type 'json' for column 'message'

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "billing_activity_logs", :force => true do |t|
    t.integer  "company_id"
    t.integer  "event_type"
    t.string   "event_action"
    t.text     "event_details"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "buildings", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "buildings", ["company_id"], :name => "idx_buildings_company_id"

  create_table "callcenter_plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "max_customers"
    t.integer  "max_outlets"
    t.string   "plan_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "max_users"
  end

  create_table "category_printing_rules", :force => true do |t|
    t.integer  "location_id"
    t.integer  "item_category_id"
    t.integer  "invoice_template_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "combo_items", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "item_id"
    t.integer  "combo_section_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "pre_select",       :default => false
    t.decimal  "additional_price", :default => 0.0
  end

  add_index "combo_items", ["combo_section_id"], :name => "idx_combo_items_combo_section_id"
  add_index "combo_items", ["parent_id"], :name => "idx_combo_items_parent_id"

  create_table "combo_order_items", :force => true do |t|
    t.integer  "order_item_id"
    t.integer  "item_id"
    t.string   "item_name"
    t.decimal  "amount"
    t.decimal  "additional_price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "combo_section_id"
    t.decimal  "computed_cost"
  end

  add_index "combo_order_items", ["order_item_id"], :name => "idx_combo_order_items_order_item_id"

  create_table "combo_sections", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "sequence_no"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "allows_skip", :default => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "country"
    t.string   "time_zone"
    t.string   "logo"
    t.integer  "orders_count",                                  :default => 0,          :null => false
    t.integer  "walk_dine_plan_id"
    t.integer  "callcenter_plan_id"
    t.string   "subscription_id"
    t.integer  "setup_state_id"
    t.integer  "users_count"
    t.integer  "locations_count"
    t.integer  "customers_count"
    t.integer  "items_count"
    t.string   "cancel_password",                               :default => "1234"
    t.integer  "support_plan_id"
    t.string   "business_end_time",                             :default => "00:00:00"
    t.boolean  "is_active",                                     :default => true
    t.integer  "plan_quantity",                                 :default => 1
    t.integer  "owner_id"
    t.string   "api_key"
    t.integer  "menu_version_no",                               :default => 0
    t.boolean  "web_order_add_on",                              :default => false
    t.boolean  "staff_can_create_area",                         :default => true
    t.integer  "online_plan_id"
    t.boolean  "dm_can_record_payment",                         :default => false
    t.boolean  "has_referral",                                  :default => false
    t.boolean  "staff_can_override_location",                   :default => false
    t.boolean  "staff_can_split_bill",                          :default => false
    t.boolean  "accept_scheduled_order",                        :default => false
    t.integer  "inventory_plan_id",                             :default => 0
    t.boolean  "inventory_allow_update_price_on_stock_receipt", :default => false
    t.boolean  "inventory_show_current_stock_in_stock_take",    :default => false
    t.integer  "sms_plan_id"
    t.datetime "next_renewal_date"
    t.integer  "previous_sms_count",                            :default => 0
    t.integer  "current_sms_count",                             :default => 0
    t.boolean  "powa_pos",                                      :default => false
    t.boolean  "has_tips",                                      :default => false
    t.boolean  "has_customer_group",                            :default => false
    t.boolean  "require_password_to_modify",                    :default => true
    t.boolean  "has_loyalty",                                   :default => false
    t.string   "subscription_status"
    t.datetime "trial_start"
    t.datetime "trial_end"
    t.datetime "current_term_start"
    t.datetime "current_term_end"
    t.datetime "activated_at"
    t.datetime "cancelled_at"
    t.string   "cancel_reason"
    t.boolean  "is_referral_mandatory",                         :default => false
    t.integer  "order_seq",                                     :default => 0
    t.integer  "loyalty_plan_id"
    t.string   "contact_number"
    t.boolean  "inventory_allow_update_price_when_raise_po",    :default => false
    t.boolean  "post_order_by_form_submit",                     :default => false
    t.boolean  "no_of_person_mandatory_on_dinein",              :default => false
    t.string   "address_labels"
    t.string   "gateway_customer_id"
    t.integer  "payment_gateway",                               :default => 1
    t.boolean  "has_location_wise_order_sequence",              :default => false
  end

  add_index "companies", ["api_key"], :name => "index_companies_on_api_key"

  create_table "company_internal_notes", :force => true do |t|
    t.integer  "company_id"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "company_invoices", :force => true do |t|
    t.integer  "company_id"
    t.string   "gateway_order_no"
    t.string   "gateway_invoice_no"
    t.string   "chargebee_invoice_no"
    t.decimal  "amount"
    t.datetime "gateway_updated_time"
    t.datetime "chargebee_updated_time"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.text     "invoice_details"
    t.decimal  "refund_amount"
    t.string   "status"
    t.datetime "invoice_date"
    t.boolean  "is_recurring",           :default => true
    t.text     "comments"
    t.integer  "payment_gateway",        :default => 1
  end

  create_table "consignment_items", :force => true do |t|
    t.integer  "consignment_id"
    t.integer  "item_id"
    t.integer  "ingredient_id"
    t.integer  "supplier_id"
    t.decimal  "quantity"
    t.string   "unit_name"
    t.string   "unit_text"
    t.decimal  "unit_value"
    t.decimal  "unit_price"
    t.decimal  "cost"
    t.decimal  "received"
    t.decimal  "opening_balance"
    t.decimal  "closing_balance"
    t.integer  "delivery_location_id"
    t.integer  "inventory_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "consignment_items", ["consignment_id"], :name => "idx_consignment_items_consignment_id"
  add_index "consignment_items", ["ingredient_id"], :name => "idx_consignment_items_ingredient_id"
  add_index "consignment_items", ["item_id"], :name => "idx_consignment_items_item_id"

  create_table "consignments", :force => true do |t|
    t.integer  "company_id"
    t.integer  "location_id"
    t.integer  "consignment_type", :default => 1
    t.string   "order_no"
    t.datetime "due_date"
    t.integer  "movement_type"
    t.text     "comments"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "invoice_no"
    t.integer  "status",           :default => 1
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "sent_by"
  end

  create_table "customer_groups", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customer_loyalty_histories", :force => true do |t|
    t.integer  "company_id"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "order_id"
    t.decimal  "opening_balance", :default => 0.0
    t.decimal  "earned",          :default => 0.0
    t.decimal  "redeemed",        :default => 0.0
    t.decimal  "closing_balance", :default => 0.0
    t.string   "status"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "location_id"
    t.boolean  "is_updated",      :default => false
  end

  add_index "customer_loyalty_histories", ["created_at"], :name => "idx_customer_loyalty_histories_created_at"

  create_table "customer_notes", :force => true do |t|
    t.text     "notes"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "customer_notes", ["customer_id"], :name => "idx_customer_notes_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "alt_telephone_number"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "company_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "orders_count",         :default => 0
    t.datetime "last_ordered_at"
    t.integer  "web_user_id"
    t.integer  "dob_year"
    t.integer  "dob_month"
    t.integer  "dob_day"
    t.integer  "gender"
    t.integer  "customer_group_id"
    t.decimal  "loyalty"
    t.integer  "crm_redemption_code"
  end

  add_index "customers", ["alt_telephone_number"], :name => "idx_customers_alt_telephone_number_txt"
  add_index "customers", ["company_id"], :name => "idx_customers_company_id"
  add_index "customers", ["telephone"], :name => "idx_customers_telephone_txt"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "delivery_addresses", :force => true do |t|
    t.integer  "customer_id"
    t.string   "country"
    t.string   "city"
    t.integer  "area_id"
    t.string   "building"
    t.string   "room_no"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "landmark"
    t.string   "street"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "deleted",     :default => false
  end

  add_index "delivery_addresses", ["customer_id"], :name => "idx_delivery_addresses_customer_id"

# Could not dump table "delivery_manager_orders" because of following StandardError
#   Unknown type 'json' for column 'value'

  create_table "dinein_areas", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "sequence_no", :default => 0
    t.boolean  "deleted",     :default => false
  end

  add_index "dinein_areas", ["location_id"], :name => "dinein_areas_location_id_index"

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "discount_type"
    t.decimal  "rate"
    t.boolean  "status",                :default => true
    t.boolean  "deleted",               :default => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "on_total",              :default => false
    t.integer  "register_inventory_as"
    t.integer  "discount_level",        :default => 1
    t.boolean  "walkin",                :default => true
    t.boolean  "dinein",                :default => true
    t.boolean  "callcenter",            :default => true
    t.boolean  "takeaway",              :default => true
    t.boolean  "weborder",              :default => true
    t.string   "schedule_day"
    t.date     "schedule_start_date"
    t.date     "schedule_end_date"
    t.time     "schedule_start_time"
    t.time     "schedule_end_time"
  end

  create_table "exported_results", :force => true do |t|
    t.string   "report_name"
    t.string   "exported_url"
    t.integer  "company_id"
    t.integer  "user_id"
    t.boolean  "is_uploaded",     :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "date_range_from"
    t.datetime "date_range_to"
  end

  create_table "global_item_preferences", :force => true do |t|
    t.integer  "company_id"
    t.decimal  "vat_rate",         :default => 0.0
    t.decimal  "food_cost",        :default => 0.0
    t.decimal  "waste",            :default => 0.0
    t.text     "critical_control"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

# Could not dump table "happenings" because of following StandardError
#   Unknown type 'json' for column 'details'

  create_table "ingredient_categories", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.integer  "ingredient_type",        :default => 1
    t.integer  "company_id"
    t.string   "name"
    t.string   "description"
    t.integer  "ingredient_category_id"
    t.integer  "measurement_unit_id"
    t.string   "buying_unit_text"
    t.decimal  "buying_unit_value"
    t.string   "buying_sub_unit_text"
    t.decimal  "buying_sub_unit_value"
    t.decimal  "net_weight"
    t.decimal  "last_buying_unit_price"
    t.decimal  "cost_per_unit"
    t.boolean  "deleted",                :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "yield",                  :default => 1.0
  end

  add_index "ingredients", ["company_id"], :name => "ingredients_company_id_index"
  add_index "ingredients", ["ingredient_category_id"], :name => "ingredients_ingredient_category_id_index"
  add_index "ingredients", ["measurement_unit_id"], :name => "ingredients_measurement_unit_id_index"

  create_table "ingredients_suppliers", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "supplier_id"
    t.decimal  "buying_unit_price"
    t.boolean  "is_default",        :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "inventories", :force => true do |t|
    t.integer  "item_id"
    t.integer  "location_id"
    t.integer  "user_id"
    t.decimal  "current_stock"
    t.decimal  "reorder_level"
    t.decimal  "reorder_quantity"
    t.boolean  "roll_over",        :default => false
    t.integer  "supplier_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "notify_users"
    t.integer  "inventory_type",   :default => 1
    t.integer  "company_id"
    t.integer  "ingredient_id"
    t.boolean  "track_inventory",  :default => true
  end

  add_index "inventories", ["created_at"], :name => "inventories_created_at_index"
  add_index "inventories", ["ingredient_id"], :name => "inventories_ingredient_id_index"
  add_index "inventories", ["inventory_type"], :name => "inventories_inventory_type_index"
  add_index "inventories", ["item_id"], :name => "inventories_item_id_index"
  add_index "inventories", ["location_id"], :name => "inventories_location_id_index"
  add_index "inventories", ["user_id"], :name => "inventories_user_id_index"

  create_table "inventory_histories", :force => true do |t|
    t.integer  "inventory_id"
    t.integer  "item_id"
    t.integer  "location_id"
    t.decimal  "opening_balance"
    t.decimal  "received"
    t.decimal  "issued"
    t.decimal  "closing_balance"
    t.integer  "user_id"
    t.integer  "supplier_id"
    t.string   "status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "movement_type"
    t.text     "comments"
    t.decimal  "value"
    t.integer  "ingredient_id"
    t.string   "invoice_no"
    t.integer  "source_location_id"
    t.integer  "recipe_item_id"
    t.integer  "reference_type"
    t.integer  "reference_id"
    t.boolean  "invalidated"
  end

  add_index "inventory_histories", ["created_at"], :name => "inventory_histories_created_at_index"
  add_index "inventory_histories", ["ingredient_id"], :name => "inventory_histories_ingredient_id_index"
  add_index "inventory_histories", ["inventory_id"], :name => "inventory_histories_inventory_id_index"
  add_index "inventory_histories", ["item_id"], :name => "inventory_histories_item_id_index"
  add_index "inventory_histories", ["location_id"], :name => "inventory_histories_location_id_index"

  create_table "inventory_modifiers", :force => true do |t|
    t.integer  "item_id"
    t.integer  "inventory_modifier_item_id"
    t.integer  "sequence_no"
    t.integer  "modifier_group_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "inventory_modifiers", ["item_id"], :name => "inventory_modifiers_item_id_index"

  create_table "invoice_templates", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.boolean  "show_brand_logo"
    t.string   "title_label"
    t.string   "invoice_number_label"
    t.string   "customer_label"
    t.string   "served_by_label"
    t.boolean  "show_breakdown"
    t.string   "sub_total_label"
    t.string   "tax_label"
    t.string   "to_pay_label"
    t.boolean  "show_header"
    t.text     "header_content"
    t.boolean  "show_footer"
    t.text     "footer_content"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "show_delivery_address"
    t.boolean  "show_price",            :default => true
    t.boolean  "show_only_new_items",   :default => false
    t.boolean  "show_running_orders",   :default => true
    t.boolean  "simple_text_invoice",   :default => false
    t.boolean  "show_history",          :default => true
    t.boolean  "show_modifiers",        :default => true
    t.boolean  "show_notes",            :default => true
    t.boolean  "show_combo_items",      :default => true
    t.boolean  "show_loyalty",          :default => false
    t.boolean  "print_larger",          :default => false
  end

  create_table "item_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "company_id"
    t.integer  "sequence_no", :default => 0
    t.boolean  "deleted",     :default => false
    t.string   "color",       :default => ""
  end

  create_table "item_preferences", :force => true do |t|
    t.integer  "item_id"
    t.decimal  "vat_rate",         :default => 0.0
    t.decimal  "food_cost",        :default => 0.0
    t.decimal  "waste",            :default => 0.0
    t.text     "critical_control"
    t.text     "method"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "item_symbols", :force => true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_symbols", ["item_id"], :name => "idx_item_symbols_item_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "item_category_id"
    t.decimal  "price"
    t.string   "preparation_time"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.decimal  "packing_charge",                       :default => 0.0
    t.integer  "company_id"
    t.boolean  "active",                               :default => true
    t.string   "image"
    t.integer  "item_type",                            :default => 1
    t.integer  "parent_id",                            :default => 0
    t.boolean  "deleted",                              :default => false
    t.string   "display_name"
    t.boolean  "hide_from_pos",                        :default => false
    t.boolean  "is_paid_modifier",                     :default => false
    t.boolean  "show_on_web",                          :default => true
    t.string   "item_code",              :limit => 30
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "has_recipe",                           :default => false
    t.decimal  "computed_cost"
    t.integer  "measurement_unit_id"
    t.string   "buying_unit_text"
    t.decimal  "buying_unit_value"
    t.string   "buying_sub_unit_text"
    t.decimal  "buying_sub_unit_value"
    t.decimal  "net_weight"
    t.decimal  "last_buying_unit_price"
    t.boolean  "track_consumption",                    :default => false
    t.string   "barcode"
    t.boolean  "is_inventory_modifier",                :default => false
    t.decimal  "loyalty_value"
    t.boolean  "is_custom_loyalty",                    :default => false
  end

  add_index "items", ["company_id"], :name => "idx_items_company_id"
  add_index "items", ["parent_id"], :name => "idx_items_parent_id"

  create_table "items_ingredients", :force => true do |t|
    t.integer  "item_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "items_locations", :force => true do |t|
    t.integer "item_id"
    t.integer "location_id"
    t.decimal "price"
    t.decimal "packing_charge", :default => 0.0
    t.decimal "tax_rate",       :default => 0.0
    t.decimal "tax",            :default => 0.0
  end

  add_index "items_locations", ["item_id"], :name => "idx_items_locations_item_id"
  add_index "items_locations", ["location_id"], :name => "idx_items_locations_location_id"

  create_table "items_modifiers", :force => true do |t|
    t.integer "item_id"
    t.integer "modifier_id"
    t.boolean "mandatory",         :default => false
    t.integer "sequence_no",       :default => 0
    t.integer "modifier_group_id", :default => 0
  end

  add_index "items_modifiers", ["item_id"], :name => "idx_items_modifiers_item_id"
  add_index "items_modifiers", ["modifier_id"], :name => "idx_items_modifiers_modifier_id"

  create_table "items_suppliers", :force => true do |t|
    t.integer  "item_id"
    t.integer  "supplier_id"
    t.decimal  "buying_unit_price"
    t.boolean  "is_default",        :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "items_tags", :force => true do |t|
    t.integer  "item_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kitchen_queues", :force => true do |t|
    t.integer  "order_type_id"
    t.integer  "order_id"
    t.integer  "order_status_id"
    t.integer  "location_id"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "kitchen_queues", ["company_id"], :name => "idx_kitchen_queues_company_id"
  add_index "kitchen_queues", ["location_id"], :name => "idx_kitchen_queues_location_id"

  create_table "location_delivery_areas", :force => true do |t|
    t.integer  "location_id"
    t.integer  "area_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.decimal  "min_amount",  :default => 0.0
  end

  add_index "location_delivery_areas", ["area_id"], :name => "idx_location_delivery_areas_area_id"
  add_index "location_delivery_areas", ["location_id"], :name => "idx_location_delivery_areas_location_id"

  create_table "location_sequences", :force => true do |t|
    t.integer  "location_id"
    t.integer  "order_seq"
    t.string   "order_seq_prefix"
    t.datetime "order_seq_reset_time"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.integer  "company_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "address_2"
    t.string   "city"
    t.string   "country"
    t.boolean  "status",                              :default => true
    t.string   "api_key"
    t.boolean  "is_delivery_disabled",                :default => true
    t.boolean  "is_service_disabled",                 :default => true
    t.boolean  "show_delivery_orders_in_service",     :default => false
    t.boolean  "has_tax_on_item",                     :default => false
    t.string   "time_zone"
    t.boolean  "is_category_print_rule_enabled",      :default => false
    t.boolean  "is_pay_by_card_enabled_for_delivery", :default => false
    t.boolean  "pssl",                                :default => false
    t.boolean  "track_inventory",                     :default => false
    t.integer  "location_type",                       :default => 1
    t.boolean  "is_token_disabled",                   :default => true
    t.integer  "tokens_count",                        :default => 1
    t.integer  "token_starts_from",                   :default => 1
    t.datetime "token_reset_time"
    t.string   "show_orders_in_dispatch_screen"
  end

  create_table "login_histories", :force => true do |t|
    t.integer  "user_id"
    t.datetime "login_time"
    t.datetime "logout_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "login_histories", ["user_id"], :name => "idx_login_histories_user_id"

  create_table "loyalties", :force => true do |t|
    t.integer  "company_id"
    t.decimal  "value_for_points"
    t.boolean  "callcenter",       :default => false
    t.boolean  "walkin",           :default => false
    t.boolean  "dinein",           :default => false
    t.boolean  "weborder",         :default => false
    t.boolean  "takeaway",         :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.decimal  "min_redeem_value", :default => 0.0
    t.decimal  "max_redeem_value", :default => 0.0
  end

  create_table "measurement_units", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "modifier_groups", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "modifiers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "modifiers_order_items", :force => true do |t|
    t.integer "modifier_id"
    t.integer "order_item_id"
    t.boolean "mandatory",     :default => false
  end

  add_index "modifiers_order_items", ["order_item_id"], :name => "idx_modifiers_order_items_order_item_id"

  create_table "modify_reasons", :force => true do |t|
    t.string   "reason"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "company_id"
    t.boolean  "deleted",    :default => false
  end

  create_table "notices", :force => true do |t|
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "one_time_payments", :force => true do |t|
    t.integer  "company_id"
    t.string   "item_name"
    t.integer  "quantity"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_item_modify_histories", :force => true do |t|
    t.integer  "order_item_id"
    t.integer  "modify_reason_id"
    t.integer  "agent_id"
    t.string   "modification_type"
    t.decimal  "old_value"
    t.decimal  "new_value"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "order_item_modify_histories", ["order_item_id"], :name => "idx_order_item_modify_histories_order_item_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "amount"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "deleted",                :default => false
    t.decimal  "price",                  :default => 0.0
    t.decimal  "packing_charge",         :default => 0.0
    t.boolean  "modified",               :default => false
    t.decimal  "packing_base_price",     :default => 0.0
    t.integer  "company_id"
    t.boolean  "is_new",                 :default => true
    t.integer  "kitchen_queue_id"
    t.decimal  "tax_base_price",         :default => 0.0
    t.decimal  "tax",                    :default => 0.0
    t.integer  "print_batch_no"
    t.integer  "parent_id",              :default => 0
    t.boolean  "has_paid_modifier",      :default => false
    t.integer  "user_id"
    t.decimal  "computed_cost"
    t.boolean  "has_inventory_modifier"
    t.decimal  "qty_dec"
    t.decimal  "loyalty_value"
    t.integer  "discount_id"
    t.integer  "discount_type"
    t.decimal  "discount_amount"
    t.decimal  "discount_rate"
    t.text     "item_note"
    t.integer  "register_inventory_as"
    t.integer  "issued_as"
  end

  add_index "order_items", ["item_id"], :name => "idx_order_items_item_id"
  add_index "order_items", ["order_id"], :name => "idx_order_items_order_id"
  add_index "order_items", ["parent_id"], :name => "idx_order_items_parent_id_new1"

  create_table "order_items_modify_reasons", :force => true do |t|
    t.integer "order_item_id"
    t.integer "modify_reason_id"
  end

  create_table "order_status_histories", :force => true do |t|
    t.integer  "order_id"
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "order_status_histories", ["order_id"], :name => "idx_order_status_histories_order_id"

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "callcenter_display_name"
    t.string   "dinein_display_name"
    t.string   "walkin_display_name"
    t.string   "weborder_display_name"
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.decimal  "total_amount"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "delivery_address_id"
    t.text     "notes"
    t.integer  "reasons_for_cancellation_id"
    t.datetime "delivered_at"
    t.integer  "driver_id"
    t.integer  "company_id"
    t.integer  "location_id"
    t.datetime "picked_at"
    t.datetime "ready_at"
    t.integer  "order_type_id"
    t.integer  "table_id"
    t.string   "table_alpha"
    t.decimal  "amount_collected"
    t.string   "credit_card_digits"
    t.integer  "number_of_person"
    t.boolean  "is_take_away",                :default => false
    t.string   "order_no"
    t.datetime "started_at"
    t.decimal  "total_discount",              :default => 0.0
    t.string   "card_type"
    t.integer  "print_batch_no"
    t.decimal  "cc_split_payment"
    t.string   "source"
    t.integer  "updated_by"
    t.integer  "referral_id"
    t.boolean  "has_checks",                  :default => false
    t.decimal  "computed_cost"
    t.integer  "token_no"
    t.boolean  "redeem_crm"
    t.integer  "payment_received_by"
    t.datetime "scheduled_on"
    t.datetime "scheduled_at"
  end

  add_index "orders", ["company_id", "location_id"], :name => "idx_orders_company_and_location"
  add_index "orders", ["created_at"], :name => "idx_orders_created_at"
  add_index "orders", ["customer_id"], :name => "idx_orders_customer_id"
  add_index "orders", ["location_id"], :name => "idx_orders_location_id"
  add_index "orders", ["order_status_id"], :name => "idx_orders_order_status_id"

  create_table "orders_checks", :force => true do |t|
    t.integer  "order_id"
    t.text     "items"
    t.string   "surcharges"
    t.string   "discounts"
    t.decimal  "total_amount"
    t.decimal  "amount_collected"
    t.boolean  "paid",             :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "tax"
  end

  create_table "orders_discounts", :force => true do |t|
    t.integer  "order_id"
    t.integer  "discount_id"
    t.string   "discount_name"
    t.integer  "discount_type"
    t.decimal  "discount_amount"
    t.decimal  "discount_rate"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "discount_on_total",     :default => false
    t.integer  "register_inventory_as"
  end

  add_index "orders_discounts", ["order_id"], :name => "idx_orders_discounts_order_id"

  create_table "orders_payments", :force => true do |t|
    t.integer  "order_id"
    t.string   "payment_type_name"
    t.integer  "payment_type_id"
    t.decimal  "amount"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "reference_code"
    t.integer  "orders_check_id"
    t.decimal  "tips",              :default => 0.0
    t.decimal  "amount_collected",  :default => 0.0
  end

  add_index "orders_payments", ["order_id"], :name => "idx_orders_payments_order_id"

  create_table "orders_surcharges", :force => true do |t|
    t.integer  "order_id"
    t.integer  "surcharge_id"
    t.string   "surcharge_name"
    t.integer  "surcharge_type"
    t.decimal  "surcharge_rate"
    t.decimal  "surcharge_amount"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "orders_surcharges", ["order_id"], :name => "idx_orders_surcharges_order_id"

  create_table "paid_modifiers", :force => true do |t|
    t.integer  "item_id"
    t.integer  "paid_modifier_item_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "sequence_no",           :default => 0
    t.integer  "modifier_group_id",     :default => 0
  end

  add_index "paid_modifiers", ["item_id"], :name => "idx_paid_modifiers_item_id"

  create_table "payment_types", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "icon"
    t.integer  "company_id"
    t.integer  "location_id"
    t.boolean  "primary",                 :default => false
    t.boolean  "deleted",                 :default => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "requires_reference_code", :default => false
    t.string   "account_code"
    t.integer  "icon_id"
    t.integer  "sequence_no"
  end

  create_table "permissions", :force => true do |t|
    t.string   "subject_class"
    t.string   "action"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "group_id"
  end

  create_table "permissions_roles", :force => true do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  add_index "permissions_roles", ["role_id"], :name => "idx_permissions_roles_role_id"

  create_table "pos_items_caches", :force => true do |t|
    t.string   "cache_items_key"
    t.text     "cache_items_value"
    t.integer  "location_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "print_jobs", :force => true do |t|
    t.integer  "order_id"
    t.integer  "template_id"
    t.integer  "printer_id"
    t.integer  "location_id"
    t.boolean  "was_printed",    :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "api_key"
    t.boolean  "was_queued",     :default => false
    t.integer  "print_batch_no"
  end

  add_index "print_jobs", ["api_key"], :name => "idx_print_jobs_api_key"

  create_table "printers", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "ip_address"
    t.string   "email_address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "printing_rules", :force => true do |t|
    t.integer  "location_id"
    t.integer  "invoice_template_id"
    t.integer  "printer_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "order_type_id"
    t.integer  "case_id",             :default => 1
  end

  add_index "printing_rules", ["case_id"], :name => "printing_rules_case_id_index"
  add_index "printing_rules", ["location_id"], :name => "printing_rules_location_id"
  add_index "printing_rules", ["order_type_id"], :name => "printing_rules_order_type_id_index"

  create_table "purchase_histories", :force => true do |t|
    t.integer  "company_id"
    t.integer  "location_id"
    t.integer  "item_id"
    t.integer  "ingredient_id"
    t.decimal  "opening_balance"
    t.decimal  "opening_cost"
    t.decimal  "purchase_qty"
    t.decimal  "purchase_price"
    t.decimal  "total_purchase"
    t.decimal  "closing_balance"
    t.decimal  "cost_per_unit"
    t.integer  "transaction_id"
    t.boolean  "cpu_not_updated"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "raw_sms_messages", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.text     "recipients"
    t.text     "body"
    t.integer  "sms_source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reasons_for_cancellations", :force => true do |t|
    t.string   "reason"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "company_id"
    t.boolean  "deleted",    :default => false
  end

  create_table "referrals", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "default_page"
    t.integer  "company_id"
    t.string   "display_name"
  end

  create_table "semi_finished_ingredients", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

# Could not dump table "sms_configs" because of following StandardError
#   Unknown type 'json' for column 'sms_details'

  create_table "sms_histories", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "opening_balance", :default => 0
    t.integer  "closing_balance", :default => 0
    t.integer  "sent_sms_count",  :default => 0
    t.string   "comments"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "sms_plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "max_messages"
    t.string   "plan_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "stock_take_items", :force => true do |t|
    t.integer  "stock_take_id"
    t.integer  "item_id"
    t.integer  "ingredient_id"
    t.decimal  "buy_unit_val"
    t.decimal  "buy_sub_unit_val"
    t.decimal  "measure_unit_val"
    t.decimal  "counted_stock"
    t.integer  "inventory_type"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.decimal  "opening_balance"
    t.decimal  "purchase"
    t.decimal  "transferred_in"
    t.decimal  "cash_purchase"
    t.decimal  "received_other"
    t.decimal  "batch_production"
    t.decimal  "transferred_out"
    t.decimal  "sold"
    t.decimal  "cancelled"
    t.decimal  "wasted"
    t.decimal  "issued_other"
    t.decimal  "promo"
    t.decimal  "internal_consumption"
    t.decimal  "used_for_batch_production"
    t.decimal  "closing_balance"
    t.decimal  "adjusted_by_issue"
    t.decimal  "adjusted_by_received"
    t.decimal  "stock_diff"
    t.decimal  "stock_cost_diff"
    t.boolean  "auto_reconcile",            :default => false
    t.decimal  "opening_stock_value"
    t.decimal  "closing_stock_value"
    t.decimal  "sales_return"
    t.decimal  "counted_stock_value"
  end

  add_index "stock_take_items", ["created_at"], :name => "stock_take_items_created_at_index"
  add_index "stock_take_items", ["ingredient_id"], :name => "stock_take_items_ingredient_id_index"
  add_index "stock_take_items", ["item_id"], :name => "stock_take_items_item_id_index"
  add_index "stock_take_items", ["stock_take_id"], :name => "stock_take_items_stock_take_id_index"

  create_table "stock_takes", :force => true do |t|
    t.string   "ref_no"
    t.integer  "company_id"
    t.integer  "location_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "status",               :default => 1
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "stock_reconciliation", :default => false
    t.string   "comments"
  end

  add_index "stock_takes", ["company_id"], :name => "stock_takes_company_id_index"
  add_index "stock_takes", ["end_date"], :name => "stock_takes_end_date_index"
  add_index "stock_takes", ["location_id"], :name => "stock_takes_location_id_index"
  add_index "stock_takes", ["start_date"], :name => "stock_takes_start_date_index"

  create_table "suppliers", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
  end

  create_table "support_team_member_activities", :force => true do |t|
    t.integer  "support_team_member_id"
    t.integer  "for_which_company"
    t.string   "action_name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "support_team_members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "role_id"
  end

  create_table "surcharges", :force => true do |t|
    t.integer  "location_id"
    t.string   "name"
    t.integer  "surcharge_type"
    t.decimal  "rate"
    t.boolean  "deleted",        :default => false
    t.boolean  "callcenter",     :default => false
    t.boolean  "walkin",         :default => false
    t.boolean  "dinein",         :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "weborder",       :default => false
    t.boolean  "takeaway",       :default => false
  end

# Could not dump table "tables" because of following StandardError
#   Unknown type 'json' for column 'current_orders'

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tax_rates", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.decimal  "rate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tmp_dashboards", :force => true do |t|
    t.integer  "company_id"
    t.string   "widget_name"
    t.text     "widget_value"
    t.string   "request_key"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "tmp_dashboards", ["request_key"], :name => "tmp_dashboards_request_key_index"
  add_index "tmp_dashboards", ["widget_name"], :name => "tmp_dashboards_widget_name_index"

  create_table "tmp_reports", :force => true do |t|
    t.integer  "company_id"
    t.string   "report_name"
    t.text     "params"
    t.text     "report_value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_critical_activity_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "action"
    t.text     "details"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.integer  "role_id"
    t.integer  "location_id"
    t.integer  "company_id"
    t.boolean  "deleted",                :default => false
    t.string   "image"
    t.integer  "last_notice_seen"
    t.string   "swipe_card_no"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "walk_dine_plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "max_users"
    t.integer  "max_outlets"
    t.string   "plan_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "web_order_settings", :force => true do |t|
    t.integer  "company_id"
    t.string   "web_site_url"
    t.string   "bg_color"
    t.string   "header_bg_color"
    t.string   "header_link_color"
    t.string   "header_text_color"
    t.text     "delivery_schedule"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "auto_confirm_threshold", :default => 0
    t.string   "allowed_domains"
    t.string   "body_bg_color"
    t.text     "custom_css"
    t.text     "custom_font"
  end

  create_table "xero_settings", :force => true do |t|
    t.integer  "company_id"
    t.string   "tax"
    t.string   "product_accounts"
    t.string   "invoice_status"
    t.string   "purchase_status"
    t.string   "invoice_payment_date"
    t.string   "discrepancy_account"
    t.string   "refund_account"
    t.string   "errors_account"
    t.string   "default_discount_account"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.datetime "xero_sync_time"
    t.datetime "xero_last_sync_time"
    t.boolean  "status",                   :default => false
    t.string   "access_token"
    t.string   "access_key"
    t.string   "org_code"
    t.string   "org_name"
    t.string   "session_handle"
    t.boolean  "location_enabled",         :default => false
    t.text     "location_code"
    t.boolean  "active",                   :default => true
  end

end
