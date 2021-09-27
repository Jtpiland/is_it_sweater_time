class BookSearchSerializer

  def self.book_search(book_search, location)
    {data:
      { id: nil,
        type: 'books',
        attributes: {
                        destination: "#{location}",
                        forecast: {
                                      summary: book_search.current_weather.conditions,
                                      temperature: book_search.current_weather.temperature
                        },
                        total_books_found: book_search.books[:numFound],
                        books: book_search.books[:docs].map do |book|
                          x = Book.new(book)
                          {
                            isbn: x.isbn,
                            title: x.title,
                            publisher: x.publisher
                          }
                        end
        }
      }
    }
  end

end
