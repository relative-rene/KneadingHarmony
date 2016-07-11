class Timeslot < ActiveRecord::Base
  has_one :appointment
  
  extend FriendlyId
    friendly_id :hour, use: :slugged

  def self.confirm(params)
    @timeslot = Timeslot.find_by_id(params[:timeslot_id])
  end
end
