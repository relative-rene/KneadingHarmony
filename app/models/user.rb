class User < ActiveRecord::Base
  validates :email, :password_digest, :phone_number, :credit_card, presence: true, uniqueness:true
end
