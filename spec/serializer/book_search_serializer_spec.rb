require 'rails_helper'

RSpec.describe 'BookSearchSerializer' do
  it 'can serialize data returned from the book service and weather service', :vcr do
    location = 'denver, co'

    result = MapquestService.get_location(location)
    lat = result[:locations][0][:latLng][:lat]
    lon = result[:locations][0][:latLng][:lng]

    weather = WeatherService.get_weather("#{lat}", "#{lon}")

    current_weather = CurrentWeather.new(weather[:current])
    books = BookService.get_books(location)

    book_search = BookSearch.new(current_weather, books)


    expext(book_search_data).to be_a(Hash)
    expect(book_search_data).to have_key(:data)
    expect(book_search_data[:data]).to be_a(Hash)
    expect(book_search_data[:data]).to have_key(:id)
    expect(book_search_data[:data]).to have_key(:type)
    expect(book_search[:data][:type]).to be_a(String)
    expect(book_search_data[:data]).to have_key(:attributes)
    expect(book_search[:data][:attributes]).to be_a(Hash)
    expect(book_search[:data][:attributes]).to have_key(:destination)
    expect(book_search[:data][:attributes][:destination]).to be_a(String)
    expect(book_search[:data][:attributes]).to have_key(:forecast)
    expect(book_search[:data][:attributes][:forecast]).to be_a(Hash)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:summary)
    expect(book_search[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(book_search[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(book_search[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(book_search[:data][:attributes]).to have_key(:total_books_found)
    expect(book_search[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(book_search[:data][:attributes]).to have_key(:books)
    expect(book_search[:data][:attributes][:books]).to be_a(Array)
    # expect(book_search[:data][:attributes][:books].length).to be(5)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(book_search[:data][:attributes][:books][0][:isbn]).to be_a(Array)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:title)
    expect(book_search[:data][:attributes][:books][0][:title]).to be_a(String)
    expect(book_search[:data][:attributes][:books][0]).to have_key(:publisher)
    expect(book_search[:data][:attributes][:books][0][:publisher]).to be_a(Array)

  end
end
