class RoadTrip
  attr_reader :hourly_weather,
              :directions

  def initialize(hourly_weather, directions)
    @hourly_weather = hourly_weather
    @directions = directions
  end
end
