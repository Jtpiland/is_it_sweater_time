class RoadTripFacade

  def self.fetch_directions_and_weather(from, to)
    d = MapquestService.get_directions(from, to)
    directions = Directions.new(d)

    result = MapquestService.get_location(to)
    lat = result[:locations][0][:latLng][:lat]
    lon = result[:locations][0][:latLng][:lng]

    weather = WeatherService.get_weather("#{lat}", "#{lon}")
    hourly_weather =    weather[:hourly].map do |hourly|
                          HourlyWeather.new(hourly)
                        end

    road_trip = RoadTrip.new(hourly_weather[directions.travel_time.split(':').first.to_i], directions)

    RoadTripSerializer.road_trip(road_trip, from, to)
  end
end
