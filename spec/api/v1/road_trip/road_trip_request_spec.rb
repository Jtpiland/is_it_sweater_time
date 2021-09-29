require 'rails_helper'

RSpec.describe 'Road Trip Request' do
  let(:valid_attributes) { {'origin': "Denver, CO", 'destination': "Pueblo, CO", 'api_key': "jgn983hy48thw9begh98h4539h4"} }

  let(:invalid_attributes) { {'origin': "Denver, CO", 'destination': "London, UK", 'api_key': "jgn983hy48thw9begh98h4539h4"} }

  it 'can return serialized information about a road trip with valid credentials', :vcr do
    user = User.create(email: 'email@email.com', password: 'pw', password_confirmation: 'pw')

    user.update(api_key: "jgn983hy48thw9begh98h4539h4")

    headers = { "Content-Type" => "application/json",
    "Accept" => "application/json" }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(valid_attributes)

    x = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(x[:data][:id]).to eq(nil)
    expect(x[:data][:type]).to eq('roadtrip')
    expect(x[:data][:attributes][:start_city]).to eq('Denver, CO')
    expect(x[:data][:attributes][:end_city]).to eq('Pueblo, CO')
    expect(x[:data][:attributes][:travel_time]).to eq('01:44:22')
    expect(x[:data][:attributes][:weather_at_eta][:temperature]).to eq(69.76)
    expect(x[:data][:attributes][:weather_at_eta][:conditions]).to eq('few clouds')
  end

  it 'can return an error if there is no route determined between origin and destination', :vcr do
    user = User.create(email: 'email@email.com', password: 'pw', password_confirmation: 'pw')

    user.update(api_key: "jgn983hy48thw9begh98h4539h4")

    headers = { "Content-Type" => "application/json",
    "Accept" => "application/json" }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(invalid_attributes)
    x = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(x[:data][:id]).to eq(nil)
    expect(x[:data][:type]).to eq('roadtrip')
    expect(x[:data][:attributes][:start_city]).to eq('Denver, CO')
    expect(x[:data][:attributes][:end_city]).to eq('London, UK')
    expect(x[:data][:attributes][:travel_time]).to eq('impossible route')
    expect(x[:data][:attributes][:weather_at_eta][:temperature]).to eq(nil)
    expect(x[:data][:attributes][:weather_at_eta][:conditions]).to eq(nil)
  end

  it 'can return error if invalid credentials are provided', :vcr do
    user = User.create(email: 'email@email.com', password: 'pw', password_confirmation: 'pw')

    user.update(api_key: "jgn983hy48thw9begh98h4539h3")

    headers = { "Content-Type" => "application/json",
    "Accept" => "application/json" }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(valid_attributes)

    x = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(x).to eq({ :error => "Invalid Credentials" })
  end
end
