class TimeSlot < ActiveRecord::Base
  belongs_to :appointment
  has_many :users, through: :appointment

end
