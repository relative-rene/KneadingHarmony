class SubscriptionsController < ApplicationController
  def new
    @product = Product.find_by_id(params[:id])
    @subscription = Subscription.new(params[:subscription])
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
        redirect_to @subscription, notice: 'Thank you for subscribing!'
    else
        render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
end
