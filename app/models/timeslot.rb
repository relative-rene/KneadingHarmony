class Timeslot < ActiveRecord::Base
  has_many :appointments

  def self.confirm(params)
    @timeslot = Timeslot.find_by_id(params[:timeslot_id])
  end
end
