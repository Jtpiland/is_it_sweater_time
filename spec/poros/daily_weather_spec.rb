require 'rails_helper'

RSpec.describe 'DailyWeather poro' do
  it 'exists' do

    weather = {
                dt: 1632690000,
                sunrise: 1632690000,
                sunset: 1632690000,
                temp: {
                  max: 87.12,
                  min: 64.52},
                weather: [{
                  description: "few clouds",
                  icon: "02d"
                         }]
              }

    x = DailyWeather.new(weather)

    expect(x).to be_a(DailyWeather)
  end
end
