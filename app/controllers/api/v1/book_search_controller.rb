class Api::V1::BookSearchController < ApplicationController

  def index
    book_search = BookSearchFacade.fetch_books(params[:location], params[:quantity])

    render json: book_search
  end
end
