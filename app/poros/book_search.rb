class BookSearch
  attr_reader :current_weather,
              :books

  def initialize(current_weather, books)
    @current_weather = current_weather
    @books = books
  end
end
