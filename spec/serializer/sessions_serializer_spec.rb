require 'rails_helper'
# should this just be the user serializer????

RSpec.describe 'Sessions Serializer' do
  it 'can serialize session data' do
    user = User.create( email: 'funbucket@gmail.com',
                        password: 'password',
                        password_confirmation: 'password')

    user.api_key = User.set_api_key
    user.save

    result = JSON.parse(user.to_json, symbolize_names: true)

    session_data = SessionSerializer.session(result)

    expect(session_data).to be_a(Hash)
    expect(session_data).to have_key(:data)
    expect(session_data[:data]).to be_a(Hash)
    expect(session_data[:data]).to have_key(:type)
    expect(session_data[:data][:type]).to be_a(String)
    expect(session_data[:data]).to have_key(:id)
    expect(session_data[:data][:id]).to be_a(Integer)
    expect(session_data[:data]).to have_key(:attributes)
    expect(session_data[:data][:attributes]).to be_a(Hash)
    expect(session_data[:data][:attributes]).to have_key(:email)
    expect(session_data[:data][:attributes][:email]).to be_a(String)
    expect(session_data[:data][:attributes]).to have_key(:api_key)
    expect(session_data[:data][:attributes][:api_key]).to be_a(String)
  end
end
