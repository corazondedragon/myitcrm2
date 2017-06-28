class Building < ActiveRecord::Base
  attr_accessible :address, :description, :id, :name, :user_id
  belongs_to :user

end
