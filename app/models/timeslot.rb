class Timeslot < ActiveRecord::Base
  belongs_to :appointment
  has_many :users, through: :appointment

  extend FriendlyId
    friendly_id :user_id, use: :slugged
    
  def self.confirm(params)
    @timeslot = Timeslot.find_by_id(params[:id])
    @timeslot.try(:authenticate, params[:hour])
  end
end
