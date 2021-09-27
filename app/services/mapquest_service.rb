class MapquestService

  class << self

    def get_directions(from, to)
      result = conn.get("/directions/v2/route") do |req|
        req.params['from'] = "#{from}"
        req.params['to'] = "#{to}"
      end
      parse(result)
    end

    def get_location(location)
      result = conn.get("/geocoding/v1/address") do |req|
        req.params['location'] = "#{location}"
      end
      parse_json(result)
    end

    def conn
      Faraday.new(url: "http://www.mapquestapi.com") do |req|
        req.params['key'] = ENV['map_key']
      end
    end

    def parse_json(result)
      formatted_result = JSON.parse(result.body, symbolize_names: true)[:results][0]
    end

    def parse(result)
      formatted_result = JSON.parse(result.body, symbolize_names: true)
    end
  end
end
