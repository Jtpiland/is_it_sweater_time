require 'rails_helper'

RSpec.describe 'Book Search Request' do
  it 'can return a list of books for a location (city, state)', :vcr do
    location = 'denver, co'
    quantity = 5

    get '/api/v1/book_search', params: { location: location }

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a(Hash)
    expect(result).to be_a(Hash)
    expect(result).to have_key(:data)
    expect(result[:data]).to be_a(Hash)
    expect(result[:data]).to have_key(:id)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to be_a(String)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to be_a(Hash)
    expect(result[:data][:attributes]).to have_key(:destination)
    expect(result[:data][:attributes][:destination]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:forecast)
    expect(result[:data][:attributes][:forecast]).to be_a(Hash)
    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(result[:data][:attributes][:forecast][:temperature]).to be_a(Numeric)
    expect(result[:data][:attributes]).to have_key(:total_books_found)
    expect(result[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(result[:data][:attributes]).to have_key(:books)
    expect(result[:data][:attributes][:books]).to be_a(Array)
    expect(result[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(result[:data][:attributes][:books][0][:isbn]).to be_a(Array)
    expect(result[:data][:attributes][:books][0]).to have_key(:title)
    expect(result[:data][:attributes][:books][0][:title]).to be_a(String)
    expect(result[:data][:attributes][:books][0]).to have_key(:publisher)
    expect(result[:data][:attributes][:books][0][:publisher]).to be_a(Array)
  end
end
