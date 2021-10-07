require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'can return json', :vcr do
    location = 'denver,co'

    expected= "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>Thu, 07 Oct 2021 13:54:15 -0500, :sunrise=>Thu, 07 Oct 2021 08:02:10 -0500, :sunset=>Thu, 07 Oct 2021 19:32:52 -0500, :temperature=>74.1, :feels_like=>72.39, :humidity=>25, :uvi=>5.61, :visibility=>10000, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, :hourly_weather=>[{:time=>Thu, 07 Oct 2021 13:00:00 -0500, :temperature=>73.72, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 14:00:00 -0500, :temperature=>74.1, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 15:00:00 -0500, :temperature=>74.71, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 16:00:00 -0500, :temperature=>75.67, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 17:00:00 -0500, :temperature=>76.48, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 18:00:00 -0500, :temperature=>76.8, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 19:00:00 -0500, :temperature=>76.21, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:time=>Thu, 07 Oct 2021 20:00:00 -0500, :temperature=>74.26, :conditions=>\"overcast clouds\", :icon=>\"04n\"}], :daily_weather=>[{:date=>Thu, 07 Oct 2021 13:00:00 -0500, :sunrise=>Thu, 07 Oct 2021 08:02:10 -0500, :sunset=>Thu, 07 Oct 2021 19:32:52 -0500, :max_temp=>76.8, :min_temp=>59.65, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>Fri, 08 Oct 2021 13:00:00 -0500, :sunrise=>Fri, 08 Oct 2021 08:03:09 -0500, :sunset=>Fri, 08 Oct 2021 19:31:18 -0500, :max_temp=>78.31, :min_temp=>61.18, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>Sat, 09 Oct 2021 13:00:00 -0500, :sunrise=>Sat, 09 Oct 2021 08:04:09 -0500, :sunset=>Sat, 09 Oct 2021 19:29:45 -0500, :max_temp=>74.48, :min_temp=>59.05, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:date=>Sun, 10 Oct 2021 13:00:00 -0500, :sunrise=>Sun, 10 Oct 2021 08:05:10 -0500, :sunset=>Sun, 10 Oct 2021 19:28:12 -0500, :max_temp=>66.56, :min_temp=>51.31, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:date=>Mon, 11 Oct 2021 13:00:00 -0500, :sunrise=>Mon, 11 Oct 2021 08:06:10 -0500, :sunset=>Mon, 11 Oct 2021 19:26:40 -0500, :max_temp=>70.79, :min_temp=>52.79, :conditions=>\"clear sky\", :icon=>\"01d\"}]}}}"

    x = ForecastFacade.fetch_weather(location).to_s

    expect(x).to eq(expected)
  end
end
