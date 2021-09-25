class Api::V1::BackgroundsController < ApplicationController

  def index
    background = BackgroundsFacade.fetch_image(params[:query])

    render json: background, status: 200 
  end

end
