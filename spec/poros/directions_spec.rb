require 'rails_helper'

RSpec.describe 'Directions poro' do
  it 'exists and has attributes' do
    directions = {
      formattedTime: '01:22:49'
    }

    x = Directions.new(directions)

    expect(x).to be_a(Directions)
    expect(x.travel_time).to eq('01:22:49')
  end
end
