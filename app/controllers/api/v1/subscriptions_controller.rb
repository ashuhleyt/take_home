class Api::V1::SubscriptionsController < ApplicationController 
  def create 
    subscription = Subscription.new(sub_params)

    subscription.status = 'active'
    if subscription.save
      render json: SubscriptionSerializer.new_subscription(subscription)
    end
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
