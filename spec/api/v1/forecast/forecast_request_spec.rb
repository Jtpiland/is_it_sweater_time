require 'rails_helper'

RSpec.describe 'Forecast Request' do
  before :each do
    location = 'denver, co'
    get "/api/v1/forecast", params: { location: location }#, headers: { Content-Type: application/json}
    @res = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can return the forecast for a location (city, state)', :vcr do
    expected = "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>1632536600, :sunrise=>1632487781, :sunset=>1632531239, :temperature=>289.6, :feels_like=>288.4, :humidity=>42, :uvi=>0, :visibility=>10000, :conditions=>\"few clouds\", :icon=>\"02n\"}, :daily_weather=>[{:date=>1632506400, :sunrise=>1632487781, :sunset=>1632531239, :max_temp=>297.33, :min_temp=>288.92, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:date=>1632592800, :sunrise=>1632574237, :sunset=>1632617539, :max_temp=>303.69, :min_temp=>288.4, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:date=>1632679200, :sunrise=>1632660694, :sunset=>1632703840, :max_temp=>304.5, :min_temp=>290.95, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:date=>1632765600, :sunrise=>1632747150, :sunset=>1632790142, :max_temp=>303.77, :min_temp=>292.59, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:date=>1632852000, :sunrise=>1632833607, :sunset=>1632876443, :max_temp=>300.18, :min_temp=>292.88, :conditions=>\"light rain\", :icon=>\"10d\"}], :hourly_weather=>[{:time=>1632535200, :temperature=>289.6, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632538800, :temperature=>290.25, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632542400, :temperature=>290.64, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632546000, :temperature=>290.9, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632549600, :temperature=>290.87, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632553200, :temperature=>290.7, :conditions=>\"clear sky\", :icon=>\"01n\"}, {:time=>1632556800, :temperature=>290.28, :conditions=>\"clear sky\", :icon=>\"01n\"}, {:time=>1632560400, :temperature=>289.76, :conditions=>\"clear sky\", :icon=>\"01n\"}]}}}"

    expect(@res.to_s).to eq(expected)
    expect(@res).to be_a(Hash)
    expect(@res).to have_key(:data)
    expect(@res[:data]).to be_a(Hash)
    expect(@res[:data]).to have_key(:id)
    expect(@res[:data]).to have_key(:type)
    expect(@res[:data][:type]).to be_a(String)
    expect(@res[:data]).to have_key(:attributes)
    expect(@res[:data][:attributes]).to be_a(Hash)
    expect(@res[:data][:attributes]).to have_key(:current_weather)
    expect(@res[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(@res[:data][:attributes][:current_weather][:datetime]).to be_a(Integer)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(@res[:data][:attributes][:current_weather][:sunrise]).to be_a(Integer)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(@res[:data][:attributes][:current_weather][:sunset]).to be_a(Integer)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(@res[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(@res[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(@res[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(@res[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(@res[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(@res[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(@res[:data][:attributes]).to have_key(:daily_weather)
    expect(@res[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(@res[:data][:attributes][:daily_weather].length).to eq(5)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(@res[:data][:attributes][:daily_weather][0][:date]).to be_a(Integer)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(@res[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(Integer)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(@res[:data][:attributes][:daily_weather][0][:sunset]).to be_a(Integer)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(@res[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Numeric)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(@res[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Numeric)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(@res[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(@res[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

    expect(@res[:data][:attributes]).to have_key(:hourly_weather)
    expect(@res[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(@res[:data][:attributes][:hourly_weather].length).to eq(8)
    expect(@res[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(@res[:data][:attributes][:hourly_weather][0][:time]).to be_a(Integer)
    expect(@res[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
    expect(@res[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Numeric)
    expect(@res[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(@res[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(@res[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(@res[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
  end

  it 'doesnt return unnecessary keys', :vcr do
    expect(@res[:data]).to_not have_key(:lat)
    expect(@res[:data]).to_not have_key(:lon)
    expect(@res[:data]).to_not have_key(:minutely)
    expect(@res[:data]).to_not have_key(:timezone)
    expect(@res[:data]).to_not have_key(:timezone_offset)
    expect(@res[:data]).to_not have_key(:minutely)
  end
end
