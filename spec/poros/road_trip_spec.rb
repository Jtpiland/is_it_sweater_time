require 'rails_helper'

RSpec.describe 'RoadTrip' do
  it 'exists and has attributes' do
    weather = {
                dt: 1632690000,
                temp: 87.12,
                weather: [{
                description: "few clouds",
                icon: "02d"
                        }]
              }

    x = HourlyWeather.new(weather)

    directions = { route: {
      formattedTime: '01:22:49'
        }
      }

    y = Directions.new(directions)

    z = RoadTrip.new(y, x)

    expect(z).to be_a(RoadTrip)
  end
end
