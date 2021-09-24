require 'rails_helper'

RSpec.describe 'Location API' do
  it 'can retrieve the latitude and longitude of the city' do
    location = 'denver,co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful 
  end

end
