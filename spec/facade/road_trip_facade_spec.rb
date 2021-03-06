require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
  it 'can return json', :vcr do
    from = 'denver, co'
    to = 'estes park, co'

    road_trip_data = RoadTripFacade.fetch_directions_and_weather(from, to)

    expect(road_trip_data).to be_a(Hash)
    expect(road_trip_data).to be_a(Hash)
    expect(road_trip_data[:data]).to have_key(:id)
    expect(road_trip_data[:data]).to have_key(:type)
    expect(road_trip_data[:data][:type]).to be_a(String)
    expect(road_trip_data[:data]).to have_key(:attributes)
    expect(road_trip_data[:data][:attributes]).to be_a(Hash)
    expect(road_trip_data[:data][:attributes]).to have_key(:start_city)
    expect(road_trip_data[:data][:attributes][:start_city]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:end_city)
    expect(road_trip_data[:data][:attributes][:end_city]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:weather_at_eta)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
