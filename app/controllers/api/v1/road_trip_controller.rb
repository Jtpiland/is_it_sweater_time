class Api::V1::RoadTripController < ApplicationController

  def create
    from = params['origin']
    to = params['destination']

    User.find_by(api_key: params['api_key'])

    render json: RoadTripFacade.fetch_directions_and_weather(from, to)
  end
end
