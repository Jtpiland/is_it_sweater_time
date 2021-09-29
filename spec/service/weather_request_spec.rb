require 'rails_helper'

RSpec.describe 'OpenWeather Api' do
  it 'can return the current weather by latitude and longitude', :vcr do
    lat = 39.738453
    lon = -104.984853

    current = WeatherService.get_weather("#{lat}", "#{lon}")
    result = JSON.parse(current.to_json, symbolize_names: true)

    expect(result).to have_key(:current)
    expect(result[:current]).to be_a(Hash)
    expect(result[:current]).to have_key(:temp)
    expect(result[:current][:temp]).to be_a(Float)
    expect(result[:current]).to have_key(:feels_like)
    expect(result[:current][:feels_like]).to be_a(Float)
    expect(result[:current]).to have_key(:humidity)
    expect(result[:current][:humidity]).to be_a(Numeric)
    expect(result[:current]).to have_key(:uvi)
    expect(result[:current][:uvi]).to be_a(Numeric)
    expect(result[:current]).to have_key(:visibility)
    expect(result[:current][:visibility]).to be_a(Numeric)
    expect(result[:current]).to have_key(:dt)
    expect(result[:current][:dt]).to be_a(Integer)
    expect(result[:current]).to have_key(:sunrise)
    expect(result[:current][:sunrise]).to be_a(Integer)
    expect(result[:current]).to have_key(:sunrise)
    expect(result[:current][:sunset]).to be_a(Integer)
    expect(result[:current]).to have_key(:weather)
    expect(result[:current][:weather]).to be_a(Array)
    expect(result[:current][:weather][0]).to have_key(:description)
    expect(result[:current][:weather][0][:description]).to be_a(String)
    expect(result[:current][:weather][0]).to have_key(:icon)
    expect(result[:current][:weather][0][:icon]).to be_a(String)
  end

  it 'can return the daily weather for the  by latitude and longitude (next 5 days***)', :vcr do
    lat = 39.738453
    lon = -104.984853

    daily = WeatherService.get_weather("#{lat}", "#{lon}")
    result = JSON.parse(daily.to_json, symbolize_names: true)

    expect(result).to have_key(:daily)
    expect(result[:daily]).to be_a(Array)
    expect(result[:daily][0]).to have_key(:dt)
    expect(result[:daily][0][:dt]).to be_a(Integer)
    expect(result[:daily][0]).to have_key(:sunrise)
    expect(result[:daily][0][:sunrise]).to be_a(Integer)
    expect(result[:daily][0]).to have_key(:sunset)
    expect(result[:daily][0][:sunset]).to be_a(Integer)
    expect(result[:daily][0]).to have_key(:temp)
    expect(result[:daily][0][:temp]).to be_a(Hash)
    expect(result[:daily][0][:temp]).to have_key(:max)
    expect(result[:daily][0][:temp][:max]).to be_a(Numeric)
    expect(result[:daily][0][:temp]).to have_key(:min)
    expect(result[:daily][0][:temp][:min]).to be_a(Numeric)
    expect(result[:daily][0]).to have_key(:weather)
    expect(result[:daily][0][:weather]).to be_a(Array)
    expect(result[:daily][0][:weather][0]).to have_key(:description)
    expect(result[:daily][0][:weather][0][:description]).to be_a(String)
    expect(result[:daily][0][:weather][0]).to have_key(:icon)
    expect(result[:daily][0][:weather][0][:icon]).to be_a(String)
  end

  it 'can return the hourly weather for the (next 8 hours after request**)', :vcr do
    lat = 39.738453
    lon = -104.984853

    hourly = WeatherService.get_weather("#{lat}", "#{lon}")
    result = JSON.parse(hourly.to_json, symbolize_names: true)

    expect(result).to have_key(:hourly)
    expect(result[:hourly]).to be_a(Array)
    expect(result[:hourly][0]).to have_key(:dt)
    expect(result[:hourly][0][:dt]).to be_a(Integer)
    expect(result[:hourly][0]).to have_key(:temp)
    expect(result[:hourly][0][:temp]).to be_a(Numeric)
    expect(result[:daily][0]).to have_key(:weather)
    expect(result[:hourly][0][:weather]).to be_a(Array)
    expect(result[:hourly][0][:weather][0]).to have_key(:description)
    expect(result[:hourly][0][:weather][0][:description]).to be_a(String)
    expect(result[:hourly][0][:weather][0]).to have_key(:icon)
    expect(result[:hourly][0][:weather][0][:icon]).to be_a(String)
  end
end
