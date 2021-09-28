require 'rails_helper'

RSpec.describe 'Background Request' do
  before :each do
    location = 'denver, co'

    get "/api/v1/backgrounds", params: { query: location}

    @res = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can return a background image for a location (city, state)', :vcr do

    expected = "{:data=>{:id=>nil, :type=>\"image\", :attributes=>{:image=>{:location=>\"denver, co\", :image_url=>\"https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjI5OTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MzI1NDE3MzQ&ixlib=rb-1.2.1&q=80&w=1080\", :credit=>{:source=>\"unsplash.com\", :author=>\"Ryan De Hamer\", :logo=>\"https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg\"}}}}}"

    expect(response).to be_successful
    expect(@res.to_s).to eq(expected)
    expect(@res[:data][:type]).to eq('image')
    expect(@res[:data][:id]).to eq(nil)
    expect(@res[:data][:attributes][:image][:location]).to eq('denver, co')
    expect(@res[:data][:attributes][:image][:image_url]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjI5OTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MzI1NDE3MzQ&ixlib=rb-1.2.1&q=80&w=1080")
    expect(@res[:data][:attributes][:image][:credit][:source]).to eq('unsplash.com')
    expect(@res[:data][:attributes][:image][:credit][:author]).to eq("Ryan De Hamer")
    expect(@res[:data][:attributes][:image][:credit][:logo]).to eq("https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg")
  end
end
