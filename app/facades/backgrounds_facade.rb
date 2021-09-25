class BackgroundsFacade
  class << self
    def fetch_image(location)
      result = ImageService.get_image(location)

      background = ImageSerializer.image(result, location)
    end
  end
end
