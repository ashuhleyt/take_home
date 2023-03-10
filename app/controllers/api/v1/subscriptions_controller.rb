class Api::V1::SubscriptionsController < ApplicationController 
  def create 
    subscription = Subscription.new(sub_params)

    subscription.status = 'active'
    if subscription.save
      render json: SubscriptionSerializer.new_subscription(subscription)
    end
  end

  def update 
    subscription = Subscription.find(params[:id])
    if subscription.update(sub_params)
      render json: { 'data': { 'success': 'Your subscriptions have been updated!' } }
    end
  end

  def index 
    customer = Customer.find(params[:customer_id])
    subs = customer.subscriptions
    render json: SubscriptionSerializer.all_subscriptions(subs)
  end

  private 
  def sub_params
    params.permit(
      :title, 
      :price, 
      :frequency, 
      :status, 
      :tea_id, 
      :customer_id
    )
  end
end
