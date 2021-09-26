class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(attributes)
    @datetime = Time.at(attributes[:dt]).to_datetime
    @sunrise = Time.at(attributes[:sunrise]).to_datetime
    @sunset = Time.at(attributes[:sunset]).to_datetime
    @temperature = (((attributes[:temp]) - 273.15) * 9/5 + 32).round(2)
    @feels_like = (((attributes[:feels_like]) - 273.15) * 9/5 + 32).round(2)
    @humidity = attributes[:humidity]
    @uvi = attributes[:uvi]
    @visibility = attributes[:visibility]
    @conditions = attributes[:weather][0][:description]
    @icon = attributes[:weather][0][:icon]
  end
end
