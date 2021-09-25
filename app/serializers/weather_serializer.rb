class WeatherSerializer
  def self.weather(weather_data)
    {data:
      { id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: weather_data[:current][:dt],
            sunrise: weather_data[:current][:sunrise],
            sunset: weather_data[:current][:sunset],
            temperature: weather_data[:current][:temp],
            feels_like: weather_data[:current][:feels_like],
            humidity: weather_data[:current][:humidity],
            uvi: weather_data[:current][:uvi],
            visibility: weather_data[:current][:visibility],
            conditions: weather_data[:current][:weather][0][:description],
            icon: weather_data[:current][:weather][0][:icon]
          },
          daily_weather: [
            {
              date: weather_data[:daily][0][:dt],
              sunrise: weather_data[:daily][0][:sunrise],
              sunset: weather_data[:daily][0][:sunset],
              max_temp: weather_data[:daily][0][:temp][:max],
              min_temp: weather_data[:daily][0][:temp][:min],
              conditions: weather_data[:daily][0][:weather][0][:description],
              icon: weather_data[:daily][0][:weather][0][:icon]
            },
            {
              date: weather_data[:daily][1][:dt],
              sunrise: weather_data[:daily][1][:sunrise],
              sunset: weather_data[:daily][1][:sunset],
              max_temp: weather_data[:daily][1][:temp][:max],
              min_temp: weather_data[:daily][1][:temp][:min],
              conditions: weather_data[:daily][1][:weather][0][:description],
              icon: weather_data[:daily][1][:weather][0][:icon]
            },
            {
              date: weather_data[:daily][2][:dt],
              sunrise: weather_data[:daily][2][:sunrise],
              sunset: weather_data[:daily][2][:sunset],
              max_temp: weather_data[:daily][2][:temp][:max],
              min_temp: weather_data[:daily][2][:temp][:min],
              conditions: weather_data[:daily][2][:weather][0][:description],
              icon: weather_data[:daily][2][:weather][0][:icon]
            },
            {
              date: weather_data[:daily][3][:dt],
              sunrise: weather_data[:daily][3][:sunrise],
              sunset: weather_data[:daily][3][:sunset],
              max_temp: weather_data[:daily][3][:temp][:max],
              min_temp: weather_data[:daily][3][:temp][:min],
              conditions: weather_data[:daily][3][:weather][0][:description],
              icon: weather_data[:daily][3][:weather][0][:icon]
            },
            {
              date: weather_data[:daily][4][:dt],
              sunrise: weather_data[:daily][4][:sunrise],
              sunset: weather_data[:daily][4][:sunset],
              max_temp: weather_data[:daily][4][:temp][:max],
              min_temp: weather_data[:daily][4][:temp][:min],
              conditions: weather_data[:daily][4][:weather][0][:description],
              icon: weather_data[:daily][4][:weather][0][:icon]
            }
          ],
          hourly_weather: [
            {
              time: weather_data[:hourly][0][:dt],
              temperature: weather_data[:hourly][0][:temp],
              conditions: weather_data[:hourly][0][:weather][0][:description],
              icon: weather_data[:hourly][0][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][1][:dt],
              temperature: weather_data[:hourly][1][:temp],
              conditions: weather_data[:hourly][1][:weather][0][:description],
              icon: weather_data[:hourly][1][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][2][:dt],
              temperature: weather_data[:hourly][2][:temp],
              conditions: weather_data[:hourly][2][:weather][0][:description],
              icon: weather_data[:hourly][2][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][3][:dt],
              temperature: weather_data[:hourly][3][:temp],
              conditions: weather_data[:hourly][3][:weather][0][:description],
              icon: weather_data[:hourly][3][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][4][:dt],
              temperature: weather_data[:hourly][4][:temp],
              conditions: weather_data[:hourly][4][:weather][0][:description],
              icon: weather_data[:hourly][4][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][5][:dt],
              temperature: weather_data[:hourly][5][:temp],
              conditions: weather_data[:hourly][5][:weather][0][:description],
              icon: weather_data[:hourly][5][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][6][:dt],
              temperature: weather_data[:hourly][6][:temp],
              conditions: weather_data[:hourly][6][:weather][0][:description],
              icon: weather_data[:hourly][6][:weather][0][:icon],
            },
            {
              time: weather_data[:hourly][7][:dt],
              temperature: weather_data[:hourly][7][:temp],
              conditions: weather_data[:hourly][7][:weather][0][:description],
              icon: weather_data[:hourly][7][:weather][0][:icon],
            }
          ]
        }
      }
    }
  end
end
