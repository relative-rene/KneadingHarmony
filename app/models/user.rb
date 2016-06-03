class User < ActiveRecord::Base
  has_many :appointments, dependent: :destroy
  validates :email, :password_digest, :phone_number, presence: true, uniqueness:true

  def valid?
    taken = where(day: day, time_slot_id: time_slot_id)
    save unless taken
  end

end
