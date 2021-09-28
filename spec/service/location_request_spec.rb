require 'rails_helper'

RSpec.describe 'Mapquest API', :vcr do
  it 'can retrieve the latitude and longitude of the city' do
    location = 'denver,co'

    location = MapquestService.get_location(location)

    expect(location).to have_key(:locations)
    expect(location[:locations]).to be_a(Array)
    expect(location[:locations][0]).to have_key(:latLng)
    expect(location[:locations][0][:latLng]).to be_a(Hash)
    expect(location[:locations][0][:latLng]).to have_key(:lat)
    expect(location[:locations][0][:latLng][:lat]).to be_a(Float)
    expect(location[:locations][0][:latLng]).to have_key(:lng)
    expect(location[:locations][0][:latLng][:lng]).to be_a(Float)
  end

  it 'can retrieve the directions between two cities' do
    from = 'denver, co'
    to = 'estes park, co'

    directions = MapquestService.get_directions(from, to)

    expect(directions).to have_key(:route)
    expect(directions[:route]).to have_key(:formattedTime)
    expect(directions[:route][:formattedTime]).to be_a(String)
  end
end
