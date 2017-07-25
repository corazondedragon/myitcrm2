class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :business_name
      t.string :business_slogan
      t.string :business_phone
      t.string :business_toll_free
      t.string :business_fax
      t.string :business_mobile
      t.string :business_email
      t.string :technician_email
      t.string :no_reply_email
      t.string :accountant_email
      t.string :service_email
      t.string :business_address
      t.string :business_city
      t.string :business_state
      t.string :business_zip_code
      t.string :business_country
      t.string :business_number
      t.string :meta_tags
      t.string :tax_type
      t.decimal :tax_rate
      t.boolean :logout_limit
      t.integer :idle_time
      t.string :version
      t.string :default_invoice_note
      t.string :default_invoice_terms

      t.timestamps
    end
  end
end
