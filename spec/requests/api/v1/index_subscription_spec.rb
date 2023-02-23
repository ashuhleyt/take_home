require 'rails_helper'

RSpec.describe 'customer subs index page' do 
  let!(:customers) { create_list :customer, 2 }
  let!(:customer1) { customers.first }
  let!(:customer2) { customers.last }

  let!(:teas) { create_list :tea, 2 }
  let!(:tea1) { teas.first }
  let!(:tea2) { teas.last }

  let!(:sub1) { create :subscription, customer_id: customer1.id, tea_id: tea1.id, status: 'active' }
  let!(:sub2) { create :subscription, customer_id: customer1.id, tea_id: tea2.id, status: 'cancelled' }

  it 'displays all of a customers subsciptions (active and cancelled)' do 
 
    expect(customer1.subscriptions).to eq([sub1, sub2])

    customer_info = {
      'customer_id': customer1.id
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_subscriptions_path(customer_info), headers: headers

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(data).to have_key(:data)
    expect(data[:data]).to have_key(:subscriptions)
    expect(data[:data][:subscriptions].count).to eq(2)
    expect(data[:data][:subscriptions][0]).to have_key(:id)
    expect(data[:data][:subscriptions][0]).to have_key(:price)
    expect(data[:data][:subscriptions][0]).to have_key(:status)
    expect(data[:data][:subscriptions][0]).to have_key(:frequency)
    expect(data[:data][:subscriptions][0]).to have_key(:tea)
    expect(data[:data][:subscriptions][0][:tea]).to have_key(:title)
    expect(data[:data][:subscriptions][0][:tea]).to have_key(:description)
    expect(data[:data][:subscriptions][0][:tea]).to have_key(:temperature)
    expect(data[:data][:subscriptions][0][:tea]).to have_key(:brew_time)
  end
end