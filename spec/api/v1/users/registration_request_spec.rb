require 'rails_helper'
require './lib/modules/api_key'

RSpec.describe 'Registration Request' do
  describe 'POST /api/v1/users' do
    let(:valid_attributes) { { 'email': 'email', 'password': 'password', 'password_confirmation': 'password' } }

    let(:invalid_email) { { 'email': '', 'password': 'password', 'password_confirmation': 'password' } }

    let(:invalid_password) { { 'email': 'email', 'password': 'password', 'password_confirmation': 'pw' } }

    it 'can register and save a new user to the database' do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      expect(User.all.length).to be(0)

      post "/api/v1/users", headers: headers, params: JSON.generate(valid_attributes)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(User.all.length).to eq(1)
      expect(x).to be_a(Hash)
      expect(x[:data][:id]).to be_a(Integer)
      expect(x[:data][:type]).to eq('user')
      expect(x[:data][:attributes][:email]).to eq('email')
      expect(x[:data][:attributes]).to have_key(:api_key)
      expect(x[:data][:attributes][:api_key]).to be_a(String)
    end

    it 'will send an error message with invalid email' do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      expect(User.all.length).to be(0)

      post "/api/v1/users", headers: headers, params: JSON.generate(invalid_email)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(User.all.length).to eq(0)
      expect(x[:email]).to eq(["can't be blank"])
    end

    it 'will send an error message with invalid password' do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      expect(User.all.length).to be(0)

      post "/api/v1/users", headers: headers, params: JSON.generate(invalid_password)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(User.all.length).to eq(0)
      expect(x[:password_confirmation]).to eq(["doesn't match Password", "doesn't match Password"])
    end
  end
end
