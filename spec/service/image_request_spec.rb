require 'rails_helper'

RSpec.describe 'Unsplash API' do
  it 'can retrieve an image based on location params', :vcr do
    location = 'denver, co'

    image = ImageService.get_image(location)

    expect(image).to have_key(:results)
    expect(image[:results]).to be_a(Array)
    expect(image[:results][0]).to have_key(:urls)
    expect(image[:results][0][:urls]).to be_a(Hash)
    expect(image[:results][0][:urls]).to have_key(:regular)
    expect(image[:results][0]).to have_key(:user)
    expect(image[:results][0][:user]).to be_a(Hash)
    expect(image[:results][0][:user]).to have_key(:name)
    expect(image[:results][0][:user][:name]).to be_a(String)
  end
end
