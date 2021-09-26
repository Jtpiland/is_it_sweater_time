class ForecastFacade
  class << self

  #   def fetch_weather(location)
  #     result = MapquestService.get_location(location)
  #     lat = result[:locations][0][:latLng][:lat]
  #     lon = result[:locations][0][:latLng][:lng]
  #
  #     weather = WeatherService.get_weather("#{lat}", "#{lon}")
  #
  #     WeatherSerializer.weather(weather)
  #   end
  # end

    def fetch_weather(location)
      result = MapquestService.get_location(location)
      lat = result[:locations][0][:latLng][:lat]
      lon = result[:locations][0][:latLng][:lng]

      weather = WeatherService.get_weather("#{lat}", "#{lon}")

      current_weather = CurrentWeather.new(weather[:current])

      daily_weather =     weather[:daily][0..4].map do |daily|
                            DailyWeather.new(daily)
                          end

      hourly_weather =    weather[:hourly][0..7].map do |hourly|
                            HourlyWeather.new(hourly)
                          end

      forecast = Forecast.new(current_weather, daily_weather, hourly_weather)

      WeatherSerializer.weather(forecast)
    end
  end
end
