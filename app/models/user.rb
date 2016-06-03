class User < ActiveRecord::Base
  has_many :appointments, dependent: :destroy
  validates :email, :login, presence: true, uniqueness:true

end
