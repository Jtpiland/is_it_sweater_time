require 'rails_helper'

RSpec.describe 'CurrentWeather poro' do
  it 'exists' do

    weather = {
                dt: 1632686400,
                sunrise: 1632686400,
                sunset: 1632686400,
                temp: 87.12,
                feels_like: 83.52,
                humidity: 13,
                uvi: 5.71,
                visibility: 10000,
                weather: [{
                description: "few clouds",
                icon: "02d"
                        }]
              }

    x = CurrentWeather.new(weather)

    expect(x).to be_a(CurrentWeather)
  end
end
