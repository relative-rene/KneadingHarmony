class OrderStatus < ActiveRecord::Base
    has_many :orders
    has_many :subscriptions
end
