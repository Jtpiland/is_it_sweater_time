require 'rails_helper'

RSpec.describe 'Forecast Request' do
  before :each do
    location = 'denver, co'
    get "/api/v1/forecast", params: { location: location }#, headers: { Content-Type: application/json}
    @res = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can return the forecast for a location (city, state)', :vcr do

    expected =  "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>\"2021-09-26T14:03:05.000-05:00\", :sunrise=>\"2021-09-26T07:51:34.000-05:00\", :sunset=>\"2021-09-26T19:50:40.000-05:00\", :temperature=>85.8, :feels_like=>82.49, :humidity=>15, :uvi=>6.26, :visibility=>10000, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, :daily_weather=>[{:date=>\"2021-09-26T13:00:00.000-05:00\", :sunrise=>\"2021-09-26T07:51:34.000-05:00\", :sunset=>\"2021-09-26T19:50:40.000-05:00\", :max_temp=>87.4, :min_temp=>64.0, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:date=>\"2021-09-27T13:00:00.000-05:00\", :sunrise=>\"2021-09-27T07:52:30.000-05:00\", :sunset=>\"2021-09-27T19:49:02.000-05:00\", :max_temp=>86.9, :min_temp=>67.01, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>\"2021-09-28T13:00:00.000-05:00\", :sunrise=>\"2021-09-28T07:53:27.000-05:00\", :sunset=>\"2021-09-28T19:47:23.000-05:00\", :max_temp=>80.89, :min_temp=>67.26, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>\"2021-09-29T13:00:00.000-05:00\", :sunrise=>\"2021-09-29T07:54:24.000-05:00\", :sunset=>\"2021-09-29T19:45:45.000-05:00\", :max_temp=>70.59, :min_temp=>53.67, :conditions=>\"moderate rain\", :icon=>\"10d\"}, {:date=>\"2021-09-30T13:00:00.000-05:00\", :sunrise=>\"2021-09-30T07:55:21.000-05:00\", :sunset=>\"2021-09-30T19:44:07.000-05:00\", :max_temp=>66.85, :min_temp=>51.35, :conditions=>\"light rain\", :icon=>\"10d\"}], :hourly_weather=>[{:time=>\"2021-09-26T14:00:00.000-05:00\", :temperature=>85.8, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>\"2021-09-26T15:00:00.000-05:00\", :temperature=>86.14, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>\"2021-09-26T16:00:00.000-05:00\", :temperature=>86.72, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>\"2021-09-26T17:00:00.000-05:00\", :temperature=>87.19, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:time=>\"2021-09-26T18:00:00.000-05:00\", :temperature=>87.4, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:time=>\"2021-09-26T19:00:00.000-05:00\", :temperature=>86.25, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>\"2021-09-26T20:00:00.000-05:00\", :temperature=>82.02, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>\"2021-09-26T21:00:00.000-05:00\", :temperature=>79.2, :conditions=>\"overcast clouds\", :icon=>\"04n\"}]}}}"

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
    expect(@res[:data]).to_not have_key(:minutely)
  end
end
