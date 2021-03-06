require 'rails_helper'

RSpec.describe WeatherSerializer do
  it 'can serialize data returned from the weather service', :vcr do
    lat = 39.738453
    lon = -104.984853

    weather = WeatherService.get_weather("#{lat}", "#{lon}")

    current_weather = CurrentWeather.new(weather[:current])

    daily_weather =     weather[:daily][0..4].map do |daily|
                          DailyWeather.new(daily)
                        end

    hourly_weather =    weather[:hourly][0..7].map do |hourly|
                          HourlyWeather.new(hourly)
                        end

    forecast = Forecast.new(current_weather, daily_weather, hourly_weather)

    weather_data = WeatherSerializer.weather(forecast) #was result

    expect(weather_data).to be_a(Hash)
    expect(weather_data).to have_key(:data)
    expect(weather_data[:data]).to be_a(Hash)
    expect(weather_data[:data]).to have_key(:id)
    expect(weather_data[:data]).to have_key(:type)
    expect(weather_data[:data][:type]).to be_a(String)
    expect(weather_data[:data]).to have_key(:attributes)
    expect(weather_data[:data][:attributes]).to be_a(Hash)
    expect(weather_data[:data][:attributes]).to have_key(:current_weather)
    expect(weather_data[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(weather_data[:data][:attributes][:current_weather][:datetime]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(weather_data[:data][:attributes][:current_weather][:sunrise]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(weather_data[:data][:attributes][:current_weather][:sunset]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(weather_data[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(weather_data[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(weather_data[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(weather_data[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(weather_data[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(weather_data[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(weather_data[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(weather_data[:data][:attributes]).to have_key(:daily_weather)
    expect(weather_data[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(weather_data[:data][:attributes][:daily_weather].length).to eq(5)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(weather_data[:data][:attributes][:daily_weather][0][:date]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(weather_data[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(weather_data[:data][:attributes][:daily_weather][0][:sunset]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(weather_data[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(weather_data[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(weather_data[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(weather_data[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(weather_data[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

    expect(weather_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(weather_data[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(weather_data[:data][:attributes][:hourly_weather].length).to eq(8)
    expect(weather_data[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(weather_data[:data][:attributes][:hourly_weather][0][:time]).to be_a(DateTime)
    expect(weather_data[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
    expect(weather_data[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Numeric)
    expect(weather_data[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(weather_data[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(weather_data[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(weather_data[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
  end
end
