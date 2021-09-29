class WeatherSerializer

  def self.weather(forecast)
    {data:
        { id: nil,
          type: 'forecast',
          attributes: {
            current_weather: {
                                datetime: forecast.current_weather.datetime,
                                sunrise: forecast.current_weather.sunrise,
                                sunset: forecast.current_weather.sunset,
                                temperature: forecast.current_weather.temperature,
                                feels_like: forecast.current_weather.feels_like,
                                humidity: forecast.current_weather.humidity,
                                uvi: forecast.current_weather.uvi,
                                visibility: forecast.current_weather.visibility,
                                conditions: forecast.current_weather.conditions,
                                icon: forecast.current_weather.icon
                            },
            hourly_weather: forecast.hourly_weather.map do |hourly|
                            {
                                time: hourly.time,
                                temperature: hourly.temperature,
                                conditions: hourly.conditions,
                                icon: hourly.icon
                            }
                            end,
            daily_weather: forecast.daily_weather.map do |daily|
                            {
                                date: daily.date,
                                sunrise: daily.sunrise,
                                sunset: daily.sunset,
                                max_temp: daily.max_temp,
                                min_temp: daily.min_temp,
                                conditions: daily.conditions,
                                icon: daily.icon
                            }
                          end
                      }
        }
    }
  end
end
