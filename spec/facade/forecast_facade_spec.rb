require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'can return json', :vcr do
    location = 'denver,co'

    expected=  "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>Sun, 26 Sep 2021 14:03:06 -0500, :sunrise=>Sun, 26 Sep 2021 07:51:34 -0500, :sunset=>Sun, 26 Sep 2021 19:50:40 -0500, :temperature=>85.8, :feels_like=>82.49, :humidity=>15, :uvi=>6.26, :visibility=>10000, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, :daily_weather=>[{:date=>Sun, 26 Sep 2021 13:00:00 -0500, :sunrise=>Sun, 26 Sep 2021 07:51:34 -0500, :sunset=>Sun, 26 Sep 2021 19:50:40 -0500, :max_temp=>87.4, :min_temp=>64.0, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:date=>Mon, 27 Sep 2021 13:00:00 -0500, :sunrise=>Mon, 27 Sep 2021 07:52:30 -0500, :sunset=>Mon, 27 Sep 2021 19:49:02 -0500, :max_temp=>86.9, :min_temp=>67.01, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>Tue, 28 Sep 2021 13:00:00 -0500, :sunrise=>Tue, 28 Sep 2021 07:53:27 -0500, :sunset=>Tue, 28 Sep 2021 19:47:23 -0500, :max_temp=>80.89, :min_temp=>67.26, :conditions=>\"overcast clouds\", :icon=>\"04d\"}, {:date=>Wed, 29 Sep 2021 13:00:00 -0500, :sunrise=>Wed, 29 Sep 2021 07:54:24 -0500, :sunset=>Wed, 29 Sep 2021 19:45:45 -0500, :max_temp=>70.59, :min_temp=>53.67, :conditions=>\"moderate rain\", :icon=>\"10d\"}, {:date=>Thu, 30 Sep 2021 13:00:00 -0500, :sunrise=>Thu, 30 Sep 2021 07:55:21 -0500, :sunset=>Thu, 30 Sep 2021 19:44:07 -0500, :max_temp=>66.85, :min_temp=>51.35, :conditions=>\"light rain\", :icon=>\"10d\"}], :hourly_weather=>[{:time=>Sun, 26 Sep 2021 14:00:00 -0500, :temperature=>85.8, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>Sun, 26 Sep 2021 15:00:00 -0500, :temperature=>86.14, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>Sun, 26 Sep 2021 16:00:00 -0500, :temperature=>86.72, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>Sun, 26 Sep 2021 17:00:00 -0500, :temperature=>87.19, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:time=>Sun, 26 Sep 2021 18:00:00 -0500, :temperature=>87.4, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:time=>Sun, 26 Sep 2021 19:00:00 -0500, :temperature=>86.25, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:time=>Sun, 26 Sep 2021 20:00:00 -0500, :temperature=>82.02, :conditions=>\"overcast clouds\", :icon=>\"04n\"}, {:time=>Sun, 26 Sep 2021 21:00:00 -0500, :temperature=>79.2, :conditions=>\"overcast clouds\", :icon=>\"04n\"}]}}}"

    x = ForecastFacade.fetch_weather(location).to_s

    expect(x).to eq(expected)
  end
end
