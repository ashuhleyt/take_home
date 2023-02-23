require 'rails_helper'

RSpec.describe 'Update Subscriptions' do 
  let!(:subscription) { create :subscription, status: 'active' }

  describe 'successfully cancelling a subscription' do 
    it 'cancel a customers tea subscription' do 
      customer = Customer.first 

      expect(customer.subscriptions.first.status).to eq('active')

      sub_params = {
        'id': subscription.id,
        'customer_id': subscription.customer.id,
        'tea_id': subscription.tea.id,
        'title': subscription.tea.title,
        'price': subscription.price,
        'frequency': subscription.frequency,
        'status': 'cancelled'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch api_v1_subscription_path(subscription), headers: headers, params: JSON.generate(sub_params)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(data[:data]).to have_key(:success)
      expect(data[:data][:success]).to eq('Your subscriptions have been updated!')
      expect(customer.subscriptions.first.status).to eq('cancelled')
      expect(customer.subscriptions.count).to eq(1)
      require 'pry'; binding.pry
    end
  end
end