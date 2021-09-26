require 'rails_helper'

RSpec.describe UserSerializer do
  it 'can serialize user data' do
    user = User.create( email: 'funbucket@gmail.com',
                        password: 'password',
                        password_confirmation: 'password')

    user.api_key = User.set_api_key
    user.save

    result = JSON.parse(user.to_json, symbolize_names: true)
    user_data = UserSerializer.user(result)

    expect(user_data).to be_a(Hash)
    expect(user_data).to have_key(:data)
    expect(user_data[:data]).to be_a(Hash)
    expect(user_data[:data]).to have_key(:type)
    expect(user_data[:data][:type]).to be_a(String)
    expect(user_data[:data]).to have_key(:id)
    expect(user_data[:data][:id]).to be_a(Integer)
    expect(user_data[:data]).to have_key(:attributes)
    expect(user_data[:data][:attributes]).to be_a(Hash)
    expect(user_data[:data][:attributes]).to have_key(:email)
    expect(user_data[:data][:attributes][:email]).to be_a(String)
    expect(user_data[:data][:attributes]).to have_key(:api_key)
    expect(user_data[:data][:attributes][:api_key]).to be_a(String)
  end
end
