require 'rails_helper'

RSpec.describe 'Forecast Request' do
  before :each do
    location = 'denver, co'
    get "/api/v1/forecast", params: { location: location }#, headers: { Content-Type: application/json}
    @res = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can return the forecast for a location (city, state)', :vcr do

    expected =  "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>\"2021-09-26T17:16:12.000-05:00\", :sunrise=>\"2021-09-26T07:51:34.000-05:00\", :sunset=>\"2021-09-26T19:50:40.000-05:00\", :temperature=>87.42, :feels_like=>83.77, :humidity=>12, :uvi=>2.52, :visibility=>10000, :conditions=>\"broken clouds\", :icon=>\"04d\"}, :hourly_weather=>[{:time=>\"2021-09-26T17:00:00.000-05:00\", :temperature=>87.42, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>\"2021-09-26T18:00:00.000-05:00\", :temperature=>87.39, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>\"2021-09-26T19:00:00.000-05:00\", :temperature=>86.76, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>\"2021-09-26T20:00:00.000-05:00\", :temperature=>84.2, :conditions=>\"broken clouds\", :icon=>\"04n\"}, {:time=>\"2021-09-26T21:00:00.000-05:00\", :temperature=>80.76, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>\"2021-09-26T22:00:00.000-05:00\", :temperature=>77.56, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>\"2021-09-26T23:00:00.000-05:00\", :temperature=>76.59, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>\"2021-09-27T00:00:00.000-05:00\", :temperature=>74.41, :conditions=>\"overcast clouds\", :icon=>\"04n\"}], :daily_weather=>[{:date=>\"2021-09-26T13:00:00.000-05:00\", :sunrise=>\"2021-09-26T07:51:34.000-05:00\", :sunset=>\"2021-09-26T19:50:40.000-05:00\", :max_temp=>87.42, :min_temp=>64.35, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:date=>\"2021-09-27T13:00:00.000-05:00\", :sunrise=>\"2021-09-27T07:52:30.000-05:00\", :sunset=>\"2021-09-27T19:49:02.000-05:00\", :max_temp=>87.24, :min_temp=>66.24, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:date=>\"2021-09-28T13:00:00.000-05:00\", :sunrise=>\"2021-09-28T07:53:27.000-05:00\", :sunset=>\"2021-09-28T19:47:23.000-05:00\", :max_temp=>79.39, :min_temp=>67.71, :conditions=>\"light rain\", :icon=>\"10d\"}, {:date=>\"2021-09-29T13:00:00.000-05:00\", :sunrise=>\"2021-09-29T07:54:24.000-05:00\", :sunset=>\"2021-09-29T19:45:45.000-05:00\", :max_temp=>72.82, :min_temp=>52.68, :conditions=>\"moderate rain\", :icon=>\"10d\"}, {:date=>\"2021-09-30T13:00:00.000-05:00\", :sunrise=>\"2021-09-30T07:55:21.000-05:00\", :sunset=>\"2021-09-30T19:44:07.000-05:00\", :max_temp=>57.42, :min_temp=>51.12, :conditions=>\"light rain\", :icon=>\"10d\"}]}}}"

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
    expect(@res[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(@res[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(@res[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(@res[:data][:attributes][:current_weather][:sunset]).to be_a(String)
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
    expect(@res[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(@res[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
    expect(@res[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(@res[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
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
    expect(@res[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
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
  end
end
