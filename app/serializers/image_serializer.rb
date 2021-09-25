class ImageSerializer

  def self.image(image_data, location)
    {data:
      { id: nil,
        type: 'image',
        attributes: {
          image: {
            location: "#{location}",
            image_url: image_data[:results][0][:urls][:regular],
            credit: {
              source: 'unsplash.com',
              author: image_data[:results][0][:user][:name],
              logo: 'https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg'
            }
          }
        }
      }
    }
  end
end
