require 'rails_helper'

RSpec.describe 'create customer subscription' do 
  let!(:customers) { create_list :customer, 2 }
  let!(:teas) { create_list :tea, 3 }

  context 'subscription does not exist' do 
    it 'subscribe a customer to a tea subscription' do 
      sub_params = {
        'title': teas.first.title, 
        'price': 19.50,
        'status': 'active',
        'frequency': 30,
        'tea_id': teas.first.id,
        'customer_id': customers.first.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_subscriptions_path, headers: headers, params: JSON.generate(sub_params)

      data = JSON.parse(response.body, symbolize_names: true)

      customer1 = customers.first

      expect(customer1.subscriptions.count).to eq(1)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:id)
      expect(data[:data]).to have_key(:price)
      expect(data[:data][:price]).to eq(19.5)
      expect(data[:data]).to have_key(:status)
      expect(data[:data][:status]).to eq('active')
      expect(data[:data]).to have_key(:frequency)
      expect(data[:data][:frequency]).to eq(30)
      expect(data[:data]).to have_key(:tea)
      expect(data[:data][:tea]).to have_key(:title)
      expect(data[:data][:tea]).to have_key(:description)
      expect(data[:data][:tea]).to have_key(:temperature)
      expect(data[:data][:tea]).to have_key(:brew_time)
    end
  end
end