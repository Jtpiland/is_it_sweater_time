require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'can return json', :vcr do
    location = 'denver,co'

    expected=   "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>Sun, 26 Sep 2021 17:16:14 -0500, :sunrise=>Sun, 26 Sep 2021 07:51:34 -0500, :sunset=>Sun, 26 Sep 2021 19:50:40 -0500, :temperature=>87.42, :feels_like=>83.77, :humidity=>12, :uvi=>2.52, :visibility=>10000, :conditions=>\"broken clouds\", :icon=>\"04d\"}, :hourly_weather=>[{:time=>Sun, 26 Sep 2021 17:00:00 -0500, :temperature=>87.42, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>Sun, 26 Sep 2021 18:00:00 -0500, :temperature=>87.39, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>Sun, 26 Sep 2021 19:00:00 -0500, :temperature=>86.76, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:time=>Sun, 26 Sep 2021 20:00:00 -0500, :temperature=>84.2, :conditions=>\"broken clouds\", :icon=>\"04n\"}, {:time=>Sun, 26 Sep 2021 21:00:00 -0500, :temperature=>80.76, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>Sun, 26 Sep 2021 22:00:00 -0500, :temperature=>77.56, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>Sun, 26 Sep 2021 23:00:00 -0500, :temperature=>76.59, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>Mon, 27 Sep 2021 00:00:00 -0500, :temperature=>74.41, :conditions=>\"overcast clouds\", :icon=>\"04n\"}], :daily_weather=>[{:date=>Sun, 26 Sep 2021 13:00:00 -0500, :sunrise=>Sun, 26 Sep 2021 07:51:34 -0500, :sunset=>Sun, 26 Sep 2021 19:50:40 -0500, :max_temp=>87.42, :min_temp=>64.35, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:date=>Mon, 27 Sep 2021 13:00:00 -0500, :sunrise=>Mon, 27 Sep 2021 07:52:30 -0500, :sunset=>Mon, 27 Sep 2021 19:49:02 -0500, :max_temp=>87.24, :min_temp=>66.24, :conditions=>\"broken clouds\", :icon=>\"04d\"}, {:date=>Tue, 28 Sep 2021 13:00:00 -0500, :sunrise=>Tue, 28 Sep 2021 07:53:27 -0500, :sunset=>Tue, 28 Sep 2021 19:47:23 -0500, :max_temp=>79.39, :min_temp=>67.71, :conditions=>\"light rain\", :icon=>\"10d\"}, {:date=>Wed, 29 Sep 2021 13:00:00 -0500, :sunrise=>Wed, 29 Sep 2021 07:54:24 -0500, :sunset=>Wed, 29 Sep 2021 19:45:45 -0500, :max_temp=>72.82, :min_temp=>52.68, :conditions=>\"moderate rain\", :icon=>\"10d\"}, {:date=>Thu, 30 Sep 2021 13:00:00 -0500, :sunrise=>Thu, 30 Sep 2021 07:55:21 -0500, :sunset=>Thu, 30 Sep 2021 19:44:07 -0500, :max_temp=>57.42, :min_temp=>51.12, :conditions=>\"light rain\", :icon=>\"10d\"}]}}}"

    x = ForecastFacade.fetch_weather(location).to_s

    expect(x).to eq(expected)
  end
end
