require 'rails_helper'

RSpec.describe 'Sessions' do
  before :each do
    @user = User.create(email: 'funbucket@gmail.com', password: 'pw', password_confirmation: 'pw')

    @user.api_key = User.set_api_key
    @user.save
  end
  
  describe 'POST /api/v1/users' do
    let(:valid_attributes) { { 'email': 'funbucket@gmail.com', 'password': 'pw'} }

    let(:invalid_account) { { 'email': 'funbucket@gmai.com', 'password': 'pw'} }

    let(:invalid_password) { { 'email': 'funbucket@gmail.com', 'password': 'p'} }

    it 'can create a session with valid credentials', :vcr do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(valid_attributes)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
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

    it 'can send an error message if an account has not been created', :vcr do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(invalid_account)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(x).to be_a(Hash)
      expect(x).to have_key(:data)
      expect(x[:data]).to be_a(Hash)
      expect(x[:data]).to have_key(:error)
      expect(x[:data][:error]).to eq("Please create an account.")
    end

    it 'can send an error message if given invalid credentials', :vcr do
      headers = { "Content-Type" => "application/json",
      "Accept" => "application/json" }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(invalid_password)

      x = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(x).to be_a(Hash)
      expect(x).to have_key(:data)
      expect(x[:data]).to be_a(Hash)
      expect(x[:data]).to have_key(:error)
      expect(x[:data][:error]).to eq("Invalid Credentials.")
    end
  end
end
