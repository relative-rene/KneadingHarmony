class Timeslot < ActiveRecord::Base
  has_one :appointment
    attr_accessor :week_day, :hour

  extend FriendlyId
    friendly_id :hour, use: :slugged

  def self.confirm(params)
    @timeslot = Timeslot.find_by_id(params[:id])
    @timeslot.try(:authenticate, params[:hour])
  end
end
