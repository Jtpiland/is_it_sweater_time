class RoadTripSerializer
  def self.road_trip(road_trip, from, to)
    {data:
          { id: nil,
            type: 'roadtrip',
            attributes: {
                          start_city: "#{from}",
                          end_city: "#{to}",
                          travel_time: road_trip.directions.travel_time,
                          weather_at_eta: {
                                            temperature: road_trip.hourly_weather.temperature,
                                            conditions: road_trip.hourly_weather.conditions
                                          }
                        }
          }
    }
  end

  def self.impossible_road_trip(from, to)
    {data:
          { id: nil,
            type: 'roadtrip',
            attributes: {
                          start_city: "#{from}",
                          end_city: "#{to}",
                          travel_time: 'impossible route',
                          weather_at_eta: {
                                            temperature: nil,
                                            conditions: nil
                                          }
                        }
          }
    }
  end
end
