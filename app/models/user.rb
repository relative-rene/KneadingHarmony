class User < ActiveRecord::Base
  # include validations once mvc is setup
  # validates :email, :password, presence: true, uniqueness:true
  # validates_confirmation_of :password
  has_many :appointments, dependent: :destroy
  has_many :time_slots, through: :appointments


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
