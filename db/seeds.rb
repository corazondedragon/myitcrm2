# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
I18n.locale = ENV['LOCALE'].nil? ? 'en_AU' : ENV['LOCALE'] # Define locale

# create default administrator account
User.create!({
                 :username => 'admin',
                 :name => 'Company Admin',
                 :email => 'admin@example.com',
                 :password => 'password',
                 :password_confirmation => 'password',
                 :employee => true,
                 :workorder_assignability => true,
                 :client => false,
                 :role_id => '1'},
             :without_protection => true)


Role.create({
                :name => I18n.t('seeds.role.super'),
                :enabled => true,
                :list_position => '1'},
            :without_protection => true)

Role.create({
                :name => 'Technician',
                :enabled => true,
                :list_position => '2'},
            :without_protection => true)

Role.create({
                :name => 'Client',
                :enabled => true,
                :list_position => '3'},
            :without_protection => true)

# create default Supplier account
Supplier.create({
                    :company_name => 'Example',
                    :address => 'Unit 4/49 Fake Road',
                    :city => 'Sydney',
                    :state => 'NSW',
                    :zip => '2001',
                    :email => 'purchasing@example.com',
                    :phone => '02 9998 9996',
                    :contact_phone => '02 9998 9996',
                    :contact_name => 'Fred Smith',
                    :fax => '02 9998 9998',
                    :date_created => Time.now,
                    :active => true},
                :without_protection => true)
                

# create default record for the Company
Company.create({
      :business_name => 'business_name',
      :business_slogan => 'business_slogan',
      :business_phone => 'business_phone',
      :business_toll_free => 'business_toll_free',
      :business_fax => 'business_fax',
      :business_mobile => 'business_mobile',
      :business_email => 'business_email',
      :technician_email => 'technician_email',
      :no_reply_email => 'no_reply_email',
      :accountant_email => 'accountant_email',
      :service_email => 'service_email',
      :business_address => 'business_address',
      :business_city => 'business_city',
      :business_state => 'business_state',
      :business_zip_code => 'business_zip_code',
      :business_country => 'Canada',
      :business_number => 'business_number',
      :meta_tags => 'meta_tags',
      :tax_type => 'tax_type',
      :tax_rate => 'tax_rate',
      :logout_limit => true,
      :idle_time => '100',
      :version => '2.0.0',
      :default_invoice_note => 'Thankyou for your support and Business. All work is Guaranteed for up to 14 days from date of completion.',
      :default_invoice_terms => 'default_invoice_terms'},
	:without_protection => true)

      
      

# Adding Some default Permissions to get you started and assigning them to the default Admin account created above.
#
Permission.create({:name => 'Manage Users', :action => 'manage', :subject_class => 'User'}, :without_protection => true)
Permission.create({:name => 'Manage Work Orders', :action => 'manage', :subject_class => 'WorkOrder'}, :without_protection => true)
Permission.create({:name => 'Manage Settings', :action => 'manage', :subject_class => 'Setting'}, :without_protection => true)
Permission.create({:name => 'Update Own Profile', :action => 'update', :subject_class => 'User'}, :without_protection => true)
Permission.create({:name => 'Manage Invoices', :action => 'manage', :subject_class => 'Invoice'}, :without_protection => true)
Permission.create({:name => 'Manage Product Categories', :action => 'manage', :subject_class => 'ProductCategory'}, :without_protection => true)
Permission.create({:name => 'Manage Products', :action => 'manage', :subject_class => 'Product'}, :without_protection => true)
Permission.create({:name => 'View Products', :action => 'view', :subject_class => 'Product'}, :without_protection => true)
Permission.create({:name => 'Manage Replies', :action => 'manage', :subject_class => 'Reply'}, :without_protection => true)
Permission.create({:name => 'Manage Roles', :action => 'manage', :subject_class => 'Role'}, :without_protection => true)
Permission.create({:name => 'Manage Permissions', :action => 'manage', :subject_class => 'Permission'}, :without_protection => true)
Permission.create({:name => 'Manage Service Rates', :action => 'manage', :subject_class => 'ServiceRate'}, :without_protection => true)
Permission.create({:name => 'Manage Suppliers', :action => 'manage', :subject_class => 'Supplier'}, :without_protection => true)
Permission.create({:name => 'Manage Company', :action => 'manage', :subject_class => 'Company'}, :without_protection => true)

Permittable.create({:role_id => '1', :permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '3'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '5'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '6'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '7'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '9'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '10'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '11'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '12'}, :without_protection => true)
Permittable.create({:role_id => '1', :permission_id => '13'}, :without_protection => true)
Permittable.create({:role_id => '2', :permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '2', :permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '2', :permission_id => '8'}, :without_protection => true)
Permittable.create({:role_id => '3', :permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '3', :permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '3', :permission_id => '4'}, :without_protection => true)

# create default values for Priority List (MyTODO :Translation required for values)
PriorityList.create({:name => 'Low'}, :without_protection => true)
PriorityList.create({:name => 'Normal'}, :without_protection => true)
PriorityList.create({:name => 'High'}, :without_protection => true)
PriorityList.create({:name => 'Urgent'}, :without_protection => true)
PriorityList.create({:name => 'Critical'}, :without_protection => true)

# create default statuses (MyTODO :Translation required for values)
Status.create({:name => 'New'}, :without_protection => true)
Status.create({:name => 'Assigned'}, :without_protection => true)
Status.create({:name => 'On Hold'}, :without_protection => true)
Status.create({:name => 'Pending'}, :without_protection => true)
Status.create({:name => 'Re-Opened'}, :without_protection => true)
Status.create({:name => 'Closed'}, :without_protection => true)



