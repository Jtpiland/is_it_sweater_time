class WeatherSerializer
  def self.weather(weather_data)
    {data:
      { id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: Time.at(weather_data[:current][:dt]).to_datetime,
            sunrise: Time.at(weather_data[:current][:sunrise]).to_datetime,
            sunset: Time.at(weather_data[:current][:sunset]).to_datetime,
            temperature: (((weather_data[:current][:temp]) - 273.15)* 9/5 +32).round(2),
            feels_like: (((weather_data[:current][:feels_like]) - 273.15)* 9/5 +32).round(2),
            humidity: weather_data[:current][:humidity],
            uvi: weather_data[:current][:uvi],
            visibility: weather_data[:current][:visibility],
            conditions: weather_data[:current][:weather][0][:description],
            icon: weather_data[:current][:weather][0][:icon]
          },
          daily_weather: [
            {
              date: Time.at(weather_data[:daily][0][:dt]).to_datetime,
              sunrise: Time.at(weather_data[:daily][0][:sunrise]).to_datetime,
              sunset: Time.at(weather_data[:daily][0][:sunset]).to_datetime,
              max_temp: (((weather_data[:daily][0][:temp][:max]) - 273.15)* 9/5 +32).round(2),
              min_temp: (((weather_data[:daily][0][:temp][:min]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:daily][0][:weather][0][:description],
              icon: weather_data[:daily][0][:weather][0][:icon]
            },
            {
              date: Time.at(weather_data[:daily][1][:dt]).to_datetime,
              sunrise: Time.at(weather_data[:daily][1][:sunrise]).to_datetime,
              sunset: Time.at(weather_data[:daily][1][:sunset]).to_datetime,
              max_temp: (((weather_data[:daily][1][:temp][:max]) - 273.15)* 9/5 +32).round(2),
              min_temp: (((weather_data[:daily][1][:temp][:min]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:daily][1][:weather][0][:description],
              icon: weather_data[:daily][1][:weather][0][:icon]
            },
            {
              date: Time.at(weather_data[:daily][2][:dt]).to_datetime,
              sunrise: Time.at(weather_data[:daily][2][:sunrise]).to_datetime,
              sunset: Time.at(weather_data[:daily][2][:sunset]).to_datetime,
              max_temp: (((weather_data[:daily][2][:temp][:max]) - 273.15)* 9/5 +32).round(2),
              min_temp: (((weather_data[:daily][2][:temp][:min]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:daily][2][:weather][0][:description],
              icon: weather_data[:daily][2][:weather][0][:icon]
            },
            {
              date: Time.at(weather_data[:daily][3][:dt]).to_datetime,
              sunrise: Time.at(weather_data[:daily][3][:sunrise]).to_datetime,
              sunset: Time.at(weather_data[:daily][3][:sunset]).to_datetime,
              max_temp: (((weather_data[:daily][3][:temp][:max]) - 273.15)* 9/5 +32).round(2),
              min_temp: (((weather_data[:daily][3][:temp][:min]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:daily][3][:weather][0][:description],
              icon: weather_data[:daily][3][:weather][0][:icon]
            },
            {
              date: Time.at(weather_data[:daily][4][:dt]).to_datetime,
              sunrise: Time.at(weather_data[:daily][4][:sunrise]).to_datetime,
              sunset: Time.at(weather_data[:daily][4][:sunset]).to_datetime,
              max_temp: (((weather_data[:daily][4][:temp][:max]) - 273.15)* 9/5 +32).round(2),
              min_temp: (((weather_data[:daily][4][:temp][:min]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:daily][4][:weather][0][:description],
              icon: weather_data[:daily][4][:weather][0][:icon]
            }
          ],
          hourly_weather: [
            {
              time: Time.at(weather_data[:hourly][0][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][0][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][0][:weather][0][:description],
              icon: weather_data[:hourly][0][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][1][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][1][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][1][:weather][0][:description],
              icon: weather_data[:hourly][1][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][2][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][2][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][2][:weather][0][:description],
              icon: weather_data[:hourly][2][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][3][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][3][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][3][:weather][0][:description],
              icon: weather_data[:hourly][3][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][4][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][4][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][4][:weather][0][:description],
              icon: weather_data[:hourly][4][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][5][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][5][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][5][:weather][0][:description],
              icon: weather_data[:hourly][5][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][6][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][6][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][6][:weather][0][:description],
              icon: weather_data[:hourly][6][:weather][0][:icon]
            },
            {
              time: Time.at(weather_data[:hourly][7][:dt]).to_datetime,
              temperature: (((weather_data[:hourly][7][:temp]) - 273.15)* 9/5 +32).round(2),
              conditions: weather_data[:hourly][7][:weather][0][:description],
              icon: weather_data[:hourly][7][:weather][0][:icon]
            }
          ]
        }
      }
    }
  end
end
