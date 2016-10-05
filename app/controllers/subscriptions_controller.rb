class SubscriptionsController < ApplicationController
  def new
    Order.find(session[:order_id])
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
        redirect_to @subscription, notice: 'Thank you for your order!'
    else
        render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
end
