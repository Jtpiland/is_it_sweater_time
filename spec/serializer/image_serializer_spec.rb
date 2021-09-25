require 'rails_helper'

RSpec.describe ImageSerializer do
  before :each do
    location = 'denver, co'

    image = ImageService.get_image(location)
    result = JSON.parse(image.to_json, symbolize_names: true)

    @image_data = ImageSerializer.image(result, location)
  end

  it 'can serialize the response from Unsplashy API', :vcr do

    expect(@image_data).to be_a(Hash)
    expect(@image_data).to have_key(:data)
    expect(@image_data[:data]).to be_a(Hash)
    expect(@image_data[:data]).to have_key(:type)
    expect(@image_data[:data][:type]).to be_a(String)
    expect(@image_data[:data]).to have_key(:id)
    expect(@image_data[:data]).to have_key(:attributes)
    expect(@image_data[:data][:attributes]).to be_a(Hash)
    expect(@image_data[:data][:attributes]).to have_key(:image)
    expect(@image_data[:data][:attributes][:image]).to be_a(Hash)
    expect(@image_data[:data][:attributes][:image]).to  have_key(:location)
    expect(@image_data[:data][:attributes][:image][:location]).to be_a(String)
    expect(@image_data[:data][:attributes][:image]).to  have_key(:image_url)
    expect(@image_data[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(@image_data[:data][:attributes][:image]).to  have_key(:credit)
    expect(@image_data[:data][:attributes][:image][:credit]).to be_a(Hash)
    expect(@image_data[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(@image_data[:data][:attributes][:image][:credit][:source]).to be_a(String)
    expect(@image_data[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(@image_data[:data][:attributes][:image][:credit][:author]).to be_a(String)
    expect(@image_data[:data][:attributes][:image][:credit]).to have_key(:logo)
    expect(@image_data[:data][:attributes][:image][:credit][:logo]).to be_a(String)
  end
end
