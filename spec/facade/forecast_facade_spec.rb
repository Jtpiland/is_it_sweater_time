require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'can return json', :vcr do
    location = 'denver,co'

    expected=  "{:data=>{:id=>nil, :type=>\"forecast\", :attributes=>{:current_weather=>{:datetime=>1632525704, :sunrise=>1632487781, :sunset=>1632531239, :temperature=>295.63, :feels_like=>294.72, :humidity=>30, :uvi=>1.17, :visibility=>10000, :conditions=>\"clear sky\", :icon=>\"01d\"}, :daily_weather=>[{:date=>1632506400, :sunrise=>1632487781, :sunset=>1632531239, :max_temp=>296.31, :min_temp=>288.92, :conditions=>\"few clouds\", :icon=>\"02d\"}, {:date=>1632592800, :sunrise=>1632574237, :sunset=>1632617539, :max_temp=>303.69, :min_temp=>288.4, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:date=>1632679200, :sunrise=>1632660694, :sunset=>1632703840, :max_temp=>304.5, :min_temp=>290.95, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:date=>1632765600, :sunrise=>1632747150, :sunset=>1632790142, :max_temp=>303.77, :min_temp=>292.59, :conditions=>\"scattered clouds\", :icon=>\"03d\"}, {:date=>1632852000, :sunrise=>1632833607, :sunset=>1632876443, :max_temp=>300.18, :min_temp=>292.88, :conditions=>\"light rain\", :icon=>\"10d\"}], :hourly_weather=>[{:time=>1632524400, :temperature=>295.63, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:time=>1632528000, :temperature=>295.84, :conditions=>\"clear sky\", :icon=>\"01d\"}, {:time=>1632531600, :temperature=>295.34, :conditions=>\"clear sky\", :icon=>\"01n\"}, {:time=>1632535200, :temperature=>294.43, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632538800, :temperature=>293.42, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632542400, :temperature=>292.21, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632546000, :temperature=>291.76, :conditions=>\"few clouds\", :icon=>\"02n\"}, {:time=>1632549600, :temperature=>291.19, :conditions=>\"few clouds\", :icon=>\"02n\"}]}}}"

    x = ForecastFacade.fetch_weather(location).to_s

    expect(x).to eq(expected)
  end
end
