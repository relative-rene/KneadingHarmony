class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :timeslot
  attr_accessor :date, :time

  extend FriendlyId
    friendly_id :user_id, use: :slugged


  def self.confirm(params)
    @appointment = Appointment.find_by_id(params[:id])
    @appointment.try(:authenticate, params[:user_id])
  end

end
