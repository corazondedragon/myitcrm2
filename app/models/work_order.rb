class WorkOrder < ActiveRecord::Base

  include ActiveModel::Dirty
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user
  has_many :replies, :dependent => :destroy  # Destroy's the associated replies if a Work Order is deleted
  has_many :tasks, :dependent => :destroy  # Destroy's the associated tasks if a Work Order is deleted

# Validate presence of Input information when creating or editing
  validates_presence_of :subject, :description

  attr_accessible :description, :subject, :priority_list_id, :edited_by, :created_by, :user_id, :task_id, :purchase_order, :instructions, :building, :contact, :technical_notes, :status_id, :building_id, :job_number, :invoice_number


  before_update :workorder_update

	#, :change_assignment, :lookup_assigned_username, :change_status


  def workorder_update
#	@old_work_order = Tran.find(self.id)
    #!/usr/bin/env ruby
    require 'logger'
    log = Logger.new('/home/purge/www/integrated/log/wo.txt')

log.debug "status id: " + self.status_id.to_s
log.debug "status id was: " + self.status_id_was.to_s

	if self.status_id == 6 and self.status_id_was != 6
		self.closed_date = Time.now
		self.closed = true
		self.closed_by = self.edited_by

		log.debug "closed"
	else
		if self.status_id != self.status_id_was
			log.debug "status changed"
			if self.status_id == 1
				log.debug "status set to unassigned"
				self.assigned_to_id = nil
				self.assigned_to_username = nil
			end

		else
			if self.assigned_to_username.blank? and !self.assigned_to_username_was.blank?
				log.debug "assignment went from something to blank, so reset the record."
				self.status_id = 1
				self.assigned_to_id = nil
				self.assigned_to_username = nil
			else
				if !self.assigned_to_username.blank? and self.assigned_to_username_was.blank?
					log.debug "assignment went from blank to a name, set status id to 2"
					self.status_id = 2

				end
			end
		end



	end		


  log.debug "-"

    #if the username is not blank, and if it has changed, find the user id and set it, there is a smarter way of doing this and i will come back to
    #this later and fix it.	
    if !self.assigned_to_username.blank?
        if self.assigned_to_username != self.assigned_to_username_was
                #self.assigned_to_id = nil
                assigned_user = User.where(["name = ?", assigned_to_username]).first
                self.assigned_to_id = assigned_user.id
        end
    end


  end


  private
# Used to obtain the Assigned Users name from the database on Work Order saving,
# instead of making a separate call each time it's displayed in the table
#  def lookup_assigned_username
 #   if !self.assigned_to_username.blank?
#	if self.assigned_to_username != self.assigned_to_username_was
 #       	#self.assigned_to_id = nil
  #      	assigned_user = User.where(["name = ?", assigned_to_username]).first
   #     	self.assigned_to_id = assigned_user.id
#	end
 #   end
  #end


end

