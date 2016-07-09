class User < ActiveRecord::Base
  validates :email, :password, length:{maximum:40}, presence:true, confirmation:true
  validates :email, uniqueness:true
  validates_confirmation_of :password
  has_secure_password
  has_many :appointments
  has_many :timeslots, through: :appointments
  accepts_nested_attributes_for :appointments

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
