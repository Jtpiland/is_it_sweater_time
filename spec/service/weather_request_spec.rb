require 'rails_helper'

RSpec.describe 'OpenWeather Api' do
  it 'can return the current weather by latitude and longitude', :vcr do
    lat = 39.738453
    lon = -104.984853

    current = WeatherService.get_current_weather("#{lat}", "#{lon}")
    result = JSON.parse(current.to_json, symbolize_names: true)

    expect(result).to have_key(:main)
    expect(result[:main]).to be_a(Hash)
    expect(result[:main]).to have_key(:temp)
    expect(result[:main][:temp]).to be_a(Float)
    expect(result[:main]).to have_key(:feels_like)
    expect(result[:main][:temp]).to be_a(Float)
    expect(result[:main]).to have_key(:humidity)
    expect(result[:main][:temp]).to be_a(Numeric)

    expect(result).to have_key(:visibility)
    expect(result[:visibility]).to be_a(Numeric)

    expect(result).to have_key(:dt)
    expect(result[:dt]).to be_a(Integer)
    expect(result).to have_key(:sys)
    expect(result[:sys]).to be_a(Hash)
    expect(result[:sys]).to have_key(:sunrise)
    expect(result[:sys][:sunrise]).to be_a(Integer)
    expect(result[:sys]).to have_key(:sunrise)
    expect(result[:sys][:sunset]).to be_a(Integer)

    expect(result).to have_key(:weather)
    expect(result[:weather]).to be_a(Array)
    expect(result[:weather][0]).to have_key(:description)
    expect(result[:weather][0][:description]).to be_a(String)
    expect(result[:weather][0]).to have_key(:icon)
    expect(result[:weather][0][:icon]).to be_a(String)

    #uvi???? = numeric
  end
end
