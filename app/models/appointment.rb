class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_slots

  
end
