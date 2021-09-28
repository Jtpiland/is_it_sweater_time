class Directions
  attr_reader :travel_time

  def initialize(direction_info)
    @travel_time = direction_info[:route][:formattedTime]
  end
end
