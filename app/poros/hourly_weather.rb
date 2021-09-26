class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(attributes)
    @time = Time.at(attributes[:dt]).to_datetime
    @temperature = (((attributes[:temp]) - 273.15) * 9/5 + 32).round(2)
    @conditions = attributes[:weather][0][:description]
    @icon = attributes[:weather][0][:icon]
  end
end
