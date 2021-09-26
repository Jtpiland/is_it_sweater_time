class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(attributes)
    @date = Time.at(attributes[:dt]).to_datetime
    @sunrise = Time.at(attributes[:sunrise]).to_datetime
    @sunset = Time.at(attributes[:sunset]).to_datetime
    @max_temp = (((attributes[:temp][:max]) - 273.15) * 9/5 + 32).round(2)
    @min_temp = (((attributes[:temp][:min]) - 273.15) * 9/5 + 32).round(2)
    @conditions = attributes[:weather][0][:description]
    @icon = attributes[:weather][0][:icon]
  end
end
