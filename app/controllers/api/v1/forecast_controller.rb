class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.fetch_weather(params[:location])

    render json: forecast
  end
end
