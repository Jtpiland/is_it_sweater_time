require 'rails_helper'

RSpec.describe 'BookSearchFacade' do
  it 'can return json', :vcr do
    location = 'denver, co'
    quantity = 5

    expected = "{:data=>{:id=>nil, :type=>\"books\", :attributes=>{:destination=>\"denver, co\", :forecast=>{:summary=>\"scattered clouds\", :temperature=>81.37}, :total_books_found=>605, :books=>[{:isbn=>[\"9780762507849\", \"0762507845\"], :title=>\"Denver, Co\", :publisher=>[\"Universal Map Enterprises\"]}, {:isbn=>[\"9780607620054\", \"0607620056\"], :title=>\"Denver west, CO and Bailey, CO: Denver, CO\", :publisher=>[\"USGS Branch of Distribution\"]}, {:isbn=>[\"0607620048\", \"9780607620047\"], :title=>\"Denver East, CO and Castle Rock, CO: Denver, CO\", :publisher=>[\"USGS Branch of Distribution\"]}, {:isbn=>[\"1427401683\", \"9781427401687\"], :title=>\"University of Denver Co 2007\", :publisher=>[\"College Prowler\"]}, {:isbn=>[\"9780762557363\", \"0762557362\"], :title=>\"Denver Co Deluxe Flip Map\", :publisher=>[\"Universal Map Enterprises\"]}]}}}"

    x = BookSearchFacade.fetch_books(location, quantity).to_s

    expect(x).to eq(expected)

  end

end
