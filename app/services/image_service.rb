class ImageService

  class << self

    def get_image(location)
      result = conn.get("/search/photos") do |req|
        req.params['query'] = "#{location}"
      end
      parse_json(result)
    end

    def conn
      Faraday.new(url: 'https://api.unsplash.com') do |req|
        req.params['client_id'] = ENV['image_access_key']
      end
    end

    def parse_json(result)
      foramtted_result = JSON.parse(result.body, symbolize_names: true)
    end

  end
end
