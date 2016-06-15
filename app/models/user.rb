class User < ActiveRecord::Base
  has_many :appointments, dependent: :destroy
  validates :email, :login, :phone_number, presence: true, uniqueness:true


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:login])
  end

end
