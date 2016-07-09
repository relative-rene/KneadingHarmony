class Appointment < ActiveRecord::Base
  belongs_to :users
  belongs_to :timeslots

  accepts_nested_attributes_for :users

end
