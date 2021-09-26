require 'rails_helper'

RSpec.describe 'HourlyWeather poro' do
  it 'exists' do

    weather = {
                dt: 1632690000,
                temp: 87.12,
                weather: [{
                description: "few clouds",
                icon: "02d"
                        }]
              }

    x = HourlyWeather.new(weather)

    expect(x).to be_a(HourlyWeather)
  end
end
