class BookSearchFacade
  def self.fetch_books(location, quantity)
    result = MapquestService.get_location(location)
    lat = result[:locations][0][:latLng][:lat]
    lon = result[:locations][0][:latLng][:lng]

    weather = WeatherService.get_weather("#{lat}", "#{lon}")

    current_weather = CurrentWeather.new(weather[:current])

    books = BookService.get_books(location, quantity)

    book_search = BookSearch.new(current_weather, books)

    book_search_data = BookSearchSerializer.book_search(book_search, location)
  end
end
