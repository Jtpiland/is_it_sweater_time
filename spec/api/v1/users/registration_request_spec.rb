require 'rails_helper'
require './lib/modules/api_key'

RSpec.describe 'Registration Request' do
  # before :each do
  #   post "/api/v1/users", params: { email: 'email', password: 'password', password_confirmation: 'password'}
  #
  #   x = JSON.parse(response.body, symbolize_names: true)
  # end
  describe 'POST /api/v1/users' do
    let(:valid_attributes) { { email: 'email', password: 'password', password_confirmation: 'password' } }
    # headers = { "Content-Type" => "application/json" }

    it 'can register and save a new user to the database', :vcr do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      expect(User.all.length).to be(0)

      # post "/api/v1/users", headers: headers, params: { email: 'email', password: 'password', password_confirmation: 'password' }

      # post "/api/v1/users", headers: headers, request.body => valid_attributes

      # body(JSON.generate({user: valid_attributes}))

      post "/api/v1/users", headers: headers, params: JSON.generate({user: valid_attributes})

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(User.all.length).to eq(1)
      expect(x).to be_a(Hash)
      expect(x).to have_key(:data)
      expect(x[:data]).to be_a(Hash)
      expect(x[:data]).to have_key(:type)
      expect(x[:data][:type]).to be_a(String)
      expect(x[:data]).to have_key(:id)
      expect(x[:data][:id]).to be_a(Integer)
      expect(x[:data]).to have_key(:attributes)
      expect(x[:data][:attributes]).to be_a(Hash)
      expect(x[:data][:attributes]).to have_key(:email)
      expect(x[:data][:attributes][:email]).to be_a(String)
      expect(x[:data][:attributes]).to have_key(:api_key)
      expect(x[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end
