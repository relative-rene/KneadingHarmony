class Timeslot < ActiveRecord::Base
  belongs_to :appointment
  has_many :users, through: :appointment

end



  def self.confirm(params)
    @timeslot = Timeslot.find_by({id: params[:id]})
    @timeslot.try(:authenticate, params[:admin])
  end
