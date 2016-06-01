class TimeSlot < ActiveRecord::Base
  belongs_to :appointment
  has_many :users, through: :user_time_slots

end
