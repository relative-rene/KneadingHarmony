class Appointment < ActiveRecord::Base
  belongs_to :user
  has_many :time_slots
end
