class Appointment < ActiveRecord::Base
  belongs_to :users
  belongs_to :timeslots
  attr_accessor :date, :time

  extend FriendlyId
    friendly_id :user_id, use: :slugged


end
