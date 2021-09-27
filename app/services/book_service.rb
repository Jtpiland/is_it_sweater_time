class BookService
  class << self
    def get_books(location)
      result = conn.get("/search.json?") do |req|
        req.params['q'] = "#{location}"
      end
      parse_json(result)
    end

    def conn
      Faraday.new(url: "http://openlibrary.org")
    end

    def parse_json(result)
      formatted_result = JSON.parse(result.body, symbolize_names: true)
    end
  end
end
