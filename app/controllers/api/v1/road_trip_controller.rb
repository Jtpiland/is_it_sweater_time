class Api::V1::RoadTripController < ApplicationController

  def create
    from = params['origin']
    to = params['destination']

    if User.find_by(api_key: params[:api_key])
      render json: RoadTripFacade.fetch_directions_and_weather(from, to)
    else
      render json: {error: 'Invalid Credentials'}, status:404
    end
  end
end
