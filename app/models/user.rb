class User < ActiveRecord::Base
  # include validations once mvc is setup
  # validates :email, :password_digest, presence: true, uniqueness:true
  # validates_confirmation_of :password_digest

  has_many :appointments
  has_many :timeslots, through: :appointments
  attr_accessor :user, :name, :email, :phone_number, :admin

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password_digest])
  end

end
