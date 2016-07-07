class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :timeslot
  attr_accessor :date, :time

  extend FriendlyId
    friendly_id :user_id, use: :slugged


end
