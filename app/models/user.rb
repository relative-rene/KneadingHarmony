class User < ActiveRecord::Base
  has_many :appointments
  validates :email, :password_digest, :phone_number, :credit_card, presence: true, uniqueness:true
end
