class User < ActiveRecord::Base
  validates :email, :password, length:{maximum:40}, presence:true, confirmation:true
  validates :email, uniqueness:true
  validates_confirmation_of :password
  has_secure_password
  has_many :attendances
  has_many :events, through: :attendances
  has_many :comments, dependent: :destroy

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
