class MapquestService

  class << self
    def get_location(location)
      conn = Faraday.new(url: "http://www.mapquestapi.com")
      result = conn.get("/geocoding/v1/address") do |req|
        req.params['key'] = ENV['map_key']
        req.params['location'] = "#{location}"
      end
      JSON.parse(result.body, symbolize_names: true)[:results][0]
    end
  end
end
