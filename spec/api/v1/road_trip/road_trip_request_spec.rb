require 'rails_helper'

RSpec.describe 'Road Trip Request' do
  let(:valid_attributes) { {'origin': "Denver,CO", 'destination': "Pueblo,CO", 'api_key': "jgn983hy48thw9begh98h4539h4"} }

  it 'can return serialized information about a road trip', :vcr do
    user = User.create(email: 'email@email.com', password: 'pw', password_confirmation: 'pw')

    user.update(api_key: "jgn983hy48thw9begh98h4539h4")
    headers = { "Content-Type" => "application/json",
    "Accept" => "application/json" }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(valid_attributes)

    x = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

end
