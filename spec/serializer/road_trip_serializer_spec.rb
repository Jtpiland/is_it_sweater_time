require 'rails_helper'

RSpec.describe 'RoadTripSerializer' do
  it 'can return serialize weather and direction info' do
    from = 'Denver, CO'
    to = 'Estes Park, CO'

    weather = {
                dt: 1632690000,
                temp: 87.12,
                weather: [{
                description: "few clouds",
                icon: "02d"
                        }]
              }

    hourly_weather = HourlyWeather.new(weather)

    d = { route: {
      formattedTime: '01:22:49'
        }
      }
    directions = Directions.new(d)

    road_trip = RoadTrip.new(hourly_weather, directions)
    road_trip_data = RoadTripSerializer.road_trip(road_trip, from, to)

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

  it 'can return json for impossible route if no directions are found' do
    from = 'Denver, CO'
    to = 'London, UK'

    road_trip_data = RoadTripSerializer.impossible_road_trip(from, to)

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
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:temperature]).to be(nil)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:conditions]).to be(nil)
  end
end
