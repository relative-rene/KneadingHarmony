class Appointment < ActiveRecord::Base
    belongs_to :users
    belongs_to :timeslots
end
