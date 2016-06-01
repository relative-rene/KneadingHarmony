class Appointment < ActiveRecord::Base
  belongs_to :user
  has_many :timeslots

  def valid?
    taken = where(day: day, time_slot_id: time_slot_id)
    save unless taken
  end
end
