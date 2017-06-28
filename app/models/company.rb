class Company < ActiveRecord::Base
  attr_accessible :accountant_email, :business_address, :business_city, :business_country, :business_email, :business_fax, :business_mobile, :business_name, :business_number, :business_phone, :business_slogan, :business_state, :business_toll_free, :business_zip_code, :default_invoice_note, :default_invoice_terms, :idle_time, :logout_limit, :meta_tags, :no_reply_email, :service_email, :tax_rate, :tax_type, :technician_email, :version


validates_presence_of :business_name,
					  :business_slogan,
					  :business_phone,
					  :business_toll_free,
					  :business_fax,
					  :business_mobile,
					  :business_email,
					  :technician_email,
					  :no_reply_email,
					  :accountant_email,
					  :service_email,
					  :business_address,
					  :business_city,
					  :business_state,
					  :business_zip_code,
					  :business_country,
					  :business_number,
					  :meta_tags,
					  :tax_type,
					  :tax_rate,
					  :idle_time,
					  :version,
					  :default_invoice_note,
					  :default_invoice_terms

end
