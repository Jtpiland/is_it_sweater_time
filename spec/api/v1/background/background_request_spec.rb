require 'rails_helper'

RSpec.describe 'Background Request' do
  before :each do
    location = 'denver, co'

    get "/api/v1/backgrounds", params: { query: location}

    @res = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can return a background image for a location (city, state)', :vcr do

    expected = "{:data=>{:id=>nil, :type=>\"image\", :attributes=>{:image=>{:location=>\"denver, co\", :image_url=>\"https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjI5OTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MzI1NDE3MzQ&ixlib=rb-1.2.1&q=80&w=1080\", :credit=>{:source=>\"unsplash.com\", :author=>\"Ryan De Hamer\", :logo=>\"https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg\"}}}}}"

    expect(@res.to_s).to eq(expected)
    expect(@res).to be_a(Hash)
    expect(@res).to have_key(:data)
    expect(@res[:data]).to be_a(Hash)
    expect(@res[:data]).to have_key(:type)
    expect(@res[:data][:type]).to be_a(String)
    expect(@res[:data]).to have_key(:id)
    expect(@res[:data]).to have_key(:attributes)
    expect(@res[:data][:attributes]).to be_a(Hash)
    expect(@res[:data][:attributes]).to have_key(:image)
    expect(@res[:data][:attributes][:image]).to be_a(Hash)
    expect(@res[:data][:attributes][:image]).to  have_key(:location)
    expect(@res[:data][:attributes][:image][:location]).to be_a(String)
    expect(@res[:data][:attributes][:image]).to  have_key(:image_url)
    expect(@res[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(@res[:data][:attributes][:image]).to  have_key(:credit)
    expect(@res[:data][:attributes][:image][:credit]).to be_a(Hash)
    expect(@res[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(@res[:data][:attributes][:image][:credit][:source]).to be_a(String)
    expect(@res[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(@res[:data][:attributes][:image][:credit][:author]).to be_a(String)
    expect(@res[:data][:attributes][:image][:credit]).to have_key(:logo)
    expect(@res[:data][:attributes][:image][:credit][:logo]).to be_a(String)
  end
end
