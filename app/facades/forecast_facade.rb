class ForecastFacade
  class << self

    def fetch_weather(location)
      result = MapquestService.get_location(location)
      lat = result[:locations][0][:latLng][:lat]
      lon = result[:locations][0][:latLng][:lng]

      weather = WeatherService.get_weather("#{lat}", "#{lon}")

      WeatherSerializer.weather(weather)
    end
  end
end
